
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.be" default=0>
<cfparam name="variables.benefit_one" default=1>


<head>	
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
			<form name="business" action="act_benefit_names.cfm?be=#url.be#&benefit_one=1" method="post">
			<tr> 
				<td>
				<strong>LADDERING EXERCISE</strong>
				<br><br>
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
<!--- 				<cfif url.email eq 0 AND url.experts eq 0>
					<a href="act_bake_off.cfm?continue=1&be=#url.be#" class="bodylink3">CONTINUE</a>
				</cfif> --->
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
					Please write down <b>on the bottom line</b> your answer to the first question below.
				</td>
			</tr>	
			<tr>
				<td>
					<b>Question 1</b><br>
					Being very selfish, what would you want to get out of using my product? 
				</td>
			</tr>	
			<tr>
				<td>
				<table width="300" border="1">
					<tr>
						<td>
				<br>
					<hr>
				<br>
					<hr>
				<br>
					<hr>
				<br>
					<hr>
				<br>
					<hr>
						</td>
					</tr>
				</table>
				</td>
			</tr>	
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>	
			<tr>
				<td>
					
					<br><br>
					<b>Question 2</b><br>
					I want you to understand that you now have that (what you wrote down above) in your life. <br>
					Given that you have that, what is the benefit of having that in your life?
					<br><br>
					Now write that down on the <b>second from the bottom line</b> above.
				</td>
			</tr>	
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>	
			<tr>
				<td>
					
					<br><br>
					<b>Question 3</b><br>
					I want you to understand that you now have that (what you wrote down on the second from the bottom line) in your life. <br>
					Given that you have that, what is the benefit of having that in your life?
					<br><br>
					Now write that down on the <b>third from the bottom line</b> above.
				</td>
			</tr>	
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>	
			<tr>
				<td>
					
					<br><br>
					<b>Question 4</b><br>
					I want you to understand that you now have that (what you wrote down on the third from the bottom line) in your life. <br>
					Given that you have that, what is the benefit of having that in your life?
					<br><br>
					Now write that down on the <b>second line from the top</b> above.
				</td>
			</tr>	
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>	
			<tr>
				<td><br><br>
					<b>Question 5</b><br>
					I want you to understand that you now have that (what you wrote down on the second line) in your life. <br>
					Given that you have that, what is the benefit of having that in your life?
					<br><br>
					Now write that down on the <b>first line</b> above.
				</td>
			</tr>	
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
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
