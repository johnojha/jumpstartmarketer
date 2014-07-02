<cfparam name="url.continue" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.be" default=0>
<cfparam name="form.email" default=0>
<cfparam name="form.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="form.e" default=0>
<cfparam name="url.flip" default=0>
	
	
					<!--- Send off the exercise to the bakeoff emails chosen. --->
			<cfinclude template="functions/sendEmails_bakeoff.cfm">
			
			
					
	<cfoutput>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&sent=1&sentnew=1">
	</cfoutput>