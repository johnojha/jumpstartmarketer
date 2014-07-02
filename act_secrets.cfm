		
		
<cfparam name="url.step" default=0>

		
		
		<cfif url.step eq "sp">
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET secrets_sp = 1
					WHERE cid = #client.cid#
				</cfquery>
		<cfelseif url.step eq "impact">
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET secrets_impact = 1
					WHERE cid = #client.cid#
				</cfquery>
		<cfelseif url.step eq "goal">
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET secrets_goal = 1
					WHERE cid = #client.cid#
				</cfquery>
		<cfelseif url.step eq "paradigm">
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET secrets_paradigm = 1
					WHERE cid = #client.cid#
				</cfquery>
		<cfelseif url.step eq "model">
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET secrets_model = 1
					WHERE cid = #client.cid#
				</cfquery>
			<cfoutput>
				<cflocation url="index.cfm?fa=intro&next=1">
			</cfoutput>
		<cfelseif url.step eq "friends">
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET friends_explained = 1
					WHERE cid = #client.cid#
				</cfquery>
			<cfoutput>
				<cflocation url="index.cfm?fa=intro&friends=1">
			</cfoutput>
		<cfelseif url.step eq "consumer">
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET consumer_explained = 1
					WHERE cid = #client.cid#
				</cfquery>
			<cfoutput>
				<cflocation url="index.cfm?fa=intro&consumer=1">
			</cfoutput>
		</cfif>
		
		<cfoutput>
			<cflocation url="index.cfm?fa=secrets">
		</cfoutput>
		
