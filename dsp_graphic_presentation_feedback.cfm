
<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.update" default=0>
<cfparam name="url.e" default=0><head>
	<title>
		PowerMarketer
	</title>
</head>






<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>

	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = 'graphic_presentation'
			AND uuid IS NULL
		ORDER BY id
	</cfquery>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
<cfif url.update neq 0>	
			<tr> 
				<td>				<br><br><br>
					<font color="green">*** <b>Thank you. Your feedback has been recorded.</b> ***</font>
				<br><br><br>
				<a href="http://www.jumpstartmarketer.com" class="bodylink3">www.jumpstartmarketer.com</a>
				</td>
			</tr>
<cfelse>
			<tr> 
				<td>
					
				</td>
			</tr>
			<tr> 
				<td>
					
				</td>
			</tr>	
			<tr> 
				<td>
<font color="green">***</font> PLEASE <strong>REVIEW</strong> THE MARKETING TERM BELOW <font color="green">***</font>
<br><br>			
<li><strong>GRAPHIC PRESENTATION</strong>: Refers to the entire marketing package of the product or service; the way the product or service is presented to the public.</li>
 <br><br>
 
<cfinclude template="includes/dsp_rating_instructions.cfm">

				</td>
			</tr>		
			
		<cfoutput>
	<form name="business" action="act_key_graphic_names.cfm?be=#url.be#&cid=#url.cid#&feedback=1<cfif url.e eq 1>&e=1</cfif>" method="post">
		</cfoutput>
		
			<cfif names.recordcount eq 0>
				<tr>
					<td>
						<strong>There are currently no graphic presentations.</strong>
					</td>
				</tr>
			<cfelse>
			<cfoutput query="names">
				<tr>
					<td align="center">
					<hr>
					<br>

							<img src="images/graphic_presentation/#url.cid#/#names.element_text#" border="0">  
						
					
					<br>
					<br>
					Rate 1 to 7, 7 being most significantly influenced by its presence.
					<br><br>
					<br>
					<table class="black14" border="0">
						<tr>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=1> 1 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=2> 2 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=3> 3 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=4> 4 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=5> 5 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=6> 6 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=7> 7 
								&nbsp; &nbsp;</font>
							</td>
						</tr>
						<tr>
							<td align="center" nowrap="nowrap" colspan="7">
								<img src="images/spectrum_bg.jpg">
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap" align="center">
								<font size="1">Rejected</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Poor</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Weak</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Average</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Preferred</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Strong</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Remarkable</font>
							</td>
						</tr>
					</table>
					
					
					
					<br>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="000000">
					<br><br>
					</td>
				</tr>	
			</cfoutput>
			</cfif>	
			<tr> 
				<td bgcolor="336699" align="center">
				
					<input type="submit" value="Submit"> 
				</td>
			</tr>
			</form>	

</cfif>
	  	</table>
		<br><br>
	
