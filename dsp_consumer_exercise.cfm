

<cfparam name="url.be"><head>

<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>


<cfif url.be neq "rtb">

<cfoutput>
	<script language='javascript'>
	  
	function validateThis(#url.be#)
	{
	
	  if (#url.be#.choice_1.value == "")
	  {
		alert("Please choose a #replace(ucase(url.be),"_"," ")#");
		#url.be#.choice_1.focus();
		return (false);
	  }
	  
	  if (#url.be#.choice_2.value == "")
	  {
		alert("Please choose a #replace(ucase(url.be),"_"," ")#");
		#url.be#.choice_2.focus();
		return (false);
	  }
	  
	  if (#url.be#.choice_3.value == "")
	  {
		alert("Please choose a #replace(ucase(url.be),"_"," ")#");
		#url.be#.choice_3.focus();
		return (false);
	  }
	
	  return (true);
	}
	
	</script>
</cfoutput>

</cfif>
</head>





	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating, ranking, times_chosen
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = '#url.be#'
				<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
					AND ranking <> 0
				<cfelseif url.be eq "tag_line" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "benefit" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
					AND rating <> 0
				<cfelseif url.be eq "generic_descriptor">
					AND times_chosen <> 0
                <cfelseif url.be eq "graphic_presentation">
                	AND eye <> 1
				</cfif>	
		ORDER BY times_chosen DESC, ranking ASC, rating DESC
	</cfquery>


<!--- <cfinclude template="dsp_connectics_redirect.cfm"> --->

		<table width="800" border="0" cellspacing="1" cellpadding="3" class="black14">
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="3">
					<img src="images/Consumer_Feedback_excercise.jpg">
				</td>
			</tr>
			<tr>
				<td colspan="3">
				 <cfinclude template="dsp_connectics_redirect.cfm">	
				</td>
			</tr>
			

	<cfoutput>	
		<form name="#url.be#" action="act_elements.cfm" method="post" onsubmit="return validateThis(this)">
	</cfoutput>	
			<tr>		  
				<td align="center" colspan="3">
					<!--- <img src="images/brand_examples.jpg"> --->
				</td>	
				<td align="left" colspan="3">	
						
				</td>		  
			  </tr>
			 <tr>		  
				<td  class="bodytext" colspan="3">
					<cfoutput>
						<li>Listed below are the <cfif url.be neq "rtb">#replace(ucase(url.be),"_"," ")#<cfif url.be neq "attributes">s</cfif><cfelse>ENDORSEMENTS</cfif> that have gone through the "Expert Feedback" phases. </li>
						<br><br>
						<cfif url.be eq "key_graphic" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "graphic_presentation">
							Click on "view" to preview the graphic.
							<br><br>
						</cfif>
						<li>Please choose <strong>the three best scoring</strong> <cfif url.be neq "rtb">#replace(ucase(url.be),"_"," ")#<cfif url.be neq "attributes">s</cfif><cfelse>ENDORSEMENTS</cfif> to begin the CONSUMER FEEDBACK process.	</li>
							<br><br>	
						<li>Then, click Submit when you are ready to send your <cfif url.be neq "rtb">#replace(ucase(url.be),"_"," ")#<cfif url.be neq "attributes">s</cfif><cfelse>ENDORSEMENTS</cfif> for CONSUMER FEEDBACK.	</li>
														
							<br><br>
							<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
								("ranking" - LOWER score is better, 1 being best.)
							<cfelseif url.be eq "tag_line" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "benefit" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
								("rating" - HIGHER score is better, 7 being best.)
							<cfelseif url.be eq "generic_descriptor">
								("times chosen" - HIGHER score is better)
							</cfif>							
					</cfoutput>
				</td>
			</tr>	
			<tr>
				<td>
					&nbsp; &nbsp; &nbsp; &nbsp;
				</td>
				<td>	
				<cfif url.be eq "key_graphic" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "graphic_presentation">
					<cfoutput query="names">
						#names.element_text# <a href="images/#url.be#/#client.cid#/#names.element_text#" class="bodylink" target="_blank">view</a><br>
					</cfoutput>
					<br><br>
				</cfif>
					
					1. <select name="choice_1" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#Replace(names.element_text,"""","'","All")#">   
										<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
											<font size="1">ranking: #names.ranking#</font> 
										<cfelseif url.be eq "tag_line" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "generic_descriptor">			
											<font size="1" color="maroon">times chosen: #names.times_chosen# </font>
										<cfelseif url.be eq "benefit">			
											<font size="1" color="maroon">rating: #names.rating# </font>
										</cfif>	- #names.element_text#
								</option>
							</cfoutput>
						</select>
					<br><br>
					2. <select name="choice_2" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#Replace(names.element_text,"""","'","All")#"> 
										<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
											<font size="1">ranking: #names.ranking#</font> 
										<cfelseif url.be eq "tag_line" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "generic_descriptor">	
											<font size="1" color="maroon">times chosen: #names.times_chosen#</font>
										<cfelseif url.be eq "benefit">			
											<font size="1" color="maroon">rating: #names.rating# </font>
										</cfif>	- #names.element_text#
								</option>
							</cfoutput>
						</select>
					<br><br>
					3. <select name="choice_3" size="1">
							<option value=""> Select...</option>
							<cfoutput query="names">
								<option value="#Replace(names.element_text,"""","'","All")#">  
										<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
											<font size="1">ranking: #names.ranking#</font> 
										<cfelseif url.be eq "tag_line" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "generic_descriptor">
											<font size="1" color="maroon">times chosen: #names.times_chosen# </font>
										<cfelseif url.be eq "benefit">			
											<font size="1" color="maroon">rating: #names.rating# </font>
										</cfif> - #names.element_text#
								</option>
							</cfoutput>
						</select>
					<br><br>
				</td>	
              </tr>
             <tr>
				<td valign="middle" align="center" colspan="5" bgcolor="FFFFFF">
					
					
				<cfoutput>
					<input type="hidden" name="business_element" value="#url.be#"> 
				
					<input type="submit" value=" Submit <cfif url.be neq "rtb">#replace(ucase(url.be),"_"," ")#<cfif url.be neq "attributes">s</cfif><cfelse>ENDORSEMENTS</cfif> "> 
				</cfoutput>	
				</td>	  
			 </tr>
		</form>		
		</table>