

<cfparam name="url.primary" default=0>
<cfparam name="url.secondary" default=0>
<cfparam name="form.choice_id" default=0>
<cfparam name="url.top_num" default=5>
<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>


<cfif url.feedback eq 1> <!---  If the submit is coming from respondants --->


	<cfif form.choice_id eq 0>
		<cfoutput>
			<cflocation url="dsp_impact_feedback.cfm?primary=#url.primary#&secondary=#url.secondary#&cid=#url.cid#">
		</cfoutput>
	</cfif>
	
		<cfset variables.UUID = CreateUUID()>
	
				<cfquery name="opt" datasource="#application.dsn#">
					UPDATE t_elements		
						SET times_chosen = times_chosen + 1
							WHERE id = #form.choice_id#	
				</cfquery>
		
			<cfif url.primary eq 1 AND url.secondary eq 2>	
				<cfquery name="opt" datasource="#application.dsn#">
					INSERT INTO t_uuids		
						(cid, be, uuid, type)
					VALUES (#url.cid#, 'IMPACT', '#variables.UUID#', 'choice')
				</cfquery>				
			</cfif>		
						
		<cfset url.secondary = url.secondary + 1>
				<!--- Add one the the secondary var --->
			<cfif url.secondary gt url.top_num>
					<!--- If the secondary var is greater than 4 --->
						<!--- Move on to the next starting point var --->
				<cfset url.primary = url.primary + 1>
							
				<cfset url.secondary = url.primary + 1>
					<!--- Set the secondary to one more than the NEW value of the primary --->
			</cfif>
		
<!--- 	 	<cfoutput>#url.primary#  #url.secondary# #url.top_num#</cfoutput>
		<cfabort>   --->
	
		<cfoutput>
			<cflocation url="dsp_impact_feedback.cfm?primary=#url.primary#&secondary=#url.secondary#&cid=#url.cid#">
		</cfoutput>


<cfelse> <!---  If the submit is coming from the client sending out the exercise --->

	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>

		<cfquery name="options" datasource="#application.dsn#" maxrows="5">
			SELECT id, business_element, my_choice, my_choice_rating, order_num
			FROM         t_elements
			WHERE     (cid = #client.cid#)
			 AND (my_choice IS NOT NULL)
			ORDER BY my_choice_rating DESC
		</cfquery>
		
        
    	<!--- get peer criteria to establish who should be sent emails requesting feedback --->
	<cfquery name="temp" datasource="#application.dsn#"> 
		SELECT id, email, name
		FROM t_consumer_emails
		WHERE ID IN (1,3,4,5,21)
	</cfquery>    
        
		<cfset counter = 0>
		
			<cfloop query="options">
				<cfquery name="order" datasource="#application.dsn#">
					UPDATE t_elements		
						SET order_num = #counter + 1#
							WHERE id = #options.id#				
				</cfquery>
	<!--- 			<cfoutput>
				#counter + 1# #options.id# <br></cfoutput> --->
				
				<cfset counter = counter + 1>
				
			</cfloop>
	<!--- dominic.ctr.kelly@faa.gov,ericc@chambersgroup.com,keith@chamberscroup.com --->
			
	<cfloop query="temp">	
    	
		<cfmail to="#trim(temp.email)#" 
							from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
			
	Hello,
			
	Someone has requested your feedback on an aspect of their business.
			
	Please go to: http://jumpstartmarketer.com/dsp_impact_feedback.cfm?cid=#client.cid#
			
	Thank you,
			
	The Jumpstart Marketer Team
				
		</cfmail> 
                    
	</cfloop>		
			
					
					
	<cfoutput>
		<cflocation url="index.cfm?fa=impact_results&be=impact&sent=1&bg=1">
	</cfoutput>
	
</cfif>
