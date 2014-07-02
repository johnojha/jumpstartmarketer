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


		



<cfif evaluate('client_progress.' & url.be & '_education') eq 1>
	<!--- Only if the client has been to the education page or video, may they proceed with the exercises. --->
			
		<cfif url.be eq "brand" OR url.be eq "sub_brand">
		
		<cfoutput>	
			<!--- Display the four phases for BRAND and SUB-BRAND. --->
			<tr>
				<td>
				<!--- The table for the phases to display. --->
					<table width="850" border="0" cellspacing="1" cellpadding="8" class="black14" bgcolor="003366"> 
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<img src="images/expert_feedback_process.jpg" border="0">
							</td>
						</tr>				
					<!--- Row for phase 1 --->
						<tr>
						<cfif evaluate(url.be & '_client.recordcount') lt 20>
							<td bgcolor="FFFFFF" width="10%">
								<img src="images/hand_v1.jpg">
							</td>
						<cfelseif evaluate(url.be & '_client.recordcount') gte 20>
							<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
						</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=1" class="bakeofflink">PHASE 1 Exercise</a></li>
								<br>
								<cfif evaluate(url.be & '_client.recordcount') lt 20>
									You have <strong>#evaluate(url.be & '_client.recordcount')#</strong> #replace(ucase(url.be),"_"," ")# names entered so far. You need <strong>20</strong> to proceed to <strong>PHASE 2</strong>. 
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<!--- <cfif evaluate(url.be & '_client.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=1" class="bakeofflink">PHASE 1 Entries</a></li>
								<cfelse>
									<li>PHASE 1 Entries</li>
								</cfif> --->
							</td>
						</tr>
					
					<!--- Row for phase 2 --->	
					<cfif evaluate(url.be & '_client.recordcount') gte 20>
						<tr>
							<cfif evaluate(url.be & '_four.recordcount') lt 5> 	
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate(url.be & '_four.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=2" class="bakeofflink">PHASE 2 Exercise</a></li>
								<br>
								<cfif evaluate(url.be & '_four.recordcount') lt 5 AND evaluate(url.be & '_four.recordcount') neq 0
								
								OR (url.sent eq 1 AND evaluate(url.be & '_four.recordcount') lt 5)>


								      
		
		                                                     
							<br />
							
							</font>
		
									You have had <strong>#evaluate(url.be & '_four.recordcount')#</strong> people suggest #replace(ucase(url.be),"_"," ")# names so far. You need <strong>5 or more</strong> to proceed to <strong>PHASE 3</strong>.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
									
									<font color="E62128">You will receive an email alert once the results are all in.</font>
									
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate(url.be & '_four.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_of5f&be=#url.be#&phase=2" class="bakeofflink">PHASE 2 Results</a></li>
								<cfelse>
									<li>PHASE 2 Results</li>
								</cfif>	
								<br>
								<cfif evaluate(url.be & '_four.recordcount') lt 5>
									View your results above after your group of experts begin responding.
								</cfif>
							</td>
						</tr>
					</cfif>		
					
					<!--- Row for phase 3 --->	
										
					<cfif evaluate(url.be & '_four.recordcount') gte 5>
						<tr>
							<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate('rate_' & url.be & '.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=3" class="bakeofflink">PHASE 3 Exercise</a></li>
								<br>

								
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5 AND evaluate('rate_' & url.be & '.recordcount') neq 0 
								OR (url.sent eq 3 AND evaluate('rate_' & url.be & '.recordcount') lt 5)>

													
									You have had <strong>#evaluate('rate_' & url.be & '.recordcount')#</strong> people <strong>RATE your #replace(ucase(url.be),"_"," ")# names</strong> so far. You need <strong>5 or more</strong> to proceed to <strong>PHASE 4</strong>.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
									<font color="E62128">You will receive an email alert once the results are all in.</font>
								
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate('rate_' & url.be & '.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=3" class="bakeofflink">PHASE 3 Results</a></li>
								<cfelse>
									<li>PHASE 3 Results</li>
								</cfif>								
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
									View your results above after your group of experts begin responding.
								</cfif>
							</td>
						</tr>
					</cfif>			

					<!--- Row for phase 4 --->	
										
					<cfif evaluate('rate_' & url.be & '.recordcount') gte 5>
						<tr>
							<cfif evaluate('rank_' & url.be & '.recordcount') lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate('rank_' & url.be & '.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=4" class="bakeofflink">PHASE 4 Exercise</a></li>
								<br>
								<cfif evaluate('rank_' & url.be & '.recordcount') lt 5 AND evaluate('rank_' & url.be & '.recordcount') neq 0
								
								OR (url.sent eq 4 AND evaluate('rank_' & url.be & '.recordcount') lt 5)>

								
									You have had <strong>#evaluate('rank_' & url.be & '.recordcount')#</strong> people <strong>RANK your #replace(ucase(url.be),"_"," ")# names</strong> so far. You need <strong>5 or more</strong> to proceed to <strong>the next step.</strong>.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
									<font color="E62128">You will receive an email alert once the results are all in.</font>
								
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate('rank_' & url.be & '.recordcount') gt 0>
								<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=4" class="bakeofflink">PHASE 4 Results</a></li>
								<cfelse>
								<li>PHASE 4 Results</li>
								</cfif>
								<br>
								<cfif evaluate('rank_' & url.be & '.recordcount') lt 5>
									View your results above after your group of experts begin responding.
								</cfif>
							</td>
						</tr>
					</cfif>																
					
						
					</table>
					
					
				</td>
			</tr>
			
			</cfoutput>	
				
		</cfif>	
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
	
					<!--- Row for phase 2 --->	
					<cfif evaluate(url.be & '_client.recordcount') gte 10>
                    
                    	
						<tr>
							<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate('rate_' & url.be & '.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=2" class="bakeofflink">PHASE 2 Exercise</a></li>
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5 AND evaluate('rate_' & url.be & '.recordcount') neq 0      OR  (url.sent eq 2 AND evaluate('rate_' & url.be & '.recordcount') lt 5)>

								
									You have had <strong>#evaluate('rate_' & url.be & '.recordcount')#</strong> people <strong>RATE your <cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ")#</cfif> names</strong> so far. You need <strong>5 or more</strong> to proceed to the next step.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
									<font color="E62128">You will receive an email alert once the results are all in.</font>

								
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate('rate_' & url.be & '.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=2" class="bakeofflink">PHASE 2 Results</a></li>
								<cfelse>
									<li>Phase 2 Results</li>
								</cfif>	
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
									View your results above after your group of experts begin responding.
								</cfif>
							</td>
						</tr>
                        
					</cfif>
	
			
								<!--- Row for phase 3 --->	
										
					<cfif evaluate('rate_' & url.be & '.recordcount') gte 5>
						<tr>
							<cfif evaluate('rank_' & url.be & '.recordcount') lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate('rank_' & url.be & '.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=3" class="bakeofflink">PHASE 3 Exercise</a></li>
								<br>
								<cfif evaluate('rank_' & url.be & '.recordcount') lt 5 AND evaluate('rank_' & url.be & '.recordcount') neq 0
								
								OR  (url.sent eq 3 AND evaluate('rank_' & url.be & '.recordcount') lt 5)>

								
									You have had <strong>#evaluate('rank_' & url.be & '.recordcount')#</strong> people <strong>RANK your #replace(ucase(url.be),"_"," ")# names</strong> so far. You need <strong>5 or more</strong> to proceed to <strong>the next step.</strong>.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>

									<font color="E62128">You will receive an email alert once the results are all in.</font>
								
								
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate('rank_' & url.be & '.recordcount') gt 0>
								<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=3" class="bakeofflink">PHASE 3 Results</a></li>
								<cfelse>
									<li>PHASE 3 Results
																
								</cfif><br>
								<cfif evaluate('rank_' & url.be & '.recordcount') lt 5>
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
	<!--- END of Display the phases for Attributes. --->	    
    
    
    
	
	<!--- Display the phases for Benefit. --->	
	<cfif url.be eq "benefit">
			<tr>
				<td>
				
					<!--- The table for the phases to display. --->
				<cfoutput>
					<table width="850" border="0" cellspacing="1" cellpadding="8" class="black14" bgcolor="003366"> 
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<img src="images/expert_feedback_process.jpg" border="0">
							</td>
						</tr>		
					
					<!--- Row for phase 1 --->
						<tr>
							<cfif benefit_count.recordcount lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif benefit_count.recordcount gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=1" class="bakeofflink">PHASE 1 Exercise</a></li>
								<br>
								<cfif benefit_count.recordcount lt 5 AND  benefit_count.recordcount neq 0 OR (url.sent eq 1 AND benefit_count.recordcount lt 5) >

								
									You have had <strong>#benefit_count.recordcount#</strong> people <strong>complete your #replace(ucase(url.be),"_"," ")# ladder exercise</strong> so far. You need <strong>5 or more</strong> to proceed to <strong>the next phase.</strong>.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
									<font color="E62128">You will receive an email alert once the results are all in.</font>

								
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
							<cfif benefit_count.recordcount gt 0>
								<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=1" class="bakeofflink">PHASE 1 Results</a></li>
							<cfelse>
								<li>Phase 1 Results</li>
							</cfif>
								<br>
								<cfif benefit_count.recordcount lt 5>
									View your results above after your group of experts begin responding.
								</cfif>
							</td>
						</tr>
					
					<!--- Row for phase 2 --->	
										
					<cfif benefit_count.recordcount gte 5>
						<tr>
							<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate('rate_' & url.be & '.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=2" class="bakeofflink">PHASE 2 Exercise</a></li>
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5 AND evaluate('rate_' & url.be & '.recordcount') neq 0
								
								OR (url.sentnew eq 1 AND evaluate('rate_' & url.be & '.recordcount') lt 5)>

								
									You have had <strong>#evaluate('rate_' & url.be & '.recordcount')#</strong> people <strong>RATE your #replace(ucase(url.be),"_"," ")# names</strong> so far. You need <strong>5 or more</strong> to proceed to the next step.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
								<font color="E62128">You will receive an email alert once the results are all in.</font>

							       
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate('rate_' & url.be & '.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=2" class="bakeofflink">PHASE 2 Results</a></li>
								<cfelse>
									<li>Phase 2 Results</li>
								</cfif>
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
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
		
			<!--- END of Display the phases for Benefit. --->	
			
			
	
			<!--- Display the phases for Tagline, RTB. --->	
			
	<cfif url.be eq "tag_line" OR url.be eq "rtb">
	
			
			<tr>
				<td>
				
			<cfoutput>
					<!--- The table for the phases to display. --->
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
									You have <strong>#evaluate(url.be & '_client.recordcount')#</strong> <cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ")#</cfif> options entered so far. You need <strong>6 total</strong> to proceed to <strong>PHASE 2</strong>.  
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<!--- <cfif evaluate(url.be & '_client.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=1" class="bakeofflink">PHASE 1 Results</a></li>
								<cfelse>
									<li>Phase 1 Results</li>
								</cfif>	 --->
							</td>
						</tr>		
						
					<cfif evaluate(url.be & '_client.recordcount') gte 6>
						<tr>
							<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate('rate_' & url.be & '.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=2" class="bakeofflink">PHASE 2 Exercise</a></li>
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5 AND evaluate('rate_' & url.be & '.recordcount') neq 0
								
								OR  (url.sent eq 2 AND evaluate('rate_' & url.be & '.recordcount') lt 5)>
								
									You have had <strong>#evaluate('rate_' & url.be & '.recordcount')#</strong> people <strong>RATE your <cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ")#</cfif> names</strong> so far. You need <strong>5 or more</strong> to proceed to the next step.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>

									<font color="E62128">You will receive an email alert once the results are all in.</font>

								
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate('rate_' & url.be & '.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=2" class="bakeofflink">PHASE 2 Results</a></li>
								<cfelse>
									<li>Phase 2 Results</li>
								</cfif>	
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
									View your results above after your group of experts begin responding.
								</cfif>
							</td>
						</tr>
					</cfif>		
                    
				<!--- Row for phase 3 --->	
					<cfif evaluate('rate_' & url.be & '.recordcount') gte 5>
                    
                    	
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
                                    <li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=3" class="bakeofflink">PHASE 3 Exercise</a></li>
                                    <br>
                                    <cfif evaluate('chosen_' & url.be & '.recordcount') lt 5 AND  evaluate('chosen_' & url.be & '.recordcount') neq 0 OR (url.sentnew eq 3  AND
				    evaluate('chosen_' & url.be & '.recordcount') lt 5)>
				   
                                        You have had <strong>#evaluate('chosen_' & url.be & '.recordcount')#</strong> people <strong>CHOOSE BETWEEN your #replace(ucase(url.be),"_"," ","ALL")# names</strong> so far. You need <strong>5 or more</strong> to proceed.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
					<font color="E62128">You will receive an email alert once the results are all in.</font>
					
                                    </cfif>
                                </td>
                                <td bgcolor="FFFFFF" width="45%">
                                    <cfif evaluate('chosen_' & url.be & '.recordcount') gt 0>
                                    <li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=3" class="bakeofflink">PHASE 3 Results</a></li>
                                    <cfelse>
                                        <li>PHASE 3 Results
                                    
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
		
			<!--- END of Display the phases for Tagline, RTB --->	
            
            
            
			
	<cfif url.be eq "key_graphic" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
	
			<!--- BEGINNING of Display the phases for KEY GRAPHIC, BRAND LOGO, SUB BRAND LOGO --->	
			
			<tr>
				<td>
				
			<cfoutput>
					<!--- The table for the phases to display. --->
					<table width="850" border="0" cellspacing="1" cellpadding="8" class="black14" bgcolor="003366"> 
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<img src="images/expert_feedback_process.jpg" border="0">
							</td>
						</tr>		
					
					<!--- Row for phase 1 --->
						<tr>
						<cfif evaluate('client_progress.' & url.be & '_cd') eq 0>
							<td bgcolor="FFFFFF" width="10%">
								<img src="images/hand_v1.jpg">
							</td>
						<cfelse>
							<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
						</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=1" class="bakeofflink">PHASE 1 Exercise</a></li>
								<br>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate('client_progress.' & url.be & '_cd') eq 1>
									Now that you have your six #replace(ucase(url.be),"_"," ","All")# options ready, please proceed to <strong>PHASE 2</strong>.
								</cfif>
							</td>
						</tr>		
						
					<cfif evaluate('client_progress.' & url.be & '_cd') eq 1>
						<tr>
							<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate('rate_' & url.be & '.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=2" class="bakeofflink">PHASE 2 Exercise</a></li>
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5  AND evaluate('rate_' & url.be & '.recordcount') neq 0
								OR (url.sent eq 1 AND evaluate('rate_' & url.be & '.recordcount') lt 5)>

								
									You have had <strong>#evaluate('rate_' & url.be & '.recordcount')#</strong> people <strong>RATE your #replace(ucase(url.be),"_"," ","All")# names</strong> so far. You need <strong>5 or more</strong> to proceed to the next step.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
									<font color="E62128">You will receive an email alert once the results are all in.</font>

								
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif evaluate('rate_' & url.be & '.recordcount') gt 0>
									<li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=2" class="bakeofflink">PHASE 2 Results</a></li>
								<cfelse>
									<li>Phase 2 Results</li>
								</cfif>	
								<br>
								<cfif evaluate('rate_' & url.be & '.recordcount') lt 5>
									View your results above after your group of experts begin responding.
								</cfif>
							</td>
						</tr>
					</cfif>		
					
			<!--- Row for phase 3 --->	
					<cfif evaluate('rate_' & url.be & '.recordcount') gte 5>
                    
                    	
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
                                    <li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=3" class="bakeofflink">PHASE 3 Exercise</a></li>
                                    <br>
                                    <cfif evaluate('chosen_' & url.be & '.recordcount') lt 5  AND evaluate('chosen_' & url.be & '.recordcount') neq 0
				    OR (url.sentnew eq 3 AND evaluate('chosen_' & url.be & '.recordcount') lt 5)>

				   
                                        You have had <strong>#evaluate('chosen_' & url.be & '.recordcount')#</strong> people <strong>CHOOSE BETWEEN your #replace(ucase(url.be),"_"," ","ALL")# names</strong> so far. You need <strong>5 or more</strong> to proceed.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>

					<font color="E62128">You will receive an email alert once the results are all in.</font>

					
                                    </cfif>
                                </td>
                                <td bgcolor="FFFFFF" width="45%">
                                    <cfif evaluate('chosen_' & url.be & '.recordcount') gt 0>
                                    <li><a href="index.cfm?fa=bake_off&be=#url.be#&phase=3" class="bakeofflink">PHASE 3 Results</a></li>
                                    <cfelse>
                                        <li>PHASE 3 Results
                                    
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
			<!--- END of Display the phases for KEY GRAPHIC, BRAND LOGO, SUB BRAND LOGO. --->			
	
	

	<cfif url.be eq "graphic_presentation">
	
			<!--- BEGINNING of Display the phases for Graphic Presentation --->	
			
			<tr>
				<td>
				
			<cfoutput>
					<!--- The table for the phases to display. --->
					<table width="850" border="0" cellspacing="1" cellpadding="8" class="black14" bgcolor="003366"> 
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<img src="images/expert_feedback_process.jpg" border="0">
							</td>
						</tr>		
					
					<!--- Row for phase 1 --->
						<tr>
						<cfif client_progress.graphic_presentation_ready eq 0>
							<td bgcolor="FFFFFF" width="10%">
								<img src="images/hand_v1.jpg">
							</td>
						<cfelse>
							<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
						</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=1" class="bakeofflink">PHASE 1 Exercise</a></li>
								<br>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<cfif client_progress.graphic_presentation_ready eq 1>
									Now that you have your three Graphic Presentations ready, please proceed to <strong>PHASE 2</strong>.
								</cfif>
							</td>
						</tr>		
						
					<cfif client_progress.graphic_presentation_ready eq 1>
						<tr>
							<cfif graphic_presentation_uploads.recordcount lt 3>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelse>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=2" class="bakeofflink">PHASE 2 Exercise</a></li>
								<br>
								<cfif graphic_presentation_uploads.recordcount lt 3>
									You have uploaded <strong>#graphic_presentation_uploads.recordcount#</strong> graphics. You need to upload <strong>3 total</strong> to proceed to the next step.
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
									<cfif graphic_presentation_uploads.recordcount gte 3>
									<font color="green">UPLOADED</font>
									</cfif>
							</td>
						</tr>
					</cfif>		
					
					
					</table>
			</cfoutput>		
				</td>
			</tr>
			
			
		</cfif>		
			<!--- END of Display the phases for Graphic Presentation. --->			
	


<cfif url.be eq "eye_tracking_study">
	
			<!--- BEGINNING of Display the phases for EYE TRACKING STUDY --->	
			
			<tr>
				<td>
				
			<cfoutput>
					<!--- The table for the phases to display. --->
					<table width="700" border="0" cellspacing="1" cellpadding="8" class="black14" bgcolor="003366"> 
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<img src="images/expert_feedback_process.jpg" border="0">
							</td>
						</tr>		
					
					<!--- Row for phase 1 --->
						<tr>
						<cfif eye_count.recordcount lt 3>
							<td bgcolor="FFFFFF" width="10%">
								<img src="images/hand_v1.jpg">
							</td>
						<cfelse>
							<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
						</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=1" class="bakeofflink">PHASE 1 Exercise</a></li>
								<br>
							</td>
							<td bgcolor="FFFFFF" width="45%">
                            	<cfif eye_sent.recordcount neq 0>
									You have sent out your Eye Tracking Study.
                                    <br /><br />
                                    <cfif eye_count.recordcount gt 0>
                                    	#eye_count.recordcount# experts have respnded. You need <strong>3 or more</strong> to proceed to <strong>Phase 2</strong>.
                                        <br /><br />
                                    </cfif>
								</cfif>	
								<cfif eye_count.recordcount gte 3>
									Now that you have had 3 or more experts respond to your Eye tracking Study, please proceed to <strong>PHASE 2</strong>.

								
								</cfif>
                                <br>                            
                                    <li><a href="index.cfm?fa=archives_eye&be=#url.be#&final=0" class="bakeofflink">EXPERT FEEDBACK Results</a></li>
							</td>
						</tr>		
						
					<cfif eye_count.recordcount gte 3>
					<!--- Row for phase 2 --->
						<tr>
						<cfif eye2_count.recordcount lt 3>
							<td bgcolor="FFFFFF" width="10%">
								<img src="images/hand_v1.jpg">
							</td>
						<cfelse>
							<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
						</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1&phase=2" class="bakeofflink">PHASE 2 Exercise</a></li>
								<br>
							</td>
							<td bgcolor="FFFFFF" width="45%">
                            	<cfif eye2_sent.recordcount neq 0>
									You have sent out your <strong>FINAL</strong> Eye Tracking Study.
                                    <br /><br />
                                    <cfif eye2_count.recordcount gt 0>
                                    	#eye2_count.recordcount# people have respnded. You need <strong>3 or more</strong> to proceed to <strong>Phase 2</strong>.
                                        <br />
                                    </cfif>
								</cfif>	
								<cfif eye2_count.recordcount gte 3>
									Now that you have had 3 or more people respond to your Eye tracking Study, please proceed to <strong>PHASE 2</strong>.
								</cfif>
                                  <br>                            
                                    <li><a href="index.cfm?fa=archives_eye&be=#url.be#&final=1" class="bakeofflink">EXPERT FEEDBACK Results</a></li>
							</td>
						</tr>	
					</cfif>		
					
					
					</table>
			</cfoutput>		
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
        
        
        
        
	
	
	<!--- Start of CONSUMER FEEDBACK Section --->
	
	
			<!--- Check which is the final exercise for the element to check before procedding to CONSUMER FEEDBACK. --->
				<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
					<cfif evaluate('rank_' & url.be & '.recordcount') gte 5>
						<cfset "final_#url.be#" = 1>
					</cfif>
				<cfelseif url.be eq "generic_descriptor" OR url.be eq "tag_line" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
					<cfif evaluate('chosen_' & url.be & '.recordcount') gte 5>	
						<cfset "final_#url.be#" = 1>
					</cfif>
				<cfelseif url.be eq "benefit">
					<cfif evaluate('rate_' & url.be & '.recordcount') gte 5>
						<cfset "final_#url.be#" = 1>
					</cfif>
				<cfelseif url.be eq "graphic_presentation">
					<cfif graphic_presentation_uploads.recordcount gte 3>
						<cfset "final_#url.be#" = 1>
					</cfif>
				<cfelse>
					<cfset "final_#url.be#" = 0>
				</cfif>	
			<!--- End of Consumer Check.	 --->
			
		<cfif evaluate('final_' & url.be) eq 1>
			<tr>
				<td>

			<cfoutput>
				<table width="850" border="0" cellspacing="1" cellpadding="8" class="black14"  bgcolor="003366">
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<br>
								<cfif url.be neq "graphic_presentation">
									CONGRATULATIONS!  You have completed the <strong>EXPERT FEEDBACK Process</strong> for <cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ","All")#</cfif>.
								<cfelse>
									CONGRATULATIONS!  You have completed and uploaded your three GRAPHIC PRESENTATIONS.
								</cfif>
								<br><br>
								Now it is time to proceed to the <strong>CONSUMER FEEDBACK Exercise</strong> for your <cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ","All")#</cfif>.
								<br><br>
								Click on the CONSUMER FEEDBACK Exercise link below.
								<br><br>
							</td>
						</tr>					
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								<img src="images/consumer_feedback_process.jpg" border="0">
							</td>
						</tr>
						<tr>
							<cfif evaluate('consumer_' & url.be & '.recordcount') lt 5>
								<td bgcolor="FFFFFF" width="10%">
									<img src="images/hand_v1.jpg">
								</td>
							<cfelseif evaluate('consumer_' & url.be & '.recordcount') gte 5>
								<td bgcolor="FFFFFF" align="center" valign="middle">
								<img src="images/completed_sm.jpg">
							</td>
							</cfif>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=consumer_exercise&be=#url.be#" class="bakeofflink">CONSUMER FEEDBACK Exercise</a></li>
								<br>
								<cfif evaluate('consumer_' & url.be & '.recordcount') gte 5>
								<cfif evaluate('choice.' & url.be) neq "">

									You have had <strong>#evaluate('consumer_' & url.be & '.recordcount')#</strong> consumers <strong>RATE your <cfif url.be neq "rtb">#replace(ucase(url.be),"_"," ","All")#<cfelse>ENDORSEMENT</cfif> names</strong> so far. You need <strong>5 or more</strong> to proceed to <strong>the next step.</strong>.  <cfif sent.recordcount neq 0><font color="green"><strong>This exercise has been sent to your group.</strong></font> You will be sent email alerts as responses come in.</cfif>
								</cfif>
								</cfif>
							</td>
							<td bgcolor="FFFFFF" width="45%">
								<li><a href="index.cfm?fa=archives&be=#url.be#" class="bakeofflink">CONSUMER FEEDBACK Results</a></li>
								<br>
								<cfif evaluate('consumer_' & url.be & '.recordcount') lt 5>
									View your results above to see the Consumer ratings of your <cfif url.be neq "rtb">#replace(ucase(url.be),"_"," ","All")#s<cfelse>ENDORSEMENTS</cfif>.
								</cfif>
							</td>
						</tr>				
					
					<cfif evaluate('consumer_' & url.be & '.recordcount') gte 5>
						<tr>
							<td align="center" colspan="3" bgcolor="FFFFFF">
								
							
							<cfif evaluate('choice.' & url.be) neq "">	
									<br>
									CONGRATULATIONS!  You have completed the <strong>CONSUMER FEEDBACK Process</strong> for <cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ")#</cfif>.
									<br><br>
									Now it is time to proceed to  <br>		
																
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
<!--- 											<li><a href="index.cfm?fa=elements&be=rtb&bg=1" class="bakeofflink">ENDORSEMENT</a></li>
										<cfelseif url.be eq "rtb">
											<li><a href="index.cfm?fa=elements&be=key_graphic&bg=1" class="bakeofflink">KEY GRAPHIC</a></li> --->
										<cfelseif url.be eq "key_graphic">
											<li><a href="index.cfm?fa=impact&be=impact&bg=1" class="bakeofflink">IMPACT</a></li>
										<cfelseif url.be eq "impact">
											<li><a href="index.cfm?fa=elements&be=graphic_presentation&bg=1" class="bakeofflink">GRAPHIC PRESENTATION</a></li>	
										<cfelseif url.be eq "graphic_presentation">
                                            <li><a href="index.cfm?fa=acknowledge_yourself" class="bakeofflink">ACKNOWLEDGE YOURSELF</a> THE FINAL STEP.</li>
											<!--- <li><a href="index.cfm?fa=bakeoff_eye_tracking_study&be=eye_tracking_study&bg=1&phase=1" class="bakeofflink">EYE TRACKING STUDY</a></li> --->																																																								

										</cfif>
										</td>
									</tr>
								</table>
													
							<cfelse>
								<cfoutput>
									<br>
									You have <strong>ALMOST</strong> completed the <strong>CONSUMER FEEDBACK Process</strong> for <cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ","All")#</cfif>.
									<br><br>
									Click below and follow the final directions. 
									<br><br>
									<table class="black14" cellpadding="5" bgcolor="FFFFFF">
										<tr>
											<td>
												<li><a href="index.cfm?fa=archives&be=#url.be#" class="bakeofflink">CONSUMER FEEDBACK Results</a></li>
											</td>
										</tr>
									</table>
									<br>
								</cfoutput>
							</cfif>	
					
							</td>
						</tr>
					</cfif>			
				</table>	
			</cfoutput>
				
				</td>
			</tr>
		</cfif>
		<!--- END of CONSUMER FEEDBACK Section --->
		
					
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
