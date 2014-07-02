	<cfparam name="url.be" default=0>
	<cfparam name="url.updated" default=0>
	<cfparam name="url.phase" default=0>

	
		<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">

			<tr>
				<td>
					<strong>Expert Feedback:</strong> The process of getting a group of experts to provide feeback about each part of your product or service.
				</td>
			</tr>			
			<tr>
				<td valign="top">
					<cfoutput>
						<img src="images/headlines_#url.be#.jpg">
					</cfoutput>
                    &nbsp; &nbsp; <cfoutput><a href="index.cfm?fa=consultant&be=#url.be#"><img src="images/creative_consultant.jpg" border="0" /></a></cfoutput>
				</td>
			</tr>	
			
			<cfif url.updated eq 1>
					<tr>
						<td>
							<font color="E62128">*** Your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names have been added. ***
							<br><br>
							If you have entered all 6 <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names, please proceed to Phase 2 below.</font>
						</td>
					</tr>
			</cfif>
			
	<cfif url.phase eq 1>
			<tr>
				<td nowrap="nowrap">
					<img src="images/Element_Header_phase1.jpg"> 
				</td>
			</tr>
			<tr>
				<td>
					<ul>

					<li> In the Phase 1 exercise, you will need to create five or six generic descriptors that all define your product or service in the simplest possible terms.
						For example, here is a list of Generic Descriptors: bread, milk, cheese, automobiles, legal services, accounting services, private investigator, gardener, window washer, shoe store and so on.
					</li>
						<br><br>
					<li> After you have come up with your list,  pick the one or two that you consider best…no more than that.</li>
						<br><br>
					<li> Now that you have one or two that simply define your product or service you will need a thesaurus for the next step. The best we have found is the thesaurus attached to Microsoft Word. You are now going to add character to your Generic Descriptor. It will likely be in the form of adding one or two words in front of those you have already created. A perfect example is the Generic Descriptor for GoGurt…"Portable Yogurt". The word "Portable" added the character. You can add even more character by calling it "Outrageous Portable Yogurt" or "Funny and Fun Portable Yogurt" and so on.</li>
						<br><br>
					<li> As you look for characterizing words to do the job consider words that define a context for WHY CONSUMERS SHOULD BUY THIS ONE. Let's return to the dry cleaning company for examples. In looking for words to add to "Dry Cleaning" we might enter "fast", "affordable", "reliable", "custom" or "fashionable" into the thesaurus. Look through the synonyms and write those down that have promise. Reenter all of them to see where they take you as well. You will have many great options with very little work. </li>
						<br><br>
					<li> Your goal is to choose what you think are your six best options.</li>
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
									<a href="dsp_gen_desc_names.cfm?be=#url.be#&email=1&phase=1" class="bakeofflink">ENTER GENERIC DESCRIPTORS</a>
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
						<li>In the Phase 2 Exercise, your group of experts will be asked to choose between your six generic descriptors you have come up with for your business.</strong></li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can make their choices. </li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_gen_desc_names.cfm?be=#url.be#&email=1&phase=2&choice=1" class="bakeofflink">Begin Phase 2 Process</a>

									
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>
		</cfif>


		
	
		</table>		