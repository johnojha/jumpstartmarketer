
<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.updated" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.be" default=0><head>
	<title>
		MyPowerMarketer
	</title>
</head>


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

	<!--- See how many options the client has entered. --->
<cfinclude template="queries/client_entries.cfm">


<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, sub_brand_desc, generic_descriptor
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>




<cfinclude template="includes/back_link.cfm">


		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
<cfif url.updated neq 0>	
			<tr> 
				<td>
				<br><br><br>
					<font color="green">*** <b>Thank you. Your input has been recorded.</b> ***</font>
				<br><br><br>
				You may <strong>VIEW</strong> and <strong>EDIT</strong> your entries in the <a href="index.cfm?fa=bake_off&be=<cfoutput>#url.be#</cfoutput>" class="bakeofflink">Expert Feedback results section</a>.
				</td>
			</tr>
<cfelse>
	
	<cfif evaluate(url.be & '_client.recordcount') gt 0>
			<tr> 
				<td bgcolor="99CCCC">
					Below are the <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names you have already entered.
					<br><br>
					<font color="green">***</font> <strong>Please enter a total of 20. You need to add <cfoutput>#(20 - evaluate(url.be & '_client.recordcount'))# more.</cfoutput></strong> <font color="green">***</font>
					<br><br>
					You may <strong>VIEW</strong> and <strong>EDIT</strong> your entries in the <a href="index.cfm?fa=bake_off&be=<cfoutput>#url.be#</cfoutput>" class="bodylink3">Expert Feedback results section</a>.
				</td>
			</tr>
			<tr> 
				<td>

	<cfset counter = 1>
			<!--- Display current options for BRAND or SUB BRAND --->
		<table width="80%" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="336699">
		<cfoutput query="#url.be#_client">
			<tr>
				<td bgcolor="FFFFFF">
				#counter#).
				</td>
				<td bgcolor="FFFFFF">
					#evaluate(url.be & '_client.element_text')#	
				</td>
			</tr>
			<cfset counter = counter + 1>
		</cfoutput>	
		</table>
	<cfelse>
			<tr> 
				<td>
					
				</td>
			</tr>
			<tr> 
				<td>
                Your Generic Descriptor defines your Product or Service, so the function of your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> is not to define.
                <br>
                Your winning Generic Descriptor is: <cfoutput><font color="maroon">#business.generic_descriptor#</font></cfoutput>
				<br><br>
						
					<strong>A great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> NAME</strong> will conform to all five of the following characteristics:<br><br>
<li>Should not define the product or service.</li>
<li>One or two words.</li>
<li>Easy to say.</li>
<li>Easy to remember.</li>
<li>Adds appropriate character.</li>
<li>EXAMPLES are; GoGurt (kid's yogurt), Google (search engine) iPod (music player), Palm Pilot (organizer), Blackberry (phone/organizer), Clorox (fabric bleach), The Geek Squad (Computer service at Best Buy), Yellow Pages (business directory service), Vista (Windows system)

					<br><br>
               
                   <strong> Describe your product or service in one sentence below.</strong><br />
                    <font color="green">(This description will be shown to your friends as they give you feedback.)</font>
					<br><br>
					<strong>Enter in your 20 <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names below. Then click SUBMIT.</strong>
					<br><br>
					If you do not have all 20 now, you can come back and enter more later. 
					<br>
					
				</td>
			</tr>	
	</cfif>
			
			
			
		<cfoutput>
			<form name="business" action="act_brand_names_client.cfm?be=#url.be#" method="post" onsubmit="return checkDesc(this)">
            
            
          <tr>
            	<td>
                <strong>Product or Service Description</strong>: <font color="maroon">(Describe in one sentence)</font><br>
                <cfif url.be eq "brand">
					<cfif business.business_desc neq "">
					
               	 		<input type="text" name="business_desc" size="80" value="#business.business_desc#"> 

				
					<cfelse>

					
						<input type="text" name="business_desc" size="80"  value="#business.business_desc#"> 
					</cfif>
                <cfelseif url.be eq "sub_brand">
					<cfif business.sub_brand_desc neq "">
                		<input type="text" name="business_desc" size="80" value="#business.sub_brand_desc#"> 
					<cfelse>
						<input type="text" name="business_desc" size="80" value="#business.business_desc#">
					</cfif>
                </cfif>
                
                </td>
          </tr>          
            
	<tr>
		<td>


		
		<table width="80%" border="0" cellspacing="1" cellpadding="5" class="black14">
        

            
			<!--- If they have already entered some choices, but not all. --->
		<cfif evaluate(url.be & '_client.recordcount') neq 0 AND evaluate(url.be & '_client.recordcount') lt 20>
		
			<tr>
				<td>
			<cfset startingPoint = (evaluate(url.be & '_client.recordcount') + 1)>
				
				<cfloop index="i" from="#startingPoint#" to="20">
					<cfoutput>
						#i#). <input type="text" name="choice_#i#" size="20"> 
						<br><br>
					</cfoutput>
				</cfloop>				
				</td>
			</tr>
			
		<cfelseif evaluate(url.be & '_client.recordcount') eq 0>
		<!--- else If they have entered all or none.. --->
			<tr>
				<td>
					1). <input type="text" name="choice_1" size="20"> 
					<br><br>				
					2). <input type="text" name="choice_2" size="20"> 
					<br><br>
					3). <input type="text" name="choice_3" size="20"> 
					<br><br>
					4). <input type="text" name="choice_4" size="20"> 
					<br><br>
					5). <input type="text" name="choice_5" size="20"> 
					<br><br>
					6). <input type="text" name="choice_6" size="20"> 
					<br><br>
					7). <input type="text" name="choice_7" size="20"> 
					<br><br>
					8). <input type="text" name="choice_8" size="20"> 
					<br><br>
					9). <input type="text" name="choice_9" size="20"> 
					<br><br>
					10). <input type="text" name="choice_10" size="20"> 
					<br><br>
				</td>
				<td>
					11). <input type="text" name="choice_11" size="20"> 
					<br><br>
					12). <input type="text" name="choice_12" size="20"> 
					<br><br>
					13). <input type="text" name="choice_13" size="20"> 
					<br><br>
					14). <input type="text" name="choice_14" size="20"> 
					<br><br>
					15). <input type="text" name="choice_15" size="20"> 
					<br><br>
					16). <input type="text" name="choice_16" size="20"> 
					<br><br>
					17). <input type="text" name="choice_17" size="20"> 
					<br><br>
					18). <input type="text" name="choice_18" size="20"> 
					<br><br>
					19). <input type="text" name="choice_19" size="20"> 
					<br><br>
					20). <input type="text" name="choice_20" size="20"> 
					<br><br>
				</td>
			</tr>	
			
			</cfif>
			
		</table>	
			
		</td>
	</tr>

			<tr> 
				<td align="center" bgcolor="336699">
				
					<input type="hidden" name="be" value="#url.be#">
				
					<input type="submit" value="  SUBMIT  "> 
				</td>
			</tr>
			</form>	
		</cfoutput>		
</cfif>
	  	</table>
		
	
<cfinclude template="includes/back_link.cfm">