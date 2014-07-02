<head>


<script type="text/javascript" src="js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="js/lightbox/themes/default/jquery.lightbox.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="js/lightbox/themes/default/jquery.lightbox.ie6.css" />
<![endif]-->

<script type="text/javascript" src="js/lightbox/jquery.lightbox.min.js"></script>



<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>


<script Language="JavaScript">

function validate()
{

   if(document.getElementById("name").value=="")
   {
       alert("Please Enter Your Name");
       document.getElementById("name").focus();
	return false;
   }

   if(document.getElementById("address").value=="")
   {
       alert("Please Enter Your Address");
       document.getElementById("address").focus();
	return false;
   }


   if(document.getElementById("city").value=="")
   {
       alert("Please Enter Your City");
       document.getElementById("city").focus();
	return false;
   }

   if(document.getElementById("state").value=="")
   {
       alert("Please Enter Your State");
       document.getElementByID("state").focus();
	return false;
   }
   if(document.getElementById("zip").value=="")
   {
       alert("Please Enter Your Zip");
       document.getElementById("zip").focus();
	return false;
   }

if(document.getElementById("email").value=="")
   {
       alert("Please Enter Your Email Address");
       document.getElementById("email").focus();
	return false;
   }

   if(document.getElementById("password").value=="")
   {
       alert("Please Enter Your Password");
       document.getElementById("password").focus();
	return false;
   }

   return true;

}


function showplan()
{

  var plan=document.getElementById("religion").value;
 
  $(".lightbox").hide();
  if(plan=="brandname")
  {
	$("a.lightbox").attr("href", "images_new/brand.jpg");
	$(".lightbox").show();
  }

  if(plan=="brandlogo")
  {
   $("a.lightbox").attr("href", "images_new/brand-logo.jpg");
   $(".lightbox").show();
  }

  if(plan=="platinum")
  {
$("a.lightbox").attr("href", "images_new/platinum.jpg");
$(".lightbox").show();
  }

  if(plan=="gold")
  {
$("a.lightbox").attr("href", "images_new/gold.jpg");
$(".lightbox").show();
  }

  if(plan=="silver")
  {
$("a.lightbox").attr("href", "images_new/silver.jpg");
$(".lightbox").show();
  }


}
//-->

</script>
</head>

<cfparam name="form.terms" default="no">

<cfif  form.terms eq "no">
	<cflocation url="index.cfm?fa=legal&remind=1">
</cfif>



<body>			


<form action="act_personal_questions.cfm" name="FrontPage_Form1" onSubmit="return FrontPage_Form1_Validator(this)" method="post">
		
		<table width="500" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr> 
				<td  align="center" class="header16" colspan="2">
					<img src="images/new_user.jpg">
				</td>
			</tr>						  

 			<tr>
				<td align="right">
					Name:
				</td>
				<td>
					<input type="text" name="name" id="name" size="30">
				</td>
			</tr>
			<tr>
				<td align="right">
					Address:
				</td>
				<td>
					<input type="text" name="address" id="address" size="30">
				</td>
			</tr>	
			<tr>
				<td align="right">
					City:
				</td>
				<td>
					<input type="text" name="city" id="city" size="30">
				</td>
			</tr>
			<tr>
				<td align="right">
					State/Region:
				</td>
				<td>
					<input type="text" name="state" id="state" size="20">
				</td>
			</tr>	
			<tr>
				<td align="right">
					Zip Code:
				</td>
				<td>
					<input type="text" name="zip" id="zip" size="20">
				</td>
			</tr> 
			<tr>
				<td align="right">
					Email Address:<br>
					(Will be your Username)
				</td>
				<td>
					<input type="text" name="email" id="email"  size="20">
				</td>
			</tr>
			<tr>
				<td align="right">
					Re-enter Email Address:
				</td>
				<td>
					<input type="text" name="email_2" size="20">
				</td>
			</tr>
			<tr>
				<td align="right">
					Password:
				</td>
				<td>
					<input type="password" name="password" id="password" size="10">
				</td>
			</tr>
			<tr>
				<td align="right">
					Choose Plan:
				</td>
				<td>
					<select name="religion" size="1" id="religion" onclick="return showplan();">
						<option value="">Choose Plan</option>
						<option value="platinum">Platinum</option>
						<option value="gold">Gold</option>
						<option value="silver">Silver</option>
						<option value="brandname">Brand Name</option>
						<option value="brandlogo">Brand Logo</option>
								
					</select>
					<a  href="images/track_record.jpg" class="lightbox" style="display:none;">View Details</a>
				</td>
			</tr> 		
	<!--- 		<tr>
				<td align="right">
					Age:
				</td>
				<td>
					<input type="text" name="age" size="3">
				</td>
			</tr>	
			<tr>
				<td align="right">
					Gender:
				</td>
				<td>
					Male<input type="checkbox" name="male"> &nbsp; &nbsp; Female<input type="checkbox" name="female">
				</td>
			</tr>	--->
<!--- 
			<tr>				
				<td align="right">
					Marital Status:
				</td>
				<td>
					Single<input type="checkbox" name="single"> &nbsp; &nbsp; Married<input type="checkbox" name="married">
					Divorced<input type="checkbox" name="divorced"> &nbsp; &nbsp; Widowed<input type="checkbox" name="widowed">
				</td>
			</tr>	
			<tr>
				<td align="right">
					Ethnicity:
				</td>
				<td>
					<input type="text" name="ethnicity" size="30">
				</td>
			</tr>	
			<tr>
				<td align="right">
					Religion:
				</td>
				<td>
					<input type="text" name="religion" size="30">
				</td>
			</tr>	
			<tr>
				<td align="right">
					Citizenship:
				</td>
				<td>
					<input type="text" name="citizenship" size="30">
				</td>
			</tr>	
			<tr>
				<td align="right">
					Number of Children:
				</td>
				<td>
					<input type="text" name="children" size="3">
				</td>
			</tr>	
			<tr>
				<td align="right">
					Number of Grand Children:
				</td>
				<td>
					<input type="text" name="grand_children" size="3">
				</td>
			</tr>
			<tr>
				<td align="right">
					What type of pet(s) do you own?:
				</td>
				<td>
					<input type="text" name="pets" size="10">
				</td>
			</tr>
			<tr>
				<td align="right" valign="top">
					Home Owner:
				</td>
				<td>
					<select name="home" size="1">
						<option value="">Select...</option>
						<option value="1">Single Family House</option>
						<option value="2">Condo / Co-op</option>
						<option value="3">Not a home owner</option>
					</select>
					<br><br>
					Estimated Value: <input type="text" name="estimated_value" size="4">
				</td>
			</tr>	
			<tr>
				<td align="right">
					Income Range:
				</td>
				<td>
					<select name="income_range" size="1">
						<option value="">Select...</option>
						<option value="35 to 50">35 to 50</option>
						<option value="70 to 90">70 to 90</option>
						<option value="90 to 110">90 to 110</option>
						<option value="110 to 130">110 to 130</option>
						<option value="130 to 150">130 to 150</option>
						<option value="150 to 170">150 to 170</option>
						<option value="170 to 200">170 to 200</option>
						<option value="over 200">over 200</option>
					</select>
				</td>
			</tr>	
			<tr>
				<td align="right">
					Houshold Income:
				</td>
				<td>
					<select name="household_income" size="1">
						<option value="">Select...</option>
						<option value="35 to 50">35 to 50</option>
						<option value="70 to 90">70 to 90</option>
						<option value="90 to 110">90 to 110</option>
						<option value="110 to 130">110 to 130</option>
						<option value="130 to 150">130 to 150</option>
						<option value="150 to 170">150 to 170</option>
						<option value="170 to 200">170 to 200</option>
						<option value="over 200">over 200</option>
					</select>
				</td>
			</tr>		
			<tr>
				<td align="right">
					Active Sports:
				</td>
				<td>
					<input type="text" name="active_sports" size="50"><br>
					Example: Golf, Bowling, Skiing, Volleyball, Tennis, Hiking, Rock Climbing
				</td>
			</tr>	
			<tr>
				<td align="right">
					Spectator Sports:
				</td>
				<td>
					<input type="text" name="spectator_sports" size="50"><br>
					Example: Basketball, Golf, Baseball, Soccer, Football, Auto Racing, Bowling, Poker
				</td>
			</tr>	
			<tr>
				<td align="right">
					Recreation:
				</td>
				<td>
					<input type="text" name="recreation" size="50"><br>
					Example: Camping, Hiking, Movies, TV, Dance Clubs, Comedy Clubs, Concerts, Dining Out, Books, Internet, Theatre, Travel
				</td>
			</tr>	 --->
	
			<tr> 
				<td  align="center" colspan="2" bgcolor="336699">
					<input type="Submit" value="Submit" onclick="return validate();">
				</td>
			</tr>	
			<tr>
				<td colspan="2">&nbsp;
				
				</td>
			</tr>				
		</table>
</form>		

<script type="text/javascript">
  jQuery(document).ready(function($){
    $('.lightbox').lightbox();
  });
</script>
</body>