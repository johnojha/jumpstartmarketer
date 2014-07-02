
<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.update" default=0>
<cfparam name="url.e" default=0><head>
<cfparam name="url.cvar" default=0>
<cfparam name="url.counter" default=1>
<cfparam name="url.primary" default=1>
<cfparam name="url.secondary" default=2>
<cfparam name="url.top_num" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="url.fid" default=0>

	<title>
		PowerMarketer
	</title>
</head>



<style type="text/css">
	input.radio { width: 1em; height: 1em; }
	input.submit { width: 10em; height: 3em; }
</style>


<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>
		
		
	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating, gd_n
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = '#trim(url.be)#'
		ORDER BY id
	</cfquery>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
<cfif url.primary gte 6>	
			<tr> 
				<td colspan="3">				<br><br><br>
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
				<td colspan="3">
<cfif url.primary eq 1>
<font color="green">***</font> PLEASE <strong>REVIEW</strong> THE MARKETING TERM BELOW <font color="green">***</font>
<br><br>	
<li><strong>GENERIC DESCRIPTOR</strong> clearly defines a business in an interesting way.</li>
<br><br>
<font color="green">***</font> PLEASE <strong>READ</strong> THE PRODUCT OR SERVICE DESCRIPTION BELOW <font color="green">***</font>
<br><br>
<b>Product or Service Description:</b> <font color="maroon"><cfoutput>#business.business_desc#</cfoutput></font>
<br><br>
<strong>INSTRUCTIONS</strong>
<br><br>
<font color="green">
	<font color="black">1).</font> You will be choosing between two GENERIC DESCRIPTOR options below
		<br><br>
	<font color="black">2).</font> Consider which one clearly defines this business in an interesting way</li>
		<br><br>
	<font color="black">3).</font> Click on the button next to the one you like better, and click SUBMIT.</li>
		<br><br>
</font>
</cfif> 					
				</td>
			</tr>
		<cfoutput>
			<form name="business" action="act_gen_desc_names.cfm?be=#url.be#&feedback=1&cid=#url.cid#&fid=#url.fid#&top_num=#names.gd_n#&primary=#url.primary#&secondary=#url.secondary#<cfif url.e eq 1>&e=1</cfif>&uuid=#url.uuid#" method="post">
		</cfoutput>
			<cfif names.recordcount eq 0>
				<tr>
					<td colspan="3">
						<strong>There are currently no generic descriptor names.</strong>
					</td>
				</tr>
			<cfelse>
				<tr>
					<td align="center" valign="middle" width="40%" height="400">
		
				<cfoutput query="names">
					
					<cfif names.gd_n eq url.primary>
						
	
						<font size="+7" face="Arial, Helvetica, sans-serif">	#names.element_text# </font>
	
						
					<table class="black14" border="0">
						<tr>
							<td>
							<br><br>
						<font size="+3"><input class="radio"  type="radio" name="choice_id"  value="#names.id#"></font>
							</td>
						</tr>
					</table>
                    
					</cfif>	

				</cfoutput>
				
					
					
					</td>	
					
					<td>
						&nbsp; &nbsp;
					</td>
					
					<td align="center" valign="middle" width="40%" height="400">			
		
					
				<cfoutput query="names">
					
					<cfif names.gd_n eq url.secondary>
						
	
						<font size="+7" face="Arial, Helvetica, sans-serif">	#names.element_text# </font>
	
						
					<table class="black14" border="0">
						<tr>
							<td>
							<br><br>
						<font size="+3"><input class="radio" type="radio" name="choice_id"  value="#names.id#"></font>
							</td>
						</tr>
					</table>
                    
					</cfif>	
					
				</cfoutput>
						

					</td>
				</tr>
                
                
                
			</cfif>	
<!--- 			<tr> 
				<td>
					Your Name: <input type="text" name="sug_by_name" size="30"> &nbsp; Your Email: <input type="text" name="sug_by_email" size="30">
				</td>
			</tr> --->
			<tr> 
				<td align="center" bgcolor="336699" colspan="3">
					
		
					<input type="submit" value="  SUBMIT  "> 
				</td>
			</tr>
			</form>	
			
</cfif>
	  	</table>
		<br><br>
	
