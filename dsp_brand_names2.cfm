
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.reorder" default=0>
<cfparam name="url.chosen" default=0>
<cfparam name="url.over" default=0>
<cfparam name="url.phase" default=0>

	<title>
		PowerMarketer Assignments
	</title>




<link href="styles/style1.css" rel="stylesheet" type="text/css">

<cfquery name="names" datasource="#application.dsn#">
	SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
	FROM         t_bake_off
	WHERE     (cid = #client.cid#)
		AND business_element = '#trim(url.be)#'
		AND legal_clearance = 1
		<cfif url.chosen eq 1>
			AND chosen = 1
		</cfif>
		<cfif url.sub eq 1>
			AND chosen = 1
		</cfif>
	ORDER BY rating DESC 
</cfquery>

<cfquery name="names2" datasource="#application.dsn#">
	SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
	FROM         t_bake_off
	WHERE     (cid = #client.cid#)
		AND business_element = '#trim(url.be)#'
		AND legal_clearance = 1
		<cfif url.chosen eq 1>
			AND chosen = 1
		</cfif>
		<cfif url.sub eq 1>
			AND chosen = 1
		</cfif>
	ORDER BY rating DESC
</cfquery>

<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, generic_descriptor
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14">
	<cfif url.sub eq 0>
		<cfoutput>
		
			<cfif url.chosen eq 1>
				<form name="business" action="act_brand_names2.cfm?be=#url.be#&names=2" method="post">
			<cfelse>
				<form name="business" action="act_brand_choices.cfm?be=#url.be#&phase=4<cfif url.email eq 1>&email=1<cfelseif url.experts eq 1>&experts=1</cfif>" method="post">
			</cfif>
			
			<tr> 
				<td>
				<font color="green">
			<cfif url.chosen eq 1>
				<cfif url.email neq 0>				
<!--- 					Please enter email addresses and contact names of the "Experts" that this excercise will be sent to.
					<br><br>
					Then click "Submit"
					<br><br> --->
				<cfelseif url.experts neq 0>
					Your group of experts will be automatically contacted, and will provide the required feedback for this excercise. 
					<br><br>
				</cfif>
			</cfif>
					
				</font>
				</td>
			</tr>		
            
<!--- 		<cfif url.chosen eq 1>
			<tr> 
				<td>
					<cfinclude template="includes/dsp_exercise_check.cfm">	
				</td>
			</tr>
        </cfif>   --->          
            
			<tr> 
				<td>
					<cfif url.over eq 1>
						<font color="red">
							*** Please choose only five names. ***
						</font>
					</cfif>
				</td>
			</tr>
		<cfif names.recordcount lt 5>
			<tr>
				<td align="center">
					<font color="red">
						*** You must Legally Clear FIVE names before proceeding ***
						<br><br>
						<a href="index.cfm?fa=bake_off&be=#url.be#" class="tinylink2">Back to BAKE OFF</a> 
					</font>
				</td>
			</tr>
		<cfelse>
			<tr> 
				<td>
				<cfif url.chosen eq 0>
					Below are the #replace(ucase(url.be),"_"," ")# names that are cleared for <strong>Phase 4</strong>:
					<br><br>
					<font color="green">Step 1.</font> Choose <strong>the TOP FIVE</strong> names below.<br><br>
					
					<table class="black14" cellspacing="1" cellpadding="5" bgcolor="CCCCCC">
						<tr>
							<td  bgcolor="6699CC">
								Select
							</td>
							<td bgcolor="6699CC">
								Element Text 
							</td>
							<td bgcolor="6699CC" nowrap>
								Rating <br>
								<font color="yellow">(7 is best)</font>
							</td>
						</tr>
						<cfloop query="names">	
							<tr>
								<td bgcolor="FFFFFF" align="right">
									<input type="checkbox" name="#names.id#">
								</td>
								<td bgcolor="FFFFFF">
									#names.element_text# 
								</td>
								<td bgcolor="FFFFFF">
									#names.rating#
								</td>
							</tr>	
						</cfloop>
					</table>
				
					<br>
					<input type="submit" value="  SUBMIT  ">
					
				<cfelse>
					Below are your chosen #replace(ucase(url.be),"_"," ")# names that are cleared for Phase 2:
					<br><br>
					<table class="black14" cellspacing="1" cellpadding="5" bgcolor="CCCCCC">
						<tr>
							<td bgcolor="6699CC">
								Element Text 
							</td>
							<td bgcolor="6699CC">
								Rating
							</td>
						</tr>
						<cfloop query="names">	
							<tr>
								<td bgcolor="FFFFFF">
									#names.element_text# 
								</td>
								<td bgcolor="FFFFFF">
									#names.rating#
								</td>
							</tr>	
						</cfloop>
					</table>
					<br>
		
				</cfif>
				</td>
			</tr>	
		</cfif>
	<cfif url.chosen eq 1>
	
	
	
		<cfif url.email neq 0>
			<tr> 
				<td>
					
					
						<!--- Include the text fields and select lists of Email address to send exercise to. --->
					<cfinclude template="functions/chooseEmails_bakeoff.cfm">
					
					
				</td>
			</tr>
		</cfif>
			<tr> 
				<td>
				<cfif url.email neq 0>
					<input type="hidden" name="email" value=1>
				<cfelseif url.experts neq 0>
					<input type="hidden" name="experts" value=1>
				</cfif>
				<input type="hidden" name="be" value="#url.be#">
				
					<input type="submit" value="Submit"> 

				</td>
			</tr>
	</cfif>
			</form>	
			</cfoutput>
	<cfelse>
			<tr> 
				<td>
					<b>Buisness Description:</b>
				</td>
			</tr>
			<tr> 
				<td>
					<cfoutput>#business.business_desc#</cfoutput>
				</td>
			</tr>	
			<tr> 
				<td>
					Below are the four key characteristics of a great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> name. They are all critical, but we have listed them in order of importance: 
 					<br>
					<img src="images/short_poetic.jpg">
				</td>
			</tr>	
			<tr>
				<td>
					<strong>Please rank (from 1 to 5, 1 being the strongest)</strong> the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names for my business listed below.
				</td>
			</tr>	
			<cfoutput query="names">
				<tr>
					<td align="center">
					<hr>
					<font size="+5">#names.element_text#</font>
					<br><br>
					<font size="+2">#business.generic_descriptor#</font>	
					<br>
					</td>
				</tr>	
			</cfoutput>			
			<tr>
				<td height="10" bgcolor="666666">
					<hr>
				</td>
			</tr>			
			<tr>
				<td>
				<br>
					<strong>Now rank (from 1 to 5, 1 being the strongest)</strong> the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names for my business listed below.
				</td>
			</tr>	
			<cfoutput query="names2">
				<tr>
					<td align="center">
					<hr>
					<font size="+5">#names2.element_text#</font>
					<br><br>
					<font size="+2">#business.generic_descriptor#</font>	
					<br>
					</td>
				</tr>	
			</cfoutput>		
	</cfif>	
	  	</table>
		<br><br>
	<cfif url.sub eq 1>	
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="noprint">
			<tr> 
				<td>
					<form>
						<input type="button" value=" Print this page "  onclick="window.print();return false;" / >
					</form> 
				</td>
			</tr>
		</table>	
	</cfif>		
