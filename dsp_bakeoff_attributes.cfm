	<cfparam name="url.be" default=0>
	<cfparam name="url.phase" default=0>
	
<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, benefit
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>	
	
		<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr>
				<td>
						<strong>EXPERT FEEDBACK:</strong> The process of getting a group of people to provide feeback about each part of your product or service.
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
				<td align="center" bgcolor="Silver">
					<b>BENEFIT</b>: <cfoutput><font size="+3">#business.benefit#</font></cfoutput>
					<br><br>
				</td>
			</tr>
			<tr>
				<td>
					<ul>
                    <li> In the Phase 1 exercise, You will come up with a list of ten possible Attributes.
                     <br><br>
                    <li> Each of your Attributes should support the above BENEFIT in some way.
                     <br><br>
                      <li> Your attributes will be made up of <a href="dsp_attributes_cont.cfm#attr" target="new" class="bakeofflink">Physical Attributes</a> - ones that realte to the physical properties of your product or service, <a href="dsp_attributes_cont.cfm#attr" target="new" class="bakeofflink">Performance Attributes</a> - these attributes that refer to what your product or service does, and  <a href="dsp_attributes_cont.cfm#attr" target="new" class="bakeofflink">Negative Attributes </a> - which are qualities that your product or service does not have, such as "No Trans Fat" or "No Waiting In Line."
                     <br><br>   
                   <li>Your attributes should be <strong>one to four words long</strong>. Again, each of your attributes should be no longer than four words long.
                     <br><br>
                   <li>When you have your list of ten Attributes ready, click on the link below.
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
									<a href="dsp_attributes_names.cfm?be=#url.be#&email=1&phase=1" class="bakeofflink">ENTER Your ATTRIBUTES</a>
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
						<li>In the Phase 2 Exercise, your group of experts will be asked to RATE the attributes you have come up with for your business. They will rate them from 1 to 7... 7 being best.</li></strong></li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can RATE your Attribute options.  </li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<!-- <a href="dsp_attributes_names.cfm?be=#url.be#&email=1&phase=2" class="bakeofflink">Begin Pahse 2 Process</a> -->

									<iframe src="dsp_attributes_names.cfm?be=#url.be#&email=1&phase=2" scrolling="no" width="100%" height="200"></iframe>
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
						<li>In the Phase 3 Exercise, your group of experts will be asked to <strong>RANK</strong> the <strong>top FOUR attributes</strong> from the Phase 2 exercise. That is, the attributes that were chosen the most times.</li>
						<br><br>
						<li>Each person in your group of experts will be sent an email. The email will contain a link to a page online where they can RANK the top four.  </li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_attributes_names2.cfm?be=#url.be#&email=1" class="bakeofflink">Begin Phase 3 Process</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>
			
	</cfif>
	
	
		
	
		</table>		