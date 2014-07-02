	<cfparam name="url.be" default=0>
	<cfparam name="url.updated" default=0>
	<cfparam name="url.sent" default=0>
	<cfparam name="url.uploaded" default=0>
	<cfparam name="url.sentnew" default=0>

	<cfparam name="final_brand" default=0>
	<cfparam name="final_sub_brand" default=0> 
	<cfparam name="final_generic_descriptor" default=0>
	<cfparam name="final_benefit" default=0> 
	<cfparam name="final_attributes" default=0>
	<cfparam name="final_rtb" default=0> 
	<cfparam name="final_key_graphic" default=0>
	<cfparam name="final_tag_line" default=0> 
	<cfparam name="client.key_graphic_cd" default=0>
	<cfparam name="url.key_graphic_cd" default=0>
	<cfparam name="client.brand_logo_cd" default=0>
	<cfparam name="url.brand_logo_cd" default=0>
	<cfparam name="client.sub_brand_logo_cd" default=0>
	<cfparam name="url.sub_brand_logo_cd" default=0>
	<cfparam name="client.graphic_presentation_ready" default=0>
	<cfparam name="url.graphic_presentation_ready" default=0>
	<cfoutput>
		<cfparam name="final_#url.be#" default=0>
	</cfoutput>


	<cflock scope="session" type="exclusive" timeout="10" >
         <cfset session.shaurl = url.sent>
         </cflock>

	 

	
	<!--- Client progress query located in application.cfm file --->
	
	
		<!--- script to determine where the individual is at in the process. --->
	<cfinclude template="functions/Element_Progress.cfm">
	
		<cfif evaluate('consumer_' & url.be & '.recordcount') gte 5>
			<cfquery name="choice" datasource="#application.dsn#">
				SELECT b.id, b.cid, b.brand, b.brand_logo, b.sub_brand, b.sub_brand_logo, b.generic_descriptor, b.benefit, b.attributes, b.tag_line, b.rtb, 
							b.key_graphic, b.impact, b.graphic_presentation, b.brand_rating, b.brand_logo_rating, b.sub_brand_rating, b.sub_brand_logo_rating, b.generic_descriptor_rating, 
							b.benefit_rating, b.attributes_rating, b.tag_line_rating, b.rtb_rating, 
							b.key_graphic_rating, b.impact_rating, b.graphic_presentation_rating, b.no_brand, b.no_sub_brand
				FROM t_business b INNER JOIN
					t_clients c ON c.id = b.cid
				WHERE b.cid = #client.cid#
			</cfquery>	
		</cfif>
	
		<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">	
			<cfif evaluate('consumer_' & url.be & '.recordcount') gte 5>
				<cfif evaluate('choice.' & url.be) eq "">	
				<tr>
					<td bgcolor="FFFFFF">
					<cfoutput>
					<br>
					You have <strong>ALMOST</strong> completed the <strong>CONSUMER FEEDBACK Process</strong> for #replace(ucase(url.be),"_"," ")#.
					<br><br>
					Click on the link below & follow the directions. 
						<br><br>
						<table class="black14" cellpadding="5" bgcolor="FFFFFF">
							<tr>
								<td>
									<li><a href="index.cfm?fa=archives&be=#url.be#" class="bakeofflink">CONSUMER FEEDBACK Results</a></li>
								</td>
							</tr>
						</table>
					</cfoutput>
					</td>
				</tr>
				</cfif>	
			</cfif>
			<cfif url.updated eq 1>
					<tr>
						<td bgcolor="FFFFFF">
							<font color="E62128">*** Your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names have been added. ***
							<br><br>
							Please proceed below.</font>
						</td>
					</tr>
			</cfif>
			
			<cfif url.key_graphic_cd eq 1>
					<tr>
						<td bgcolor="FFFFFF">
							<font color="E62128">*** Now you have your Key Graphics ready ***
							<br><br>
							You are ready to go on to Phase 2 below.</font>
						</td>
					</tr>
			</cfif>			
			<cfif url.graphic_presentation_ready eq 1>
					<tr>
						<td bgcolor="FFFFFF">
							<font color="E62128">*** Now you have your Graphic Presentations ready ***
							<br><br>
							You are ready to go on to Phase 2 below.</font>
						</td>
					</tr>
			</cfif>	
		<cfoutput>
			<tr>
				<td>	
                
                	<table width="100%">
                    	<tr>
                        	<td>
								<img src="images/headlines_#url.be#.jpg"> 
							</td>
                            <td align="right">	
								<cfif url.be eq "generic_descriptor" OR url.be eq "brand" OR url.be eq "attributes" OR url.be eq "tag_line"><a href="index.cfm?fa=consultant&be=#url.be#"><img src="images/creative_consultant.jpg" border="0" /></a><cfelseif url.be eq "brand_logo" OR url.be eq "key_graphic" OR url.be eq "graphic_presentation"><a href="index.cfm?fa=consultant&be=#url.be#"><img src="images/design_consultant.jpg" border="0" /></a></cfif>
                    		</td>
                        </tr>
                    </table>
                    <br>
              <cfif url.be neq "eye_tracking_study">
				
					<img src="images/elements/element_#url.be#_def.jpg"><br>
					<img src="images/elements/element_#url.be#_great.jpg"><br>
					<img src="images/elements/element_#url.be#_ex.jpg"><br>
                   
                    <cfif url.be eq "rtb">
                    	<font color="red">NOTE:</font> <strong>TESTIMONIALS from previous customers</strong> are great Endorsements if you don't have a professional or 			celebrity endorsement.  You may want to come up with your own testimonials, and then see if you can get a previous customer to put their name to it.   
                        <br /><br />  
                    </cfif>
                
              </cfif>
					
					
					<table width="850" border="0" cellspacing="1" cellpadding="8" class="black14"  bgcolor="003366"> 
						<tr>
							<cfif evaluate('client_progress.' & url.be & '_education') eq 0>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>	
							<cfelse>
								<td bgcolor="FFFFFF" width="10%" align="center" valign="middle">
									<img src="images/completed_sm.jpg">
								</td>		
							</cfif>
							<td bgcolor="FFFFFF" rowspan="2" width="40%">
								
									<a href="index.cfm?fa=#url.be#_cont" class="bakeofflink">First, learn more about creating <cfif url.be neq "rtb">#replace(ucase(url.be),"_"," ","All")#<cfelse>Endorsement</cfif><cfif url.be neq "attributes">s</cfif></a> before creating your own.


							</td>
						</tr>
					</table>
					
					<br>
				<cfif evaluate('client_progress.' & url.be & '_education') eq 1>	
					<a name="friends"><font color="red">***</font></a> After you are thoroughly familiar with <cfoutput>#replace(ucase(url.be),"_"," ","All")#</cfoutput>, click the <b>PHASE 1 Exercise</b> link below.<br>
				</cfif>
				</td>
			</tr>

		</cfoutput>


		




	<!--- END of Display the four phases for BRAND and SUB-BRAND. --->
	
	
    
	<!--- Display the phases for Generic Descriptor. --->
	
	<cfif url.be eq "generic_descriptor">
			<tr>
				<td>		
		<cfoutput>
			<table width="850" border="0" cellspacing="1" cellpadding="8" class="black14" bgcolor="003366"> 
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<img src="images/expert_feedback_process.jpg" border="0">
							</td>
						</tr>		
					<!--- Row for phase 1 --->
						<tr>
						<cfif evaluate(url.be & '_client.recordcount') lt 6>
							<td bgcolor="FFFFFF" width="10%">
								<img src="images/hand_v1.jpg">
							</td>
						<cfelseif evaluate(url.be & '_client.recordcount') gte 6>
							<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
						</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=1" class="bakeofflink">PHASE 1 Exercise</a></li>
								<br>
								<cfif evaluate(url.be & '_client.recordcount') lt 6>
									You have <strong>#evaluate(url.be & '_client.recordcount')#</strong> #replace(ucase(url.be),"_"," ")# names entered so far. You need <strong>6</strong> to proceed to <strong>PHASE 2</strong>. 
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
     <!--- 								<cfif evaluate(url.be & '_client.recordcount') gt 0>
	         								<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=1" class="bakeofflink">PHASE 1 Entries</a></li>
								<cfelse>
									<li>PHASE 1 Entries
								</cfif> --->
							</td>
						</tr>
	
					<!--- Row for phase 2 --->	
					<cfif evaluate(url.be & '_client.recordcount') gte 6>
                    
                    	
						<tr>
								<cfif evaluate('chosen_' & url.be & '.recordcount') lt 5>
                                    <td bgcolor="FFFFFF" width="10%">
                                        <img src="images/hand_v1.jpg">
                                    </td>
                                <cfelseif evaluate('chosen_' & url.be & '.recordcount') gte 5>
                                    <td bgcolor="FFFFFF" align="center" valign="middle">
                                    <img src="images/completed_sm.jpg">
                                </td>
                                </cfif>
                                <td bgcolor="FFFFFF" width="45%">
                                    <li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=2" class="bakeofflink">PHASE 2 Exercise</a></li>
                                    <br>
                                    <cfif evaluate('chosen_' & url.be & '.recordcount') lt 5  AND evaluate('chosen_' & url.be & '.recordcount') neq 0  OR (url.sent eq 1 AND
				    evaluate('chosen_' & url.be & '.recordcount') lt 5)>
                                        You have had <strong>#evaluate('chosen_' & url.be & '.recordcount')#</strong> people <strong>CHOOSE BETWEEN your #replace(ucase(url.be),"_"," ")# names</strong> so far. You need <strong>5 or more</strong> to proceed. <font color="E62128">You will receive an email alert once the results are all in.</font> <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
                                    </cfif>
                                </td>
                                <td bgcolor="FFFFFF" width="45%">
                                    <cfif evaluate('chosen_' & url.be & '.recordcount') gt 0>
                                    <li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=2" class="bakeofflink">PHASE 2 Results</a></li>
                                    <cfelse>
                                        <li>PHASE 2 Results
                                    
                                    </cfif><br>
                                    <cfif evaluate('chosen_' & url.be & '.recordcount') lt 5>
                                        View your results above after your group of experts begin responding.
                                    </cfif>
                                </td>
                            </tr>
					
					</cfif>
				
			</table>
		</cfoutput>
			</td>
		</tr>
	</cfif>
	<!--- END of Display the phases for Generic Descriptor. --->	
	
    
    
<!--- Display the phases for  Attributes. --->
	
	<cfif url.be eq "attributes">
			<tr>
				<td>		
		<cfoutput>
			<table width="850" border="0" cellspacing="1" cellpadding="8" class="black14" bgcolor="003366"> 
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<img src="images/expert_feedback_process.jpg" border="0">
							</td>
						</tr>		
					<!--- Row for phase 1 --->
						<tr>
						<cfif evaluate(url.be & '_client.recordcount') lt 10>
							<td bgcolor="FFFFFF" width="10%">
								<img src="images/hand_v1.jpg">
							</td>
						<cfelseif evaluate(url.be & '_client.recordcount') gte 10>
							<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
						</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=1" class="bakeofflink">PHASE 1 Exercise</a></li>
								<br>
								<cfif evaluate(url.be & '_client.recordcount') lt 10>
									You have <strong>#evaluate(url.be & '_client.recordcount')#</strong> #replace(ucase(url.be),"_"," ")# names entered so far. You need <strong>10</strong> to proceed to <strong>PHASE 2</strong>. 
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
<!--- 								<cfif evaluate(url.be & '_client.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=1" class="bakeofflink">PHASE 1 Entries</a></li>
								<cfelse>
									<li>PHASE 1 Entries
								</cfif> --->
							</td>
						</tr>
	
					
	
			
							
			</td>
		</tr>
	</cfif>
	<!--- END of Display the phases for Attributes. --->	    
    
    
    
	
	<!--- Display the phases for Benefit. --->	
	<cfif url.be eq "benefit">
			<tr>
				<td>
				
					<!--- The table for the phases to display. --->
				
			<!--- END of Display the phases for Benefit. --->	
			
			
	
			<!--- Display the phases for Tagline, RTB. --->	
			
	<cfif url.be eq "tag_line" OR url.be eq "rtb">
	
			
			<tr>
				<td>
				
				
				</td>
			</tr>
	</cfif>
		
			<!--- END of Display the phases for Tagline, RTB --->	
            
            
            
			
	<cfif url.be eq "key_graphic" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
	
			<!--- BEGINNING of Display the phases for KEY GRAPHIC, BRAND LOGO, SUB BRAND LOGO --->	
			
			<tr>
				<td>
				
				
				</td>
			</tr>
			
			
		</cfif>		
			<!--- END of Display the phases for KEY GRAPHIC, BRAND LOGO, SUB BRAND LOGO. --->			
	
	

	<cfif url.be eq "graphic_presentation">
	
			<!--- BEGINNING of Display the phases for Graphic Presentation --->	
			
			<tr>
				<td>
				
					
				</td>
			</tr>
			
			
		</cfif>		
			<!--- END of Display the phases for Graphic Presentation. --->			
	


<cfif url.be eq "eye_tracking_study">
	
			<!--- BEGINNING of Display the phases for EYE TRACKING STUDY --->	
			
			<tr>
				<td>
				
				
				</td>
			</tr>
			
			
		</cfif>		
			<!--- END of Display the phases for EYE TRACKING STUDY. --->		
	
    	
        <cfif url.be eq "eye_tracking_study">
        	<cfif eye2_count.recordcount gte 5>
         <table width="850" border="0" cellspacing="1" cellpadding="8" class="black14" bgcolor="003366">
                                <tr>
                                    <td align="center" colspan="3" bgcolor="FFFFFF">
                                        <br>
                                        
                                            CONGRATULATIONS!  You have completed the <strong>THE FINAL EYE TRACKING STUDY</strong>.

                                        <br><br>
                                        Now it is time to proceed to 
                                        <table class="black14" cellpadding="5" bgcolor="FFFFFF">
											<tr>
												<td>	
										
											<li><a href="index.cfm?fa=aknowledge_yourself&bg=1" class="bakeofflink">READY TO LAUNCH!</a> The Final Step.</li>																																																								

										
												</td>
											</tr>
										</table>
                                    </td>
                                </tr>
                           </table>	 <br /><br /><br />    <cfabort>      	
            </cfif>
        </cfif>
        
        
        
        
	
	
	
		
					
		<tr>
			<td>
			
			<cfif url.sent eq 1>
		<font color="green">***</font> Occasionally refresh page to see if more results have come in. <br /><font color="green"></font>
		
							<br />
							
							</font>
		</cfif>

		
			<br><br>
		<cfinclude template="includes/back_link.cfm">		

			</td>
		</tr>		
			
		<!--- End of check to see if client has been to the education page or video. --->
	</cfif>	
			
	</table>		
