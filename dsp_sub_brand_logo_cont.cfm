

				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET sub_brand_logo_education = 1
					WHERE cid = #client.cid#
				</cfquery>


			<SCRIPT LANGUAGE="JavaScript">	
				function popUp(URL) {
				day = new Date();
				id = day.getTime();
				eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=350,height=500,left = 476,top = 332');");
				}
			</script>

<link href="styles/style1.css" rel="stylesheet" type="text/css">

	<cfquery name="level" datasource="#application.dsn#">
		SELECT expert
		FROM t_clients
		WHERE id = #client.cid#
	</cfquery>
		
		<table width="600" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr>
				<td>


			<br><br>		
<A HREF="javascript:window.print()" class="bodylink3">Print This Page</a>							 <div class="black16" align="center"><img src="images/elements/Element_sub_brand_logo_header.jpg"> </div>   
								 <br>

What is generally referred to as a logo has two possible graphic components. (1) The logotype which is a brand name that has been graphically altered to achieve the appearance of uniqueness and (2) the logo which is a brand symbol that can be used to communicate the brand without using its words.
<br><br>
Using the following six sub-brands, I will demonstrate the virtues of a strong logo / logotype.
<br>
  <img src="images/sub_brand_logos.jpg">           
<br>
Generally the brand is always present at the impact point along with the sub-brand. The purpose of the sub-brand is to characterize a special product or service within the larger brand offering. Given its importance, the sub-brand is usually much more prevalent than the brand. In such cases, target consumers will refer to the Sub-Brand when referencing the product or service. As in "I want some Go-Gurt". The function of the brand in the presence of a sub-brand is to add credibility. As in "Go-Gurt is made by Yoplait".
<br><br>
The Microsoft, X Box 360 brand and sub-brand are seen here together but the X Box 360 brand is frequently used without its parent brand. That is also true of the Nintendo Wii. The Microsoft X Box 360 is an example of equal prominence, which is never a good idea. You should always direct the eye initially to one then to the other. They should not compete.
<br><br>
Yoplait Go-Gurt is typical of the sub-branding seen in the grocery category where the brand is always present and significantly subordinated to a dominant sub-brand.  This works well.
<br><br>
Google, Gmail incorporates the multi color lettering of its parent Google and cleverly subordinates the Brand to "by Google" in grey.  This works well.
 <br><br>
Wolfgang Puck, Grand Cafe is brand dominant because of the strong black bar and graphic which by design gives a lot of space to the Grand Café sub-brand area to be festive.
<br><br>
American Airlines, American Eagle works because they have incorporated the American Airlines logo. Additionally they use the "American" logotype with a script "Eagle" and it works. This is clearly an American Airlines sub-brand even without the full American Airlines image.
<br><br>

								Before you start working on your brand, click on the “EXAMPLES” icon and review additional Brand examples to see how they relate to your business. 
	
								
								<br><br>
								Now that you have a clear understanding of the nature and function of a great Brand name, it is time to create one for your business by beginning the <strong>Expert Feedback Process</strong>.
								
								 <br><br>
								Please click ONE option below.
								<br><br>

								<li><a href="index.cfm?fa=elements&be=sub_brand_logo&bg=1">I want to develop a SUB-BRAND LOGO</a></li>
                                <br><br>
                                <li><a href="index.cfm?fa=upload_logo&be=sub_brand_logo">I have an existing SUB-BRAND LOGO</a></li> 							 
								<br><br> 
							

						<br><br> 
 
				</td>
			</tr>
			<tr>
				<td>

				</td>
			</tr>
	</table>		