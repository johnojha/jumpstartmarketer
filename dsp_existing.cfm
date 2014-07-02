	<cfparam name="url.be" default=0>
	<cfparam name="url.logo" default=0>
	<cfparam name="url.upload_logo" default=0>
	<cfparam name="url.big" default=0>
	<cfparam name="url.update" default=0>
	<cfparam name="url.delete" default=0>
	<cfparam name="url.review" default=0>
	<cfparam name="url.nojpg" default=0>
	<cfparam name="url.resize" default=0>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
			<tr> 
				<td  align="center" valign="bottom" class="header16" colspan="2" >
				<cfif url.be eq "brand">
					<img src="images/existing_brand_header.jpg">
				<cfelse>
					<img src="images/existing_sub_brand.jpg">
				</cfif>
				</td>
			</tr>	
			<tr>
				<td align="center" colspan="2">&nbsp;
					
				</td>
			</tr>

			<tr>
				<td align="center" colspan="2">
				<cfif url.be eq "brand">
					<img src="images/brand_enter.jpg">
				<cfelse>
					<img src="images/enter_sub_brand.jpg">
				</cfif>
					
				</td>
			</tr>


	<cfoutput>
		<form name="existing" action="act_existing.cfm?be=#url.be#&logo=#url.logo#" method="post">
			<tr>
				<td align="center" width="50%" valign="middle">
					
					<br>
				<cfif url.be eq "brand">
					BRAND NAME<br>
				<cfelse>
					SUB-BRAND NAME<br>
				</cfif>
					
					 <input type="text" name="existing_be" size="30"> 
				</td>
				<td width="50%" valign="bottom">	<br>
					<input type="hidden" name="business_element" value="#trim(url.be)#">
					<input type="image" src="images/brand_submit.jpg" onclick="submit(existing)"> 					
				</td>
			</tr>
		</form>
	</cfoutput>


		</table>