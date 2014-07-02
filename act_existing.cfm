<cfparam name="url.logo" default=0>


	<cfquery name="business" datasource="#application.dsn#"> 
		UPDATE t_business 
			SET #trim(form.business_element)# = '#trim(form.existing_be)#',
			 #trim(form.business_element)#_rating = 0,
			 existing_#trim(form.business_element)# = 1	 
		WHERE cid = #client.cid#
	</cfquery>
	
<cfif url.logo eq 0>
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&bg=1&existing_#form.business_element#=1">
	</cfoutput>
<cfelse>
	<cfoutput>
		<cflocation url="index.cfm?fa=upload_logo&be=#form.business_element#">
	</cfoutput>
</cfif>