<head>

<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>

<script language='javascript'>
  
function validateThis(GenDesc)
{

  if (GenDesc.choice_1.value == "")
  {
    alert("Please choose a Generic Descriptor");
    GenDesc.choice_1.focus();
    return (false);
  }
  
  if (GenDesc.choice_2.value == "")
  {
    alert("Please choose a Generic Descriptor");
    GenDesc.choice_2.focus();
    return (false);
  }
  
  if (GenDesc.choice_3.value == "")
  {
    alert("Please choose a Generic Descriptor");
    GenDesc.choice_3.focus();
    return (false);
  }

  return (true);
}

</script>

</head>

	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, gd_n, date_submitted, rating, times_chosen
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'generic_descriptor'
				AND times_chosen <> 0
		ORDER BY id
	</cfquery>

<cfinclude template="dsp_connectics_redirect.cfm">

		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="2">
					<img src="images/gen_desc_header.jpg">
				</td>
			</tr>	
<!--- 			<tr> 
				<td  align="left" colspan="2" height="210" width="100%" valign="top" class="white14" >
					<table class="white14" cellspacing="0" border="0" width="100%">
						<tr>
							<td valign="top">
								<img src="images/start_here.jpg">
							</td>
							<td width="623">
								<img src="images/gen_desc_def.jpg">
							</td>
						</tr>			
						<tr>
							<td width="530" valign="top" colspan="2">
								<img src="images/gen_desc_text.jpg"><br>
								  <div align="center"> <a href="index.cfm?fa=gen_desc_cont&bg=1" class="yellowlink">Continue</a><br></div>					
							</td>					
					  </tr>			
					</table>		  					
				</td>		
			</tr>	 --->
			
		<form name="GenDesc" action="act_elements.cfm" method="post" onsubmit="return validateThis(this)">
			<tr>		  
				<td align="center">
					<!--- <img src="images/brand_examples.jpg"> --->
				</td>	
				<td align="left">	
						
				</td>		  
			  </tr>
			 <tr>		  
				<td align="center" class="bodytext" colspan="2">
					Listed below are the GENERIC DESCRIPTOR names that have gone through the "Bake Off" phases. 
					<br><br>
					Please choose Three GENERIC DESCRIPTORS of your product or service to begin the Connectics process.	(higher rating the better.)		
				</td>
			</tr>	
			<tr>
				<td align="center">	
				
				
					1. <select name="choice_1" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#names.element_text#"> #names.element_text#  -  chosen: #names.times_chosen#</option>
							</cfoutput>
						</select>
					<br><br>
					2. <select name="choice_2" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#names.element_text#"> #names.element_text#  -  chosen: #names.times_chosen#</option>
							</cfoutput>
						</select>
					<br><br>
					3. <select name="choice_3" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#names.element_text#"> #names.element_text#  - chosen: #names.times_chosen#</option>
							</cfoutput>
						</select>


					<br><br>
				</td>	
				<td valign="middle" align="left">
					<!---<img src="images/brand_existing.jpg"><br> --->
					<br><br><br>
					<input type="hidden" name="business_element" value="generic_descriptor"> 
					
					<input type="submit" value="  Submit Generic Descriptors  ">
				</td>	  
			 </tr>
		</form>	
			 <tr>
				<td align="center"  bgcolor="213F9A" colspan="5" height="5"> </td>
			  </tr>		
		</table>