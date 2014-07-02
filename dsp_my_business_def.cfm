<head>

<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>


<script Language="JavaScript"><!--
function FrontPage_Form1_Validator(theForm)
{

  if (theForm.business_desc.value == "")
  {
    alert("Please enter a Business Definition.");
    theForm.business_desc.focus();
    return (false);
  }

  if (theForm.age_range.value == "")
  {
    alert("Please enter a value for the \"Age Range\" field.");
    theForm.age_range.focus();
    return (false);
  }

  return (true);
}
//--></script>
</head>


<cfparam name="url.biz_type" default="retail">
<cfparam name="url.pers" default=0>

<body>			


<form action="act_my_business_def.cfm" name="FrontPage_Form1" onSubmit="return FrontPage_Form1_Validator(this)" method="post">
		
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14" bgcolor="000000">
		<cfif url.pers neq 0>
			<tr> 
				<td  align="left" class="header16" colspan="2">
					Your personal information has been recorded. <br>
					An email with your login details has been sent to you.<br>
					<div class="yellow14">Please continue Registration below.</div>
				</td>
			</tr>	
		</cfif>

			<tr> 
				<td  align="left" class="header16" colspan="2">
					<cfif url.biz_type eq "retail">
						<img src="images/my_retail_header.jpg">
					<cfelseif url.biz_type eq "product">
						<img src="images/my_product_header.jpg">
					<cfelseif url.biz_type eq "service">
						<img src="images/my_service_header.jpg">
					</cfif>
				</td>
			</tr>						  
	<!--- 	<tr>
				<td align="left" colspan="2">
					In 30 words or less define your general 
					<!--- <cfif url.biz_type eq "retail">
						<strong>retail</strong> 
					<cfelseif url.biz_type eq "product">
						<strong>product</strong>
					<cfelseif url.biz_type eq "service">
						<strong>service</strong>
					</cfif>	 --->			
					business below. 
                    <br><br>
                    Do not embellish it by including your sales pitch. <!--- This is for others to understand your business and is used for them to respond to your requests for their opinions relative to the remarkability of your selling proposition.  That is where you embellish your pitch.---> Your business description must be specific, easy to understand and be read within 30 seconds.
                    <br><br>
                    The business you describe below will later be referred to as your <strong>"BRAND"</strong>
				</td>
			</tr>	
			<tr>
				<td align="left" colspan="2">
                	<strong>General Business Description:</strong><br>
					<textarea name="business_desc" rows="10" cols="60">
						
					</textarea>					
				</td>
			</tr> --->
	
	
			<tr>
				<td align="left" colspan="2">
					In one sentence please describe the <strong>product or service</strong> you will be putting through Jumpstart Marketer.
                    <br><br>
                    <strong>NOTE:</strong> You can only put one product or service through at a time.
                    <br><br>
				</td>
			</tr>	
            <tr>
				<td align="left" colspan="2">
                <strong>Product or Service you are selling:</strong><br>
					<textarea name="business_desc" rows="10" cols="60">
						
					</textarea>					
				</td>
			</tr>	
			<tr>
				<td align="right">
					MY TARGET CONSUMER:
				</td>
				<td>
					Male<input type="checkbox" name="male"> &nbsp; &nbsp; Female<input type="checkbox" name="female">&nbsp; &nbsp; Both Male & Female<input type="checkbox" name="male_female">
				</td>
			</tr>
			<tr>
				<td align="right">
					
				</td>
				<td>
					Age Range: 
					<select name="age_range" size="1">
						<option value="All"> All </option>
                        <option value="All Adults"> All Adults</option>
						<option value="1 and 15"> 15 and under </option>
						<option value="16 and 25"> 16 - 25 </option>
						<option value="26 and 45"> 26 - 45 </option>
						<option value="46 and 65"> 46 - 65 </option>
						<option value="65 and 100"> over 65 </option>
					</select>
				</td>
			</tr>	
			<tr>
				<td align="left" colspan="2">
					<!--- <cfif url.biz_type eq "retail">
						<div class="yellow14">RETAIL EXAMPLE:</div> My retail business is a small store located two blocks from the beach that sells beachwear. Our product offering includes bathing suits including a line of custom Bikini style suits for women. Also we offer sunglasses, tanning products, sandals, visors, hats, beach towels, umbrellas and chairs.
					<cfelseif url.biz_type eq "product">
						<div class="yellow14">PRODUCT EXAMPLE:</div> My product is a battery-operated tool for cleaning jewelry. It is the size of a power toothbrush and has three different heads that each performs different functions. It comes with two cleaning solutions, one for jewels and one for metals and a final polishing solution.
					<cfelseif url.biz_type eq "service">
						<div class="yellow14">SERVICE EXAMPLE:</div> I have a  personal training service that I conduct out of my home. I offer programs in Aerobics, Body Strength, Pilates and Yoga. I come to the homes of my clients as well as conducting training outdoors in the park and on the beach when appropriate. I also offer training in groups of 2 to 5.
					</cfif>	 --->	
				</td>
			</tr>		

			<tr> 
				<td  align="center" colspan="2" bgcolor="336699">
					<cfoutput>
						<input type="hidden" name="business_type" value="#url.biz_type#"><br>
					</cfoutput>
					
					<input type="Submit" value="Submit">
				</td>
			</tr>	
			<tr>
				<td colspan="2">&nbsp;
				
				</td>
			</tr>				
		</table>
</form>		

</body>