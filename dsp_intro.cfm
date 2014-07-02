<cfparam name="url.denied" default="0">
<cfparam name="url.next" default="0">
<cfparam name="url.friends" default="0">
<cfparam name="url.consumer" default="0">

		<table width="800" border="0" cellspacing="1" cellpadding="3" class="white14">	
				<cfif url.denied neq 0>
					<tr>
						<td  height="20" colspan="8">
							*** You need to go to the previous step before continuing. ***
						</td>
					</tr>
				</cfif>
				<cfif url.next neq 0>
					<tr>
						<td  height="20" colspan="8">
							*** Congratulations, you have completed the Secrets To Success! ***  
							<br><br>
							Please go to step 2 below. 
						</td>
					</tr>
				</cfif>
				<cfif url.friends neq 0>
					<tr>
						<td  height="20" colspan="8">
							*** Now you have an overview of the Expert Feedback Process. ***  
							<br><br>
							Please go to step 3 below. 
						</td>
					</tr>
				</cfif>
				<cfif url.consumer neq 0>
					<tr>
						<td  height="20" colspan="8">
							*** Now you have an overview of the Consumer Feedback Process. ***  
							<br><br>
							Please go to the "My Business" link below. 
						</td>
					</tr>
				</cfif>
			<tr> 
				<td  colspan="2" class="header16">
				
				<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14">
					<tr>
						<td colspan="2">
					

					<img src="images/directions_getting_started.jpg">
                    <br>
					<br>
					The following is a rundown of the four steps you will use as you create a remarkable sales message for your business. 
                    Familiarizing yourself with these steps will make the process much easier.
                    <br>
					<br>
						</td>
					</tr>	
					<tr>
						<td valign="middle" align="right">
							<cfif client_progress.secrets_model eq 1>
								<img src="images/completed_sm.jpg">
							<cfelse>
								<img src="images/hand_v1.jpg">
							</cfif>
						<td>
							<a href="index.cfm?fa=secrets" class="bodylink"><img src="images/Secrets_to_success.jpg" border="0"></a><br><br>
						</td>
					</tr>

					<tr>
						<td valign="middle" align="right">
						<cfif client_progress.secrets_model eq 1 AND client_progress.friends_explained eq 1>
							<img src="images/completed_sm.jpg">
						<cfelseif client_progress.secrets_model eq 1 AND client_progress.friends_explained eq 0>
							<img src="images/hand_v1.jpg">
						</cfif>
						</td>
						<td>
						<a href="index.cfm?fa=friends_explained&bg=1" class="bodylink"><img src="images/Expert_Feedback.jpg" border="0"></a><br><br>
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
						<cfif client_progress.friends_explained eq 1 AND client_progress.consumer_explained eq 1>
							<img src="images/completed_sm.jpg">
						<cfelseif client_progress.friends_explained eq 1 AND client_progress.consumer_explained eq 0>
							<img src="images/hand_v1.jpg">
						</cfif>
						</td>
						<td>
						<a href="index.cfm?fa=consumer_explained&bg=1" class="bodylink"><img src="images/Consumer_Feedback.jpg" border="0"></a><br><br>
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							<cfif client_progress.consumer_explained eq 1>
								<img src="images/hand_v1.jpg">
							</cfif>
						<td>
							<a href="index.cfm?fa=my_business&bg=1"><img src="images/My_Business.jpg" border="0"></a>
						</td>
					</tr>
				</table>
				
				</td>
			</tr>	

		</table>	