<cfinclude template="dsp_order_js.cfm">



<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.update" default=0>
<cfparam name="url.reorder" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.flip" default=0>
<cfparam name="url.sample" default=0>
<cfparam name="url.fid" default=0>
<cfparam name="url.rn" default=0>

<cfset variables.random = RandRange(1,10)>



<cfif url.rn eq 0>
	<cfset url.rn = RandRange(1,10)>
</cfif>




	<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, generic_descriptor, sub_brand_desc
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>

<cfquery name="names" datasource="#application.dsn#">
	SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
	FROM         t_bake_off
	WHERE     (cid = #url.cid#)
		AND business_element = '#trim(url.be)#'
		AND legal_clearance = 1
		AND chosen = 1
	ORDER BY id  <cfif url.rn lt 6>ASC<cfelse>DESC</cfif>
</cfquery>

<cfquery name="names2" datasource="#application.dsn#">
	SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
	FROM         t_bake_off
	WHERE     (cid = #url.cid#)
		AND business_element = '#trim(url.be)#'
		AND legal_clearance = 1
		AND chosen = 1
	ORDER BY id DESC
</cfquery>


<table width="100%" border="1" cellspacing="1" cellpadding="3" class="black14">
	<tr>
		<td width="40%" valign="top">
			<table width="100%" border="1" cellspacing="1" cellpadding="3" class="black14">
<cfif url.update neq 0>	
			<tr> 
				<td>				<br><br><br>
					<font color="green">*** <b>Thank you. Your feedback has been recorded.</b> ***</font>
				<br><br><br>
				<a href="http://www.jumpstartmarketer.com" class="bodylink3">www.jumpstartmarketer.com</a>
				</td>
			</tr>
<cfelse>
<!--- 			<tr> 
				<td>
					<b>Buisness Description:</b>
				</td>
			</tr>
			<tr> 
				<td>
					<cfoutput>#business.business_desc#</cfoutput>
				</td>
			</tr>	 --->

		<cfif url.flip eq 1>
			<tr>
				<td bgcolor="FFFFCC" align="center">
					<font color="green">
					THANK YOU FOR YOUR FEEDBACK.
					<br /><br />
					<strong>PLEASE ONCE AGAIN RE-ORDER THE <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> NAMES BELOW.
					<br /><br />
					THEN CLICK SUBMIT.</strong>
					</font>
					
				</td>
			</tr>
	<cfelse>
					
	<tr> 
		<td>
<font color="green">***</font> PLEASE <strong>READ</strong> THE <cfif url.be eq "brand">BUSINESS<cfelse>SUB BRAND</cfif> DESCRIPTION BELOW <font color="green">***</font>
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
<li>Should not define the product or service.</li>
<li>One or two words.</li>
<li>Easy to say.</li>
<li>Easy to remember.</li>
<li>Adds appropriate character.</li>
<li>EXAMPLES are; GoGurt (kid's yogurt) or Google (search engine).

<br><br> 
<strong>INSTRUCTIONS</strong>
<br><br>
<font color="green">
	<font color="black">1).</font> View the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names to the right.</li>
		<br><br>
	<font color="black">2).</font> Decide which ones would make a good <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> name.</li>
		<br><br>
	<font color="black">3).</font> Click & Drag on the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names to <strong>re-order the list</strong>.</li>
		<br><br>
	<font color="black">4).</font> Reorder the list from <strong>BEST - (TOP of List)</strong> to <strong>WORST - (BOTTOM of list)</strong>.</li>
		<br><br>
	<font color="black">5).</font> Click on the <strong>SUBMIT</strong> button at the bottom of the page.</li>
		<br><br>
</font>

				</td>
			</tr>
	</cfif>					
			</table>				
		</td>
		<td width="60%">
			<table width="100%" border="1" cellspacing="1" cellpadding="3" class="black14">
		<cfoutput>
			 <form name="business" action="act_brand_names2.cfm?be=#url.be#&cid=#url.cid#&feedback=1&flip=#url.flip#&fid=#url.fid#" method="post"> 
			
		</cfoutput>

			<cfif names.recordcount eq 0>
				<tr>
					<td>
						<strong>There are currently no legally cleared</strong>  <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names.
					</td>
				</tr>
			<cfelse>
			
		
				<tr>
						<td align="center">
			<cfset counter = 0>
			<ul id="sortableList">
				<cfoutput query="names">
				
					<cfset counter = counter + 1>
								

						<li id="#names.id#" class="sortableItem">
				<table border="1" cellpadding="5" width="400">
					<tr>
						<td align="center">
							<font size="+3">#names.element_text#</font> 	
							<br><br>
						 <font size="+1">#business.generic_descriptor#</font> 
							</td>
					</tr>
				</table>		
							</li>				
	
				</cfoutput>
			</ul>
			</td>
					
		</tr>	

		</cfif>		
		
			<tr> 
				<td align="center" bgcolor="336699">
					<cfif url.e eq 1>
						<input type="hidden" name="e" value=1>
					</cfif>

			<!--- <label for="itemIds" id="lbl_itemIds">New Item Order:</label> --->
			<input type="hidden" name="itemIds" id="itemIds" value="" size="20"/>
		
	 <cfif url.sample eq 0>
		<input type="submit" name="submitSort" id="submitSort" value="  SUBMIT  " />

		<cfelseif url.sample eq 1>

                
       <font color="white"> [The <strong>SUMBIT</strong> button has been disabled for this preview]</font>
     </cfif>

				</td>
			</tr>
			</form>	
		
</cfif>			
			</table>					
		</td>
	</tr>
</table>






		<br><br>
	
