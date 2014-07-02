


<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.update" default=0>
<cfparam name="url.fid" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.fid" default=0>

<cfinclude template="dsp_order_js.cfm"><head>








<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, benefit
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>
	
	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, cid, element_text, att_type
		FROM t_bake_off
		WHERE cid = #url.cid#
		 AND business_element = 'attributes'
		 	AND chosen = 1
	</cfquery>
	
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
<cfif url.update neq 0>	
			<tr> 
				<td>				<br><br><br>
					<font color="green">*** <b>Thank you. Your feedback has been recorded.</b> ***</font>
				<br><br><br>
				<a href="http://www.jumpstartmarketer.com" class="bodylink3">www.jumpstartmarketer.com</a>
				</td>
			</tr>
<cfelse>
			<tr> 
				<td>			
<font color="green">***</font> PLEASE <strong>READ</strong> THE BUSINESS DESCRIPTION BELOW <font color="green">***</font>
<br><br>
<b>Buisness Description:</b> <font color="maroon"><cfoutput>#business.business_desc#</cfoutput></font>
<br><br>

<strong>INSTRUCTIONS</strong>
<br><br>
<font color="green">
	<font color="black">1).</font> View the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> below.</li>
		<br><br>
	<font color="black">2).</font> Decide which ones would best support the below mentioned <strong>BENEFIT</strong>.</li>
		<br><br>
	<font color="black">3).</font> Click & Drag on the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names to <strong>re-order the list</strong>.</li>
		<br><br>
	<font color="black">4).</font> Reorder the list from <strong>BEST</strong> (first) to <strong>WORST</strong> (last).</li>
		<br><br>
	<font color="black">5).</font> Click on the <strong>SUBMIT</strong> button at the bottom of the page.</li>
		<br><br>
</font>	
<cfif business.benefit neq "">
	The BENEFIT below has been chosen to represent what consumers get out of using this product or service.  
	<br><br>
	BENEFIT: &nbsp; <cfoutput><font size="+3"><strong>#business.benefit#</strong></font></cfoutput>
	<br><br>	
</cfif>		
				</td>
			</tr>
			<tr> 
				<td>
					
				</td>
			</tr>	
		<cfoutput>
			<form name="business" action="act_attributes_names.cfm?be=#url.be#&feedback2=1&cid=#url.cid#&fid=#url.fid#<cfif url.e eq 1>&e=1</cfif>" method="post">
		</cfoutput>
			<tr>
				<td>

				<table width="500" border="1" cellspacing="1" cellpadding="3" class="black14">
						<tr>
							<td colspan="2" align="center" bgcolor="Silver">
							<b>ATTRIBUTES</b>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;
							
							</td>
						</tr>
						<tr>
							<td>
							
								<ul id="sortableList">
									<cfoutput query="names">
									
													
					
											<li id="#names.id#" class="sortableItem">
									<table border="1" cellpadding="5" width="400">
										<tr>
											<td align="center">
												<font size="+3">#names.element_text#</font> 	
												</td>
										</tr>
									</table>		
											</li>				
						
									</cfoutput>
								</ul>
			
							</td>
						</tr>
				</table>
				
				</td>
			</tr>	

			<tr> 
				<td align="center" bgcolor="336699">
			<input type="hidden" name="itemIds" id="itemIds" value="" size="20"/>
		
	
		<input type="submit" name="submitSort" id="submitSort" value="  SUBMIT  " />
				</td>
			</tr>
			</form>	

</cfif>
	  	</table>
		<br><br>
	
