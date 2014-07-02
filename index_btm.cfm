<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Connectics.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/style1.css" rel="stylesheet" type="text/css">
</head>
<cfparam name="fa" default="home">
<cfparam name="client.c_id" default=0>



<body leftmargin="0" topmargin="0" bgcolor="000000">


<!---<table bgcolor="000000" width="100%" height="100%" cellpadding="0" cellspacing="0"><tr><td align="left">	--->	
<table border="0" cellspacing="0" cellpadding="0" width="827" height="618" bgcolor="000000">
  <!---<tr>
    <td colspan="3" height="70" bgcolor="000000"></td>
  </tr>--->
  <tr>
    <td width="159" height="618" background="images/menu_bg2.jpg" valign="top" align="center" rowspan="3">
	<cfinclude template="menu_left.cfm"> 	
	<!--- <cfinclude template="menu.cfm"> --->
	</td>
	<td width="668" height="30" bgcolor="000000" align="right">
	<cfinclude template="menu_top.cfm">		
	</td>
  </tr>
  <tr>
    <td width="668" height="426" valign="top" colspan="3">
	
<cfswitch expression="#fa#">
	 <cfcase value="home">
        <cfinclude template="dsp_home.cfm">
     </cfcase>
	 <cfcase value="about_us">
        <cfinclude template="dsp_about_us.cfm">
     </cfcase>
	 <cfcase value="your_goal">
        <cfinclude template="dsp_your_goal.cfm">
     </cfcase>
	 <cfcase value="selling_prop">
        <cfinclude template="dsp_selling_prop.cfm">
     </cfcase>
	 <cfcase value="impact_point">
        <cfinclude template="dsp_impact_point.cfm">
     </cfcase>
	 <cfcase value="my_brand">
        <cfinclude template="dsp_my_brand.cfm">
     </cfcase>
	 <cfcase value="personal_questions">
        <cfinclude template="dsp_personal_questions.cfm">
     </cfcase>
  </cfswitch>
	
	</td>
<!--- 	<td width="10" bgcolor="CCCCCC" rowspan="2">
		
		<table height="100%" bgcolor="44507A">
			<tr>
				<td width="80" height="100%" bgcolor="44507A">&nbsp;
				
				</td>
			</tr>
		</table> 
		
	</td> --->
  </tr>
<tr>
	<td colspan="3" align="left" background="images/bottom_bg2.jpg" height="162" width="668">&nbsp;
		
	</td>
</tr>

</table>

<!---
		</td>
	</tr>
</table>
--->



</body>
</html>
