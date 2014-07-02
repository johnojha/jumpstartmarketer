
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.phase" default=0><head>	
	<title>
		PowerMarketer Assignments
	</title>
</head>





<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, generic_descriptor
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

	<cfquery name="elements" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'tag_line'
		ORDER BY id
	</cfquery>


	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'tag_line'
		ORDER BY id
	</cfquery>


		
<cfoutput>		

<cfinclude template="includes/back_link.cfm">

		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">

			
			<form name="business" action="act_tagline_names.cfm?be=#url.be#&phase=#url.phase#" method="post">
			<tr> 
				<td>
				<font color="green">
				
				<cfif url.phase eq 1>
					Please enter your six Tag Lines below. 
					<br><br>					
					Then click "Submit"
					<br><br>
				<cfelseif url.phase eq 2>
<!--- 					Please enter email addresses and contact names of the "Experts" that this excercise will be sent to.
					<br><br>
					Then click "Submit"
					<br><br> --->
				</cfif>
					
				</font>
				</td>
			</tr>	
<cfif phase eq 1>
			<tr> 
				<td>
					<b>Tag Lines:</b>
				</td>
			</tr>
			<cfif names.recordcount neq 0>
				<tr> 
					<td bgcolor="CCCCCC">
						Below are your Current <b>Tag Lines</b>.
						<br><br>
						<font color="red">NOTE:</font> You must have <strong>six</strong> Tag Lines.
						<br><br>
						If you do not have all six entered, or if you want to change them, <strong>you must enter all six again below</strong>.
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
				
					1). <input type="text" size="30" name="choice_1">
						<br><br>
					2). <input type="text" size="30" name="choice_2">
						<br><br>
					3). <input type="text" size="30" name="choice_3">
						<br><br>
					4). <input type="text" size="30" name="choice_4">
						<br><br>
					5). <input type="text" size="30" name="choice_5">
						<br><br>
					6). <input type="text" size="30" name="choice_6">
					<br><br>
				</td>
			</tr>

	
		
		
<cfelseif url.phase eq 2>
			
			<cfif names.recordcount lt 6>
				<tr> 
					<td bgcolor="CCCCCC">
						<font color="red">NOTE:</font> You must have <strong>six</strong> Tag Lines.
						<br><br>
						Please go to the <a href="dsp_tag_line_names.cfm?be=#url.be#&email=1&phase=1" class="bakeofflink">PHASE 1 Exercise</a> and enter your six Tag Lines.
					</td>
				</tr>
				<cfabort>	
			<cfelse>
		
			<tr> 
				<td>
				
				
					
					
						<!--- Include the text fields and select lists of Email address to send exercise to. --->
					<cfinclude template="functions/chooseEmails_bakeoff.cfm">
					
					
				
				
				
				</td>
			</tr>
			
			</cfif>
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
			</form>	
			
		

	  	</table>

</cfoutput>

