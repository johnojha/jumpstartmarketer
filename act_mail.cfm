
<cfparam name="url.del" default=0>

<cfif url.del neq 0>

	<cfset mailList = form.fieldnames>
	
	<cfloop list="#mailList#" index="i">
	
		<cfquery name="del" datasource="#application.dsn#"> 
			DELETE t_mail 
			WHERE id = #i#
		</cfquery>
	
	</cfloop>	
	
		<cfoutput>
			<cflocation url="index.cfm?fa=mail">
		</cfoutput>
	
</cfif>