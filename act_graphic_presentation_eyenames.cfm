<cfparam name="url.continue" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.eye" default=0>
<cfparam name="url.final" default=0>

<!---
<cfoutput>#url.email#, #url.final#</cfoutput>
<cfabort>--->

<cfif url.email neq 0>

		<!--- get peer criteria to establish who should be sent emails requesting feedback --->
	<cfquery name="temp" datasource="#application.dsn#"> 
		SELECT id, email, name
		FROM t_consumer_emails
WHERE ID IN (1,3,4,5,15) 
	</cfquery>									
					
					<!--- Send off the exercise to the bakeoff emails chosen. --->
			<!--- <cfinclude template="functions/sendEmails_bakeoff.cfm"> --->

					<!--- <cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,dtkelly72@yahoo.com,dominic.ctr.kelly@faa.gov"> --->
					
					<cfoutput query="temp">
					
						
						<cfmail to="#temp.email#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_#url.be#_eye.cfm?cid=#client.cid#&feedback=1&be=#url.be#&final=#url.final#

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
				</cfoutput>

	<cfquery name="eye_status" datasource="#application.dsn#">
		INSERT INTO t_exercise_status
			(cid,be,consumer_sent,final)
		VALUES (#client.cid#,'eye_tracking_study',1,<cfif url.final eq 1>1<cfelse>0</cfif>)
	</cfquery>		
				
					
	<cfoutput>
		<cflocation url="index.cfm?fa=archives_eye&be=eye_tracking_study&sent=1&eye=1&final=#url.final#">
	</cfoutput>


<cfelseif url.experts neq 0>



					<cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,dtkelly72@yahoo.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_#url.be#_eye.cfm?cid=#client.cid#&feedback=1&be=#url.be#&e=1&final=#url.final#

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=archives_eye&be=eye_tracking_study&sent=1&eye=1&final=#url.final#">
	</cfoutput>

</cfif>