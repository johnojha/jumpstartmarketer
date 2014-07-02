				


<cfquery name="support" datasource="#application.dsn#">

	INSERT INTO c_support_tickets
		(cid, name, email, message, UUID, date_submitted)
		VALUES(#client.cid#, '#form.name#', '#form.email#', '#form.message#', '#form.UUID#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#') 
		
</cfquery>


						
<cfmail to="john_ojha@yahoo.com,ericc@chambersgroup.com,brandenc@chambersgroup.com,keith@chambersgroup.com,dtkelly72@yahoo.com" from="info@jumpstartmarketer.com" subject="Support Request from JumpStartMarketer.com">
		

		
A Support ticket has been submitted from jumpstartmarketer.com

Ticket Number: #CreateUUID()#

by: #form.name#

email: #form.email#

Message:
#form.message#



A support ticket has been logged in the database.


</cfmail>

						
					

	<cfoutput>
		<cflocation url="index.cfm?fa=support&sent=1">
	</cfoutput>