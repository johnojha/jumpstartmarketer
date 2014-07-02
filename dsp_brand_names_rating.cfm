
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.be" default=0><head>	
	<title>
		PowerMarketer Assignments
	</title>




<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
	<cfif url.sub eq 0>
			<cfoutput>
			<form name="business" action="act_brand_names.cfm?be=#url.be#&rate=1" method="post">
			<tr> 
				<td>
				<font color="green">
				
				<cfif url.email neq 0>
					Make any updates to your business description below. 
					<br><br>					
					Please enter email addresses and contact names of the "Experts" that this excercise will be sent to.
					<br><br>
					Then click "Submit"
					<br><br>
				<cfelseif url.experts neq 0>
					Make any updates to your business description below and click "Submit"

					<br><br>
					The Connectics Experts will be automatically contacted, and will provide the required feedback for this excercise. 
					<br><br>
				<cfelse>
					Make any updates to your business description below and click "Submit"
					
					
					<br><br>
				</cfif>
					
				</font>
				</td>
			</tr>		
			<tr> 
				<td>
					<b>Buisness Description:</b>
				</td>
			</tr>
			<tr> 
				<td>
					<textarea cols="60" rows="5" name="business_desc">#business.business_desc#</textarea>
				</td>
			</tr>	
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
					<br><br>
				<!--- 	<a href="act_bake_off.cfm?continue=1&be=#url.be#" class="bodylink3">CONTINUE</a> --->
				</td>
			</tr>
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
				<br><br><br>
					Below are the four key characteristics of a great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> name. They are all critical, but we have listed them in order of importance: 
 					<br>
					<img src="images/short_poetic.jpg">
				</td>
			</tr>	
			<tr>
				<td>
					Please come up with four <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names for my business, and list them below
				</td>
			</tr>	
			<tr>
				<td>
				<br>
					1). <hr>
				<br>
					2). <hr>
				<br>
					3). <hr>
				<br>
					4). <hr>
				<br>
				</td>
			</tr>				
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
