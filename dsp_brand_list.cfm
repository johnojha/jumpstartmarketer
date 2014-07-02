
<link href="styles/style1.css" rel="stylesheet" type="text/css">


		<cfquery name="elements" datasource="#application.dsn#">
			SELECT id, cid, element_text, business_element
			FROM t_bake_off
			WHERE cid = #client.cid#
				AND business_element = '#url.be#'
		</cfquery>	


	<table border="1" cellspacing="0" cellpadding="0" width="100%" bgcolor="FFFFFF">
		<tr>
			<td align="center">
				<b>YOUR <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s</b>
			</td>
		</tr>
	<cfoutput query="elements">
		<tr>
			<td>
				#elements.element_text#
			</td>
		</tr>
	</cfoutput>
	</table>