
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
		SELECT id, cid, element_text, att_type, chosen, att_n, rating, times_chosen
		FROM t_bake_off
		WHERE cid = #client.cid#
		 AND business_element = 'attributes'
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
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
	<cfif url.sub eq 0>
		<cfoutput>
		
			<cfif url.chosen eq 1>
				<form name="business" action="act_attributes_names2.cfm?be=#url.be#&names=2" method="post">
			<cfelse>
				<form name="business" action="act_attributes_choices.cfm?be=#url.be#<cfif url.email eq 1>&email=1<cfelseif url.experts eq 1>&experts=1</cfif>" method="post">
			</cfif>
			
			<tr> 
				<td>
				<font color="green">
				<cfif url.chosen eq 1>
					<cfif url.email neq 0>				
<!--- 						Please enter email addresses and contact names of the "Experts" that this excercise will be sent to.
						<br><br>
						Then click "Submit"
						<br><br> --->
					<cfelseif url.experts neq 0>
						The your group of experts will be automatically contacted, and will provide the required feedback for this excercise. 
						<br><br>
					<cfelse>
						
					</cfif>
				</cfif>	
				</font>
				</td>
			</tr>		
			<tr> 
				<td>
					<cfif url.over eq 1>
						<font color="red">
							*** Please choose only FOUR Attributes. ***
						</font>
					</cfif>
				</td>
			</tr>
			<tr> 
				<td>
				<cfif url.chosen eq 0>
					Below are the #replace(ucase(url.be),"_"," ")# Attributes that are ready for Phase 2:
					<br><br>
					<font color="green">(rating of 7 is best)</font>
					<br><br>
					<font color="green">Step 1.</font> Choose only FOUR Attributes below.<br><br>
					
					<cfloop query="names">	
							
						<input type="checkbox" name="#names.id#">&nbsp;#names.element_text# &nbsp; <font size=1>rating = #NumberFormat(names.rating,"9.9")#</font>
						<br><br>
						
					</cfloop>
					<br>
					<input type="submit" value="Select Top Four">
					
				<cfelse>
					Below are your chosen #replace(ucase(url.be),"_"," ")# names that are cleared for Phase 2:
					<br><br>
			
					<cfloop query="names">				
						<li>#names.element_text# </li><br><br>
					</cfloop>
					<br>
		
				</cfif>
				</td>
			</tr>	
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
				</td>
			</tr>	
			<tr>
				<td>
					<br>
					<font color="green">***</font> Please circle the attribute that is most important to you.		
				</td>
			</tr>	
				<tr>
					<td align="center">
					<hr>
					<div align="left">1).</div>
					<cfoutput query="names">
						<cfif names.att_n eq 1>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<br><br>
					VS.
					<br><br>
					<cfoutput query="names">
						<cfif names.att_n eq 2>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br><br>
					</td>
				</tr>
				<tr>
					<td align="center">
					<hr>
					<div align="left">2).</div>
					<cfoutput query="names">
						<cfif names.att_n eq 1>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<br><br>
					VS.
					<br><br>
					<cfoutput query="names">
						<cfif names.att_n eq 3>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br><br>
					</td>
				</tr>
				<tr>
					<td align="center">
					<hr>
					<div align="left">3).</div>
					<cfoutput query="names">
						<cfif names.att_n eq 1>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<br><br>
					VS.
					<br><br>
					<cfoutput query="names">
						<cfif names.att_n eq 4>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br><br>
					</td>
				</tr>
				<tr>
					<td align="center">
					<hr>
					<div align="left">4).</div>
					<cfoutput query="names">
						<cfif names.att_n eq 2>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<br><br>
					VS.
					<br><br>
					<cfoutput query="names">
						<cfif names.att_n eq 3>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br><br>
					</td>
				</tr>
				<tr>
					<td align="center">
					<hr>
					<div align="left">5).</div>
					<cfoutput query="names">
						<cfif names.att_n eq 2>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<br><br>
					VS.
					<br><br>
					<cfoutput query="names">
						<cfif names.att_n eq 4>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br><br>
					</td>
				</tr>
				<tr>
					<td align="center">
					<hr>
					<div align="left">6).</div>
					<cfoutput query="names">
						<cfif names.att_n eq 3>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<br><br>
					VS.
					<br><br>
					<cfoutput query="names">
						<cfif names.att_n eq 4>
							<font size="+3">#names.element_text#</font>  
						</cfif> 
					</cfoutput>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br><br>
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
