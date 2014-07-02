	<cfparam name="url.names" default=0>
	<cfparam name="url.rate" default=0>
	<cfparam name="url.eye" default=0>
	<cfparam name="url.be" default=0>
	<cfparam name="url.phase" default=0>
	<cfparam name="url.benefit_one" default=0>


	<cfif url.be eq "brand" OR url.be eq "sub_brand">
		<cfif url.phase eq 4>
			<cfset url.names = 2>
		<cfelseif url.phase eq 3>	
			<cfset url.rate = 1>
		</cfif>
	</cfif>
	
	

						<cfmail to="#client.email#" from="info@JumpStartMarketer.com" subject="[SAMPLE] Feedback Request from JumpstartMarketer.com ">
		
Hello [Name of Person],

		
#client.name# has requested your feedback on an aspect of their business!
		
Please go to:

<cfif url.choice eq 1>
http://jumpstartmarketer.com/dsp_choice_feedback.cfm?cid=#client.cid#&feedback=1&be=#url.be#&sample=1
<cfelse>
http://jumpstartmarketer.com/dsp_<cfif url.be eq "sub_brand">brand<cfelse><cfif url.be eq "generic_descriptor">gen_desc<cfelse>#url.be#</cfif></cfif>_feedback<cfif url.names eq 2>2</cfif><cfif url.rate eq 1>_rate</cfif>.cfm?cid=#client.cid#&feedback=1&be=#url.be#<cfif url.be eq "benefit">&ladder1=1</cfif>&sample=1
</cfif>

Your participation is much appreciated.

Sincerely,

		
The My Power Marketer Team
			
						</cfmail>
<center>
	<table bgcolor="C8D2FB" cellpadding="10" width="300" height="200">
		<tr>
			<td>	
				<font color="black" size="+1" face="arial">			
			<cfoutput>
				A SAMPLE exercise for #replace(ucase(url.be),"_"," ","All")# - Phase #url.phase# has been sent to your email address for your review.
			</cfoutput>
				</font>	
			</td>
		</tr>
	</table>
</center>

