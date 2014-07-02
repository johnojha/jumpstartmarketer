<head>
<link href="styles/style1.css" rel="stylesheet" type="text/css">
<script
    language="JavaScript"
    src="js/sliderStatic.js">
</script>
<link
    href="styles/default.css"
    rel="stylesheet"
    type="text/css">
</head>

<cfparam name="url.be" default=0>
<cfparam name="url.choice" default=0>
<cfparam name="url.date_spec" default=0>
<cfparam name="url.impact" default=0>
<cfparam name="url.imp" default=0>
<cfparam name="url.sent" default=0>
<cfparam name="url.eye" default=0>


<cfif IsDefined("url.cid")>
	<cfset client.cid = url.cid>
</cfif>

	<cfquery name="elements" datasource="#application.dsn#" > 
		SELECT   id, cid, c_name, business_element, choice_1, choice_2, choice_3, 
				choice_1_rating, choice_2_rating, choice_3_rating, date_submitted
		FROM t_elements
			WHERE cid = #client.cid#
			AND business_element = '#trim(url.be)#'
			<cfif url.date_spec neq 0>
				WHERE date_submitted = '#url.date_spec#'
			</cfif>
			ORDER BY date_submitted
	</cfquery>	
	
	<cfquery name="my" datasource="#application.dsn#">
		SELECT id AS bid, #trim(url.be)# AS my_choice, #trim(url.be)#_rating AS my_choice_rating
		FROM t_business
		WHERE cid = #client.cid#
	</cfquery>
	
<cfif elements.recordcount neq 0>	
	<cfquery name="sug" datasource="#application.dsn#">
		SELECT id, element_suggestion 
		FROM t_suggestions
		WHERE eid = #elements.id#
		ORDER BY id DESC
	</cfquery>
</cfif>		

	<cfquery name="feedback" datasource="#application.dsn#">
		SELECT id
		FROM t_ratings
		WHERE cid = #client.cid#
			AND business_element = '#trim(url.be)#'
	</cfquery>


				
<cfif url.be eq "graphic_presentation">

	<cfquery name="eye" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye = 1
			AND uuid <> '0'
	</cfquery>
    
	<cfquery name="eye2" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye2 = 1
			AND uuid <> '0'
	</cfquery>
	
	
	<cfquery name="eye_count" datasource="#application.dsn#">
		SELECT DISTINCT uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye = 1
			AND uuid <> '0'
	</cfquery>	
    
	<cfquery name="eye2_count" datasource="#application.dsn#">
		SELECT DISTINCT uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye2 = 1
			AND uuid <> '0'
	</cfquery>	
	
	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye = 1
			AND uuid IS NULL
	</cfquery>
    
    <cfquery name="names2" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye2 = 1
			AND uuid IS NULL
	</cfquery>
    
  </cfif>

	
		
		<table width="500" border="0" cellspacing="1" cellpadding="3" class="black14">
		<cfif url.imp neq 0>
			<tr>
				<td  height="20" colspan="6" bgcolor="FFFFCC" align="center">
					*** Click on one of the "Make My Choice" buttons below ***
				</td>
			</tr>
		</cfif>	
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="2">
					<img src="images/consumer_feedback_results.jpg">
				</td>
			</tr>	
	<cfif url.sent eq 1>
			<tr>
				<td bgcolor="FFFFFF" nowrap>
					<cfif feedback.recordcount lt 5>
					<font color="E62128">
					You will receive an email alert once the results are all in.</font>
					</cfif>
				</td>
			</tr>
	</cfif>		
			<tr>
				<td>
				          
					<!--<strong><cfoutput>#feedback.recordcount#</cfoutput></strong> people have provided CONSUMER FEEDBACK so far.
					<cfif feedback.recordcount lt 5>
						<br><br>
						You need <cfoutput><strong>#5 - feedback.recordcount#</strong></cfoutput> more responses to proceed to the next step.
					</cfif>-->
					<cfif feedback.recordcount gt 5>
						 *** Your consumers have responded, please continue below ***
					</cfif>
				</td>
			</tr>
		<cfif feedback.recordcount gte 5>
			<tr>
				<td  height="20" colspan="6" class="black14" bgcolor="FFFFFF" nowrap>			
				<cfif url.be neq "attributes">
					<!--<font color="green">***</font> 5 or more consumers have responded <font color="green">***</font> -->
					<br><br>
					 <li>Click on the "Make My Choice" button below, next to the option with the highest rating.</li>
					 	<br><br>
					 <li>After you click "Make My Choice" you will be ready to go on to the next step.</li>
					 	<br>
				<cfelse>
					<cfif client_progress.attributes_choice eq ".5">
						<font color="green">OK, now click on the <strong>next highest rated</strong> attribute.</font>
					</cfif>
					<!--<font color="green">***</font> 5 or more consumers have responded <font color="green">***</font> -->
					<br><br>
					 <li>Click on the "Make My Choice" button below, next to the <strong>TWO OPTIONS</strong> with the highest rating, one at a time.</li>
					 	<br><br>
					 <li>After you click "Make My Choice" for each of the top rated ATTRIBUTES, you will be ready to go on to the next step.</li>
					 	<br>				
				</cfif>					 
					 </font>	
				</td>
			</tr>
		</cfif>
			
					<cfif evaluate('client_progress.' & url.be & '_choice') eq 1>
						<tr>
							<td align="center" colspan="3" bgcolor="#99CCFF">
								<br>
								CONGRATULATIONS!  You have completed the <strong>CONSUMER FEEDBACK Process</strong> for <cfoutput><cfif url.be neq "rtb">#replace(ucase(url.be),"_"," ","All")#<cfelse>ENDORSEMENT</cfif></cfoutput>.
								<br><br>
								Now it is time to proceed to  <br><br>
								<table class="black14" cellpadding="5" bgcolor="FFFFFF">
									<tr>
										<td>
										<cfif url.be eq "generic_descriptor">			
											<li><a href="index.cfm?fa=elements&be=brand&bg=1" class="bakeofflink">BRAND</a></li>
                                        <cfelseif url.be eq "brand">			
											<li><a href="index.cfm?fa=elements&be=brand_logo&bg=1&sentnew=0" class="bakeofflink">BRAND LOGO</a></li>
										<cfelseif url.be eq "brand_logo">
                                       	    <li><a href="index.cfm?fa=elements&be=benefit&bg=1&sentnew=0" class="bakeofflink">BENEFIT</a></li>
<!--- 											<li><a href="index.cfm?fa=elements&be=sub_brand&bg=1" class="bakeofflink">SUB-BRAND</a></li>									
										<cfelseif url.be eq "sub_brand">
											<li><a href="index.cfm?fa=elements&be=sub_brand_logo&bg=1" class="bakeofflink">SUB-BRAND LOGO</a></li>
										<cfelseif url.be eq "sub_brand_logo">	
											<li><a href="index.cfm?fa=elements&be=benefit&bg=1" class="bakeofflink">BENEFIT</a></li> --->
										<cfelseif url.be eq "benefit">
											<li><a href="index.cfm?fa=elements&be=attributes&bg=1" class="bakeofflink">ATTRIBUTES</a></li>
										<cfelseif url.be eq "attributes">
											<li><a href="index.cfm?fa=elements&be=tag_line&bg=1" class="bakeofflink">TAG LINE</a></li>
										<cfelseif url.be eq "tag_line">
                                       	    <li><a href="index.cfm?fa=elements&be=key_graphic&bg=1" class="bakeofflink">KEY GRAPHIC</a></li>
											<!--- <li><a href="index.cfm?fa=elements&be=rtb&bg=1" class="bakeofflink">ENDORSEMENT</a></li> --->
<!--- 										<cfelseif url.be eq "rtb">
											<li><a href="index.cfm?fa=elements&be=key_graphic&bg=1" class="bakeofflink">KEY GRAPHIC</a></li> --->
										<cfelseif url.be eq "key_graphic">
											<li><a href="index.cfm?fa=impact&be=impact&bg=1" class="bakeofflink">IMPACT</a></li>	
										<cfelseif url.be eq "impact">
											<li><a href="index.cfm?fa=elements&be=graphic_presentation&bg=1" class="bakeofflink">GRAPHIC PRESENTATION</a></li>	
										<cfelseif url.be eq "graphic_presentation">
                                        	<li><a href="index.cfm?fa=acknowledge_yourself" class="bakeofflink">ACKNOWLEDGE YOURSELF</a> THE FINAL STEP.</li>
<!---                                         	<cfif eye_count.recordcount lt 5>
												<li><a href="index.cfm?fa=bakeoff_graphic_presentation&be=graphic_presentation&bg=1&phase=3" class="bakeofflink">EYE TRACKING STUDY</a></li>
                                            <cfelseif eye_count.recordcount gte 5>
                                            
                                            		<cfif eye2_count.recordcount lt 5>	
                                             			<li><a href="index.cfm?fa=bakeoff_graphic_presentation&be=graphic_presentation&bg=1&phase=4" class="bakeofflink"><strong>FINAL</strong> EYE 										TRACKING STUDY</a></li>
                                                	<cfelseif eye2_count.recordcount gte 5>
                                                   		 <li><a href="index.cfm?fa=acknowledge_yourself" class="bakeofflink">ACKNOWLEDGE YOURSELF</a> THE FINAL STEP.</li>
  													</cfif>                                                  
                                            </cfif>	 --->
 																																																				
										</cfif>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</cfif>			
		<cfif url.choice neq 0>
			<tr>
				<td  height="20" colspan="6">
					<font color="green">*** Your <cfoutput>#ucase(url.be)# choice has been updated.</cfoutput> ***</font>	
				</td>
			</tr>
		</cfif>	
		<cfif url.impact eq 1>
			<tr>
				<td  height="20" colspan="6" bgcolor="FFFFCC" align="center">
					<li><a href="index.cfm?fa=impact&bg=1" class="bodylink3">Back to IMPACT Excercise</a></li>		
				</td>
			</tr>			
		</cfif>
			<tr>
				<td>
				
		<table width="500" border="0" cellspacing="1" cellpadding="3" class="black14">
			<cfoutput query="elements">
			
				<cfset variables.choice_1_px = val(elements.choice_1_rating) * 2.25>
				<cfset variables.choice_2_px = val(elements.choice_2_rating) * 2.25>
				<cfset variables.choice_3_px = val(elements.choice_3_rating) * 2.25>
				<cfset variables.my_choice_px = val(my.my_choice_rating) * 2.25>
				<tr>
					<td align="right">
						<strong>Date Submitted:</strong>
					</td>
					<td>
						#elements.date_submitted#
					</td>
					<td>&nbsp;
						
					</td>
					<td>&nbsp;
						
					</td>
				</tr>
				<tr>
					<td align="right">
						<strong>Business Element:</strong>
					</td>
					<td>
						<cfif elements.business_element eq "rtb">
							ENDORSEMENT
						<cfelse>
							#Replace(elements.business_element,"_", " ")#
						</cfif>
					</td>
					<td>&nbsp;
						
					</td>
					<td>&nbsp;
						
					</td>
				</tr>
		<cfif feedback.recordcount gte 5>
				<tr>
					<td align="right">
						<img src="images/my_choice.jpg">
					</td>
					<td align="center" width="75%">
						<cfif evaluate('client_progress.' & url.be & '_choice') eq 1>
							<input type="text" size="20" name="my_choice" value="#my.my_choice#" readonly="yes">
						</cfif>
					</td>
					<td width="250" background="images/spectrum.jpg" colspan="4">
							<div class="carpe_horizontal_slider_track">
						<div class="carpe_slider_slit">&nbsp;</div>
						<div class="carpe_slider" 
							id="your_slider_id"
							orientation="horizontal"
							distance="233"
							display="your_display1"
							style="left: #variables.my_choice_px#px;">&nbsp;</div>
						</div>
					</td>	
					<td>
						<div class="carpe_slider_display_holder">
					<input class="carpe_slider_display"
						id="your_display1"
						name="your_var_name"
						type="text" 
						from="0" 
						to="100" 
						valuecount="101" 
						value="#my.my_choice_rating#" 
						typelock="off" /></div>	
					</td>
				</tr>	
				<tr class="black10">
					<td colspan="2" valign="top">
						
						<cfif url.be eq "attributes">
							<div align="center"> <a href="act_my_choice.cfm?bid=#my.bid#&be=#trim(url.be)#&clearAtt=1" class="bodylink"><font size="1">Clear Attributes</font></a><br></div>
						</cfif>
						
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
		
			
		</cfif>		
				
				
		<cfif url.be eq "key_graphic" OR url.be eq "impact" OR url.be eq "graphic_presentation" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="7" bgcolor="CCCCCC" align="center">
					<img src="images/#url.be#/#client.cid#/#elements.choice_1#">
				</td>
			</tr>
		</cfif>
				<tr>
					<td align="right" valign="middle" nowrap="nowrap">
					<cfif feedback.recordcount gte 5>
						<a href="act_my_choice.cfm?bid=#my.bid#&choice_text=#trim(elements.choice_1)#&rating=#elements.choice_1_rating#&be=#trim(url.be)#&impact=#url.impact#"><img src="images/my_choice2.jpg" border="0"></a>
					</cfif>
						1)
					</td>
					<td align="center" nowrap >
						#elements.choice_1#
					</td>
					<td width="250" background="images/spectrum.jpg" colspan="4">
							<div class="carpe_horizontal_slider_track">
						<div class="carpe_slider_slit">&nbsp;</div>
						<div class="carpe_slider" 
							id="your_slider_id2"
							orientation="horizontal"
							distance="233"
							display="your_display2"
							style="left: #variables.choice_1_px#px;">&nbsp;</div>
						</div>
					</td>	
					<td>
						<div class="carpe_slider_display_holder">
					<input class="carpe_slider_display"
						id="your_display2"
						name="your_var_name"
						type="text" 
						from="0" 
						to="100" 
						valuecount="101" 
						value="#elements.choice_1_rating#" 
						typelock="off" /></div>	
					</td>
				</tr>	
				<tr class="black10">
					<td>
						
					</td>
					<td>
						
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
		<cfif url.be eq "key_graphic" OR url.be eq "impact" OR url.be eq "graphic_presentation" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="7" bgcolor="CCCCCC" align="center">
					<img src="images/#url.be#/#client.cid#/#elements.choice_2#">
				</td>
			</tr>
		</cfif>
				<tr>
					<td align="right" valign="middle" nowrap="nowrap">
					<cfif feedback.recordcount gte 5>
						<a href="act_my_choice.cfm?bid=#my.bid#&choice_text=#trim(elements.choice_2)#&rating=#elements.choice_2_rating#&be=#trim(url.be)#&impact=#url.impact#"><img src="images/my_choice2.jpg" border="0"></a>
					</cfif>
						2)
					</td>
					<td align="center" nowrap>
						#elements.choice_2#
					</td>
					<td width="250" background="images/spectrum.jpg" colspan="4">
							<div class="carpe_horizontal_slider_track">
						<div class="carpe_slider_slit">&nbsp;</div>
						<div class="carpe_slider" 
							id="your_slider_id3"
							orientation="horizontal"
							distance="233"
							display="your_display3"
							style="left: #variables.choice_2_px#px;">&nbsp;</div>
						</div>
					</td>	
					<td>
						<div class="carpe_slider_display_holder">
					<input class="carpe_slider_display"
						id="your_display3"
						name="your_var_name"
						type="text" 
						from="0" 
						to="100" 
						valuecount="101" 
						value="#elements.choice_2_rating#" 
						typelock="off" /></div>	
					</td>
				</tr>	
				<tr class="black10">
					<td>
						
					</td>
					<td>
						
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
		<cfif url.be eq "key_graphic" OR url.be eq "impact" OR url.be eq "graphic_presentation" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="7" bgcolor="CCCCCC" align="center">
					<img src="images/#url.be#/#client.cid#/#elements.choice_3#">
				</td>
			</tr>
		</cfif>
				<tr>
					<td align="right" valign="middle" nowrap="nowrap">
					<cfif feedback.recordcount gte 5>
						<a href="act_my_choice.cfm?bid=#my.bid#&choice_text=#trim(elements.choice_3)#&rating=#elements.choice_3_rating#&be=#trim(url.be)#&impact=#url.impact#"><img src="images/my_choice2.jpg" border="0"></a>
					</cfif>
						3)
					</td>
					<td align="center" nowrap>
						#elements.choice_3#
					</td>
					<td width="250" background="images/spectrum.jpg" colspan="4">
							<div class="carpe_horizontal_slider_track">
						<div class="carpe_slider_slit">&nbsp;</div>
						<div class="carpe_slider" 
							id="your_slider_id4"
							orientation="horizontal"
							distance="233"
							display="your_display4"
							style="left: #variables.choice_3_px#px;">&nbsp;</div>
						</div>
					</td>	
					<td>
						<div class="carpe_slider_display_holder">
					<input class="carpe_slider_display"
						id="your_display4"
						name="your_var_name"
						type="text" 
						from="0" 
						to="100" 
						valuecount="101" 
						value="#elements.choice_3_rating#" 
						typelock="off" /></div>	
					</td>
				</tr>	
				<tr class="black10">
					<td>
						
					</td>
					<td>
						
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
				<tr>
					<td colspan="8" bgcolor="999999" height="10">
						
					</td>
				</tr>
			</cfoutput>
		</table>
<!--- 	<cfif elements.recordcount neq 0>			
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="2">
					SUGGESTIONS
				</td>
			</tr>	
			<tr>
				<td>
				<cfif sug.recordcount eq 0>
					There are no suggestions at this time.
				<cfelse>
					<ul>
						<cfoutput query="sug">
							<li>#sug.element_suggestion#</li>
							<br><br>
						</cfoutput>
					</ul>
				</cfif>
				</td>
			</tr>		
	  	</table>	
	</cfif>	 --->	
	
	<cfif feedback.recordcount lt 5>
			<font color="green">***</font> Occasionally refresh page to see if more results have come in. <font color="green">***</font>
			<br><br>
		</cfif>
				</td>		
			</tr>	
		</table>
		
		
<!--- <cfif url.be eq "graphic_presentation">


		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14" bgcolor="336699">
			<tr> 
				<td  align="center" valign="bottom" class="header16" colspan="2" bgcolor="000000">
					<strong>EYE TRACKING STUDY</strong>
				</td>
			</tr>
			
		<cfif eye.recordcount eq 0>	
		
			<tr>
				<td colspan="2">
					There are no results at this time.
				</td>
			</tr>	
			
		<cfelse>
		
			<tr>
				<td colspan="2" align="center" bgcolor="000000">
					<cfoutput>
						<img src="images/graphic_presentation/#client.cid#/#names.element_text#">
					</cfoutput>
				</td>
			</tr>
			<tr>
				<td bgcolor="CCCCCC" align="center" class="black14" colspan="2" bgcolor="000000">
						<strong>FEEDBACK </strong>  - <cfoutput> #eye_count.recordcount#</cfoutput> responder(s)
				</td>
			</tr>	
			<cfoutput query="eye">
			<tr>
				<td bgcolor="000000">&nbsp;
					 
				</td>
				<td bgcolor="000000">
					#eye.element_text#
				</td>
			</tr>
			</cfoutput>	
					
		</cfif>	
        
        
			<tr> 
				<td  align="center" valign="bottom" class="header16" colspan="2" bgcolor="000000">
					<strong>FINAL EYE TRACKING STUDY</strong>
				</td>
			</tr>
			
		<cfif eye2.recordcount eq 0>	
		
			<tr>
				<td colspan="2">
					There are no results at this time.
				</td>
			</tr>	
			
		<cfelse>
		
			<tr>
				<td colspan="2" align="center" bgcolor="000000">
					<cfoutput>
						<img src="images/graphic_presentation/#client.cid#/#names2.element_text#">
					</cfoutput>
				</td>
			</tr>
			<tr>
				<td bgcolor="CCCCCC" align="center" class="black14" colspan="2" bgcolor="000000">
						<strong>FEEDBACK </strong>  - <cfoutput> #eye2_count.recordcount#</cfoutput> responder(s)
				</td>
			</tr>	
			<cfoutput query="eye">
			<tr>
				<td bgcolor="000000">&nbsp;
					 
				</td>
				<td bgcolor="000000">
					#eye2.element_text#
				</td>
			</tr>
			</cfoutput>	
					
		</cfif>	
			<tr>
				<td colspan="2" bgcolor="CCCCCC">
				&nbsp; &nbsp; &nbsp;
				</td>
			</tr>
	  	</table>	
		<br><br><br>
</cfif> --->