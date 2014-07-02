
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.phase" default=0><head>	
	<title>
		PowerMarketer Assignments
	</title>




<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, benefit
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>
	
	

	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, cid, element_text, att_type
		FROM t_bake_off
		WHERE cid = #client.cid#
		 AND business_element = 'attributes'
		 ORDER BY id
	</cfquery>

<cfinclude template="includes/back_link.cfm">
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">

			<cfoutput>
			<form name="business" action="act_attributes_names.cfm?be=#url.be#&phase=#url.phase#" method="post">
			</cfoutput>
			<tr> 
				<td>
               
				<font color="green">
					<cfif url.phase eq 1>
                     <br /><br />
                   	NOTE: Your attributes should be <strong>one to four words long</strong>. Again, your attributes should be no longer than four words long.
                     <br /><br />
						Please enter your <strong>ten Attributes</strong> below. 
						<br><br>					
						Then click "Submit"
						<br><br>
					<cfelseif url.phase eq 2>
<!---                      <br /><br />
						Please enter email addresses and contact names of the "Experts" that this excercise will be sent to.
						<br><br>
						Then click "Submit"
						<br><br> --->
					</cfif>					
				</font>
				</td>
			</tr>	
	<cfif url.phase eq 1>
			<tr> 
				<td>
					<b>Attributes:</b>
				</td>
			</tr>
			<cfif names.recordcount neq 0>
				<tr> 
					<td bgcolor="CCCCCC">
						Below are your Current <b>Attributes</b>.
						<br><br>
						<font color="red">NOTE:</font> You must have <strong>10</strong> Attributes.
						<br><br>
						<font color="red">***</font> If you do not have all ten entered, or if you want to change them, <strong>you must enter all ten again below</strong>.
					</td>
				</tr>
				<tr>
					<td>
						<cfset counter = 1>
					<cfloop query="names">
						<cfoutput>
							#counter#). #names.element_text# <br><br>
								<cfset counter = counter + 1>
						</cfoutput>
					</cfloop>
					</td>
				</tr>
			</cfif>		
			<tr> 
				<td>
					
					<table width="500" border="0" cellspacing="1" cellpadding="3" class="black14">
						<tr>
							<td colspan="2" align="center" bgcolor="Silver">
							<b>BENEFIT</b>: <cfoutput><font size="+2">#business.benefit#</font></cfoutput>
							<br><br>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							LIST YOUR ATTRIBUTES
						</tr>
						<tr>
							<td>
							<input type="text" size="30" name="att1" maxlength="50">
							<br><br>
							<input type="text" size="30" name="att2" maxlength="50">
							<br><br>
							<input type="text" size="30" name="att3" maxlength="50">
							<br><br>
							<input type="text" size="30" name="att4" maxlength="50">
							<br><br>
							<input type="text" size="30" name="att5" maxlength="50">
							<br><br>
							</td>
							<td>
							<input type="text" size="30" name="att6" maxlength="50">
							<br><br>
							<input type="text" size="30" name="att7" maxlength="50">
							<br><br>
							<input type="text" size="30" name="att8" maxlength="50">
							<br><br>
							<input type="text" size="30" name="att9" maxlength="50">
							<br><br>
							<input type="text" size="30" name="att10" maxlength="50">
							<br><br>
							</td>
						</tr>
					</table>
					
					
				</td>
			</tr>	

	<cfelseif url.phase eq 2>
	
				<tr> 
					<td>
					
					
						<!--- Include the text fields and select lists of Email address to send exercise to. --->
					<cfinclude template="functions/chooseEmails_bakeoff.cfm">
					
					
					</td>
				</tr>	
	</cfif>

			<tr> 
				<td>
			<cfoutput>
				<cfif url.email neq 0>
					<input type="hidden" name="email" value=1>
				<cfelseif url.experts neq 0>
					<input type="hidden" name="experts" value=1>
				</cfif>
				<input type="hidden" name="be" value="#url.be#">
				
					<input type="submit" value="Submit"> 
				</td>
			</tr>
			</form>	
			</cfoutput>
			
	  	</table>
		<br><br>

