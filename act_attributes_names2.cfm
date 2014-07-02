<cfparam name="url.continue" default=0>
<cfparam name="form.email" default=0>
<cfparam name="form.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.feedback2" default=0>
<cfparam name="url.f2" default=0>
<cfparam name="url.e" default=0>


<cfif form.email neq 0>

					
					
					
<!--- Send off the exercise to the bakeoff emails chosen. --->
			<cfinclude template="functions/sendEmails_bakeoff.cfm">
			
			
			
					
	<cfoutput>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&sent=3">
	</cfoutput>


<cfelseif form.experts neq 0>


					<cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,dtkelly72@yahoo.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_attributes_feedback2.cfm?cid=#client.cid#&feedback=1&be=#form.be#&e=1

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&be=#url.be#&sent=1">
	</cfoutput>


<cfelse>


	
		<cfoutput>
			<cflocation url="dsp_attributes_names2.cfm?be=#url.be#&sub=1">
		</cfoutput>


</cfif>