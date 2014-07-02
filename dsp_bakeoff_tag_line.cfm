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
					<li>You will begin by doing a bit of work on paper.</li>
						<br><br>
					<li> In the Phase 1 exercise, you will need to create six tag lines.
					</li>
						<br><br>
					<li> The most effective Tag Lines come from two different contexts. The first is the BOLD statement that is personal if at all possible. The second is to go back to your Generic Descriptor and add words to it until it has so much character that it becomes a Tag Line. If you are successful you will want to elevate its prominence as in the General Mills "Milk N Cereal Bars" example we shared with you in the Generic Descriptor section. You will simply need to create several that you think might be effective without offending your target consumers. 
					<br><br>
					<li> A great way of generating clichés for your product or service is to buy a book of clichés or go to clichesite.com. You will discover there are tons of them. Take your time to consider using them directly or changing a word that skews it to your product or service without loosing its identity. 
						<br><br>
					<li> Your goal is to come up with a total <strong>list of six tag lines</strong>.</li>
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
									<a href="dsp_tag_line_names.cfm?be=#url.be#&email=1&phase=1" class="bakeofflink">ENTER TAG LINES</a>
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
						<li>In the Phase 2 Exercise, your group of experts will be asked to RATE your six tag lines.  They will rate them from 1 to 7... 7 being best.</li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can RATE your tag line options. </li>
						<br><br>
						<li>The results of this exercise will be displayed in the Expert Feedback results section.</li>
                        <br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_tag_line_names.cfm?be=#url.be#&email=1&phase=2" class="bakeofflink">Begin the Phase 2 Process</a>
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
						<li>In the Phase 3 Exercise, your group of experts will be asked to <strong>choose between your 4 highest rated <cfoutput>#replace(ucase(url.be),"_"," ","ALL")#</cfoutput> options.</strong></li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can choose between your 4 highest rated TAG LINE options.</li>
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