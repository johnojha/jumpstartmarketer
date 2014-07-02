
<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.update" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.sample" default=0>
<cfparam name="url.primary" default=1>
<cfparam name="url.top_num" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="url.radio" default=0>
<cfparam name="url.fid" default=0><head>
	<title>
		MyPowerMarketer
	</title>
</head>




<cfif url.uuid eq 0>
	<cfset client.order_by = 0>
	<cfset rand_num = RandRange(1,10)>
    <cfif rand_num lte 5>
		<cfset client.order_by = "ASC">
    <cfelse>
    	<cfset client.order_by = "DESC">
    </cfif>
</cfif>





<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, sub_brand_desc, generic_descriptor
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>

	<cfquery name="names1" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = '#url.be#'
			AND legal_clearance = 1
		ORDER BY id #client.order_by#
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
			AND business_element = '#url.be#'
			AND legal_clearance = 1
		ORDER BY id
	</cfquery>        
    
    	<cfset url.top_num = names.recordcount>
        
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
<cfif url.primary gt url.top_num>	
			<tr> 
				<td>
				<br><br><br>
					<font color="green">*** <b>Thank you. Your input has been recorded.</b> ***</font>
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
					<font color="green">***</font> PLEASE <strong>READ</strong> THE DESCRIPTION BELOW <font color="green">***</font>
					<br><br>
					<cfif url.be eq "brand">
					<strong>Product or Service Description:</strong> <font color="maroon"><cfoutput>#business.business_desc#</cfoutput></font>
					<br><br>
					<cfelse>
					<strong>Product or Service Description:</strong> <font color="maroon"><cfoutput>#business.sub_brand_desc#</cfoutput></font>
					<br><br>
					</cfif>                    
                    <strong>Generic Descriptor:</strong> <font color="maroon"><cfoutput>#business.generic_descriptor#</cfoutput></font>
                    <br><br>
					<strong>A great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> NAME</strong> will conform to all five of the following characteristics:<br><br>
<li>Does not need to define the product or service.</li>
<li>One or two words.</li>
<li>Easy to say.</li>
<li>Easy to remember.</li>
<li>Adds appropriate character.</li>
<li>EXAMPLES are; GoGurt (kid's yogurt), Google (search engine) iPod (music player), Palm Pilot (organizer), Blackberry (phone/organizer), Clorox (fabric bleach), The Geek Squad (Computer service a t Best Buy), Yellow Pages (business directory service), Vista (computer operating system)

					<br><br>
			<cfif url.primary eq 1>
					<strong>INSTRUCTIONS</strong>
					<br><br>
					<font color="green">
						<font color="black">1).</font> Please RATE the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> option below
							<br><br>
						<font color="black">2).</font> You will rate it from 1 (worst) to 7 (best)
							<br><br>
						<font color="black">3).</font> Consider if each option has the five key characteristics of a great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> name 
							<br><br>
						<font color="black">4).</font> Click on the button next to the number you choose
							<br><br>
						<font color="black">5).</font> Click on the <strong>SUBMIT</strong> button, and continue with the next option
							<br><br>
					</font>	
             </cfif>
				</td>
			</tr>
          <cfif url.radio eq 1>
            <tr> 
				<td align="center">
					<font color="red">*** <b>Please choose a rating before clicking submit</b> ***</font>	
				</td>
			</tr>	
          </cfif>
		
		<cfoutput>
			<form name="business" action="act_brand_names.cfm?be=#url.be#&feedback_rate=1&cid=#url.cid#&primary=#url.primary#&top_num=#url.top_num#&fid=#url.fid#&uuid=#url.uuid#" method="post">
		</cfoutput>
			<cfoutput query="names">
            	
                <cfif names.order_num eq url.primary>
				<tr>
					<td align="center">
					<hr>
					<br>

							<font size="+3">#names.element_text#</font>  
						
					
					<br>
					<br>
					Rate 1 to 7, 7 being most interesting.
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

		<cfoutput>
			<tr> 
				<td align="center" bgcolor="336699">
	           <cfinclude template="includes/dsp_submit_button.cfm">
				</td>
			</tr>
			</form>	
		</cfoutput>		
</cfif>
	  	</table>
		<br><br>
	
