<cfparam name="url.be" default=0>

<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
		<tr>
			<td>
			<!--- <font color="yellow">
				Your <cfoutput>#replace(ucase(url.be),"_"," ","All")#</cfoutput> name has been added.
			</font> --->
			</td>
		</tr>
</table>

<cfif url.be eq "brand">
	<cfset url.be = "brand_logo">
<cfelseif url.be eq "sub_brand">
	<cfset url.be = "sub_brand_logo">
</cfif>


<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
		<tr>
			<td>
			<b>UPLOAD <cfoutput>#replace(ucase(url.be),"_"," ","All")#</cfoutput> image:</b>
			<br><br>
			<cfinclude template="includes/upload_instructions.cfm">
			
				<cfinclude template="components/upload.cfm">
			</td>
		</tr>	
		<cfif IsDefined("isValid")>
			<cfif isValid CONTAINS "uploaded">
			<tr>
				<td>
					Please click below to proceed.
					<br><br>
					<li><a href="index.cfm?fa=my_business&bg=1&existing_#url.be#=1" class="bodylink">Return to MY BUSINESS page</a></li>
				</td>
			</tr>		
			</cfif>
		</cfif>
</table>
	