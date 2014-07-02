

	<cfparam name="url.be" default=0>
	<cfparam name="url.updated" default=0>
	<cfparam name="url.phase" default=0>
	
	
		<cfquery name="cleared" datasource="#application.dsn#">
			SELECT id, cid, business_element
			FROM t_bake_off
			WHERE cid = #client.cid#
				AND business_element = '#url.be#'
				AND legal_clearance = 1
		</cfquery>	
		
			<SCRIPT LANGUAGE="JavaScript">	
				function popUp(URL) {
				day = new Date();
				id = day.getTime();
				eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=350,height=500,left = 476,top = 332');");
				}
			</script>
			
			
<cfinclude template="includes/back_link.cfm">


		<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr>
				<td>
					<strong>Expert Feedback:</strong> The process of getting a group of experts to provide feeback about each part of your product or service.</li></font>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<cfoutput>
						<img src="images/headlines_#url.be#.jpg">
					</cfoutput>
				</td>
			</tr>
<!--- 	<cfif url.phase eq 1 OR url.phase eq 2>	
			<tr>
				<td>
					<cfinclude template="dsp_bakeoff_intro.cfm">
				</td>
			</tr>	
	</cfif>	 --->	
			
	<cfif url.updated eq 1>
			<tr>
				<td>
					<font color="E62128">*** Your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names have been added. ***
					<br><br>
					If you have entered all thirty <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names, please proceed to Phase 2 below.</font>
				</td>
			</tr>
	</cfif>
<!--- 	<cfif cleared.recordcount gte 5>		
			<tr>
				<td>
						<font color="red">
							You have now legally cleared enough <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names. Click on the <strong>EMAIL</strong> link below.
						</font>
						<br><br>
				</td>
			</tr>
	<cfelse>
			<tr>
				<td>
					<font color="red">*</font> You must legally clear more names in the <a href="index.cfm?fa=bake_off&be=#url.be#" class="bakeofflink">Expert Feedback results section</a>	before proceeding with Phase 3.			
				</td>
			</tr>		
	</cfif>		 --->
	
<cfif url.phase eq 1>
			<tr>
				<td>
					<img src="images/Element_Header_phase1.jpg">
				</td>
			</tr>
			<tr>
				<td>
					<ul>
						<li>Referencing what you now know about a great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> name, take the time to create 20 possible 
						<cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> name options</li>
						<br><br>
                        <li>While you are coming up with Brand names, keep in mind that you may need to have your domain name (web address) match your Brand name. Make sure you check your names on a website like godaddy.com before you move on.
                        <br><br>
						<li>The reason you must enter so many <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names is because later on in the process, Legal clearance of <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names will eliminate a lot of your options.</li>
						<br><br>
						<li> Here are some helpful instructions for <a href="index.cfm?fa=brand_instructions" class="bakeofflink">Creating your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names</a>.
						<br><br>
						<li>If you don't have all 20 now, you can come back here anytime and enter more names.</li>
						<br><br>
						<li><a href="dsp_brand_feedback_client.cfm?be=<cfoutput>#url.be#</cfoutput>" class="bakeofflink" >Click here to ENTER YOUR <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names</a> </li>
						<br><br>
					</ul>
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
						<li>In the Phase 2 Exercise, each person in your group of experts will be asked to suggest four  <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names for your business.</strong></li>
						<br><br>
						<li>Each expert will be sent an email. The email will contain a link to a page online where they can make their four suggestions. </li>
						<br><br>
						<li>As their responses come in, you will be able to view their suggestions in the Expert Feedback results section. You will also be sent an email letting you know that some results have come in.</li>						
						<br><br>
					</ul>
					
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<!-- <a href="dsp_brand_names.cfm?be=#url.be#&email=1" class="bakeofflink">Begin Phase 2 Process</a> -->

									<iframe src="dsp_brand_names.cfm?be=#url.be#&email=1" scrolling="no" width="100%" height="400"></iframe>

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
                
                				<cfif cleared.recordcount gte 5>
									<font color="red">
										*** You now have enough available <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names. Please proceed below.
									</font>
									<br><br>
								<cfelseif cleared.recordcount lt 5 AND cleared.recordcount gt 0>
									<font color="red">***</font> You must <strong>"Update Available Names"</strong> in the <a href="index.cfm?fa=bake_off&be=#url.be#" class="bakeofflink">Expert Feedback results section</a>	before proceeding with Phase 3.
									<br><br>
								</cfif>
					<ul>
						<li>Phase 3 begins with <strong>checking the availability</strong> of the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names you came up with, and the ones the Experts suggested.
						Checking the availability of <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names is standard practice in the marketing industry before developing products or services.</li>
						<br><br>						
						<li><strong>This is easy to do, and costs NO money.</strong> you simply check and see which of the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names already have Trademarks.
                        Names that already have trademarks in your category of business should not be used. 
                        <br />
                        <br>
                        <li> <a href="index.cfm?fa=check_availability&be=<cfoutput>#url.be#</cfoutput>" class="bakeofflink">CHECK AVAILABILITY INSTRUCTIONS</a><br />
                        (<strong>You may decide to do this at a later time</strong>, but it is recommended before proceeding to far in the process with a name that is not available)
                        	<br /><br />	
                        
                        <li> After you have checked the availability of your names, go here - <a href="index.cfm?fa=bake_off&be=<cfoutput>#url.be#</cfoutput>" class="bakeofflink">Check off each name that is available</a>, and click the <strong>"Update Available Names"</strong> button at the bottom of the page</a>.</li>								
						<br><br>                       
                        
                       
	
						<li>Next, your group of experts will RATE the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names that are available for use. <font color="gray">(1-7, 7 being best)</font></li>
						<br><br>
						
					</ul>
				
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">

									<!-- <a href="dsp_brand_names.cfm?be=#url.be#&email=1&rate=1&phase=3" class="bakeofflink">Begin the Phase 3 Process</a> -->

									<iframe src="dsp_brand_names.cfm?be=#url.be#&email=1&rate=1&phase=3" width="100%" scrolling="no" height="300"></iframe>

								</td>															
							</tr>
						</table>
					</cfoutput>	

					<hr>						
				</td>
			</tr>
<cfelseif url.phase eq 4>
			<tr>
				<td>
					<img src="images/Element_Header_phase4.jpg">
				</td>
			</tr>	
			<tr>
				<td>
				<cfoutput>
					<ul>
						<li>In Phase 4 your group of experts will <strong>RANK</strong> the top FIVE rated <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names you came up with.
						</li>
						<br><br>
						<li>When you click on the "Begin The Phase 4 Process" link below you will be able to choose the top five rated <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names.</li>
						<br><br>
						<li>Click The "Begin The Phase 4 Process" link below to choose the top five <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names, and to send your experts the Phase 4 exercise.<br>
						<br><br>	
					</ul>
				</cfoutput>
			
					<cfoutput>
                    
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<!-- <a href="dsp_brand_names2.cfm?be=#url.be#&email=1&phase=4" class="bakeofflink" >Begin The Phase 4 Process</a> -->
									<iframe src="dsp_brand_names2.cfm?be=#url.be#&email=1&phase=4" scrolling="no" width="100%" height="400"></iframe>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
                    
				</td>
			</tr>


		
		
		<!--- End of conditional phase display. --->
</cfif>	





		</table>		