							
							
							<cfquery name="business" datasource="#application.dsn#"> 
								UPDATE t_business
									SET no_sub_brand = 1
									WHERE cid = #client.cid#
							</cfquery>
							
							
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&bg=1&nosub=1">
	</cfoutput>