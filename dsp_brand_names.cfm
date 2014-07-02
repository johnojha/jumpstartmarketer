
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.rate" default=0>
<cfparam name="url.be" default=0><head>	
	<title>
		MyPowerMarketer Assignments
	</title>


<script language="javascript">


	function checkDesc() {

		if (document.business.business_desc.value == "")
		
		{
	alert("Please type in a \"Product or Service Description\".");
    business.business_desc.focus();
    return (false);		
		}
		
		

	}

</script>

<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, sub_brand_desc, instructions_brand, instructions_sub_brand
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

	<cfquery name="names1" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = '#url.be#'
			AND legal_clearance = 1
		ORDER BY id
	</cfquery>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
      
     <cfif url.rate eq 1>  
        <cfif names1.recordcount eq 0>
        	<tr>
            	<td align="center" bgcolor="FFFFCC">
                	<font color="red"><strong>STOP!</strong> You must leagally clear your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names before you send them out to be rated.</font><br />
                    
                 <li>   Go here - <a href="index.cfm?fa=bake_off&be=<cfoutput>#url.be#</cfoutput>" class="bakeofflink">Check off each name that is available</a>, and click the <strong>"Update Available Names"</strong> button at the bottom of the page</a></li>
                    
                    <cfinclude template="includes/back_link.cfm">
                </td>
            </tr>
        </cfif>
       </cfif>
        
	<cfif url.sub eq 0>
			<cfoutput>
			<form name="business" action="act_brand_names.cfm?be=#url.be#<cfif url.rate eq 1>&rate=1</cfif>" method="post" onsubmit="return checkDesc(this)">
			<tr> 
				<td>
			<cfif url.rate eq 1>
				<strong>Phase 3</strong>: Your experts will RATE the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names that are legally cleared. 
				<br><br>
			<cfelse>
				<strong>Phase 2</strong>:	Your group of experts will be sent an email. The email will contain a link to a page online where they can make their four suggestions. 
				<br><br>
			</cfif>	
				<font color="green">
				
				<cfif url.email neq 0>
					 <cfif url.be eq "brand">Make any updates to your business<cfelse>Enter your Sub Brand</cfif> description below. 
					<br><br>					
<!--- 					Please enter email addresses and contact names of the "Experts" that this excercise will be sent to.
					<br><br> --->
					Then click "Submit"
					<br><br>
				<cfelseif url.experts neq 0>
					<cfif url.be eq "brand">Make any updates to your business<cfelse>Enter your Sub Brand</cfif> description below and click "Submit"

					<br><br>
					Your group of experts will be automatically contacted, and will provide the required feedback for this excercise. 
					<br><br>
				<cfelse>
					Make any updates to your Product or Service description below and click "Submit"
					
					
					<br><br>
				</cfif>
					
				</font>
				</td>
			</tr>	

			<tr> 
				<td>
					 <strong>Product or Service Description</strong>: (Describe in one sentence)<br>
				</td>
			</tr>
			<tr> 
				<td>
				 <cfif url.be eq "brand">
               	 	<input type="text" name="business_desc" size="80" value="#business.business_desc#"> 
                <cfelseif url.be eq "sub_brand">
					<input type="text" name="business_desc" size="80" value="#business.sub_brand_desc#">
                </cfif>
				<br><br>
				</td>
			</tr>	
		<cfif url.rate eq 0>
<!--- 			<tr> 
				<td>
					 <strong>Additional Comments or Instructions for your friends</strong>: (limit to one sentence)<br>
				</td>
			</tr>
			<tr> 
				<td>
				<cfif url.be eq "brand">
               	 	<input type="text" name="instructions_brand" size="80" value="#business.instructions_brand#"> 
                <cfelseif url.be eq "sub_brand">
					<input type="text" name="instructions_sub_brand" size="80" value="#business.instructions_sub_brand#">
                </cfif>
				<br><br>
				</td>
			</tr>	 --->
        </cfif>
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
