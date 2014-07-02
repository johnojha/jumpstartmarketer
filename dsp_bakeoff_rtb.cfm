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
							<font color="E62128">*** Your ENDORSEMENTS have been added. ***
							<br><br>
							If you have entered all 6 ENDORSEMENTS, please proceed to Phase 2 below.</font>
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
					<li>You will begin by doing a bit of work on paper.</li>
						<br><br>
					<li> In the Phase 1 exercise, you will need to create six Endorsements.
					</li>
						<br><br>
					<li>  Here are some tips on places to look. Start with trade or professional organizations that relate to your business specifically. Sometimes it will influence your target consumer even if they are not familiar with it. 
					<br><br>
					<li> A second place to look is in the area of endorsements that represent the consumer. That is what Consumer Reports magazine is all about. 
					<br><br>
					<li> A third area is simply a respected third party. A celebrity endorsement is an example of this group. If you don't know any celebrities we suggest you consider getting testimonial statements from satisfied users and use them in the same way that movie marketers use quotes from movie critics. 
					<br><br>
					<li> <font color="red">NOTE:</font> <b>Testimonials</b> from satisfied customers can work if you do not have an endorsement. You may even want to create your own testimonials, and then ask a previous customer if you can put their name on it.
							<br><b>Testimonials should be only one sentence long.</b>
					<br><br>
					<li> Your goal is to come up with a total <strong>list of six Endorsements/Testimonials</strong>.</li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									Phase 1 Exercise 				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_rtb_names.cfm?be=#url.be#&email=1&phase=1" class="bakeofflink">ENTER ENDORSEMENTS</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
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
						<li>In the Phase 2 Exercise, your group will be asked to RATE your six Endorsements.  They will rate them from 1 to 7... 7 being best.</li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can RATE your Endorsements options. </li>
						<br><br>
                        <cfinclude template="includes/dsp_exercise_check.cfm">	
                        
						<li>Click The "EMAIL" link below to specify your Experts' email addresses, and to send your group the Phase 2 exercise.<br>
							<strong>Make sure you let them know the email is coming.</strong></li>
						<br><br>
						<li>The results of this exercise will be displayed in the Expert Feedback results section.</li>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									Email the Phase 2 Exercise 				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_rtb_names.cfm?be=#url.be#&email=1&phase=2" class="bakeofflink">EMAIL</a>
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
						<li>In the Phase 3 Exercise, your group will be asked to <strong>choose between your 4 highest rated ENDORSEMENTS options.</strong></li>
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