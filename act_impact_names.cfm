<cfparam name="url.continue" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.e" default=0>

<cfif url.email neq 0>

					
					
					<!--- Send off the exercise to the bakeoff emails chosen. --->
			<cfinclude template="functions/sendEmails_bakeoff.cfm">



					
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&be=#url.be#&sent=1">
	</cfoutput>


<cfelseif url.experts neq 0>



					<cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,dtkelly72@yahoo.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_key_graphic_feedback.cfm?cid=#client.cid#&feedback=1&be=#url.be#&e=1

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&be=#url.be#&sent=1">
	</cfoutput>


	
<cfelseif url.feedback neq 0>
	
	
	

		<!--- Calculate and Update ratings for this element. --->
	<cfinclude template="functions/calcRatings.cfm">
	
	
	
		<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #url.cid#
	</cfquery>		
				
	<!--- Send an email alerting the client that someone has given feedback on their business. --->


						<cfmail to="#c.email#" from="info@JumpStartMarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#


Sincerely,

		
The Jumpstart Marketer Team					
	
	</cfmail>		
					
					<cfoutput>
						<cflocation url="dsp_key_graphic_feedback.cfm?update=1&be=#url.be#">
					</cfoutput>

<cfelse>


		<cfoutput>
			<cflocation url="dsp_key_graphic_upload.cfm?be=#url.be#&sub=1">
		</cfoutput>


</cfif>