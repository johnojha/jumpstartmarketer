	<cfparam name="url.be" default=0>
	<cfparam name="url.updated" default=0>
	<cfparam name="url.phase" default=0>
	
	
		<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">

			<tr>
				<td>
					<strong>EXPERT FEEDBACK:</strong> The process of getting a group of experts to provide feeback about each part of your product or service.
				</td>
			</tr>			
			<tr>
				<td valign="top">
					<cfoutput>
						<img src="images/headlines_#url.be#.jpg">
					</cfoutput>
				</td>
			</tr>
			<cfif url.updated eq 1>
					<tr>
						<td>
							<font color="E62128">*** Your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s have been added. ***
							<br><br>
							If you have entered all 6 <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s, please proceed to Phase 2 below.</font>
						</td>
					</tr>
			</cfif> 
			
	<cfif url.phase eq 1>
			<tr>
				<td>
					<img src="images/Element_Header_phase1.jpg">
				</td>
			</tr>
			<tr>
				<td>
					<ul>
					<li> Write down your Benefit and your two strongest Attributes. </li>
						<br><br>
					<li> Now for your first shot at identifying possible Key Graphics do a Google image search. Look for images that in some way express your brand and the meaning communicated by your Benefit/Attributes. Save those images in a folder. </li>
						<br><br>
					<li> Next do a little research by looking to see what others are doing in your category. Surf the Internet. Be sure to also search outside your category. Remarkable ideas will come from seeing what is being done in other areas. Now that you have some new ideas do another Google image search and put the new images that you found into the same folder. 
						<br><br>
					<li> Now that you have tons of images, it is time to narrow them down to your top six. Your goal is to come up with six key graphics for the next phase. NOTE: these images are likely owned by someone else. So once you finish Phase 1 and get a winner you will likely have to either buy the photo/graphic or hire a photographer to shoot something similar or a graphic designer to design an image. 
						<br><br>
					<li> Save your six graphics as "JPEG format" no greater than 600 pixels width by 600 pixels height. 
																	
					
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									When you have your six Key Graphics, click on the checkbox below and hit SUBMIT.				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<form action="act_key_graphic_names.cfm?be=key_graphic" method="post">
										I have my Key Graphics ready: <input type="checkbox" name="key_graphic_cd" value="1">
										&nbsp; &nbsp; <input type="submit" value="  SUBMIT  ">
									</form>
								</td>															
							</tr>
						</table>
					</cfoutput>	
				</td>
			</tr>	
		<cfelseif url.phase eq 2>
			<tr>
				<td>
					<img src="images/Element_Header_phase2.jpg">
				</td>
			</tr>	
			<tr>
				<td>
					<ul>						
						<li>In the <strong>Phase 2 Exercise</strong>, your group will be asked to RATE your six key graphics.  They will rate them from 1 to 7... 7 being best.</li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can RATE your key graphics options. </li>
						<br><br>
						<li>Now you will upload your six Key Graphics, so your group of experts can rate them. </li>
						<br><br>
						<li>The results of this exercise will be displayed in the Expert Feedback results section.</li>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_key_graphic_upload.cfm?be=#url.be#&email=1" class="bakeofflink">Begin the Phase 2 Process</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>
			
	
<cfelseif url.phase eq 3>
			<tr>
				<td>
					<img src="images/Element_Header_phase3.jpg">
				</td>
			</tr>	
			<tr>
				<td>
					<ul>
						<li>In the Phase 3 Exercise, your group will be asked to <strong>choose between your 4 highest rated <cfoutput>#replace(ucase(url.be),"_"," ","ALL")#</cfoutput> options.</strong></li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can make their choices. </li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_choice_names.cfm?be=#url.be#&phase=3&choice=1" class="bakeofflink">Begin the Phase 3 Process</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>				
			
			
		</cfif>


			
		
	
		</table>		