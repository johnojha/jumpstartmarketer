	
	<cfoutput>
	'#trim(form.profile_business_desc)#',
           '#trim(form.profile_product_desc)#'
	</cfoutput>
	
	
	
	<cfquery name="up1" datasource="#application.dsn#">
	
		UPDATE t_business
			SET 
			profile_business_desc = '#trim(form.profile_business_desc)#',
           	profile_product_desc = '#trim(form.profile_product_desc)#'
		WHERE cid = #client.cid#
	
	</cfquery>
	
	<cfquery name="up2" datasource="#application.dsn#">
	
		UPDATE t_clients
			SET 
			name = '#trim(form.name)#',
           	email = '#trim(form.email)#',
			password = '#trim(form.password)#',
			address = '#trim(form.address)#',
			city = '#trim(form.city)#',
			state = '#trim(form.state)#',
			phone = '#trim(form.phone)#'
		WHERE id = #client.cid#
	
	</cfquery>
	
	<cflocation url="index.cfm?fa=profile">
	
	