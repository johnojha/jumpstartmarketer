				


<cfquery name="support" datasource="#application.dsn#">

	INSERT INTO c_contact_emails
		(cid, name, email, message, date_submitted)
		VALUES(#client.cid#, '#form.name#', '#form.email#', '#form.message#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#') 
		
</cfquery>

<cfif client.cid neq 0>
	<cfquery name="c" datasource="#application.dsn#">
		SELECT company_name FROM c_clients
		WHERE id = #client.cid#
	</cfquery>
</cfif>

<cfset emailList = "daisy@chambersgroup.com,ericc@chambersgroup.com,dtkelly72@yahoo.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Support Request from Jumpstartmarketer.com">
		

		
A contact email has been submitted from Jumpstartmarketer.com

by: #form.name#

<cfif client.cid neq 0>
Company: #c.company_name#
</cfif>	

email: #form.email#

Message:
#form.message#



This email has been logged in the database.


			
						</cfmail>

						
					</cfloop>

	<cfoutput>
		<cflocation url="index.cfm?fa=contact&sent=1">
	</cfoutput>