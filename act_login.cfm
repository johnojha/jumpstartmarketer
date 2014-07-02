	
	
	<cfquery name="login" datasource="#application.dsn#"> 
		SELECT id, email, password, name,religion
		FROM t_clients
		WHERE email = '#trim(form.email)#' 
				AND password = '#trim(form.password)#'
	</cfquery>


	<cflock scope="session" type="exclusive" timeout="10" >
         <cfset session.type = login.religion>
         </cflock>
	
	<cfif login.recordcount neq 0>
		<cfset client.cid = login.id>
		<cfset client.name = login.name>
		<cfset client.username = login.email>
		<cfset client.email = login.email>
        
        
	
			<cfquery name="client_progress" datasource="#application.dsn#"> 
				SELECT *
				FROM t_client_progress
				WHERE cid = #client.cid#
			</cfquery>	
		
		<cfif client_progress.consumer_explained eq 1>
			<cfoutput>
				<cflocation url="index.cfm?fa=my_business">
			</cfoutput>
		<cfelse>
			<cfoutput>
				<cflocation url="index.cfm?fa=intro">
			</cfoutput>
		</cfif>
		
	<cfelse>
		<cflocation url="index.cfm?fa=login&logf=1">
	</cfif>