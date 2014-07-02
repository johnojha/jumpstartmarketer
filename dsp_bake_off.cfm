
<cfif url.be eq "impact">
	<cflocation url="index.cfm?fa=bake_off_impact&bg=1">
</cfif>


<cfparam name="url.be" default=0>
<cfparam name="url.edit" default=0>
<cfparam name="url.added" default=0>
<cfparam name="url.big" default=0>
<cfparam name="RateList" default=0>
<cfparam name="RankList" default=0>
<cfparam name="ChosenList" default=0>
<cfparam name="url.phase" default=0>
<cfparam name="url.check" default=0>


<SCRIPT LANGUAGE="JavaScript">	
		function popUp(URL) {
		day = new Date();
		id = day.getTime();
		eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=300,height=350,left = 476,top = 332');");
		}
	</script>
    
	
<cfif url.be neq "generic_descriptor" AND url.be neq "attributes">
	<cfset RateList = "#url.be#">
</cfif>
<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
	<cfset RankList = "#url.be#">
</cfif>
<cfif url.be eq "generic_descriptor" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "tag_line">
	<cfset ChosenList = "#url.be#">
</cfif>


	<!--- Queries for seeing if bake off work has been done, and show the green light --->
	
<cfinclude template="functions/Bakeoff_Feedback.cfm">
<cfinclude template="queries/client_entries.cfm">

	<!--- Tallies how many people have responded for Rate, Rank and Choose exercises. --->



<cfif url.be eq "benefit">

	<cfquery name="names" datasource="#application.dsn#">
		SELECT DISTINCT id, element_text, business_element, date_submitted, ladder_id, benefit_id, sug_by_name, rating
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = '#trim(url.be)#'
		ORDER BY benefit_id, ladder_id DESC
	</cfquery>

<cfelse>

	<cfquery name="names" datasource="#application.dsn#">
		SELECT DISTINCT id, element_text, business_element, legal_clearance, date_submitted, rating, sug_by_name, 
          
          CASE WHEN
            ranking > 0
           THEN
            ranking
           ELSE
            5 
           END
            AS ranking, times_chosen, uuid
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = '#trim(url.be)#'
				<cfif url.be eq "graphic_presentation">
					AND uuid IS NULL
				</cfif>
		ORDER BY 

        ranking ASC, times_chosen DESC, rating DESC, business_element, date_submitted, element_text 
	</cfquery>

</cfif>



		<table width="800" border="0" cellspacing="1" cellpadding="3" class="white14">
			<tr bgcolor="FFFFFF"> 
				<td  align="left" valign="bottom" class="header16" colspan="6">
                <br />
                	<cfoutput>
						<img src="images/expert_feedback_results.jpg"> 
                    </cfoutput>
					<br>
					<!--- <strong><cfoutput>#Replace(ucase(url.be),"_"," ")#:</cfoutput></strong><br> --->
				</td>
             </tr> 
			<tr bgcolor="FFFFFF"> 
				<td  align="left" colspan="2">
					&nbsp; &nbsp; &nbsp; &nbsp;
				</td> 
				<td  align="left" colspan="4" class="black14">
					
						<li> View your Expert Feedback Results so far for <strong><cfoutput>#Replace(ucase(url.be),"_"," ")#</cfoutput></strong> below.
                        <br><br>
						<li> After you view your results, you may click on the "See where you are in the Phase Process" button at the bottom of the page, to see where to go next.
				  		<br><br>
                  </td>
			</tr>		
  
                <!--- "See who has responded" is commented out for now. --->
<!--- 			<tr>
				<td>
					
					
					<cfif url.be neq "benefit">
						<cfoutput><strong>#evaluate(url.be & '_client.recordcount')#</strong> #replace(ucase(url.be),"_"," ")#s have been added by you. <font color="yellow">(Phase 1)</font></cfoutput>
						<br>
					</cfif>					
					<cfif url.be eq "benefit">
					 <cfoutput><strong>#benefit_count.recordcount#</strong> people have suggested BENEFITS so far.</cfoutput> <font color="yellow">(Phase 1)</font>  
						<br>	
                     <cfoutput>
                    	 <a href="javascript:popUp('components/dsp_friends_responded.cfm?be=#url.be#&phase=1')" class="bodylink">* See who has responded</a>
                     </cfoutput>				
					</cfif>
					
					
					<cfif url.be eq "brand" OR url.be eq "sub_brand">
					 <cfoutput><strong><cfif url.be eq "brand">#b_four.recordcount#<cfelse>#sb_four.recordcount#</cfif></strong> people have suggested <cfif url.be eq "brand">BRANDS<cfelse>SUB-BRANDS</cfif> so far.</cfoutput> <font color="yellow">(Phase 2)</font>  
                     <cfoutput>
                    	 <a href="javascript:popUp('components/dsp_friends_responded.cfm?be=#url.be#&phase=2')" class="bodylink">* See who has responded</a>
                     </cfoutput>
						<br>
					</cfif>

					<cfif url.be eq "graphic_presentation">
					 <cfoutput><strong>#eye_count.recordcount#</strong> people have done the EYE tracking study so far.</cfoutput>
						<br>
					</cfif>
					<cfif url.be neq "generic_descriptor">
					 <cfoutput><strong>#evaluate("rate_" & url.be & ".recordcount")#</strong> people have RATED so far.</cfoutput>
					 
					 	<cfif url.be eq "brand" OR url.be eq "sub_brand">
							<font color="yellow">(Phase 3)</font>
							 <cfoutput>
                                 <a href="javascript:popUp('components/dsp_friends_responded.cfm?be=#url.be#&phase=3')" class="bodylink">* See who has responded</a>
                             </cfoutput>
						<cfelse>
							<font color="yellow">(Phase 2)</font>
							 <cfoutput>
                                 <a href="javascript:popUp('components/dsp_friends_responded.cfm?be=#url.be#&phase=2')" class="bodylink">* See who has responded</a>
                             </cfoutput>
						</cfif>	
						<br>
					</cfif>
					<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
					 <cfoutput><strong>#evaluate("Rank_" & url.be & ".recordcount")#</strong> people have RANKED so far.</cfoutput>
						
						<cfif url.be eq "brand" OR url.be eq "sub_brand">
							<font color="yellow">(Phase 4)</font>
							 <cfoutput>
                                 <a href="javascript:popUp('components/dsp_friends_responded.cfm?be=#url.be#&phase=4')" class="bodylink">* See who has responded</a>
                             </cfoutput>
						<cfelse>
							<font color="yellow">(Phase 3)</font>
							 <cfoutput>
                                 <a href="javascript:popUp('components/dsp_friends_responded.cfm?be=#url.be#&phase=3')" class="bodylink">* See who has responded</a>
                             </cfoutput>
						</cfif>	
						<br>
					</cfif>
					<cfif url.be eq "generic_descriptor">
					 <cfoutput><strong>#evaluate("chosen_" & url.be & ".recordcount")#</strong> people have CHOSEN so far.</cfoutput>
						<font color="yellow">(Phase 2)</font>
  				 	<cfoutput>
                    	 <a href="javascript:popUp('components/dsp_friends_responded.cfm?be=#url.be#&phase=2')" class="bodylink">* See who has responded</a>
                     </cfoutput>
						<br>
					</cfif>		

				<cfif url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "tag_line">
					 <cfoutput><strong>#evaluate("chosen_" & url.be & ".recordcount")#</strong> people have CHOSEN so far.</cfoutput>
						<font color="yellow">(Phase 3)</font>
  				 	<cfoutput>
                    	 <a href="javascript:popUp('components/dsp_friends_responded.cfm?be=#url.be#&phase=3')" class="bodylink">* See who has responded</a>
                     </cfoutput>
						<br>
				</cfif>		
				</td>
			</tr> --->
           <!---  End of "See who has responded" --->
            
            
            
            
			
			<cfif url.added eq 1>
				<tr>
					<td  height="20" align="center">
						<font color="green">*** Your <cfoutput>#ucase(url.be)# entry has been added.</cfoutput> ***</font>
					</td>
				</tr>
			</cfif>
			<cfif url.big eq 1>
				<tr>
					<td  height="20" align="center">
						<font color="green">*** Your <cfoutput>#ucase(url.be)# file is too big.</cfoutput> ***</font>
					</td>
				</tr>
			</cfif>
			<cfif url.check eq 1>
				<tr>
					<td  height="20" align="center">
						<font color="green">*** Check off each name that is available, and click the <strong>"Update Available Names"</strong> button at the bottom of the page ***</font>
					</td>
				</tr>
			</cfif>
		</table>
	
	
	
<cfif url.edit eq 1>
	
	
		
		
	<cfif url.be eq "key_graphic" OR url.be eq "impact" OR url.be eq "graphic_presentation" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">			
	
	
		<cfoutput>
				<table width="800" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="336699">
					<tr>
						<td bgcolor="FFFFFF" align="right" valign="top">
							Browse for your graphic.
						</td>
						<td bgcolor="FFFFFF">
						<form action="act_key_graphic_upload.cfm?be=#url.be#&bakeoff=1" method="post" name="add" enctype="multipart/form-data">

						#ucase(url.be)#: <input type="file" name="upload_image"> <br>
						<font color="FF0000">(.jpg or .gif file) <!--- will be displayed at 300px width and 300px height. ---><br>
														CANNOT be heavier that 200k.</font><br>
						<br>
						<input type="submit" value="Upload">
						</form>
						</td>
					</tr>
				</table>
			</cfoutput>		
			
			
		<cfelse>	
			
					
		<form action="act_bake_off.cfm?add=1&be=<cfoutput>#url.be#</cfoutput>" method="post" name="add">
			<table width="800" border="0" cellspacing="1" cellpadding="5" class="white14" bgcolor="336699">	
				<tr>
					<td bgcolor="333333" nowrap>
						Add <cfoutput>#Replace(ucase(names.business_element),"_"," ")#</cfoutput> Below
					</td>
					<td bgcolor="333333" nowrap>
						Business Element
					</td>
					<td bgcolor="333333" nowrap>
						Date Submitted
					</td>
				<cfif url.be eq "brand" OR url.be eq "sub_brand">
					<td bgcolor="333333" nowrap>
						Legal Clearance
					</td>
				</cfif>
<!--- 					<cfif url.be neq "benefit">
							<cfif url.be eq "generic_descriptor" OR url.be eq "attributes">
								<td bgcolor="333333" nowrap>
									Times Chosen <font color="CCCCCC"><br>
									(higher is better)</font>
								</td>	
							<cfelse>
								<td bgcolor="333333" nowrap>
									Rating <font color="CCCCCC"><br>
									(7 is best)</font>
								</td>	
							</cfif>					
					</cfif>
					<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
							<td bgcolor="333333" nowrap>
								Ranking <br>
								<font color="CCCCCC">(1 is best)</font>
							</td>
					</cfif> --->
			</tr>
				<cfoutput>
				
					<tr>
						<td bgcolor="FFFFFF">
							<input type="text" size="30" name="element_text">
						</td>
						
					
						<td bgcolor="FFFFFF">
							<input type="text" size="20" name="business_element" value="#ucase(url.be)#" readonly="yes">
						</td>
						<td bgcolor="FFFFFF">
							<input type="text" size="10" name="date_submitted" value="#DateFormat(Now(),'mm/dd/yyyy')#" readonly="yes">
						</td>
						<cfif url.be eq "brand" OR url.be eq "sub_brand">
						<td bgcolor="FFFFFF">
							<select name="legal_clearance" size="1">
								<option value=0> NO </option>
								<option value=1> YES </option>
							</select>				
						</td>
						</cfif>
<!--- 						<cfif url.be neq "benefit">
						<td bgcolor="FFFFFF">
							<input type="text" size="2" name="rating">
						</td>
						</cfif> --->
					</tr>
					
					

										
					
<!--- 					
					<tr>
						<td bgcolor="FFFFFF" colspan=1>
							Sugessted By Name: <br>
							<input type="text" size="30" name="sug_by_name">
						</td>
						<td bgcolor="FFFFFF" colspan=4>
							Sugessted By Email: <br>
							<input type="text" size="30" name="sug_by_email">
						</td>
					</tr> --->
				</cfoutput>
			<tr>	
				<td colspan="5" align="center" bgcolor="FFFFFF">
				<input type="submit" value=" SAVE ENTRY ">
			</td>			
		</tr>
			</table>					
			</form>
			
			

			

					
				
		
		</cfif>
	</cfif>
		
		
		<table width="800" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="336699">	
			<tr>
				<cfif url.edit eq 1>
					<td bgcolor="333333">
						
					</td>
				</cfif>
				<td bgcolor="333333" class="white14">
					Element Text
				</td>
				<td bgcolor="333333" class="white14">
					Business Element
				</td>
				<td bgcolor="333333" class="white14">
				<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "benefit">
						<cfif url.be eq "brand" OR url.be eq "sub_brand">
							<font color="yellow">(Phase 2)</font><br>
						<cfelseif url.be eq "benefit">	
							<font color="yellow">(Phase 1)</font><br>
						</cfif>
					Suggested By
				<cfelse>
					Date Submitted
				</cfif> 	
				</td>
				<cfif url.be eq "brand" OR url.be eq "sub_brand">
					<td bgcolor="333333" class="white14">
						Legal Clearance
					</td>
				</cfif>
					<!--- <cfif url.be neq "benefit"> --->
							<cfif url.be eq "generic_descriptor">
								<td bgcolor="333333" class="white14">
									<font color="yellow">(Phase 2)</font>
									<br>
									Times Chosen <br />
									<font color="yellow">(higher is better)</font>
								</td>	
                                
							<cfelseif url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "tag_line">    
								<td bgcolor="333333" nowrap class="white14">
										<font color="yellow">(Phase 2)</font>
									<br>
									Rating <br>
									<font color="yellow">(7 is best)</font>
								</td>	                        
                                                
							<cfelse>
								<td bgcolor="333333" nowrap class="white14">
									<cfif url.be eq "brand" OR url.be eq "sub_brand">
										<font color="yellow">(Phase 3)</font>
									<cfelse>
										<font color="yellow">(Phase 2)</font>
									</cfif>	
									<br>
									Rating <br>
									<font color="yellow">(7 is best)</font>
								</td>	
							</cfif>					
					<!--- </cfif> --->
					<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
							<td bgcolor="333333" class="white14">
									<cfif url.be eq "brand" OR url.be eq "sub_brand">
										<font color="yellow">(Phase 4)</font>
									<cfelse>
										<font color="yellow">(Phase 3)</font>
									</cfif>	
									<br>
								Ranking <br>
								<font color="yellow">(1 is best)</font>
							</td>
                    <cfelseif url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "tag_line">
                   		 <td bgcolor="333333" class="white14">
                    	<font color="yellow">(Phase 3)</font>
                               
									<br>
									Times Chosen <br>
									<font color="yellow">(higher is better)</font>
                          </td>
					</cfif>
                      
			</tr>

	<form action="act_bake_off.cfm?legal=1&be=<cfoutput>#url.be#</cfoutput>" method="post" name="legal">
		<cfoutput query="names">
			<tr>
				<cfif url.edit eq 1>
					<td bgcolor="FFFFFF">
						<a href="act_bake_off.cfm?delete=1&be=#url.be#&bid=#names.id#" onclick="return confirm('Are you sure you want to delete this file?')" class="editlink">delete</a>
					</td>
				</cfif>
				<cfif url.be eq "key_graphic" OR url.be eq "impact" OR url.be eq "graphic_presentation" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
					<td bgcolor="FFFFFF">
						<a href="images/#url.be#/#client.cid#/#names.element_text#" class="bodylink" target="new">view</a> &nbsp; #names.element_text#
					</td>
				<cfelse>
					<td bgcolor="FFFFFF">
						#names.element_text#
					</td>
				</cfif>
				<td bgcolor="FFFFFF">		
					<cfif names.business_element neq "rtb">	
						#Replace(ucase(names.business_element),"_"," ")#
					<cfelse>
						Endorsement				
					</cfif>	
				</td>
				<td bgcolor="FFFFFF">
					<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "benefit">
						#names.sug_by_name#
					<cfelse>
						#names.date_submitted#
					</cfif> 				
				</td>
				<cfif url.be eq "brand" OR url.be eq "sub_brand">
				<td bgcolor="FFFFFF" nowrap>	
					<cfif names.legal_clearance eq 0>
						<input type="checkbox" name="legal_#names.id#" value="#names.id#"><font size="1">set to Available</font>
					<cfelseif names.legal_clearance eq 1>
						Available
					</cfif>			
				</td>
				</cfif>
				
				<td bgcolor="FFFFFF">
				<cfif url.be eq "generic_descriptor">
					<cfif names.times_chosen eq 0>
						0						
					<cfelse>
						#NumberFormat(names.times_chosen, "9")#
					</cfif>					
				<cfelse>
					<cfif names.rating eq 0>
						no rating						
					<cfelse>
						#NumberFormat(names.rating, "9.9")#
					</cfif>
				</cfif>
				</td>
				
				<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
					<td bgcolor="FFFFFF">
                    	<cfif names.ranking eq 5>
                        	<font size="-1">not ranked</font>
                        <cfelse>
							#NumberFormat(names.ranking, "9.9")#
                        </cfif>
					</td> 
                <cfelseif url.be eq "brand_logo" OR url.be eq "sub_brand_logo" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "tag_line">  
                	<td bgcolor="FFFFFF">  
						<cfif names.times_chosen eq 0>
                            0						
                        <cfelse>
                            #NumberFormat(names.times_chosen, "9")#
                        </cfif>	  
                    </td>            
				</cfif>
			</tr>
		</cfoutput>
	
		<tr>
			<cfoutput>
				<td colspan="3" bgcolor="FFFFFF">
<!--- 				<cfif url.edit neq 1>
					<li><a href="index.cfm?fa=bake_off&edit=1&be=#url.be#" class="editlink">EDIT ENTRIES</a>
				
				</cfif> --->
                </td>
			</cfoutput>
			<td colspan="3" nowrap bgcolor="FFFFFF">
			<cfif url.be eq "brand" OR url.be eq "sub_brand" or url.be eq "benefit">
				Check off cleared names above then click below <br>
				<input type="submit" value=" Update Available Names ">

				<a href="add-brand.cfm?lightbox[width]=400&lightbox[height]=300]&be=<cfoutput>#url.be#</cfoutput>" class="lightbox">Add More Names</a>
				<br> 
				<a href="http://www.uspto.gov/main/trademarks.htm" target="new" class="bodylink">Check Availability Assistance</a>
			</cfif>
			</td>			
		</tr>
	</form>
			<tr bgcolor="FFFFFF"> 
				<td  align="left" colspan="2">
					<cfinclude template="includes/back_link.cfm">
				</td>
				<td colspan="4">
                	<cfoutput>
						<a href="index.cfm?fa=elements&be=#url.be#&bg=1" class="bodylink"><img src="images/phase_process.jpg" border="0" align="right" /></a>
                    </cfoutput>
				</td>
                
			</tr>
		</table>	

<!--- 	
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">	
				
			<tr bgcolor="FFFFFF"> 
				<td  align="left" valign="bottom" class="header16" colspan="6">			
					
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr> 
		
			<tr>
				<td bgcolor="FFFFFF" align="center">
				<cfoutput>
						<br>
						<a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1" class="bodylink3">Click here to go to the NEXT 					
					<cfif names.business_element neq "rtb">	
						#Replace(ucase(names.business_element),"_"," ")#
					<cfelse>
						Endorsement				
					</cfif>	 
						exercises.</a>
						<br><br>
				</cfoutput>
				</td>
			</tr>
			<tr>
				<td>
				<br><br>
				Make sure you have finished with the "Bake Off" Phases for your <cfoutput>#ucase(url.be)#</cfoutput> before	
				proceeding to the CONNECTICS phase of your <cfoutput>#ucase(url.be)#</cfoutput> devlopment.
				<br><br>
				<cfoutput>
					<li><a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#" class="bodylink">Bake Off Exercises</a></li>
				</cfoutput> 
				</td>
			</tr> 
			<tr>
				<td bgcolor="FFFFFF" align="center">
				<cfoutput>
					<a href="index.cfm?fa=#url.be#" class="bodylink3"><img src="images/connectics.jpg"></a>
				</cfoutput>
				</td>
			</tr>
		</table>		
	--->
	 <br><br>