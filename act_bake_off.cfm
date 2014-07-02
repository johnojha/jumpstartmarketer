
<cfparam name="url.legal" default=0>
<cfparam name="url.delete" default=0>
<cfparam name="url.add" default=0>


<cfif url.legal eq 1>
	<cfset fieldList = form.fieldnames>
		<cfloop list="#fieldList#" index="i">
			<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_bake_off 
					SET legal_clearance = 1				
				WHERE cid = #client.cid#
					AND id = '#evaluate("form." & i)#'
			</cfquery>
		</cfloop>
</cfif>


<cfif url.delete eq 1>

			<cfquery name="business" datasource="#application.dsn#"> 
				DELETE t_bake_off 			
				WHERE cid = #client.cid#
					AND id = #url.bid#
			</cfquery>

</cfif>

<cfif url.add eq 1>

		<cfquery name="business" datasource="#application.dsn#"> 
		INSERT INTO t_bake_off 
			(cid, c_name, element_text, business_element, date_submitted <cfif url.be eq "brand" OR url.be eq "sub_brand">,legal_clearance</cfif>)
		VALUES
			(#client.cid#, '#client.name#', '#form.element_text#', '#form.business_element#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#' <cfif url.be eq "brand" OR url.be eq "sub_brand">,#form.legal_clearance#</cfif>)								
		</cfquery>
		
</cfif>

<cfif url.add eq 1>
	<cfoutput>
		<cflocation url="index.cfm?fa=bake_off&be=#url.be#&added=1&edit=1">
	</cfoutput>
<cfelseif url.delete eq 1>
	<cfoutput>
		<cflocation url="index.cfm?fa=bake_off&be=#url.be#&deleted=1&edit=1">
	</cfoutput>
<cfelseif url.legal eq 1>
	<cfoutput>
		<cflocation url="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=3">
	</cfoutput>
<cfelse>
	<cfoutput>
		<cflocation url="index.cfm?fa=bake_off&be=#url.be#">
	</cfoutput>
</cfif>