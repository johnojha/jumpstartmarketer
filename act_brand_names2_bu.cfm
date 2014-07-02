<cfparam name="url.continue" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.be" default=0>
<cfparam name="form.email" default=0>
<cfparam name="form.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="form.e" default=0>

<cfif form.email neq 0>

	<cfquery name="business" datasource="#application.dsn#"> 
		UPDATE t_business 
			SET generic_descriptor = '#form.generic_descriptor#'
		WHERE cid = #client.cid#
	</cfquery>

					<cfset emailList = "1,2,3,4,5,6,7,8,9,10">
					<cfloop list="#emailList#" index="i">
						
						<cfif evaluate("form.email_" & i) neq "">  
						
						<cfmail to="#evaluate('form.email_' & i)#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		
Hello #evaluate("name_" & i)#,

		
#client.name# has requested your feedback on an aspect of their business!
		
Please go to:

http://jumpstartmarketer.com/dsp_brand_feedback2.cfm?cid=#client.cid#&feedback=1&be=#form.be#

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						</cfif> 
						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&be=#url.be#&sent=1">
	</cfoutput>


<cfelseif form.experts neq 0>

	<cfquery name="business" datasource="#application.dsn#"> 
		UPDATE t_business 
			SET generic_descriptor = '#form.generic_descriptor#'
		WHERE cid = #client.cid#
	</cfquery>

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
		<cflocation url="index.cfm?fa=my_business&be=#url.be#&sent=1">
	</cfoutput>

<cfelseif url.feedback neq 0>
	


	
	<cfset choiceList = "#form.fieldnames#">
					<cfloop list="#choiceList#" index="i">
					
					<cfset remove = left(i, 3)>
						
						<cfif evaluate("form." & i) neq "">  
						
							<cfquery name="in" datasource="#application.dsn#"> 
								INSERT INTO t_rankings 
									(cid, bid, ranking, date_ranked)
									VALUES
									(#url.cid#, '#Replace(i, remove, "")#', '#evaluate("form." & i)#','#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#')							
							</cfquery>
						
							<cfquery name="s" datasource="#application.dsn#"> 
								SELECT ranking 
									FROM  t_rankings 
									WHERE	bid = #Replace(i, remove, "")# 				
							</cfquery>
							
								<cfset choice_total = 0>
							
							<!--- Get the total of past ratings added together --->
						<cfloop query="s">
							<cfset choice_total = choice_total + s.ranking>						
						</cfloop>
					
							<cfset divider = s.recordcount>
				
							<!--- Set the new average for each choice for this particular business element session. --->
							<cfset variables.ranking_1 = choice_total / divider>

						
							<cfquery name="bake" datasource="#application.dsn#"> 
								UPDATE t_bake_off 
									SET rating = #NumberFormat(variables.ranking_1,"9.9")#
									WHERE	id = #Replace(i, remove, "")# 				
							</cfquery>
			
						</cfif> 
						
					</cfloop>
					
	<!--- Send an email alerting the client that someone has given feedback on their business. --->

	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #url.cid#
	</cfquery>
	
						<cfmail to="#c.email#" from="info@JumpStartMarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#


Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>
					
					<cfoutput>
						<cflocation url="dsp_brand_feedback2.cfm?update=1&be=#url.be#">
					</cfoutput>

<cfelse>

	<cfif url.continue eq 1>
		<cfoutput>
			<cflocation url="dsp_brand_names2.cfm?be=#url.be#&sub=1">
		</cfoutput>
	<cfelse>
		<cfquery name="business" datasource="#application.dsn#"> 
			UPDATE t_business 
				SET generic_descriptor = '#form.generic_descriptor#'
			WHERE cid = #client.cid#
		</cfquery>
	
		<cfoutput>
			<cflocation url="dsp_brand_names2.cfm?be=#url.be#&sub=1">
		</cfoutput>
	</cfif>

</cfif>