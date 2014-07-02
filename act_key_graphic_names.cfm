<cfparam name="url.continue" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.be" default=0>
<cfparam name="form.key_graphic_cd" default=0>
<cfparam name="form.brand_logo_cd" default=0>
<cfparam name="form.sub_brand_logo_cd" default=0>
<cfparam name="form.graphic_presentation_cd" default=0>
<cfparam name="form.graphic_presentation_ready" default=0>
<cfparam name="url.primary" default=1>
<cfparam name="url.top_num" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="url.radio" default=0>
<cfparam name="url.fid" default=0>


<cfinclude template="functions/Element_Progress.cfm">


<cfset rate=evaluate('rate_' & url.be & '.recordcount')>

<cfif evaluate('form.' & url.be & '_cd') neq 0>
	

				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET #url.be#_cd = 1
					WHERE cid = #client.cid#
				</cfquery>
	
	<cfoutput>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&#url.be#_cd=1">
	</cfoutput>		
	
</cfif>

<cfif form.graphic_presentation_ready neq 0>
	
		
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET graphic_presentation_ready = 1
					WHERE cid = #client.cid#
				</cfquery>
	
	<cfoutput>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&graphic_presentation_ready=1">
	</cfoutput>		
	
</cfif>


<cfif url.email neq 0>

					
					
					<!--- Send off the exercise to the bakeoff emails chosen. --->
			<cfinclude template="functions/sendEmails_bakeoff.cfm">



					
	<cfoutput>
		
		<cfif rate lt 5>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=1&rate=#rate#&sentnew=0">
		</cfif>

		<cfif rate gte 5>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=3&rate=#rate#&sentnew=0">

		</cfif>
		
		
		
	


	</cfoutput>


<cfelseif url.experts neq 0>



					<cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,dtkelly72@yahoo.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_#url.be#_feedback.cfm?cid=#client.cid#&feedback=1&be=#url.be#&e=1

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&be=#url.be#&sent=1&sentnew=0">
	</cfoutput>


	
<cfelseif url.feedback neq 0>
	

	<cfif form.fieldnames eq 0>
		<cfoutput>
			<cflocation url="dsp_#url.be#_feedback.cfm?radio=1&be=#url.be#&primary=#url.primary#&top_num=#url.top_num#&cid=#url.cid#&fid=#url.fid#&uuid=#url.uuid#">
		</cfoutput>
    </cfif>

		<!--- Calculate and Update ratings for this element. --->
	<cfinclude template="functions/calcRatings.cfm">
	
				
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #url.cid#
	</cfquery>		
				
	<!--- Send an email alerting the client that someone has given feedback on their business. --->

	<cfif url.primary eq url.top_num>
		
		<cfif evaluate('rate_' & url.be & '.recordcount') gte 5  and  evaluate('rate_' & url.be & '.recordcount') lt 6>
		
		<cfmail to="#c.email#" from="info@JumpStartMarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#


Sincerely,

		
The Jumpstart Marketer Team					
	
		</cfmail>	
		</cfif>
    </cfif>	
			
            <cfset url.primary = url.primary + 1>
            		
					<cfoutput>
						<cflocation url="dsp_#url.be#_feedback.cfm?&be=#url.be#&primary=#url.primary#&top_num=#url.top_num#&cid=#url.cid#&fid=#url.fid#&uuid=#url.uuid#">
					</cfoutput>

<cfelse>


























		<cfoutput>
			<cflocation url="dsp_#url.be#_upload.cfm?be=#url.be#&sub=1">
		</cfoutput>


</cfif>