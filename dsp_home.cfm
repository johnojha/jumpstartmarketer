<head>

<script language='javascript'>
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }
</script>

	<SCRIPT LANGUAGE="JavaScript">	
		function popUp(URL) {
		day = new Date();
		id = day.getTime();
		eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=250,height=250,left = 476,top = 332');");
		}
	</script>

</head>

<cfparam name="url.logf" default=0>
<cfparam name="url.logout" default=0>

<body>

	<table border="0" cellspacing="0" cellpadding="0" width="500" bgcolor="F3F4F6">
		<tr><td align="right"><img src="images/home_entre.jpg"></td><td><img src="images/home_until.jpg"></td></tr>
		<tr><td valign="top"><img src="images/home_explain.jpg">
		<cfinclude template="dsp_login.cfm">
		</td><td><div style="width: 400px; height: 190px; background-color: white; overflow:scroll; overflow-auto: hidden" class="black14">
		<cfinclude template="dsp_home_cont.cfm"></div>
		<br>
		<a href="javascript:popUp('dsp_video_intro.cfm')"><img src="images/home_video.jpg" border="0"></a>
		<img src="images/home_testim.jpg"></td></tr>
	<!---	<tr><td><img src="images/home_hereyouget.jpg"></td><td><a href="javascript:popUp('dsp_video_intro.cfm')"><img src="images/home_video.jpg" border="0"></a><br><a href="index.cfm?fa=register"><img src="images/home_register.jpg" border="0"></a></td></tr>
		<tr><td><img src="images/home_page_V3_2_1.jpg"></td><td><img src="images/home_page_V3_2_2.jpg"></td></tr>--->
	<!--- 		<tr><td>
		<img src="images/home_products_2.jpg"><br>
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,0,0" width="340" height="105" id="accelescroller3" align="middle">
					<param name="allowScriptAccess" value="sameDomain" />
					<param name="movie" value="accelescroller3.swf" /><param name="quality" value="medium" /><param name="bgcolor" value="#000000" /><embed src="accelescroller3.swf" quality="medium" bgcolor="#000000" width="340" height="105" name="accelescroller3" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>
					<br><a href="index.cfm?fa=products" class="bodylink3">View All Products</a>
					<br>
		</td><td valign="top"><cfinclude template="dsp_login.cfm"></td></tr>
		<tr><td><img src="images/home_endorsement1.jpg"></td><td><img src="images/home_endorsement2.jpg"></td></tr>
	<tr><td><img src="images/home_page_V3_5_1.jpg"></td><td><img src="images/home_page_V3_5_2.jpg"></td></tr>
		<tr><td><img src="images/home_page_V3_6_1.jpg"></td><td><img src="images/home_page_V3_6_2.jpg"></td></tr> --->
	</table>
	<map id="home" name="home"><area shape="polygon" alt="Secrets to Success" title="" coords="15,222,165,224,316,265,316,283,17,281,6,255,6,230" href="index.cfm?fa=secrets" target="_self" /><area shape="polygon" alt="Video Introduction" title="" coords="67,105,62,100,411,104,395,248,258,243,67,174,54,135" href="javascript:popUp('dsp_video_intro.cfm')" /></map>
		
</body>