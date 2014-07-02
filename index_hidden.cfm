<script language="JavaScript">
<!--
/"alert(location.href.toLowerCase());"/

if (-1 !=
              location.href.toLowerCase().indexOf('myconnectics.com')) 
              location.href='http://www.myconnectics.com/myconnectics/';
	  
//-->
</script>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>MyPowerMarketer.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/style1.css" rel="stylesheet" type="text/css">
</head>
<cfparam name="fa" default="home">
<cfparam name="bg" default=0>

<cfif fa eq "feedback" OR fa eq "home">
	<cfset bg = 1>
</cfif>
<!---<cfparam name="client.c_id" default=0> --->



<body leftmargin="0" topmargin="0"  <cfif fa eq "home">bgcolor="F3F4F6"<cfelse><cfif bg eq 0>bgcolor="000000"<cfelse>bgcolor="FFFFFF"</cfif></cfif>>

<!--- <cfif fa eq "home">
	<cfinclude template="dsp_home.cfm">
<cfelse> --->

<!---<table bgcolor="000000" width="100%" height="100%" cellpadding="0" cellspacing="0"><tr><td align="left">	--->	
<table border="0" cellspacing="0" cellpadding="0" width="100%" height="618" <cfif fa eq "home">bgcolor="F3F4F6"<cfelse><cfif bg eq 0>bgcolor="000000"<cfelse>bgcolor="FFFFFF"</cfif></cfif>>
<tr><cfif fa eq "home"><td colspan="3" bgcolor="F3F4F6"><img src="images/home_header_3.jpg"></td><cfelse><td width="133" height="74"><cfif bg eq 1><img src="images/HOME_PAGE_top_left.jpg"><cfelse><img src="images/HOME_PAGE_top_left_blk.jpg"></cfif></td><td width="100%" height="74" <cfif bg eq 0>bgcolor="000000"<cfelse>bgcolor="FFFFFF"</cfif> valign="top"><cfif bg eq 1><img src="images/HOME_PAGE_header_V3.jpg"><cfelse><img src="images/HOME_PAGE_header_V3_blk.jpg"></cfif></td></cfif></tr>
 
  <tr><cfif fa eq "home"><td width="100" background="images/home_menu_background_3.jpg" rowspan="2" valign="top"><br><br><br><br><br><cfif fa neq "home"><cfinclude template="menu_home.cfm"></cfif></td><cfelse><td width="133" height="79" valign="top" align="center"><cfif bg eq 1><img src="images/HOME_PAGE_left.jpg"><cfelse><img src="images/HOME_PAGE_left_blk.jpg"></cfif><!--- <cfinclude template="menu.cfm"> ---></td></cfif>
     <td <cfif fa eq "home">width="500"<cfelseif fa eq "elements">width="850"<cfelse>width="700"</cfif> height="600" valign="top" rowspan="4" colspan="2">
	
<cfswitch expression="#fa#">
	 <cfcase value="home">
        COMING SOON....
     </cfcase>
 	<cfcase value="home_hidden">
        <cfinclude template="dsp_home.cfm">
     </cfcase>
	 <cfcase value="login">
        <cfinclude template="dsp_login.cfm">
     </cfcase>
	 <cfcase value="home_cont">
        <cfinclude template="dsp_home_cont.cfm">
     </cfcase>	 
	 <cfcase value="special">
        <cfinclude template="dsp_special.cfm">
     </cfcase>
	 <cfcase value="about">
        <cfinclude template="dsp_about.cfm">
     </cfcase>	 
	 <cfcase value="personal_questions">
        <cfinclude template="dsp_personal_questions.cfm">
     </cfcase>
	 <cfcase value="my_business_def">
        <cfinclude template="dsp_my_business_def.cfm">
     </cfcase>
 	<cfcase value="project_form">
        <cfinclude template="dsp_project_form.cfm">
     </cfcase>
	 <cfcase value="my_business">
        <cfinclude template="dsp_my_business.cfm">
     </cfcase>
	 <cfcase value="view_sp">
        <cfinclude template="dsp_view_sp.cfm">
     </cfcase>
	 <cfcase value="elements">
        <cfinclude template="dsp_elements.cfm">
     </cfcase>
	 <cfcase value="tour">
        <cfinclude template="dsp_tour.cfm">
     </cfcase>
	 <cfcase value="tour_cont">
        <cfinclude template="dsp_tour_cont.cfm">
     </cfcase>
	 <cfcase value="secrets">
        <cfinclude template="dsp_secrets.cfm">
     </cfcase>
	 <cfcase value="feedback">
        <cfinclude template="dsp_feedback.cfm">
     </cfcase>
	 <cfcase value="bake_off">
        <cfinclude template="dsp_bake_off.cfm">
     </cfcase>
	 <cfcase value="consumer_exercise">
        <cfinclude template="dsp_consumer_exercise.cfm">
     </cfcase>
	 <cfcase value="bake_off_impact">
        <cfinclude template="dsp_bake_off_impact.cfm">
     </cfcase>
	 <cfcase value="intro">
        <cfinclude template="dsp_intro.cfm">
     </cfcase>
	 <cfcase value="friends_explained">
        <cfinclude template="dsp_friends_explained.cfm">
     </cfcase>
	 <cfcase value="consumer_explained">
        <cfinclude template="dsp_consumer_explained.cfm">
     </cfcase>
	 <cfcase value="products">
        <cfinclude template="dsp_products.cfm">
     </cfcase>
	 <cfcase value="welcome">
        <cfinclude template="dsp_welcome.cfm">
     </cfcase>
	 <cfcase value="register">
        <cfinclude template="dsp_cc.cfm">
     </cfcase>
	 <cfcase value="business_product">
        <cfinclude template="dsp_my_business_product.cfm">
     </cfcase>
	 <cfcase value="my_brand">
        <cfinclude template="dsp_my_brand.cfm">
     </cfcase>
	 <cfcase value="brand">
        <cfinclude template="dsp_my_brand.cfm">
     </cfcase>
	 <cfcase value="my_brand_cont">
        <cfinclude template="dsp_my_brand_cont.cfm">
     </cfcase>
	 <cfcase value="brand_cont">
        <cfinclude template="dsp_my_brand_cont.cfm">
     </cfcase>
	 <cfcase value="sub_brand">
        <cfinclude template="dsp_sub_brand.cfm">
     </cfcase>
	 <cfcase value="sub_brand_cont">
        <cfinclude template="dsp_sub_brand_cont.cfm">
     </cfcase>
	 <cfcase value="gen_desc">
        <cfinclude template="dsp_gen_desc.cfm">
     </cfcase>
	 <cfcase value="generic_descriptor">
        <cfinclude template="dsp_gen_desc.cfm">
     </cfcase>
	 <cfcase value="gen_desc_cont">
        <cfinclude template="dsp_gen_desc_cont.cfm">
     </cfcase>
	 <cfcase value="generic_descriptor_cont">
        <cfinclude template="dsp_gen_desc_cont.cfm">
     </cfcase>
	 <cfcase value="benefit">
        <cfinclude template="dsp_benefit.cfm">
     </cfcase>
	 <cfcase value="benefit_cont">
        <cfinclude template="dsp_benefit_cont.cfm">
     </cfcase>
	 <cfcase value="attributes">
        <cfinclude template="dsp_attributes.cfm">
     </cfcase>
	 <cfcase value="attributes_cont">
        <cfinclude template="dsp_attributes_cont.cfm">
     </cfcase>
	 <cfcase value="tag_line">
        <cfinclude template="dsp_tag_line.cfm">
     </cfcase>
	 <cfcase value="tag_line_cont">
        <cfinclude template="dsp_tag_line_cont.cfm">
     </cfcase>
	 <cfcase value="rtb">
        <cfinclude template="dsp_rtb.cfm">
     </cfcase>
	 <cfcase value="rtb_cont">
        <cfinclude template="dsp_rtb_cont.cfm">
     </cfcase>
	 <cfcase value="key_graphic">
        <cfinclude template="dsp_key_graphic.cfm">
     </cfcase>
	 <cfcase value="key_graphic_cont">
        <cfinclude template="dsp_key_graphic_cont.cfm">
     </cfcase>
	 <cfcase value="impact">
        <cfinclude template="dsp_impact.cfm">
     </cfcase>
	 <cfcase value="impact_cont">
        <cfinclude template="dsp_impact_cont.cfm">
     </cfcase>
	 <cfcase value="graphic_presentation">
        <cfinclude template="dsp_graphic_presentation.cfm">
     </cfcase>
	 <cfcase value="graphic_presentation_cont">
        <cfinclude template="dsp_graphic_presentation_cont.cfm">
     </cfcase>
	 <cfcase value="graphic_presentation_send">
        <cfinclude template="dsp_graphic_presentation_send.cfm">
     </cfcase>
	 <cfcase value="product_display">
        <cfinclude template="dsp_product_display.cfm">
     </cfcase>
	 <cfcase value="mail">
        <cfinclude template="dsp_mail.cfm">
     </cfcase>
	 <cfcase value="read_mail">
        <cfinclude template="dsp_read_mail.cfm">
     </cfcase>
	 <cfcase value="archives">
        <cfinclude template="dsp_archives.cfm">
     </cfcase>
 	<cfcase value="archives_eye">
        <cfinclude template="dsp_archives_eye.cfm">
     </cfcase>
	 <cfcase value="existing">
        <cfinclude template="dsp_existing.cfm">
     </cfcase>
	 <cfcase value="compose_mail">
        <cfinclude template="dsp_compose_mail.cfm">
     </cfcase>
	 <cfcase value="brand_names">
        <cfinclude template="dsp_brand_names.cfm">
     </cfcase>
	 <cfcase value="legal">
        <cfinclude template="dsp_legal.cfm">
     </cfcase>
	 <cfcase value="bakeoff_brand">
        <cfinclude template="dsp_bakeoff_brand.cfm">
     </cfcase>
	 <cfcase value="bakeoff_brand_logo">
        <cfinclude template="dsp_bakeoff_brand_logo.cfm">
     </cfcase>
	 <cfcase value="bakeoff_sub_brand">
        <cfinclude template="dsp_bakeoff_brand.cfm">
     </cfcase>
	 <cfcase value="bakeoff_sub_brand_logo">
        <cfinclude template="dsp_bakeoff_sub_brand.cfm">
     </cfcase>
	 <cfcase value="bakeoff_generic_descriptor">
        <cfinclude template="dsp_bakeoff_generic_descriptor.cfm">
     </cfcase>
	 <cfcase value="bakeoff_benefit">
        <cfinclude template="dsp_bakeoff_benefit.cfm">
     </cfcase>
	 <cfcase value="bakeoff_attributes">
        <cfinclude template="dsp_bakeoff_attributes.cfm">
     </cfcase>
	 <cfcase value="bakeoff_tag_line">
        <cfinclude template="dsp_bakeoff_tag_line.cfm">
     </cfcase>
	 <cfcase value="bakeoff_key_graphic">
        <cfinclude template="dsp_bakeoff_key_graphic.cfm">
     </cfcase>
	 <cfcase value="bakeoff_rtb">
        <cfinclude template="dsp_bakeoff_rtb.cfm">
     </cfcase>
	 <cfcase value="impact_results">
        <cfinclude template="dsp_impact_results.cfm">
     </cfcase>
	 <cfcase value="graphic_presentation_results">
        <cfinclude template="dsp_graphic_presentation_results.cfm">
     </cfcase>
	 <cfcase value="bakeoff_graphic_presentation">
        <cfinclude template="dsp_bakeoff_graphic_presentation.cfm">
     </cfcase>
	 <cfcase value="bakeoff_eye_tracking_study">
        <cfinclude template="dsp_bakeoff_eye_tracking_study.cfm">
     </cfcase>
	 <cfcase value="support">
        <cfinclude template="dsp_support.cfm">
     </cfcase>
	 <cfcase value="contact">
        <cfinclude template="dsp_contact.cfm">
     </cfcase>
	 <cfcase value="bakeoff_explained">
        <cfinclude template="dsp_bakeoff_explained.cfm">
     </cfcase>
	 <cfcase value="connectics_explained">
        <cfinclude template="dsp_connectics_explained.cfm">
     </cfcase>
	 <cfcase value="thank_you">
        <cfinclude template="dsp_thank_you.cfm">
     </cfcase>
	 <cfcase value="menu_test">
        <cfinclude template="dsp_menu_test.cfm">
     </cfcase>
	 <cfcase value="upload_logo">
        <cfinclude template="dsp_upload_logo.cfm">
     </cfcase>
	 <cfcase value="acknowledge_yourself">
        <cfinclude template="dsp_acknowledge_yourself.cfm">
     </cfcase>
	 <cfcase value="profile">
        <cfinclude template="dsp_profile.cfm">
     </cfcase>
	 <cfcase value="profile_edit">
        <cfinclude template="dsp_profile_edit.cfm">
     </cfcase>
  </cfswitch>
	
	</td>
 
 </tr>
 
 

    <cfif fa neq "home"><tr><td width="133" height="392" valign="top" <cfif bg eq 1>background="images/HOME_PAGE_menu.jpg"<cfelse>background="images/HOME_PAGE_menu_blk.jpg"</cfif>><cfif fa eq "home"><cfinclude template="menu_home.cfm"><cfelse><cfinclude template="menu_left.cfm"></cfif></td></tr>
	 <tr><td width="133" height="392" valign="top" <cfif bg eq 0>bgcolor="000000"<cfelse>bgcolor="FFFFFF"</cfif>></td></tr>
  <tr>
	<td height="200" <cfif bg eq 0>bgcolor="000000"<cfelse>bgcolor="FFFFFF"</cfif>>&nbsp;
	 
	</td>
  </tr></cfif>
</table>

<!--- </cfif> --->





<!---
		</td>
	</tr>
</table>
--->



</body>
</html>
