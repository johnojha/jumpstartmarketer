<head>

<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>

</head>

<body>



		<table width="700" border="0" cellspacing="0" cellpadding="5" class="black14">
			<tr> 
				<td  align="center" class="header16">
					<img src="images/secrets_header.jpg">
				</td>
			</tr>	
			<tr> 
				<td  bgcolor="#FFFFFF" class="black14" nowrap>
				<ul>
					<li>It is very important that you learn the information in the <strong>5 steps of "Secrets to Success."</strong></li>
					<br><br>
					<li>Learning these steps will be vital to your success in launching your product or service.</li>
					<br><br>
					<li>Please click below, and read through each of the 5 steps. </li>
				</ul>
				</td>
			</tr>
			<tr>
				<td width="500" align="center">
				
					<table width="700" border="0" cellspacing="0" cellpadding="8" class="black14" bgcolor="#FFFFFF">
						<tr>
							<td  height="10">
								
							</td>
						</tr>
						<tr>
                        <cfif client.cid neq 0>
							<cfif client_progress.secrets_sp eq 0>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="white14">
									<img src="images/hand_v1.jpg" align="middle">
								</td>
							<cfelse>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="black14">
									<img src="images/completed_sm.jpg">
								</td>
							</cfif>
                        </cfif>
							<td valign="top" bgcolor="FFFFFF" rowspan="2">	
								<a href="index.cfm?fa=tour_cont&bg=1&link=selling" class="bodylink"><img src="images/secrets_step1.jpg" border="0"></a>
							</td>
						</tr>
						<tr>
							<td  height="10">
								
							</td>
						</tr>						
						<tr>
                        <cfif client.cid neq 0>
							<cfif client_progress.secrets_goal eq 0 AND client_progress.secrets_sp eq 1>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="white14">
									<img src="images/hand_v1.jpg" align="middle">
								</td>
							<cfelseif client_progress.secrets_goal eq 1 AND client_progress.secrets_sp eq 1>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="black14">
									<img src="images/completed_sm.jpg">
								</td>
							<cfelse>
								<td rowspan="2" valign="top" bgcolor="FFFFFF" nowrap class="white14">
								</td>							
							</cfif>
                        </cfif>
							<td valign="top" bgcolor="FFFFFF" rowspan="2">						
								<a href="index.cfm?fa=tour_cont&bg=1&link=goal" class="bodylink"><img src="images/secrets_step2.jpg" border="0"></a>
							</td>
						</tr>
						<tr>
							<td  height="10">
								
							</td>
						</tr>
						<tr>
                        <cfif client.cid neq 0>
							<cfif client_progress.secrets_impact eq 0 AND client_progress.secrets_goal eq 1>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="white14">
									<img src="images/hand_v1.jpg" align="middle">
								</td>
							<cfelseif client_progress.secrets_impact eq 1 AND client_progress.secrets_goal eq 1>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="black14">
									<img src="images/completed_sm.jpg">
								</td>
							<cfelse>
								<td rowspan="2" valign="top" bgcolor="FFFFFF" nowrap class="white14">
								</td>							
							</cfif>
                        </cfif>
							<td valign="top" bgcolor="FFFFFF" rowspan="2">
								<a href="index.cfm?fa=tour_cont&bg=1&link=impact" class="bodylink"><img src="images/secrets_step3.jpg" border="0"></a>
							</td>
						</tr>
						<tr>
							<td  height="10">
								
							</td>
						</tr>
				
						<tr>
                        <cfif client.cid neq 0>
							<cfif client_progress.secrets_paradigm eq 0 AND client_progress.secrets_impact eq 1>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="white14">
									<img src="images/hand_v1.jpg" align="middle">
								</td>
							<cfelseif client_progress.secrets_paradigm eq 1 AND client_progress.secrets_impact eq 1>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="black14">
									<img src="images/completed_sm.jpg">
								</td>
							<cfelse>
								<td rowspan="2" valign="top" bgcolor="FFFFFF" nowrap class="white14">
								</td>							
							</cfif>
                         </cfif>
							<td valign="top" bgcolor="FFFFFF" rowspan="2">
								<a href="index.cfm?fa=tour_cont&bg=1&link=rp" class="bodylink"><img src="images/secrets_step4.jpg" border="0"></a>
							</td>
						</tr>
						<tr>
							<td  height="10">
								
							</td>
						</tr>
						<tr>
                        <cfif client.cid neq 0>
							<cfif client_progress.secrets_model eq 0 AND client_progress.secrets_paradigm eq 1>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="white14">
									<img src="images/hand_v1.jpg" align="middle">
								</td>
							<cfelseif client_progress.secrets_model eq 1 AND client_progress.secrets_paradigm eq 1>
								<td bgcolor="FFFFFF" rowspan="2" valign="middle" class="black14">
									<img src="images/completed_sm.jpg">
								</td>
							<cfelse>
								<td rowspan="2" valign="top" bgcolor="FFFFFF" nowrap class="white14">
								</td>							
							</cfif>
                        </cfif>
							<td valign="top" bgcolor="FFFFFF" rowspan="2">
								<a href="index.cfm?fa=tour_cont&bg=1&link=cm" class="bodylink"><img src="images/secrets_step5.jpg" border="0"></a>
							</td>
						</tr>
						<tr>
							<td  height="10">
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					
				</td>
			</tr>
		</table>
		
</body>