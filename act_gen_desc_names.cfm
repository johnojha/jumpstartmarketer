<cfparam name="url.continue" default=0>
<cfparam name="form.email" default=0>
<cfparam name="form.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.phase" default=0>
<cfparam name="form.choice_id" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.top_num" default=0>
<cfparam name="url.primary" default=1>
<cfparam name="url.secondary" default=2>
<cfparam name="url.uuid" default=0>
<cfparam name="url.fid" default=0>

<cfif form.email neq 0>


<!--- <cfoutput>#form.email#  #url.phase#</cfoutput>
<cfabort> --->


	
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>
	
	
		<cfif url.phase eq 1>
		
			<cfquery name="del" datasource="#application.dsn#"> 
				DELETE FROM
				t_bake_off 
				WHERE cid = #client.cid#
				AND business_element = 'generic_descriptor'
			</cfquery>
		
        	<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET business_desc = '#form.business_desc#'
				WHERE cid = #client.cid#
			</cfquery>
        
        
			<cfset choiceList = "1,2,3,4,5,6">
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.choice_" & i) neq "">  
							
						<!---  <cfset "form.choice_#i#" = Replace(evaluate("form.choice_" & i),"'","''")> --->
						
						 
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, gd_n)
									VALUES
									(#client.cid#, '#client.name#', '#Replace(evaluate('form.choice_' & i),"'","''")#', '#ucase(form.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', #i#)							
							</cfquery>
			
						</cfif> 
						
					</cfloop>
			<cfoutput>
				<cflocation url="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&updated=1&phase=2">
			</cfoutput>


		<cfelseif url.phase eq 2>
		
					<!--- Send off the exercise to the bakeoff emails chosen. --->
					
			<cfinclude template="functions/sendEmails_bakeoff.cfm">
				
					
			<cfoutput>
				<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=1">
			</cfoutput>


		</cfif>

<cfelseif form.experts neq 0>

	<cfquery name="del" datasource="#application.dsn#"> 
		DELETE FROM
		t_bake_off 
		WHERE cid = #client.cid#
		AND business_element = 'generic_descriptor'
	</cfquery>

	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>

	<cfset choiceList = "1,2,3,4,5,6">
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.choice_" & i) neq "">  
						
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, gd_n, expert)
									VALUES
									(#client.cid#, '#client.name#', '#evaluate('form.choice_' & i)#', '#ucase(form.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', #i#, 1)							
							</cfquery>
			
						</cfif> 
						
					</cfloop>

					<cfset emailList = "shalabhojha@gmail.com,ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@jumpstartmarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_gen_desc_feedback.cfm?cid=#client.cid#&feedback=1&be=#form.be#&e=1

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&be=#url.be#&sent=1">
	</cfoutput>

<cfelseif url.feedback neq 0>
	

	<cfif NOT IsDefined("form.choice_id")>
    	<cfoutput>
			<cflocation url="dsp_gen_desc_feedback.cfm?update=1&be=#url.be#&primary=#url.primary#&secondary=#url.secondary#&top_num=#url.top_num#&fid=#url.fid#&cid=#url.cid#&uuid=#url.uuid#">
		</cfoutput>
    </cfif>


	<!--- Calculate & Update how many times each element possibility is chosen. 
	<cfinclude template="functions/calcTimesChosen.cfm">--->
    
    
    


<cfif url.uuid eq 0>	
	<cfset url.uuid = CreateUUID()>
</cfif>


							<cfquery name="business" datasource="#application.dsn#"> 
								UPDATE t_bake_off 
									SET times_chosen = (times_chosen + 1)					
									<cfif url.e eq 1>, expert = 1</cfif>									
								WHERE id = #form.choice_id#
							</cfquery>
					
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_uuids
									(cid, uuid, be, type, fid)
								VALUES
									(#url.cid#,'#url.UUID#','#url.be#','choice', #url.fid#)
							</cfquery>
			

<!--- 	<cfoutput>#url.primary#  #url.secondary#</cfoutput>
 <br> --->
			
	<cfset url.secondary = url.secondary + 1>
			<!--- Add one the the secondary var --->
		<cfif url.secondary gt 6>
				<!--- If the secondary var is greater than the amount used in the choice exercise --->
					<!--- Move on to the next starting point var --->
			<cfset url.primary = url.primary + 1>
						
			<cfset url.secondary = url.primary + 1>
				<!--- Set the secondary to one more than the NEW value of the primary --->
		</cfif>
	
 	<!--- <cfoutput>#url.primary#  #url.secondary#</cfoutput>
	<cfabort>  --->


	

	
	
					
					
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #url.cid#
	</cfquery>		
				
	<!--- Send an email alerting the client that someone has given feedback on their business. --->

	<cfif url.primary gte 6>
		<cfmail to="#c.email#" from="info@jumpstartmarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#


Sincerely,

		
The Jumpstart Marketer Team					
	
		</cfmail>		
	</cfif>
        			
	
	<cfoutput>
		<cflocation url="dsp_gen_desc_feedback.cfm?update=1&be=#url.be#&primary=#url.primary#&secondary=#url.secondary#&top_num=#url.top_num#&cid=#url.cid#&fid=#url.fid#&uuid=#url.uuid#">
	</cfoutput>

<cfelse>

	<cfquery name="del" datasource="#application.dsn#"> 
		DELETE FROM
		t_bake_off 
		WHERE cid = #client.cid#
		AND business_element = 'generic_descriptor'
	</cfquery>

	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>
	
	<cfset choiceList = "1,2,3,4,5,6">
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.choice_" & i) neq "">  
						
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, gd_n)
									VALUES
									(#client.cid#, '#client.name#', '#evaluate('form.choice_' & i)#', '#ucase(form.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', #i#)							
							</cfquery>
			
						</cfif> 
						
					</cfloop>
	
		<cfoutput>
			<cflocation url="dsp_gen_desc_names.cfm?be=#url.be#&sub=1">
		</cfoutput>


</cfif>