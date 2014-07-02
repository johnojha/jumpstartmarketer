<head>



</head>

	<cfquery name="elements" datasource="#application.dsn#">
		SELECT id, business_element, my_choice, my_choice_rating, times_chosen
		FROM         t_elements
		WHERE     (cid = #client.cid#)
			AND (my_choice IS NOT NULL)
		ORDER BY id
	</cfquery>


<!--- <cfinclude template="dsp_connectics_redirect.cfm"> --->

		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14">
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="2">
					<img src="images/headlines_impact.jpg">
				</td>
			</tr>	
			
		<form name="impact" action="act_impact_choice.cfm" method="post" onsubmit="return validateThis(this)">
			<tr>		  
				<td align="center">
					
				</td>	
				<td align="left">	
						
				</td>		  
			  </tr>
			 <tr>		  
				<td class="bodytext" bgcolor="CCCCCC" align="center">
					Below are your results for your IMPACT Bake Off exercise.
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
				<td valign="middle" align="center" bgcolor="336699">
				Now you may proceed to the CONNECTICS phase of your IMPACT devlopment.
				<br><br>
				<cfoutput>
					<a href="index.cfm?fa=impact2" class="bodylink3"><img src="images/connectics.jpg"></a>
				</cfoutput>
				</td>	  
			</tr>
		</form>	
		</table>