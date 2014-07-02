	<cfparam name="url.be" default=0>
	
	
		<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr>
				<td>	
					<cfoutput>
						<img src="images/Element_Header_bakeoff.jpg"> &nbsp; <img src="images/Element_Header_#url.be#_lc.jpg">
					</cfoutput>
				</td>
			</tr>
			<tr>
				<td bgcolor="FFFFCC">
					<b>Definition:</b>  
						 the BAKE OFF is The process of getting a group of experts to provide feeback about each part of your product or service.
				</td>
			</tr>
			<tr>
				<td>
					<cfif url.be eq "brand">
						You are now ready to create your <strong>Remarkable Brand name</strong>. Choose a group of <strong>ten people</strong> that will make up your supportive team. 
						Your group will be ten friends, family, or business associates you feel are bright enough to assist you in the process. 
						They should be fairly aware consumers and be willing to participate with enthusiasm.  
					</cfif>
				</td>
			</tr>	
			<tr>
				<td>
					<img src="images/Element_Header_phase1.jpg">
				</td>
			</tr>	
			<tr>
				<td>
					<ul>
						<li><strong>YOU come up with 30 <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s	</strong></li>
						<br><br>
						<li><a href="" class="bodylink3" target="new">Click here to ENTER YOUR <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s</a></li>
						<br><br>
						<li>Have your group of people <strong>SUGGEST 4  <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s each.</strong></li>
						<br><br>
						<li>You can either <strong>email</strong> your group and have them do the exercise online, 
							or <strong>print</strong> out the exercise and have them do it on paper.  If you use Email, make sure you let them know it is coming.</li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14" bgcolor="000000">
							<tr>
								<td bgcolor="354E66" valign="top" width="50%" align="center">	
									Print out the Phase 1 Exercise 				
								</td>
								<td bgcolor="354E66" valign="top" width="50%" align="center">	
									Email the Phase 1 Exercise 				
								</td>
							</tr>
							<tr>							
								<td bgcolor="CC0000" align="center" class="black14" nowrap width="40%">
									<a href="" class="bodylink2" target="new"><b>PRINT</b></a>
								</td>								
								<td bgcolor="CC0000" align="center" width="40%">
									<a href="" class="bodylink2" target="new"><b>EMAIL</b></a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/Element_Header_phase2.jpg">
				</td>
			</tr>	
			<tr>
				<td>
					<ul>
						<li><a href="http://www.uspto.gov/main/trademarks.htm" class="bodylink3" target="new">Legally clear <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s by searching for existing TRADEMARK</a></li>
						<br><br>
						<li>Have your group of people <strong>RATE</strong> the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s that are legally cleared. <font color="maroon">(1-7, 7 being best)</font></li>
						<br><br>
						<li>You can either <strong>email</strong> your group and have them do the exercise online, 
							or <strong>print</strong> out the exercise and have them do it on paper.  If you use Email, make sure you let them know it is coming.</li>
						<br><br>		
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14" bgcolor="000000">
							<tr>
								<td bgcolor="354E66" valign="top" width="50%" align="center">	
									Print out the Phase 2 Exercise 				
								</td>
								<td bgcolor="354E66" valign="top" width="50%" align="center">	
									Email the Phase 2 Exercise 				
								</td>
							</tr>
							<tr>							
								<td bgcolor="CC0000" align="center" class="black14" nowrap width="40%">
									<a href="" class="bodylink2" target="new"><b>PRINT</b></a>
								</td>								
								<td bgcolor="CC0000" align="center" width="40%">
									<a href="" class="bodylink2" target="new"><b>EMAIL</b></a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>						
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/Element_Header_phase3.jpg">
				</td>
			</tr>	
			<tr>
				<td>
				<cfoutput>
					<ul>
						<li><a href="index.cfm?fa=bake_off&be=#url.be#" class="bodylink3">View the results of the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> ratings</a> <font color="maroon">(Bake Off results page)</font></li>
						<br><br>
						<li>Have your group of people <strong>RANK</strong> the top FIVE rated <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names you came up with by 
						re-ordering them from <strong>FIRST</strong> (best) to <strong>LAST</strong> (worst)</li>
						<br><br>
						<li>You can either <strong>email</strong> your group and have them do the exercise online, 
							or <strong>print</strong> out the exercise and have them do it on paper.  If you use Email, make sure you let them know it is coming.</li>
						<br><br>	
					</ul>
				</cfoutput>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14" bgcolor="000000">
							<tr>
								<td bgcolor="354E66" valign="top" width="50%" align="center">	
									Print out the Phase 3 Exercise 				
								</td>
								<td bgcolor="354E66" valign="top" width="50%" align="center">	
									Email the Phase 3 Exercise 				
								</td>
							</tr>
							<tr>							
								<td bgcolor="CC0000" align="center" class="black14" nowrap width="40%">
									<a href="" class="bodylink2" target="new"><b>PRINT</b></a>
								</td>								
								<td bgcolor="CC0000" align="center" width="40%">
									<a href="" class="bodylink2" target="new"><b>EMAIL</b></a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>

			<tr>
				<td>
				&nbsp; &nbsp;	&nbsp;
				</td>
			</tr>
		
	
		</table>		