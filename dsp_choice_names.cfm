
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.reorder" default=0>
<cfparam name="url.chosen" default=0>
<cfparam name="url.over" default=0>
<cfparam name="url.choice" default=1>

	<title>
		PowerMarketer Assignments
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
	ORDER BY rating DESC 
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
	ORDER BY rating DESC
</cfquery>

<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, generic_descriptor, benefit
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
	
		<cfoutput>
		
			<cfif url.chosen eq 1>
				<form name="business" action="components/act_choiceExercise.cfm?be=#url.be#&phase=#url.phase#&send=1&choice=1" method="post">
			<cfelse>
				<form name="business" action="components/act_choiceExercise.cfm?be=#url.be#&phase=#url.phase#&chosen=1" method="post">
			</cfif>
			
        
			<tr> 
				<td>
					<cfif url.over eq 1>
						<font color="red">
							*** Please choose only FOUR names. ***
						</font>
					</cfif>
				</td>
			</tr>
			<tr> 
				<td>
				<cfif url.chosen eq 0>
					Below are the #replace(ucase(url.be),"_"," ","ALL")# options that are cleared for <strong>Phase 3</strong>:
					<br><br>
					<font color="green">Step 1.</font> Choose your 4 highest rated #replace(ucase(url.be),"_"," ","ALL")# options below.<br><br>
					
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
								(7 is best)
							</td>
						</tr>
						<cfloop query="names">	
							<tr>
								<td bgcolor="FFFFFF" align="right">
									<input type="checkbox" name="#names.id#">
								</td>
								<td bgcolor="FFFFFF">
                                	<cfif names.element_text CONTAINS ".jpg"><a href="images/#trim(url.be)#/#client.cid#/#names.element_text#" target="_new">view</a> &nbsp; </cfif>
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
					Below are your chosen #replace(ucase(url.be),"_"," ","ALL")# options that are cleared for Phase 3:
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
                                	<cfif names.element_text CONTAINS ".jpg"><a href="images/#trim(url.be)#/#client.cid#/#names.element_text#" target="_new">view</a> &nbsp; </cfif>
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
	
        
	<cfif url.chosen eq 1>
	
	
			<tr> 
				<td>
					
					
						<!--- Include the text fields and select lists of Email address to send exercise to. --->
					<cfinclude template="functions/chooseEmails_bakeoff.cfm">
					
					
				</td>
			</tr>
	
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
	
	  	</table>
	
