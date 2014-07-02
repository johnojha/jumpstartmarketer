<cfquery name="login" datasource="#application.dsn#"> 
		SELECT id, email, password, name
		FROM t_clients
		WHERE email = '#trim(form.txtEmail)#' 
				
	</cfquery>
	

	<cfmail to="#form.txtEmail#" from="info@JumpStartMarketer.com" subject="Your Login Credentials of Jumpstartmarketer.com">
		

		
Please find below your login credentials 

Email: #form.txtEmail#



Password: #login.password#




</cfmail>



<cfoutput>
		<cflocation url="index.cfm?fa=forgotpassword&sent=1">
</cfoutput>