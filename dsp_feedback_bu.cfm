<head>
<link href="styles/style1.css" rel="stylesheet" type="text/css">
<script
    language="JavaScript"
    src="js/slider.js">
</script>
<link
    href="styles/default.css"
    rel="stylesheet"
    type="text/css">
</head>

<cfparam name="url.sid" default=0>

	
	<!--- Get the request sumbitter info --->
	<cfquery name="s" datasource="#application.dsn#"> 
		SELECT c.name, c.email, b.business_desc, c.business_type
		FROM t_clients c INNER JOIN
			 t_business b ON c.id = b.cid
		WHERE c.id = #url.sid#
	</cfquery>

	<!--- Get the business element choices  --->
	<cfquery name="choices" datasource="#application.dsn#"> 
		SELECT cid, c_name, business_element, choice_1, choice_2, choice_3, my_choice, date_submitted
		FROM t_elements
		WHERE id = #url.eid#
	</cfquery>
	
	
	<table width="750" border="0" cellspacing="1" cellpadding="3" class="black14">
			
		<form name="Feedback" action="act_feedback.cfm" method="post">
			<cfoutput query="s">
				<tr>		  
					<td align="right" nowrap>
						<!--- <strong>Client Name:</strong>	 --->			
					</td>	
					<td>	 
						<!--- #s.name# --->
					</td>			
				</tr>

				<tr>		  
					<td valign="top" colspan="2">
						<strong>Product or Service Description:</strong> &nbsp;					 
						<font color="maroon">#s.business_desc#</font>
					</td>			
				</tr>
			</cfoutput>		
					
				<tr>		  
					<td colspan="2">
			<cfif choices.business_element neq "graphic_presentation">
				<cfoutput>
				<ul>
				<li>Now that you are familiar with this product or service it is time to rate the proposed <cfif choices.business_element neq "rtb">#ucase(replace(choices.business_element,"_"," ","All"))#s<cfelse>ENDORSEMENTS</cfif>. </li>
					<br><br>
				<li>To do so effectively, first review the judging criteria below. </li>
					<br>
					
					
			<cfif choices.business_element eq "brand" or choices.business_element eq "sub_brand">	
				
					<font color="green">JUDGING CRITERIA:</font><br>
						<ol>
					<li>Must be easy to say and remember.</li>
					<li>Must characterize the product or service.</li>
					<li>Must NOT describe or define the product or service.</li>
					<li>Must seem unique to the category.</li>
					</ol>
	
				<cfelseif choices.business_element eq "generic_descriptor">

					<br><br>
					JUDGING CRITERIA:<br>
						<ol>
				<li>Must accurately define the product or service.</li>
				<li>Must be brief and similar to others in our category.</li>
				<li>Can add character but not at the expense of defining.</li>
                &nbsp;  -Without character EXAMPLE; “yogurt”<br>
                 &nbsp;  -With character EXAMPLE; “portable yogurt”
				 </ol>

				<cfelseif choices.business_element eq "benefit">				
				

						<br><br>
					JUDGING CRITERIA:<br>
						<ol>
				<li>Must define what the user gets out of using it.</li>
				<li>Must be no more than three words.</li>
				<li>Does not need character.</li>
					&nbsp;  -No character EXAMPLE; “Less Work”
					</ol>

				<cfelseif choices.business_element eq "attributes">	
				

						<br><br>
					JUDGING CRITERIA:<br>
						<ol>
				<li>Must relate directly to the Benefit.</li>
				<li>Must validate or empower the Benefit.</li>
					</ol>
					
				<cfelseif choices.business_element eq "tag_line">			
				

						<br><br>
					JUDGING CRITERIA:<br>
						<ol>
				<li>Must be honest and authentic.</li>
				<li>Must inspire you to purchase.</li>
				<li>Must seem unique to the category.</li>
					</ol>
					
				<cfelseif choices.business_element eq "rtb">	
					

						
						<br><br>
					JUDGING CRITERIA:<br>
						<ol>
					<li>Must reference an independent outside source.</li>
					<li>Must increase the level of credibility.</li>
						</ol>
				
				<cfelseif choices.business_element eq "key_graphic">
				

						<br><br>
					JUDGING CRITERIA:<br>
						<ol>
					<li>Must immediately communicate something Remarkable about the product or service.</li>
					<li>Must be graphically simple and strong.</li>
					<li>Must be easy to recognize and remember.</li>
					<li>Must seem unique to your category.</li>
						</ol>
				
				<cfelseif choices.business_element eq "key_graphic">
				
	
						<br><br>
					JUDGING CRITERIA:<br>
						<ol>
					<li>Must bring attention to the Selling Proposition in a positive way.</li>
					<li>Must cause the consumer to evaluate the Selling Proposition.</li>
					<li>Must seem unique to the category.</li>
						</ol>
				
				<cfelseif choices.business_element eq "graphic_presentation">
				<ul>
				<li>Now that you are familiar with this business it is time to rate the proposed Graphic Presentation layouts. </li>
					<br><br>
				<li>To do so effectively, first review the judging criteria below. </li>
					<br><br>
				<li>Next, review the first Graphic Presentation image several times then review each of the three judging criteria again.</li>
				 	<br><br>
				<li>Use the sliders below to rate the Graphic Presentations from 1-100 (100 being most Remarkable). </li>
					<br><br>
				</ul>
				Thank you for your authentic participation.
						
				<br><br>
					<font color="green">JUDGING CRITERIA:</font><br>
						<ol>
				<li>Must have an obvious starting point.</li>
				<li>Must flow easily from point to point.</li>
				<li>Must fully communicate a complete and compelling Selling Proposition.</li>
				<li>Must be seen as unique to the category.</li>
						</ol>
					
				</cfif>
				
				<br><br>
				
				<li>Next, review the <cfif choices.business_element neq "rtb">#ucase(replace(choices.business_element,"_"," ","All"))#s<cfelse>ENDORSEMENTS</cfif> several times.</li>
				 	<br><br>
				<li>Use the sliders below to rate the <cfif choices.business_element neq "rtb">#ucase(replace(choices.business_element,"_"," ","All"))#s<cfelse>ENDORSEMENTS</cfif> from 1-100 (100 being most Remarkable). </li>
					<br>
				</ul>
				</cfoutput>	
			</cfif>
				
					
					
					</td>			
				</tr>

			 <tr>		  
				<td align="center" class="black10" colspan="2">
					Below are the three 
					<cfif choices.business_element eq "rtb">
						<font size="3">ENDORSEMENTS</font> 
					<cfelse>
						<font size="3"><cfoutput>#ucase(replace(choices.business_element,"_"," ","All"))#</cfoutput>S</font> 
					</cfif>
					that require your feedback.
					<br>
					Move the sliders to rate each choice, 100 being the best.
				</td>
			</tr>	
			<cfoutput query="choices">
			<tr>	
				<td align="center" colspan="2">	
					
					<table border="0" cellspacing="1" cellpadding="3" class="white14">
					<!--- Choice 1 starts --->
		<cfif choices.business_element eq "key_graphic" OR choices.business_element eq "impact" OR choices.business_element eq "graphic_presentation" OR choices.business_element eq "brand_logo" OR choices.business_element eq "sub_brand_logo">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="7" bgcolor="CCCCCC" align="center">
					<img src="images/#choices.business_element#/#choices.cid#/#choices.choice_1#">
				</td>
			</tr>
		</cfif>
						<tr>
							<td width="75%">
								1. <input type="text" name="choice_1" size="40" value="#choices.choice_1#" readonly="yes"> 
							</td>
							<td width="250" background="images/spectrum.jpg" colspan="4">
								<div class="carpe_horizontal_slider_track">
							<div class="carpe_slider_slit">&nbsp;</div>
							<div class="carpe_slider" 
								id="your_slider_id"
								orientation="horizontal"
								distance="233"
								display="your_display1"
								style="left: 0px;">&nbsp;</div>
						</div>
							</td>
							<td>
								<div class="carpe_slider_display_holder">
							<input class="carpe_slider_display"
								id="your_display1"
								name="choice_1_rating"
								type="text" 
								from="0" 
								to="100" 
								valuecount="101" 
								value="0" 
								typelock="off" /></div>	
							</td>
						</tr>
						<tr class="black10">
							<td>&nbsp;
								
							</td>
							<td>
								Unremarkable 
							</td>
							<td>
								Average
							</td>
							<td align="center">
								Strongly <br>
								Preferred 
							</td>
							<td>
								Remarkable
							</td>
							<td>&nbsp;
								
							</td>							
						</tr>
						<!--- Choice 2 starts --->
		<cfif choices.business_element eq "key_graphic" OR choices.business_element eq "impact" OR choices.business_element eq "graphic_presentation" OR choices.business_element eq "brand_logo" OR choices.business_element eq "sub_brand_logo">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="7" bgcolor="CCCCCC" align="center">
					<img src="images/#choices.business_element#/#choices.cid#/#choices.choice_2#">
				</td>
			</tr>
		</cfif>
						<tr>
							<td width="75%">
								2. <input type="text" name="choice_2" size="40" value="#choices.choice_2#" readonly="yes"> 
							</td>
							<td width="250" background="images/spectrum.jpg" colspan="4">
								<div class="carpe_horizontal_slider_track">
							<div class="carpe_slider_slit">&nbsp;</div>
							<div class="carpe_slider" 
								id="your_slider_id2"
								orientation="horizontal"
								distance="233"
								display="your_display2"
								style="left: 0px;">&nbsp;</div>
						</div>
							</td>
							<td>
								<div class="carpe_slider_display_holder">
							<input class="carpe_slider_display"
								id="your_display2"
								name="choice_2_rating"
								type="text" 
								from="0" 
								to="100" 
								valuecount="101" 
								value="0" 
								typelock="off" /></div>	
							</td>
						</tr>
						<tr class="black10">
							<td>&nbsp;
								
							</td>
							<td>
								Unremarkable 
							</td>
							<td>
								Average
							</td>
							<td align="center">
								Strongly <br>
								Preferred 
							</td>
							<td>
								Remarkable
							</td>
							<td>&nbsp;
								
							</td>							
						</tr>
						
		<cfif choices.business_element eq "key_graphic" OR choices.business_element eq "impact" OR choices.business_element eq "graphic_presentation" OR choices.business_element eq "brand_logo" OR choices.business_element eq "sub_brand_logo">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="7" bgcolor="CCCCCC" align="center">
					<img src="images/#choices.business_element#/#choices.cid#/#choices.choice_3#">
				</td>
			</tr>
		</cfif>
						<!--- Choice 3 starts --->
						<tr>
							<td width="75%">
								3. <input type="text" name="choice_3" size="40" value="#choices.choice_3#" readonly="yes"> 
							</td>
							<td width="250" background="images/spectrum.jpg" colspan="4">
								<div class="carpe_horizontal_slider_track">
							<div class="carpe_slider_slit">&nbsp;</div>
							<div class="carpe_slider" 
								id="your_slider_id3"
								orientation="horizontal"
								distance="233"
								display="your_display3"
								style="left: 0px;">&nbsp;</div>
						</div>
							</td>
							<td>
								<div class="carpe_slider_display_holder">
							<input class="carpe_slider_display"
								id="your_display3"
								name="choice_3_rating"
								type="text" 
								from="0" 
								to="100" 
								valuecount="101" 
								value="0" 
								typelock="off" /></div>	
							</td>
						</tr>
						<tr class="black10">
							<td>&nbsp;
								
							</td>
							<td>
								Unremarkable 
							</td>
							<td>
								Average 
							</td>
							<td align="center">
								Strongly <br>
								Preferred 
							</td>
							<td>
								Remarkable
							</td>
							<td>&nbsp;
								
							</td>							
						</tr>
						<!--- My Choice  starts --->
						<!---
						<tr>
							<td>
								 <input type="text" name="my_choice" size="30" value="#choices.my_choice#" readonly="yes"> 	
							</td>
							<td width="250" background="images/spectrum.jpg" colspan="4">
								<div class="carpe_horizontal_slider_track">
							<div class="carpe_slider_slit">&nbsp;</div>
							<div class="carpe_slider" 
								id="your_slider_id4"
								orientation="horizontal"
								distance="233"
								display="your_display4"
								style="left: 0px;">&nbsp;</div>
						</div>
							</td>
							<td>
								<div class="carpe_slider_display_holder">
							<input class="carpe_slider_display"
								id="your_display4"
								name="my_choice_rating"
								type="text" 
								from="0" 
								to="100" 
								valuecount="101" 
								value="0" 
								typelock="off" /></div>	
							</td>
						</tr>
						<tr class="black10">
							<td class="white14" valign="top">
								Business Owner's Choice
							</td>
							<td>
								Unremarkable 
							</td>
							<td>
								Preferred 
							</td>
							<td align="center">
								Strongly <br>
								Preferred 
							</td>
							<td>
								Remarkable
							</td>
							<td>&nbsp;
								
							</td>							
						</tr> --->
					</table>
			
				</td>		  
			 </tr>
<!--- 			<tr>		  
					<td align="right" valign="top">
						Suggestions:				
					</td>	
					<td>	 
						1. <input type="text" name="suggestion_1" size="30" value=""><br>
						2. <input type="text" name="suggestion_2" size="30" value=""><br>
						3. <input type="text" name="suggestion_3" size="30" value=""><br>
					</td>			
			</tr> --->
			<tr>
				<td colspan="6" align="center">
				<br><br>
				<input type="hidden" name="business_element" value="#choices.business_element#"> 
				<input type="hidden" name="rated_by_id" value="#client.cid#"> 
				<input type="hidden" name="rated_by_name" value="#client.name#"> 
				<input type="hidden" name="sid" value="#url.sid#"> 
				<input type="hidden" name="s_name" value="#s.name#"> 
				<input type="hidden" name="eid" value="#url.eid#"> 
						
				<input type="image" src="images/brand_submit.jpg" onclick="submit(Feedback)"> 
				</td>
			</tr>



				
			 </cfoutput>	
		</form>	
			 <tr>
				<td align="center" bgcolor="336699" colspan="2" height="5"> </td>
			  </tr>		
		</table>