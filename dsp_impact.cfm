<head>



</head>


	<cfparam name="url.sent" default=0>
	<cfparam name="url.be" default=0>

	<cfquery name="elements" datasource="#application.dsn#">
		SELECT id, business_element, my_choice, my_choice_rating
		FROM         t_elements
		WHERE     (cid = #client.cid#)
		ORDER BY id
	</cfquery>
	

				<cfquery name="feedback" datasource="#application.dsn#">
					SELECT cid, be, uuid, type
					FROM t_uuids		
					WHERE 
						cid = #client.cid#
						AND be = 'IMPACT'
				</cfquery>		

<!--- <cfinclude template="dsp_connectics_redirect.cfm"> --->

		<table width="800" border="0" cellspacing="1" cellpadding="3" class="black14">
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="2">
					<img src="images/headlines_impact.jpg">
				</td>
			</tr>	
			<cfif url.sent eq 1>
					<tr>
						<td bgcolor="FFFFFF" colspan="2">
							<font color="E62128">*** Your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> Exercise has been sent. ***
							<br><br>
							You will receive email alerts as results come in.</font>
						</td>
					</tr>
			</cfif>		
		<cfif feedback.recordcount gte 1>	
			<tr>
				<td bgcolor="FFFFFF">
					<strong><cfoutput>#feedback.recordcount#</cfoutput></strong> people have provided CONSUMER FEEDBACK so far.
					<cfif feedback.recordcount lt 5>
						<br><br>
						You need <cfoutput><strong>#5 - feedback.recordcount#</strong></cfoutput> more responses to proceed to the next step.
					</cfif>
					<div align="center">
						<table width="700" border="0" cellspacing="2" cellpadding="8" class="black14" bgcolor="99CCFF"> 
							<tr>
								<td align="center" bgcolor="FFFFFF" nowrap>
								View your results below.<br>
								<cfoutput>
									<li><a href="index.cfm?fa=impact_results&be=#url.be#&bg=1" class="bakeofflink">CONSUMER FEEDBACK Results</a></li>
								</cfoutput>
								</td>
							</tr>	
						</table>
					</div>		
				</td>
			</tr>	
		</cfif>
		<cfif feedback.recordcount gte 5>
			<tr>
				<td  height="20" colspan="6" class="black14" bgcolor="99CCFF" nowrap>			
					<font color="green">***</font> 5 or more consumers have responded <font color="green">***</font> 
					<br><br>
					CONGRATULATIONS!  You have completed the <strong>CONSUMER FEEDBACK Process</strong> for IMPACT.
									<br><br>
						Now it is time to proceed to  
						<br>	
						<table width="800" border="0" cellspacing="2" cellpadding="8" class="black14" bgcolor="336699"> 
							<tr>
								<td align="center" bgcolor="FFFFFF" nowrap>
									<li><a href="index.cfm?fa=elements&be=graphic_presentation&bg=1" class="bakeofflink">GRAPHIC PRESENTATION</a></li>		
								</td>
							</tr>	
						</table>
														 
					 </font>	
				</td>
			</tr>
		</cfif>
		<form name="impact" action="act_impact_choice.cfm" method="post" onsubmit="return validateThis(this)">
			<tr>		  
				<td align="center">
					<!--- <img src="images/brand_examples.jpg"> --->
				</td>	
				<td align="left">	
						
				</td>		  
			  </tr>
			 <tr>		  
				<td class="bodytext" >
					<ul>
						<li>Now you have created all the elements of your selling proposition<br />
    (Generic Descriptor, Brand, Brand Logo, Benefit, Attributes, Tagline, and Key Graphic)
						<br><br>
						<li> Now you have completed your exercises and you know which options are the most remarkable. </li> 
						<br><br>
						<li>In the results area you should have clicked the "Make My Choice" button by the highest scoring choice for each element (Generic Descriptor, Brand, Brand Logo, Benefit, etc.) This tells the system what the winning option is for that element.</li>
						<br><br>						
						<li>It is time to find out which element is the most important to your consumers. The information you gather from the IMPACT exercise will help you decide how prominent to feature each of your winning elements when creating your Graphic Presentation.</li>
						<br><br>	
						<li>The IMPACT exercise is a "choose" exercise that puts all your winning elements against each other, and has consumers choose between them.</li>
						<br><br>
		
					</ul>
				<strong>INSTRUCTIONS</strong>
				
					<ol>
					<font color="black"><li></font>  Review the winning options below for each of your business elements.
						</li><br><br>
					<li> If there is nothing displayed for an element, or you want to choose a different option, click on the "my choice" link. This will take you back to the consumer results area where you can click the      "Make My Choice" button next to the highest scoring option.
						</li><br><br>
					<li> Once all the winning elements are displayed, click on the "Submit IMPACT Exercise" button below. This will send off your IMPACT exercise to your target consumers.
						</li><br><br>
					</ol>
					 
				</td>
			</tr>	
			<tr>
				<td align="center">	
				
				<table cellpadding="5" cellspacing="1" border="0" class="black14" bgcolor="336699">
					<tr>
						<td bgcolor="666666" class="white14">
							Business Element
						</td>
						<td bgcolor="666666" class="white14">
							Winning Choice
						</td>
						<td bgcolor="666666" class="white14">
							Rating
						</td>
						<td bgcolor="666666" class="white14">
							Make My Choice
						</td>
					</tr>
		<cfset ElementList = "brand,brand_logo,generic_descriptor,benefit,attributes,tag_line,key_graphic">			
		
		<cfloop list="#ElementList#" index="i">
				<cfquery name="e_#i#" datasource="#application.dsn#">
					SELECT id, #i#, #i#_rating
					FROM         t_business
					WHERE     (cid = #client.cid#)
					ORDER BY id
				</cfquery>			
				<cfoutput query="e_#i#">
					<tr>
						<td bgcolor="FFFFFF" nowrap>
							<cfif i eq "rtb">
								ENDORSEMENT
							<cfelse>
								#replace(ucase(i),"_"," ")#
							</cfif>
							<cfif i eq "key_graphic">
								<a href="images/#i#/#client.cid#/#evaluate(i)#" class="bodylink3" target="new">view</a>
							</cfif>
						</td>
						<td bgcolor="FFFFFF" nowrap>
							<cfif evaluate(i) eq "">
								<font color="red">
									Click on "my choice"
									<br>
									to find the winning option.
								</font>
							<cfelse>
								#evaluate(i)#
							</cfif> 
						</td>
						<td bgcolor="FFFFFF">
							#evaluate(i & '_rating')#
						</td>
						<td bgcolor="CCCCCC">
							<a href="index.cfm?fa=archives&be=#i#&impact=1&imp=1" class="bodylink3">my choice</a>
						</td>	
					</tr>
				</cfoutput>
			
		</cfloop>
				</table>
				

				</td>
			</tr>
			<tr>	
				<td valign="middle" align="center" bgcolor="336699">
		
					<br>
					<input type="submit" value=" Submit IMPACT Exercise "> 
					<br>
				</td>	  
			</tr>
		</form>	
		</table>