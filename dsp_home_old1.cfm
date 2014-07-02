<head>

<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>

</head>

<cfparam name="url.logf" default=0>

<body>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="white14" bgcolor="000000">
			<tr> 
				<td  align="left" colspan="2">
				
				</td>
			</tr>	
			<tr> 
				<td align="center" valign="top">
					<img src="images/HOME-PAGE-entre2.jpg">
					<img src="images/HOME-PAGE-now.jpg">
					<img src="images/HOME-PAGE-sales.jpg">
					<img src="images/HOME-PAGE-quote.jpg">
				</td>
				<td  align="center" valign="top" height="400">
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,0,0" width="340" height="105" id="accelescroller3" align="middle">
					<param name="allowScriptAccess" value="sameDomain" />
					<param name="movie" value="accelescroller3.swf" /><param name="quality" value="medium" /><param name="bgcolor" value="#000000" /><embed src="accelescroller3.swf" quality="medium" bgcolor="#000000" width="340" height="105" name="accelescroller3" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>
					<div align="center"> <a href="index.cfm?fa=products" class="yellowlink">View All Products</a><br></div>
					<a href="index.cfm?fa=products"><img src="images/HOME-PAGE-products.jpg" border="0"></a><br>
					<img src="images/HOME-PAGE-blurb.jpg"><br>
					  <div align="center"> <a href="index.cfm?fa=home_cont&bg=1" class="yellowlink">Continue</a><br></div>

					
					<table class="white14" border="0">
						<tr>
							<td colspan="2">
							<a href="index.cfm?fa=secrets"><img src="images/HOME-PAGE_tour.jpg" border="0"></a>
							</td>
						</tr>
				 <cfif url.logf eq 1>
						<tr>
							<td colspan="2" class="yellow14">
							Login Failed. Please try again, or email customer service.
							</td>
						</tr>
				 </cfif>
						<form name="login" action="act_login.cfm" method="post">
							<tr>
								<td>
									Email/Login:<br>
									<input type="text" name="email" size="20">
								</td>
								<td>
									Password:<br>
									<input type="password" name="password" size="20">
								</td>				
							</tr>
						
						<tr>
							<td colspan="2" valign="top">
								<input type="image" src="images/HOME-PAGE_login.jpg" onClick="submit(login)" align="middle"> 
									
								<a href="index.cfm?fa=register"><img src="images/HOME-PAGE_register.jpg" align="middle" border="0"></a>
							</td>
						</tr>
						</form>
					</table>	
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
				<td valign="top">
	
				</td>
			</tr>
		</table>	
		
</body>