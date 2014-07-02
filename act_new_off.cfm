<cfquery name="business" datasource="#application.dsn#"> 
		INSERT INTO t_bake_off 
			(cid, c_name, element_text, business_element, date_submitted <cfif url.be eq "brand" OR url.be eq "sub_brand">,legal_clearance</cfif>)
		VALUES
			(#client.cid#, '#client.name#', '#form.txtelement2#', '#form.txtelement1#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#' <cfif url.be eq "brand" OR url.be eq "sub_brand">,1</cfif>)							
		</cfquery>


		<cfoutput>
		<cflocation url="index.cfm?fa=bake_off&be=#url.be#&clientid=#client.cid#">
	</cfoutput>