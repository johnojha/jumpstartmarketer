<head>

<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>

<script language='javascript'>
  
function validateThis(keygraphic)
{

  if (keygraphic.choice_1.value == "")
  {
    alert("Please choose a Key Graphic");
    keygraphic.choice_1.focus();
    return (false);
  }
  
  if (keygraphic.choice_2.value == "")
  {
    alert("Please choose a Key Graphic");
    keygraphic.choice_2.focus();
    return (false);
  }
  
  if (keygraphic.choice_3.value == "")
  {
    alert("Please choose a Key Graphic");
    keygraphic.choice_3.focus();
    return (false);
  }

  return (true);
}

</script>

</head>

<cfparam name="url.upload" default="0">


	<cfquery name="names" datasource="#application.dsn#" maxrows="3">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
		ORDER BY id
	</cfquery>


<cfinclude template="dsp_connectics_redirect.cfm">

		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
			<tr> 
				<td  align="left" valign="bottom" class="header16">
					<!--- <img src="images/graphic_presentation_header.jpg"> --->
				</td>
			</tr>	
			
		<form name="graphic" action="act_elements.cfm" method="post" onsubmit="return validateThis(this)">
			<tr>		  
				<td align="center">

						
				</td>		  
			  </tr>
			 <tr>		  
				<td class="bodytext">
					Listed below are the GRAPHIC PRESENTATIONS that you have uploaded. <br>
					Click on "view" to preview the graphic.
					<br><br>
					Please click "Submit GRAPHIC PRESENTATIONS" when you are ready to send the exercise to your target consumers.
				</td>
			</tr>	
			<tr>
				<td nowrap>	
				
					
					1. 
							
								<cfoutput query="names">
									<cfif names.getRow() eq 1>
										<input name="choice_1" size="30" value="#names.element_text#" readonly="yes"> 
									</cfif>
								</cfoutput>
							
						
						<cfoutput query="names">
							<cfif names.getRow() eq 1>
								&nbsp; <a href="images/graphic_presentation/#client.cid#/#names.element_text#" class="bodylink" target="_blank">view</a>
							</cfif>
						</cfoutput>	
					<br><br>
					2. 	
							<cfoutput query="names">
									<cfif names.getRow() eq 2>
										<input name="choice_2" size="30" value="#names.element_text#" readonly="yes"> 
									</cfif>
								</cfoutput>
								
						<cfoutput query="names">
							<cfif names.getRow() eq 2>
								&nbsp; <a href="images/graphic_presentation/#client.cid#/#names.element_text#" class="bodylink" target="_blank">view</a>
							</cfif>
						</cfoutput>	
					<br><br>
					3. 
					
								<cfoutput query="names">
									<cfif names.getRow() eq 3>
										<input name="choice_3" size="30" value="#names.element_text#" readonly="yes"> 
									</cfif>
								</cfoutput>
								
						<cfoutput query="names">
							<cfif names.getRow() eq 3>
								&nbsp; <a href="images/graphic_presentation/#client.cid#/#names.element_text#" class="bodylink" target="_blank">view</a>
							</cfif>
						</cfoutput>	
					<br><br>
				</td>		  
			 </tr>			
		 	 <tr>
				<td align="center"  bgcolor="336699" colspan="5" height="5">
					
					<input type="hidden" name="business_element" value="graphic_presentation"> 
					
					<input type="submit" value=" Submit GRAPHIC PRESENTATIONS "> 
				 </td>
			  </tr>		
		</form>	

		</table>