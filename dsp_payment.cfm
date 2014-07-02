<head>


</head>




<body>	

<script type="text/javascript" src="js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="js/lightbox/themes/default/jquery.lightbox.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="js/lightbox/themes/default/jquery.lightbox.ie6.css" />
<![endif]-->

<script type="text/javascript" src="js/lightbox/jquery.lightbox.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


<script type="text/javascript" language="javascript">

function applydiscount()
{
  
  var value=document.getElementById("txtdiscount").value;
  //alert(value);
  var amt1;

  if(value=="smile")
  {
   $("#divmsg").text("");
    flag=document.getElementById("hdntemp1").value;
    if(flag==0)
    {
	amt1=document.getElementById("hdnamt").value;
	amt=parseInt(amt1)-100;
	document.getElementById("hdnamt").value=amt;
	document.getElementById("amt").value=amt;
	document.getElementById("divprice").innerHTML="$" + amt;
	document.getElementById("hdntemp1").value="1";

    }

  }
   if(value=="beta2")
  {
   $("#divmsg").text("");
    flag=document.getElementById("hdntemp1").value;
    if(flag==0)
    {
	amt1=document.getElementById("hdnamt").value;
	amt=parseInt(amt1)-300;
	document.getElementById("hdnamt").value=amt;
	document.getElementById("amt").value=amt;
	document.getElementById("divprice").innerHTML="$" + amt;
	document.getElementById("hdntemp1").value="1";

    }

  }
  else
  {

	flag=document.getElementById("hdntemp1").value;
	//alert(flag);
	$("#divmsg").html("Please Enter Correct Discount Code!");

		

    if(flag==1)
    {
		def=document.getElementById("hdnamt").value;
		def=parseInt(def)+100;
 
		document.getElementById("hdnamt").value=def;
		 document.getElementById("amt").value=def;
		document.getElementById("divprice").innerHTML="$" + def;
		document.getElementById("hdntemp1").value="0";
		
		
     }
  }

}

/* This code is used to set the  price based upon brand selected*/



function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}

function applypromo()
{
  
  var value=document.getElementById("txtPromo").value;
  //alert(value);
  var amt1;

  if(value=="josh")
  {
    flag=document.getElementById("hdntemp").value;
    // alert(flag);
    $("#divmsg").text("");
    if(flag==0)
    {
    amt1=document.getElementById("hdnamt").value;
    amt=parseInt(amt1)-50;
    
    document.getElementById("hdnamt").value=amt;
    document.getElementById("amt").value=amt;

    document.getElementById("divprice").innerHTML="$" + amt;

	document.getElementById("hdntemp").value="1";
    }

  }
  else
  {

   flag=document.getElementById("hdntemp").value;
	 $("#divmsg").text("Please Enter Correct Promotional Code!");
    
    if(flag==1)
    {
   def=document.getElementById("hdnamt").value;
   def=parseInt(def)+50;
   document.getElementById("hdnamt").value=def;
   document.getElementById("amt").value=def;
    document.getElementById("divprice").innerHTML="$" + def;
    document.getElementById("hdntemp").value="0";
  
    //document.getElementById("divmsg").innerHTML="Please Enter Correct Promotional Code!";
   
    }
  }

}

</script>

<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<table width="600" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="FFFFFF">


			<tr>
				<td align="right" colspan="2">
					<input type="hidden" id="hdntemp" value="0" />

					<input type="hidden" id="hdntemp1" value="0" />
				</td>
				
			</tr>
                         <tr> 
				<td  align="center" class="header16" colspan="2">
					<img src="images/new_user.jpg">
				</td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
				<div id="divmsg" style="color:red;"></div>
					
				</td>
				
			</tr>

 			<tr>
				<td align="right">
					Item Name:
				</td>
				<td>
					Jumpstart Marketer
				</td>
			</tr>
			<tr>
				<td align="right">
					Enter Discount Code:
				</td>
				<td>
					<input type="text" id="txtdiscount" name="discount"  onchange="applydiscount()"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					Enter Promotional Code:
				</td>
				<td>
					<input type="text" id="txtPromo" name="promotional"  onchange="applypromo()"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					Price:
				</td>
				<td>
					<div id="divprice">$699</div><a href="images_new/gold.jpg" class="lightbox">View Plan Details</a>
				</td>
			</tr>

			<tr>
				<td align="right">
					<input type="hidden" name="hdnamt" id="hdnamt" value="699" />
				</td>
				<td>
					Please click on buy now button to pay
				</td>
			</tr>

			
			
<tr>
<td>
&nbsp;
</td>
<td  valign=middle>
    <input type="hidden" name="cmd" value="_xclick">
    <input type="hidden" name="business" value="ericdchambers69@gmail.com">
    <input type="hidden" name="item_name" value="Jumpstart Marketer">
    <input type="hidden" name="item_number" value="1">
    <input type="hidden" name="amount" id="amt" value="699">
    <input type="hidden" name="quantity" value="1">		
    <input type="hidden" name="no_note" value="1">
    <input type="hidden" name="currency_code" value="USD">
    <input type="hidden" name="lc" value="US">
    <input type="hidden" name="return" value="http://jumpstartmarketer.com/index.cfm?fa=project_form&pers=1">
    <input type="image" src="http://www.paypal.com/en_US/i/btn/btn_buynow_LG.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
	</td>
</tr>
</table>
</form>	


<script type="text/javascript">

var plantype=getQueryVariable("type");

if(plantype=="brandname")
{
	document.getElementById("divprice").innerHTML="$250";
	$("#hdnamt").val("250");
	$("#amt").val("250");
	$("a.lightbox").attr("href", "images_new/brand.jpg");
}
if(plantype=="brandlogo")
{
	document.getElementById("divprice").innerHTML="$150";
	$("#hdnamt").val("150");
	$("#amt").val("150");
	$("a.lightbox").attr("href", "images_new/brand-logo.jpg");
}
if(plantype=="platinum")
{
	document.getElementById("divprice").innerHTML="$2000";
	$("#hdnamt").val("2000");
	$("#amt").val("2000");
	$("a.lightbox").attr("href", "images_new/platinum.jpg");
}
if(plantype=="gold")
{
	document.getElementById("divprice").innerHTML="$1200";
	$("#hdnamt").val("1200");
	$("#amt").val("1200");
	$("a.lightbox").attr("href", "images_new/gold.jpg");
}
if(plantype=="silver")
{
	document.getElementById("divprice").innerHTML="$350";
	$("#hdnamt").val("350");
	$("#amt").val("350");
	$("a.lightbox").attr("href", "images_new/silver.jpg");
}

</script>

<script type="text/javascript">
  jQuery(document).ready(function($){
    $('.lightbox').lightbox();
  });
</script>
</body>