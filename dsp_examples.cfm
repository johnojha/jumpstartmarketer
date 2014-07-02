
<link href="styles/style1.css" rel="stylesheet" type="text/css">


		<cfquery name="elements" datasource="#application.dsn#">
			SELECT id, example_text, be
			FROM t_element_examples
			WHERE  be = '#url.be#'
		</cfquery>	


	<table border="1" cellspacing="1" cellpadding="0" width="100%" bgcolor="336699" class="black14">
		<tr>
			<td align="center" bgcolor="CCCCCC">
				<b>
					<cfif url.be eq "rtb">
						ENDORSEMENT
					<cfelse>
						<cfoutput>#replace(ucase(url.be),"_"," ","All")#</cfoutput> 
					</cfif>
					EXAMPLES
				</b>
			</td>
		</tr>
	<cfoutput query="elements">
		<tr>
			<td bgcolor="FFFFFF" align="center">
				<cfif elements.example_text CONTAINS ".jpg">
					<img src="images/examples/#names.element_text#" border="0">
				<cfelse>
					#elements.example_text#
				</cfif>
			</td>
		</tr>
	</cfoutput>
	</table>