<cfparam name="url.continue" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.be" default=0>
<cfparam name="form.email" default=0>
<cfparam name="form.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="form.e" default=0>
<cfparam name="url.flip" default=0>


<cfinclude template="functions/Element_Progress.cfm">

	<cfset brand=evaluate(url.be & '_four.recordcount')>
	
	<cfset rate=evaluate('rate_' & url.be & '.recordcount')>
	<cfset rank=evaluate('rank_' & url.be & '.recordcount')>

<cfif form.email neq 0>




					<!--- Send off the exercise to the bakeoff emails chosen. --->
			<cfinclude template="functions/sendEmails_bakeoff.cfm">
			
			
					
	<cfoutput>
	     
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=4">
	</cfoutput>


<cfelseif form.experts neq 0>



					<cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_brand_feedback2.cfm?cid=#client.cid#&feedback=1&be=#form.be#&e=1

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=1">
	</cfoutput>

<cfelseif url.feedback neq 0>
	


	<!--- Update the rankings for this element. --->
		<cfinclude template="functions/calcRankings.cfm">
	
	
	
					
	<!--- Send an email alerting the client that someone has given feedback on their business. --->
<!--- <cfif url.flip eq 1> --->

	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #url.cid#
	</cfquery>
	

	<cfif rank gte 4 and rank lt 5>
	
						<cfmail to="#c.email#" from="info@JumpStartMarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#&rank=#rank#


Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>
						</cfif>
<!--- </cfif> --->


<!--- 			<cfif url.flip eq 0>					
					<cfoutput>
						<cflocation url="dsp_brand_feedback2.cfm?flip=1&cid=#url.cid#&be=#url.be#">
					</cfoutput>
			<cfelse> --->
					<cfoutput>
						<cflocation url="dsp_brand_feedback2.cfm?update=1&be=#url.be#">
					</cfoutput>	
			<!--- </cfif>	 --->

<cfelse>

	<cfif url.continue eq 1>
		<cfoutput>
			<cflocation url="dsp_brand_names2.cfm?be=#url.be#&sub=1">
		</cfoutput>
	<cfelse>
		<cfif url.be eq "brand">
			<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET generic_descriptor = '#form.generic_descriptor#'
				WHERE cid = #client.cid#
			</cfquery>
		</cfif>
	
		<cfoutput>
			<cflocation url="dsp_brand_names2.cfm?be=#url.be#&sub=1">
		</cfoutput>
	</cfif>

</cfif>