	<cfparam name="url.be" default=0>
	<cfparam name="url.updated" default=0>
	<cfparam name="url.phase" default=0>
	
	
	<cfquery name="names" datasource="#application.dsn#">
		SELECT sub_brand
		FROM         t_business
		WHERE     (cid = #client.cid#)
	</cfquery>
	
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
							<font color="E62128">*** Your <cfoutput>#replace(ucase(url.be),"_"," ","All")#</cfoutput>s have been added. ***
							<br><br>
							If you have entered all 6 <cfoutput>#replace(ucase(url.be),"_"," ","All")#</cfoutput>s, please proceed to Phase 2 below.</font>
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
					<cfoutput>
						<ul>
						<li> Now you have a winning SUB-BRAND name: <cfoutput><font size="+1" color="maroon"><strong>#names.sub_brand#</strong></font></cfoutput> </li>
							<br><br>
						<li> It is time to hire an affordable graphic designer to bring your SUB-BRAND name to life.</li>
							<br><br>
						<li> Your goal will be to come up with <strong>six graphic representations</strong> of your winning SUB-BRAND name.
							<br><br>
							<font color="red">IMPORTANT NOTE:</font> When you design your logos, you should include your winning SUB-BRAND name in each graphic along with the logo. Never submit logos by themselves.
							If you decide to do a "logotype" (where the logo is: the winning SUB-BRAND name stylized in some manner), then just submit your 6 logotypes.
							<br><br>
						<li> Remember to utilize the knowledge you learned about #replace(ucase(url.be),"_"," ","All")# design in the beginning of this section.
							<br><br>
						<li> Instruct your graphic designer to create 6 different #replace(ucase(url.be),"_"," ","All")#s.  Have your graphic designer save your six logos as <strong>"JPEG format"</strong> no greater than 400 pixels width by 200 pixels height.</li>
							<br><br>
						<li>When you are happy with the six designs, have your graphic designer create a CD with your 6 #replace(ucase(url.be),"_"," ","All")# graphics as .jpg files on it. At this point you will have finished Phase 1.</li>
							<br><br>
						</ul>
					</cfoutput>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									When you have a CD with your six #replace(ucase(url.be),"_"," ","All")#s, click on the checkbox below and hit SUBMIT.				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<form action="act_key_graphic_names.cfm?be=sub_brand_logo" method="post">
										I have my #replace(ucase(url.be),"_"," ","All")# graphics ready: <input type="checkbox" name="sub_brand_logo_cd" value="1">
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
				<cfoutput>
					<ul>						
						<li>In the <strong>Phase 2 Exercise</strong>, your group will be asked to RATE your #replace(ucase(url.be),"_"," ","All")# graphics.  They will rate them from 1 to 7... 7 being best.</li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can RATE your #replace(ucase(url.be),"_"," ","All")# options. </li>
						<br><br>
						<li>Put the CD your graphic designer made for you into your computer. Copy the 6 graphic .jpg files to a folder on your computer.</li>
						<br><br>
						<li>Now you will be able to browse to the folder you just made in order to upload your six #replace(ucase(url.be),"_"," ","All")# graphics. </li>
						<br><br>
                        <cfinclude template="includes/dsp_exercise_check.cfm">	
                        
						<li>Click The "EMAIL" link below to <strong>upload your six #replace(ucase(url.be),"_"," ","All")#</strong>s, enter your Experts' email addresses, and to send your group the Phase 2 exercise.<br>
							<strong>Make sure you let them know the email is coming.</strong></li>
						<br><br>
						<li>The results of this exercise will be displayed in the Expert Feedback results section.</li>
					</ul>
				</cfoutput>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									Email the Phase 2 Exercise 				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_sub_brand_logo_upload.cfm?be=#url.be#&email=1" class="bakeofflink">EMAIL</a>
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
                        
						<li>Click The "EMAIL" link below to enter your Experts' email addresses and to send your group the Phase 3 exercise.<br>
							<strong>Make sure you let them know the email is coming.</strong></li>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									Email the Phase 3 Exercise 				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_choice_names.cfm?be=#url.be#&phase=3&choice=1" class="bakeofflink">EMAIL</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>				
			
			
		</cfif>


			
		
	
		</table>		