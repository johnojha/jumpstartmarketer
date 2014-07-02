<head>



</head>

<cfparam name="url.sent" default="0">

	<cfquery name="elements" datasource="#application.dsn#">
		SELECT id, business_element, my_choice, my_choice_rating, times_chosen
		FROM         t_elements
		WHERE     (cid = #client.cid#)
			AND (my_choice IS NOT NULL)
		ORDER BY times_chosen DESC
	</cfquery>
	
	
			<!--- Check the IMPACT, to see if five or more have responded --->		
		<cfquery name="impact_count" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_uuids
			WHERE     (cid = #client.cid#)
				AND be = 'impact'		
		</cfquery>	


<!--- <cfinclude template="dsp_connectics_redirect.cfm"> --->

		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14">
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="2">
					<img src="images/headlines_impact.jpg">
				</td>
			</tr>	
			<cfif url.sent eq 1>
					<tr>
						<td bgcolor="FFFFFF" colspan="2">
							<font color="E62128">*** Your IMPACT Exercise has been sent. ***
							<br><br>
							You will receive email alerts as results come in.</font>
                            <br /><br />
                            <font color="green">***</font> Refresh this page occasionally to check for new results. <font color="green">***</font>
						</td>
					</tr>
			</cfif>				
		<form name="impact" action="act_impact_choice.cfm" method="post" onsubmit="return validateThis(this)">
			<tr>		  
				<td align="center">
					
				</td>	
				<td align="left">	
						
				</td>		  
			  </tr>
			 <tr>		  
				<td class="bodytext" bgcolor="CCCCCC" align="center">
					Below are your results for your IMPACT exercise.
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
							Times Chosen
						</td>
					</tr>
	
				<cfoutput query="elements">
					<tr>
						<td bgcolor="FFFFFF" nowrap>
							<cfif elements.business_element eq "rtb">
								ENDORSEMENT
							<cfelse>
								#replace(ucase(elements.business_element),"_"," ")#
							</cfif>
							<cfif elements.business_element eq "key_graphic">
								<a href="images/#elements.business_element#/#client.cid#/#elements.my_choice#" class="bodylink3" target="new">view</a>
							</cfif>
						</td>
						<td bgcolor="FFFFFF" nowrap>
							#elements.my_choice#
						</td>
						<td bgcolor="FFFFFF">
							#elements.my_choice_rating#
						</td>
						<td bgcolor="CCCCCC">
							<strong>#elements.times_chosen#</strong>
						</td>	
					</tr>
				</cfoutput>

				</table>
				

				</td>
			</tr>
			<tr>	
				<td valign="middle" align="center" bgcolor="6699FF">
				<cfoutput>
					<strong>#impact_count.recordcount#</strong> people have responded to this IMPACT exercise.
						<br><br>
					<cfif impact_count.recordcount gte 5>
						Now you may proceed to the Graphic Presentation exercises.
						<br><br>
						<table  border="0" cellspacing="2" cellpadding="8" class="black14" bgcolor="336699"> 
							<tr>
								<td align="center" bgcolor="FFFFFF" nowrap>
								<cfoutput>
									<li><a href="http://www.jumpstartmarketer.com/index.cfm?fa=graphic_presentation&be=graphic_presentation&bg=1" class="bodylink3">Graphic Presentation</a></li>
								</cfoutput>
								</td>
							</tr>	
						</table>
					<cfelse>
						<strong>5 or more people must respond</strong> before you may proceed with the next step.
					</cfif>
				</cfoutput>
				</td>	  
			</tr>
		</form>	
		</table>