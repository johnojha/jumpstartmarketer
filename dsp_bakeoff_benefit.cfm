	<cfparam name="url.be" default=0>
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
	<cfif url.phase eq 1>
			<tr>
				<td>
					<img src="images/Element_Header_phase1.jpg">
				</td>
			</tr>
			<tr>
				<td>
					<ul>

					<li> In the Phase 1 exercise, you will have your group fill out a "laddering exercise" online.</li>
						<br><br>
					<li>A "laddering exercise" is an exercise used to 
							determine what the target consumer gets out of using the product. As you can see in the example below, the higher you climb up the ladder, the more personal the benefit becomes. The more personal the benefit, the more attractive, and therefore, the more powerful it occurs to target consumers. </li>
						<br><br>
							<strong>Example:</strong><br>
							HAPPY<br>
							GREAT LIFE<br>
							I FEEL GREAT<br>
							I LOOK GREAT<br>
							MY CLOTHES LOOK GREAT<br>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they will complete the "laddering exercise," based on questions they are asked about your business. </li>
						<br><br>
						<li>The results of this exercise will be displayed in the Expert Feedback results section.</li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_benefit_names.cfm?be=#url.be#&email=1" class="bakeofflink" target="new">Begin the Phase 1 Process</a>
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
						<li>In the Phase 2 Exercise, your group of experts will be asked to RATE your <strong>top ten BENEFITS</strong>.  They will rate them from 1 to 7... 7 being best.</li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can RATE your BENEFIT options. </li>
						<br><br>
						<li>The results of this exercise will be displayed in the Expert Feedback results section.</li>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_benefit_names2.cfm?be=#url.be#&email=1" class="bakeofflink" target="new">Begin the Phase 2 Process</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>

		</cfif>


			

		
	
		</table>		