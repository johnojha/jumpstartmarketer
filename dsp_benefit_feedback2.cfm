
<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.update" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.sample" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.primary" default=1>
<cfparam name="url.top_num" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="url.radio" default=0>
<cfparam name="url.fid" default=0>

<head>
	<title>
		PowerMarketer
	</title>
</head>








<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>



	<cfquery name="names1" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating, order_num
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = 'benefit'
			AND chosen = 1
		ORDER BY id
	</cfquery>   
    
    	<cfset counter = 0>
    
    	<cfloop query="names1">
        	<cfquery name="up_order" datasource="#application.dsn#">
            	UPDATE t_bake_off
                SET order_num = '#counter + 1#'
               	WHERE id = #names1.id#
            </cfquery>
            
            <cfset counter = counter + 1>
        </cfloop>
    	
        
	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating, order_num
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = 'benefit'
			AND chosen = 1
		ORDER BY id
	</cfquery>     
    
    	<cfset url.top_num = names.recordcount>
        
	
    
    
    
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
<cfif url.primary gt url.top_num>	
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

				</td>
			</tr>
			<tr> 
				<td>

				</td>
			</tr>	
			<tr> 
				<td>

	<cfif url.primary eq 1> 
		<cfinclude template="includes/dsp_rating_instructions.cfm">
	</cfif>

				</td>
			</tr>		
			
		<cfoutput>
	<form name="business" action="act_benefit_names.cfm?be=#url.be#&cid=#url.cid#&feedback2=1<cfif url.e eq 1>&e=1</cfif>&primary=#url.primary#&top_num=#url.top_num#&fid=#url.fid#&uuid=#url.uuid#" method="post">
		</cfoutput>
		
			<cfif names.recordcount eq 0>
				<tr>
					<td>
						<strong>There are currently no BENEFIT names.</strong>
					</td>
				</tr>
			<cfelse>
			<cfoutput query="names">
            
            	<cfif names.order_num eq url.primary>
				<tr>
					<td align="center">
					<hr>
					<br>

							<font size="+3">#names.element_text#</font>  
						
					
					<br>
					<br>
					Rate 1 to 7, 7 being most significantly influenced by it's presence.
					<br><br>
					<br>
					<table class="black14" border="0">
						<tr>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=1> 1 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=2> 2 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=3> 3 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=4> 4 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=5> 5 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=6> 6 
								&nbsp; &nbsp;</font>
							</td>
							<td nowrap="nowrap">
								<font size="+3"><input type="radio" name="#names.id#" value=7> 7 
								&nbsp; &nbsp;</font>
							</td>
						</tr>
						<tr>
							<td align="center" nowrap="nowrap" colspan="7">
								<img src="images/spectrum_bg.jpg">
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap" align="center">
								<font size="1">Rejected</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Poor</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Weak</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Average</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Preferred</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Strong</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Remarkable</font>
							</td>
						</tr>
					</table>
					<br>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br><br>
					</td>
				</tr>	
                </cfif>
			</cfoutput>
			</cfif>	
			<tr> 
				<td align="center" bgcolor="336699">
				
					<cfinclude template="includes/dsp_submit_button.cfm">
				</td>
			</tr>
			</form>	

</cfif>
	  	</table>
		<br><br>
	
