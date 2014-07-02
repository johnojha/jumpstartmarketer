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
<title>Jumpstart Marketer</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/style1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="js/lightbox/themes/default/jquery.lightbox.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="js/lightbox/themes/default/jquery.lightbox.ie6.css" />
<![endif]-->

<script type="text/javascript" src="js/lightbox/jquery.lightbox.min.js"></script>

</head>
<cfparam name="fa" default="home">


<cfif fa eq "home">
	<cflocation url="index_new.cfm" addtoken="no">
</cfif>


<body leftmargin="0" topmargin="0"  bgcolor="FFFFFF">

	
<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr>
    	<td width="100%" bgcolor="ffffff" align="">
        	<table width="100%" border="0">
            	<tr>
                	<td>
        				<a href="index.cfm?fa=home"><img src="images/JUMPSTART_LOGO.jpg" border="0"></a>
                    </td>
                    <td align="right" width="90%" valign="bottom">
           			    <cfinclude template="menu_header.cfm"> 
                    </td>
                </tr>
            </table>
        </td>
   </tr>
 
  <tr>
    <td width="100%" valign="top" align="center">

<cfif client.cid eq 0>
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
     <cfcase value="forgotpassword">
        <cfinclude template="dsp_forgotpassword.cfm">
     </cfcase>
 	<cfcase value="legal">
        <cfinclude template="dsp_legal.cfm">
     </cfcase>
 	<cfcase value="special">
        <cfinclude template="dsp_special.cfm">
     </cfcase> 
	 <cfcase value="personal_questions">
        <cfinclude template="dsp_personal_questions.cfm">
     </cfcase>
      <cfcase value="payment">
        <cfinclude template="dsp_payment.cfm">
     </cfcase>
 	<cfcase value="consultant">
        <cfinclude template="dsp_consultant.cfm">
     </cfcase>
     <cfcase value="project_form">
        <cfinclude template="dsp_project_form.cfm">
     </cfcase>
     <cfcase value="secrets">
        <cfinclude template="dsp_secrets.cfm">
     </cfcase>
      <cfcase value="contact">
        <cfinclude template="dsp_contact.cfm">
     </cfcase>
	</cfswitch>
</cfif>
	

<cfif client.cid neq 0>	
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
     <cfcase value="forgotpassword">
        <cfinclude template="dsp_forgotpassword.cfm">
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
      <cfcase value="payment">
        <cfinclude template="dsp_payment.cfm">
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


      <cfcase value="my_business_brand">
        <cfinclude template="dsp_my_business_brand.cfm">
     </cfcase>

      <cfcase value="my_business_logo">
        <cfinclude template="dsp_my_business_logo.cfm">
     </cfcase>

      <cfcase value="my_business_silver">
        <cfinclude template="dsp_my_business_silver.cfm">
     </cfcase>

      <cfcase value="my_business_gold">
        <cfinclude template="dsp_my_business_gold.cfm">
     </cfcase>


	 <cfcase value="view_sp">
        <cfinclude template="dsp_view_sp.cfm">
     </cfcase>
	 <cfcase value="elements">
        <cfinclude template="dsp_elements.cfm">
     </cfcase>


      <cfcase value="elements_gold">
        <cfinclude template="dsp_elements_gold.cfm">
     </cfcase>


      <cfcase value="elements_silver">
        <cfinclude template="dsp_elements_silver.cfm">
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
	 <cfcase value="brand_cont">
        <cfinclude template="dsp_brand_cont.cfm">
     </cfcase>
 	 <cfcase value="brand_instructions">
        <cfinclude template="dsp_brand_instructions.cfm">
     </cfcase>
	 <cfcase value="brand_logo_cont">
        <cfinclude template="dsp_brand_logo_cont.cfm">
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
	 <cfcase value="generic_descriptor_cont">
        <cfinclude template="dsp_generic_descriptor_cont.cfm">
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
        <cfinclude template="dsp_bakeoff_sub_brand_logo.cfm">
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
 	<cfcase value="check_availability">
        <cfinclude template="includes/dsp_check_availability.cfm">
     </cfcase>
 	<cfcase value="consultant">
        <cfinclude template="dsp_consultant.cfm">
     </cfcase>
  </cfswitch>
</cfif>
	</td>
 
 </tr>
 
 

 <tr>
 	<td width="100%"  valign="top">&nbsp;
    	
    </td>
 </tr>

</table>



<script type="text/javascript">
  jQuery(document).ready(function($){
    $('.lightbox').lightbox();
  });
</script>

</body>
</html>
