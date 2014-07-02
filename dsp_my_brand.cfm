<head>

<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>


<script language='javascript'>
  
function validateThis(brand)
{

  if (brand.choice_1.value == "")
  {
    alert("Please choose a Brand");
    brand.choice_1.focus();
    return (false);
  }
  
  if (brand.choice_2.value == "")
  {
    alert("Please choose a Brand");
    brand.choice_2.focus();
    return (false);
  }
  
  if (brand.choice_3.value == "")
  {
    alert("Please choose a Brand");
    brand.choice_3.focus();
    return (false);
  }

  return (true);
}
</script>

	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating, ranking
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'brand'
				AND ranking <> 0
		ORDER BY id
	</cfquery>

</head>

<cfinclude template="dsp_connectics_redirect.cfm">
		
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="2">
					<img src="images/consumer_exercise.jpg">
				</td>
			</tr>	
	<!--- 			<tr> 
				<td  align="left" colspan="2" height="310" width="100%" valign="top" class="white14" >
				<table class="white14" cellspacing="0" border="0" width="100%">
						<tr>
							<td valign="top">
							<img src="images/start_here.jpg">
							</td>	
							<td width="623" nowrap="nowrap">
								<img src="images/brand_def.jpg">
							</td>
						</tr>			
						<tr>
						
							<td width="530" valign="top" colspan="2">
								<img src="images/brand_text.jpg"><br>
								  <div align="center"> <a href="index.cfm?fa=my_brand_cont&bg=1" class="yellowlink">Continue</a><br></div>					
							</td>				
					  </tr>			
					</table>		  					
				</td>		
			</tr>	 --->
			
		<form name="brand" action="act_elements.cfm" method="post" onsubmit="return validateThis(this)">
			<tr>		  
				<td align="center">
					<!--- <img src="images/brand_examples.jpg"> --->
				</td>	
				<!--- <td align="left">	
						<img src="images/brand_choice.jpg"><br>
					<input type="text" name="my_choice" size="30"> 
				</td> --->		  
			  </tr>
			 <tr>		  
				<td align="center" class="bodytext" colspan="2">
				
					Listed below are the BRAND names that have gone through the "Bake Off" phases. 
					<br><br>
					Please choose Three BRANDS of your product or service to begin the Connectics process.	(A ranking of 1 is best)		
				</td>
			</tr>	
			<tr>
				<td align="center">	
						
					1. <select name="choice_1" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#names.element_text#"> #names.element_text# - <font size="1">ranking:</font> #names.ranking#</option>
							</cfoutput>
						</select>
					<br><br>
					2. <select name="choice_2" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#names.element_text#"> #names.element_text# - <font size="1">ranking:</font> #names.ranking#</option>
							</cfoutput>
						</select>
					<br><br>
					3. <select name="choice_3" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#names.element_text#"> #names.element_text# - <font size="1">ranking:</font> #names.ranking#</option>
							</cfoutput>
						</select>
					<br><br>
				</td>	
				<td valign="middle" align="left">
				<br><br>
					
					<input type="hidden" name="business_element" value="brand"> 
					
					<!--- <input type="image" src="images/brand_submit.jpg" onclick="submit(brand)">  --->
					<input type="submit" value="  Submit Brands  ">
				</td>	  
			 </tr>
		</form>	
			 <tr>
				<td align="center"  bgcolor="213F9A" colspan="5" height="5"> </td>
			  </tr>		
		</table>
		
		