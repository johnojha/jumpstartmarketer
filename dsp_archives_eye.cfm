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
<cfparam name="url.final" default=0>
<cfparam name="url.omni" default=0>
<cfparam name="url.cid" default=0>


<cfif IsDefined("url.cid")>
	<cfset client.cid = url.cid>
</cfif>

	
<cfif url.final eq 0>

	<cfquery name="eye" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid, order_num
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = 'graphic_presentation'
			AND eye = 1
			AND uuid <> '0'
            ORDER BY uuid
	</cfquery>

	<cfquery name="eye_count" datasource="#application.dsn#">
		SELECT DISTINCT uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye = 1
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
    
<cfelseif url.final eq 1>    
    
    
  <cfquery name="eye2" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid, order_num
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye2 = 1
			AND uuid <> '0'
             ORDER BY uuid
	</cfquery>  
	<cfquery name="eye2_count" datasource="#application.dsn#">
		SELECT DISTINCT uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND eye2 = 1
			AND uuid <> '0'
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
	
		
	
	


		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14"  bgcolor="#FFFFFF">
  
  <cfif url.sent eq 1>
			<tr>
				<td bgcolor="FFFFFF" nowrap colspan="2">
              
					<font color="E62128">*** Your <cfif url.final eq 1>FINAL </cfif>EYE TRACKING STUDY 
                     
                    CONSUMER FEEDBACK Exercise has been sent. ***
					<br><br>
					You will receive email alerts as results come in.</font>
				</td>
			</tr>
	</cfif>		      
        
<cfif url.omni eq 1>
	<!---If this is Keith viewing the results, show all results and the interpretation form.--->
        
    <cfif url.final eq 0>
    
    
    
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
				<td>
                	#eye.order_num# 
				</td>
				<td>
					#eye.element_text#
				</td>
			</tr>
			</cfoutput>	
					
		</cfif>	
      
      
        
    <cfelseif url.final eq 1>
    
    
        
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
			<cfoutput query="eye2">
			<tr>
				<td>
                	#eye2.order_num#	 
				</td>
				<td>
					#eye2.element_text#
				</td>
			</tr>
			</cfoutput>	
					
		</cfif>	
        
        
      </cfif>
   
   		<!---Show Keith his interpretation form--->
   
    <table width="400" border="0" cellspacing="1" cellpadding="3" class="white14">
    	<tr>
        	<td colspan="2">
            	<strong>INTERPRETATION FEEDBACK FORM</strong>
            </td>
        </tr>
    

    <cfoutput>  
    <form name="interpret" action="act_eye_interpret.cfm?final=#url.final#&cid=#client.cid#" method="post">
    	<cfset ilist = "1,2,3,4,5">
    <cfloop list="#ilist#" index="i">
          <tr>
             <td width="20">
   				#i#).
             </td>
           	 <td>
             	<input type="text" size="30" name="interpret_#i#" />   
             </td>
   		  </tr>
       </cfloop>
       <tr>
       		<td>
            	
           		 <input type="submit" value="  Submit  " />
       		</td>
       </tr>
     </cfoutput>
    </table>
   
 <cfelse>
   		<!---	else If this is the client viewing the results, show keith's interpretation.--->
   
   		
 	<cfquery name="interpret1" datasource="#application.dsn#">
		SELECT id, order_num, element_text, final
		FROM         t_eye_interpret
		WHERE     (cid = #client.cid#)
			AND final = 0
	</cfquery>  
    
  	<cfquery name="interpret2" datasource="#application.dsn#">
		SELECT id, order_num, element_text, final
		FROM         t_eye_interpret
		WHERE     (cid = #client.cid#)
			AND final = 1
	</cfquery>  
    
    <cfquery name="elements" datasource="#application.dsn#" maxrows="5">
		SELECT id, business_element, my_choice, my_choice_rating, times_chosen
		FROM         t_elements
		WHERE     (cid = #client.cid#)
			AND (my_choice IS NOT NULL)
		ORDER BY times_chosen DESC
	</cfquery>
   		
   			<tr>
				<td colspan="2">
					
                    <table width="800" border="0" cellspacing="1" cellpadding="3" class="white14">
                        <tr>
                        	<td colspan="3" bgcolor="FFFFFF" class="black14">
								<font size="+2">COMMUNICATION HIERARCHY REPORT</font>
                            </td>
                        </tr>
                    	<tr>
                        	<td colspan="3" bgcolor="FFFFFF" class="black14">
<cfif url.final eq 0>
Below are the results of your Impact study and Eye Tracking Studies #1.

<cfelseif url.final eq 1>

Below are the results of your Impact study and Eye Tracking Studies #1 & #2.

</cfif>
                            </td>
                    	<tr>
                        	<td width="300">
                            	
                                <cfset counter = 1>
                                
                            <table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" bgcolor="336699">
                                                                   <tr> 
                                            <td  colspan="2" bgcolor="CCCCCC">
                                               IMPACT EXERCISE RESULTS
                                            </td>   
                                        </tr>
                            		<!---Show the client IMPACT results--->
                            		<cfoutput query="elements">
                                     
                                    <tr>
                                    	<td bgcolor="CCCCCC">
                                        	<font size="+3">
                                        		#counter#
                                            </font>
                                        </td>
										<td bgcolor="FFFFFF" nowrap>
                                            <cfif elements.business_element eq "key_graphic">
                                                <a href="images/#elements.business_element#/#client.cid#/#elements.my_choice#" class="bodylink3" target="new">view</a>
                                            </cfif>
                                            #elements.my_choice#
                                        </td>
                                    </tr>
                                    <cfset counter = counter + 1>
                                </cfoutput>
                
                                </table>
                                
                            </td>
                            
                            <td width="300" valign="top">
                            		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" bgcolor="336699">
                                        <tr> 
                                            <td  colspan="2" bgcolor="CCCCCC">
                                                EYE TRACKING #1 RESULTS 
                                            </td>   
                                        </tr>
                                        
                                        	<cfif interpret1.recordcount lt 1>
                                            	<tr>
                                                	<td colspan="2" bgcolor="FFFFFF">
                                            			There are no interpretation results yet.
                                                	</td>
                                                </tr>
                                            <cfelse>
											<cfoutput query="interpret1">
                                            	<tr> 
                                                	<td bgcolor="FFFFFF" width="10%">
                                                    	<font size="+3">#interpret1.order_num#</font>
                                                    </td>
                                                   	<td bgcolor="FFFFFF" width="90%">
                                                    	#interpret1.element_text#
                                                    </td>
                                                </tr>
											</cfoutput>	
                                            </cfif>
                                     </table>
                                     
                             </td>
                              <td width="300" valign="top">
                                 <table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" bgcolor="336699">
                                 		<tr> 
                                            <td  colspan="2" bgcolor="CCCCCC">
                                                EYE TRACKING #2 Results
                                            </td>   
                                        </tr>
                                        
                                        	<cfif interpret2.recordcount lt 1>
                                            	<tr>
                                                	<td colspan="2" bgcolor="FFFFFF">
                                            			There are no interpretation results yet.
                                                	</td>
                                                </tr>
                                            <cfelse>
											<cfoutput query="interpret2">
                                            	<tr>
                                                	<td bgcolor="FFFFFF">
                                                    	<font size="+3">#interpret2.order_num#</font>
                                                    </td>
                                                   	<td bgcolor="FFFFFF">
                                                    	#interpret2.element_text#
                                                    </td>
                                                </tr> 
											</cfoutput>	
                                            </cfif>
                                         
                                    </table>
                                
                            </td>
                        </tr>
                    </table>
                            
                   
                    
				</td>
			</tr>	
                     	<tr>
                        	<td colspan="3" bgcolor="FFFFFF" class="black14">
<cfif url.final eq 0>
You are now in a position to compare your first Eye Tracking Study with the results of your Impact study. The objective, in doing so, is to evaluate the effectiveness of your Graphic Presentation. The results have been lined up above to facilitate easy comparison.
<br /><br />
Begin by comparing the results across line one to see if they are the same in both studies. In doing so you will need to interpret the descriptive words used in the Eye Tracking study with the more specific words and graphics used in the Impact study. That comparison should be easy even though they may not be a perfect match.
<br /><br />
Continue by comparing all five communication levels. You are looking for is how well your Graphic Presentation matches up with the order of importance indicated by your Impact study. It’s unlikely you will have matched all five but if you did, you will skip Eye Tracking Study #2.
<br /><br />
Do not over react! It is not at all necessary for the order of these two studies to match perfectly. If an element that is ranked high in the Impact study and low in the Eye Tracking study you will want to make an appropriate adjustment. The opposite is true as well. If an element that is ranked low in the Impact study is ranked high in the Eye Tracking study you will also want to make an appropriate adjustment. All other changes should be subtle. After making changes to your Graphic Presentation, you will submit it to Eye Tracking study #2. 

<cfelseif url.final eq 1>

You are now in a position to compare your first and second Eye Tracking Studies with the results of your Impact study. The objective, in doing so, is to evaluate the effectiveness of your Graphic Presentation. The results have been lined up above to facilitate easy comparison.
<br /><br />
Begin by comparing the elements that you made changes to. In doing so you will need to interpret the descriptive words used in the Eye Tracking study with the more specific words and graphics used in the Impact study. That comparison should be easy even though they may not match up perfectly. Note the changes from the first study relative to the elements you changed. If there are no changes you can conclude your adjustments were not significant enough and consider changing them further. Your goal of getting close to the Impact study is still the objective.
<br /><br />
Again…do not over react! It is not at all necessary for the order of these two studies to match perfectly. If an element that is ranked high in the Impact study and low in the Eye Tracking study you will want to make an appropriate adjustment. The opposite is true as well. If an element that is ranked low in the Impact study is ranked high in the Eye Tracking study you will also want to make an appropriate adjustment. All other changes should be subtle. After making final changes, you are done. 

</cfif>
                            </td>
                    	<tr>  
   </cfif>     
			<tr>
				<td colspan="2" bgcolor="CCCCCC">
				&nbsp; &nbsp; &nbsp;
				</td>
			</tr>
	  	</table>	
		<br>
	<table width="500" border="0" cellspacing="1" cellpadding="3" class="white14">
	
            
 <cfif url.omni eq 0>           
            
            
	
    
    	<cfif url.final eq 0>
			<tr>
				<td>
					<strong><cfoutput>#eye_count.recordcount#</cfoutput></strong> experts have provided EYE TRACKING FEEDBACK so far.
					<cfif eye_count.recordcount lt 3>
						<br><br>
						You need <cfoutput><strong>#3 - eye_count.recordcount#</strong></cfoutput> more responses to proceed to the next step.
					</cfif>
				</td>
			</tr>
			<cfif eye_count.recordcount gte 3>
			<tr>
				<td  height="20" colspan="6" class="black14" bgcolor="FFFFFF" nowrap>			
					<font color="green">***</font> 3 or more experts have responded <font color="green">***</font> 
					<br><br>
					 <li>You are ready to go on to the next step.</li>
					 	<br>				 
					 </font>	
				</td>
			</tr>
			
			
					
					<tr>
						<td align="center" colspan="3" bgcolor="6699FF">
								<br>
								CONGRATULATIONS!  You have completed the <strong>EXPERT FEEDBACK Process</strong> for  the <cfoutput>EYE TRACKING STUDY</cfoutput>.
								<br><br>
								Now it is time to proceed to  <br><br>
								<table class="black14" cellpadding="5" bgcolor="FFFFFF">
									<tr>
										<td>
	
          <li><a href="index.cfm?fa=bakeoff_eye_tracking_study&be=eye_tracking_study&bg=1&phase=2" class="bakeofflink"><strong>FINAL</strong> EYE TRACKING STUDY</a></li> 						
                                                

										</td>
									</tr>
								</table>
							</td>
						</tr>
			</cfif>			
		<cfelseif url.final eq 1>
        
        

			<tr>
				<td>
					<strong><cfoutput>#eye2_count.recordcount#</cfoutput></strong> experts have provided FINAL EYE TRACKING FEEDBACK so far.
					<cfif eye2_count.recordcount lt 3>
						<br><br>
						You need <cfoutput><strong>#3 - eye2_count.recordcount#</strong></cfoutput> more responses to proceed to the next step.
					</cfif>
				</td>
			</tr>
			<cfif eye2_count.recordcount gte 3>
			<tr>
				<td  height="20" colspan="6" class="black14" bgcolor="FFFFFF" nowrap>			
					<font color="green">***</font> 3 or more consumers have responded <font color="green">***</font> 
					<br><br>
					 <li>You are ready to go on to the next step.</li>
					 	<br>				 
					 </font>	
				</td>
			</tr>
			
			
					
					<tr>
						<td align="center" colspan="3" bgcolor="6699FF">
								<br>
								CONGRATULATIONS!  You have completed the <strong>EXPERT FEEDBACK Process</strong> for  the <cfoutput>FINAL EYE TRACKING STUDY</cfoutput>.
								<br><br>
								Now it is time to proceed to  <br><br>
								<table class="black14" cellpadding="5" bgcolor="FFFFFF">
									<tr>
										<td>
	
          <li><a href="index.cfm?fa=acknowledge_yourself" class="bakeofflink">READY TO LAUNCH!</a> THE FINAL STEP.</li>					
                                                

										</td>
									</tr>
								</table>
                                
                                <br /><br />
							</td>
						</tr>
			</cfif>	        
        
        
        </cfif>
				
	</cfif>
		</table>