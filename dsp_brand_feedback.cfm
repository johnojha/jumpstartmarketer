
<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.insert" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.sample" default=0>
<cfparam name="url.fid" default=0>
<head>
	<title>
		PowerMarketer
	</title>
</head>




<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, sub_brand_desc, generic_descriptor, instructions_brand, instructions_sub_brand
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>
		
<cfquery name="c" datasource="#application.dsn#">
	SELECT name
	FROM t_clients
	WHERE id = #url.cid#
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
<font color="green">***</font> PLEASE <strong>REVIEW</strong> THE MARKETING TERM BELOW <font color="green">***</font>
<br><br>			
<li><strong><cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput></strong>: 
	<cfif url.be eq "brand">
		The identifier by which your product or service becomes known and referred to by the target consumer.</li>
	<cfelse>
		The identifier used to characterize a small group of products or services within its larger BRAND.
	</cfif>
 <br><br>	
<strong>A great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> NAME</strong> will conform to all five of the following characteristics:<br><br>
<li>Should not define the product or service.</li>
<li>One or two words.</li>
<li>Easy to say.</li>
<li>Easy to remember.</li>
<li>Adds appropriate character.</li>
<li>EXAMPLES are; GoGurt (kid's yogurt), Google (search engine) iPod (music player), Palm Pilot (organizer), Blackberry (phone/organizer), Clorox (fabric bleach), The Geek Squad (Computer service at Best Buy), Yellow Pages (business directory service), Vista (Windows system)
<br><br>
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
			<cfif url.be eq "brand">
				<cfif business.instructions_brand neq "">
     				<strong>Instructions/Comments from <cfoutput>#ucase(c.name)#</cfoutput>:</strong> <font color="maroon"><cfoutput>#business.instructions_brand#</cfoutput></font>
					<br><br>
				</cfif>
			<cfelse>
				<cfif business.instructions_sub_brand neq "">
     				<strong>Instructions/Comments from <cfoutput>#ucase(c.name)#</cfoutput>:</strong> <font color="maroon"><cfoutput>#business.instructions_sub_brand#</cfoutput></font>
					<br><br>
				</cfif>
			</cfif>
		
				</td>
			</tr>	
			<tr>
				<td>
				<strong>INSTRUCTIONS</strong>
					<br><br>
				<font color="black">1).</font>	<font color="green">Please come up with four <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names for my business, described above.</font>
					<br><br>
				<font color="black">2).</font>	<font color="green">Type your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names in the text boxes below, and click SUBMIT.</font>					
				</td>
			</tr>	
		<cfoutput>
			<form name="business" action="act_brand_names.cfm?be=#url.be#&feedback=1&fid=#url.fid#" method="post">
			<tr>
				<td>
					1). <input type="text" name="choice_1" size="30"> 
					<br><br>
					2). <input type="text" name="choice_2" size="30"> 
					<br><br>
					3). <input type="text" name="choice_3" size="30"> 
					<br><br>
					4). <input type="text" name="choice_4" size="30"> 
					<br><br>
				</td>
			</tr>	
			<!--<tr>
				<td>
					Your Name: <input type="text" name="sug_by_name" size="30"> 
					<br><br>
					Email: <input type="text" name="sug_by_email" size="30"> 
					<br><br>
				</td>
			</tr>	-->
			<tr> 
				<td align="center" bgcolor="336699">
					<cfif url.e eq 1>
						<input type="hidden" name="e" value=1>
					</cfif>
					<input type="hidden" name="cid" value="#url.cid#">
					<input type="hidden" name="be" value="#url.be#">

					<input type="hidden" name="sug_by_name" size="30" value="name"> 
					<input type="hidden" name="sug_by_email" size="30" value="email"> 
				
                <cfinclude template="includes/dsp_submit_button.cfm">
                
				</td>
			</tr>
			</form>	
		</cfoutput>		
</cfif>
	  	</table>
		<br><br>
	
