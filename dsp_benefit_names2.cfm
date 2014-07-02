
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.reorder" default=0>
<cfparam name="url.chosen" default=0>
<cfparam name="url.over" default=0>

	<title>
		Jumpstart Marketer Assignments
	</title>




<link href="styles/style1.css" rel="stylesheet" type="text/css">

<cfquery name="names" datasource="#application.dsn#">
	SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
	FROM         t_bake_off
	WHERE     (cid = #client.cid#)
		AND business_element = '#trim(url.be)#'
		<cfif url.chosen eq 1>
			AND chosen = 1
		</cfif>
		<cfif url.sub eq 1>
			AND chosen = 1
		</cfif>
	ORDER BY id 
</cfquery>

<cfquery name="names2" datasource="#application.dsn#">
	SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
	FROM         t_bake_off
	WHERE     (cid = #client.cid#)
		AND business_element = '#trim(url.be)#'
		<cfif url.chosen eq 1>
			AND chosen = 1
		</cfif>
		<cfif url.sub eq 1>
			AND chosen = 1
		</cfif>
	ORDER BY id DESC
</cfquery>

<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, generic_descriptor
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
	<cfif url.sub eq 0>
		<cfoutput>
		
			<cfif url.chosen eq 1>
				<form name="business" action="act_benefit_names2.cfm?be=#url.be#&names=2" method="post">
			<cfelse>
				<form name="business" action="act_benefit_choices.cfm?be=#url.be#<cfif url.email eq 1>&email=1<cfelseif url.experts eq 1>&experts=1</cfif>" method="post">
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
					The Connectics Experts will be automatically contacted, and will provide the required feedback for this excercise. 
					<br><br>
				</cfif>
			</cfif>
					
				</font>
				</td>
			</tr>		
			<tr> 
				<td>
					<cfif url.over eq 1>
						<font color="red">
							*** Please choose only TEN names. ***
						</font>
					</cfif>
				</td>
			</tr>
		<cfif names.recordcount lt 5>
			<tr>
				<td align="center">
					<font color="red">
						*** You must have at least TEN BENEFIT possibilities before proceeding ***
						<br><br>
						<a href="index.cfm?fa=bake_off&be=#url.be#" class="tinylink2">Back to BAKE OFF</a> 
					</font>
				</td>
			</tr>
		<cfelse>
			<tr> 
				<td>
				<cfif url.chosen eq 0>
					Below are the #replace(ucase(url.be),"_"," ")# names that are cleared for <strong>Phase 2</strong>:
					<br><br>
					<font color="green">Step 1.</font> Choose the <strong>TEN</strong> best BENEFIT answers below.<br><br>
					
					<table class="black14" cellspacing="1" cellpadding="5" bgcolor="CCCCCC">
						<tr>
							<td  bgcolor="6699CC">
								Select
							</td>
							<td bgcolor="6699CC">
								Element Text 
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
							</tr>	
						</cfloop>
					</table>
				
					<br>
					<input type="submit" value="Select Top Ten">
					
				<cfelse>
					Below are your chosen #replace(ucase(url.be),"_"," ")# names that are cleared for Phase 2:
					<br><br>
					<table class="black14" cellspacing="1" cellpadding="5" bgcolor="CCCCCC">
						<tr>
							<td bgcolor="6699CC">
								Element Text 
							</td>
						</tr>
						<cfloop query="names">	
							<tr>
								<td bgcolor="FFFFFF">
									#names.element_text# 
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



	</cfif>		
