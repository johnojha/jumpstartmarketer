
<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.insert" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.sample" default=0>
<cfparam name="url.ladder1" default=0>
<cfparam name="url.ladder2" default=0>
<cfparam name="url.ladder3" default=0>
<cfparam name="url.ladder4" default=0>
<cfparam name="url.ladder5" default=0>
<cfparam name="url.ladder6" default=0>
<cfparam name="url.fid" default=0><head>
	<title>
		PowerMarketer
	</title>
</head>

<cfif url.ladder1 eq 1>
	<cfset client.benefit_id = CreateUUID()>
</cfif>

<cfif url.ladder1 neq 1>
	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, cid, element_text, ladder_id
		FROM t_bake_off
		WHERE cid = #url.cid#
		 AND business_element = 'benefit'
		 AND benefit_id = '#client.benefit_id#'
	</cfquery>
</cfif>


<script language="javascript">
	function RemoveText(obj) 
	{   obj.value = ''; } 
</script>


<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
<cfif url.insert neq 0>	
			<tr> 
				<td>				<br><br><br>
					<font color="green">*** <b>Thank you. Your feedback has been recorded.</b> ***</font>
				<br><br><br>
				<a href="http://www.jumpstartmarketer.com" class="bodylink3">www.jumpstartmarketer.com</a>
				</td>
			</tr>
<cfelse>
	
		<cfoutput>
			<form name="business" action="act_benefit_names.cfm?be=#url.be#&feedback=1&fid=#url.fid#" method="post">
		</cfoutput>
			<tr> 
				<td>
					
				</td>
			</tr>
			<tr> 
				<td>
<font color="green">***</font> PLEASE <strong>REVIEW</strong> THE MARKETING TERM BELOW <font color="green">***</font>
<br><br>			
<li><strong>BENEFIT</strong>: What you get out of using this product or service.</li>
 <br><br>					
					
<font color="green">***</font> PLEASE <strong>READ</strong> THE PRODUCT OR SERVICE DESCRIPTION BELOW <font color="green">***</font>
<br><br>
<b>Product or Service Description:</b> <font color="maroon"><cfoutput>#business.business_desc#</cfoutput></font>
<br><br>
<!---
<br><br>
Based upon what you now know about this business, assume you are one of its consumers. Also assume you have fully experienced using this product or service several times and you are completely satisfied with it. 
<br><br>
You will be asked to write in five things that you have gotten out of experiencing this product or service. One or two word statements are perfect. You are identifying its Benefit.
<br><br>
The Benefit can be about the product or it can be about more personal and be about you. Here are examples of both. Let's assume the service is a dry cleaners company, one benefit could be "beautiful clothes"…that's what you get. It's about the clothes. It could also be more personal about you and be "I feel great".
<br><br>
 When you are finished click on the "submit" icon below.
 
 <br><br>  --->
 
<cfif url.ladder1 eq 1>
<strong>INSTRUCTIONS</strong>
<br><br>
<font color="green">
	<font color="black">1).</font> Assume that <strong>you are a comsumer</strong> that is completely satisfied with this product or service.</li>
		<br><br>
	<font color="black">2).</font> Decide what would you would want to get out of using this product or service.</li>
		<br><br>
	<font color="black">3).</font> Write the answer in the red box below. (A one or two word statement is fine)</li>
		<br><br>
	<font color="black">4).</font> Click  the <strong>SUBMIT</strong> button after you have typed in your answer.</li>
		<br><br>
	<font color="black">5).</font> You will be asked 4 more times, something you would want to get out of using this product or service.</li>
		<br><br>
	<font color="black">6).</font> Click on the <strong>SUBMIT</strong> button after you have typed in each statement.</li>
		<br><br>
</font>
</cfif>
				</td>
			</tr>	
	<cfif url.ladder1 eq 1>
			<tr>
				<td>
					<b>Question 1</b><br><br>
					<font color="maroon">Being very selfish, what would you want to get out of using my product? </font>
				</td>
			</tr>
	
			<tr>
				<td>
				<table width="350" border="1">

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
				<table bgcolor="CC0000" width="500">
					<tr>
						<td align="center">
							<input type="text" size="30" name="ladder1_text" value="type answer here" onfocus="RemoveText(this);">
						</td>
					</tr>
					<tr>
						<td align="center" bgcolor="CCCCCC">
							<input type="text" size="20" name="feedback_name" value="type your name here" onfocus="RemoveText(this);">
						</td>
					</tr>
				</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>	
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>	
	</cfif>	
	
	<cfif url.ladder2 eq 1>
			<tr>
				<td>
					
					<br><br>
					<b>Question 2</b><br>
					I want you to understand that you now have that (what you wrote down previously) in your life. <br>
					Given that you have that, what is the benefit of having that in your life?
					<br><br>
					Now write that down in the text field below - <b>just above what you wrote before</b>.
				</td>
			</tr>	
				<tr>
				<td>
				<table width="350" border="1">

					<tr>
						<td>
				<br>
					<hr>
				<br>
					<hr>
				<br>
					<hr>
				<br>
				<table bgcolor="CC0000" width="500">
					<tr>
						<td align="center">
					<input type="text" size="30" name="ladder2_text" value="type answer here" onfocus="RemoveText(this);">
						</td>
					</tr>
				</table>
					<br>
				<br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 1>
							#names.element_text#
						</cfif>
					</cfoutput>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>
	</cfif>	
	
	<cfif url.ladder3 eq 1>
			<tr>
				<td>
					
					<br><br>
					<b>Question 3</b><br>
					I want you to understand that you now have that (what you wrote down previously) in your life. <br>
					Given that you have that, what is the benefit of having that in your life?
					<br><br>
					Now write that down in the text field below - <b>just above what you wrote before</b>.
				</td>
			</tr>	
				<tr>
				<td>
				<table width="350" border="1">

					<tr>
						<td>
				<br>
					<hr>
				<br>
					<hr>
				<br>
			<table bgcolor="CC0000" width="500">
					<tr>
						<td align="center">
					<input type="text" size="30" name="ladder3_text" value="type answer here" onfocus="RemoveText(this);">
						</td>
					</tr>
				</table>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 2>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 1>
							#names.element_text#
						</cfif>
					</cfoutput>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>
	</cfif>
	
	<cfif url.ladder4 eq 1>
			<tr>
				<td>
					
					<br><br>
					<b>Question 4</b><br>
					I want you to understand that you now have that (what you wrote down previously) in your life. <br>
					Given that you have that, what is the benefit of having that in your life?
					<br><br>
					Now write that down in the text field below - <b>just above what you wrote before</b>.
				</td>
			</tr>	
				<tr>
				<td>
				<table width="350" border="1">

					<tr>
						<td>
				<br>
					<hr>
				<br>
				<table bgcolor="CC0000" width="500">
					<tr>
						<td align="center">
					<input type="text" size="30" name="ladder4_text" value="type answer here" onfocus="RemoveText(this);">
						</td>
					</tr>
				</table>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 3>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 2>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 1>
							#names.element_text#
						</cfif>
					</cfoutput>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>
	</cfif>
	
	<cfif url.ladder5 eq 1>
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
				<td>
				<table width="350" border="1">

					<tr>
						<td>
				<br>
				<table bgcolor="CC0000" width="500">
					<tr>
						<td align="center">
					<input type="text" size="30" name="ladder5_text">
						</td>
					</tr>
				</table>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 4>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 3>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 2>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 1>
							#names.element_text#
						</cfif>
					</cfoutput>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>
	</cfif>	

<cfif url.ladder6 eq 1>

<tr>
				<td>				<br><br><br>
					<font color="green">*** <b>Thank you. Your feedback has been recorded.</b> ***</font>
				<br><br><br>
				<a href="http://www.jumpstartmarketer.com" class="bodylink3">www.jumpstartmarketer.com</a>
				</td>
			</tr>
				</td>
			</tr>	
<tr>
				<td>
				<table width="350" border="1">

					<tr>
						<td>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 5>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 4>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 3>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 2>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
					<cfoutput query="names">
						<cfif names.ladder_id eq 1>
							#names.element_text#
						</cfif>
					</cfoutput>
				<br><br>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr> 
				<td bgcolor="Silver">&nbsp;
					
				</td>
			</tr>

</cfif>
				

			<tr> 
				<td bgcolor="336699">
					<cfif url.e eq 1>
						<input type="hidden" name="e" value=1>
					</cfif>
				<cfoutput>
					<input type="hidden" name="cid" value="#url.cid#">
					<input type="hidden" name="be" value="#url.be#">
				</cfoutput>	
				<cfif url.ladder6 eq 0>
					&nbsp; &nbsp; <cfinclude template="includes/dsp_submit_button.cfm">
				</cfif> 
				</td>
			</tr>
			</form>	
			
</cfif>
	  	</table>
		<br><br>
	
