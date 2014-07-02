<cfparam name="url.continue" default=0>
<cfparam name="form.email" default=0>
<cfparam name="form.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.feedback_rate" default=0>
<cfparam name="form.e" default=0>
<cfparam name="url.rate" default=0>
<cfparam name="url.primary" default=1>
<cfparam name="url.top_num" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="url.fid" default=0>
<cfparam name="form.fieldnames" default=0>
<cfparam name="form.instructions_brand" default="">



<cfinclude template="functions/Element_Progress.cfm">

	<cfset brand=evaluate(url.be & '_four.recordcount')>
	
	<cfset rate=evaluate('rate_' & url.be & '.recordcount')>
	<cfset rank=evaluate('rank_' & url.be & '.recordcount')>

<cfif form.email neq 0>

		<cfif url.be eq "brand">
			<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET business_desc = '#form.business_desc#'
                   <cfif url.rate eq 0> ,instructions_brand = '#form.instructions_brand#'</cfif>
				WHERE cid = #client.cid#
			</cfquery>
		<cfelse>
			<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET sub_brand_desc = '#form.business_desc#'
						<cfif url.rate eq 0>,instructions_sub_brand = '#form.instructions_sub_brand#'</cfif>
				WHERE cid = #client.cid#
			</cfquery>		
		</cfif>



					<!--- Send off the exercise to the bakeoff emails chosen. --->
			<cfinclude template="functions/sendEmails_bakeoff.cfm">
					
					
					
					
	<cfoutput>
	
	<cfif rate gte 5 and rank lt 5>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=4&rate=#rate#&rank=#rank#&brand=#brand#&sentnew=0">
	</cfif>

	<cfif brand gte 5 and rate lt 5>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=3&rate=#rate#&rank=#rank#&brand=#brand#&sentnew=0">
	</cfif>

	<cfif brand lt 5 >
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=1&rate=#rate#&rank=#rank#&brand=#brand#&sentnew=0">
	</cfif>
	
		
	
	</cfoutput>


<cfelseif form.experts neq 0>
			 
							
		<cfif url.be eq "brand">
			<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET business_desc = '#form.business_desc#'
				WHERE cid = #client.cid#
			</cfquery>
		<cfelse>
			<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET sub_brand_desc = '#form.business_desc#'
				WHERE cid = #client.cid#
			</cfquery>		
		</cfif>

					<cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

<cfif url.rate eq 0>
http://jumpstartmarketer.com/dsp_brand_feedback.cfm?cid=#client.cid#&feedback=1&be=#form.be#
<cfelse>
http://jumpstartmarketer.com/dsp_brand_feedback_rate.cfm?cid=#client.cid#&feedback=1&be=#form.be#
</cfif>

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=1&sentnew=0">
	</cfoutput>

<cfelseif url.feedback neq 0>

	<cfset variables.UUID = CreateUUID()>
	
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #form.cid#
	</cfquery>
	
	<cfset choiceList = "1,2,3,4">
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.choice_" & i) neq "">  
						
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, date_submitted, UUID, sug_by_name, sug_by_email, fid<cfif form.e eq 1>, expert</cfif>)
									VALUES
									(#form.cid#, '#c.name#', '#replace(evaluate('form.choice_' & i),"'","''")#', '#ucase(form.be)#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#','#variables.uuid#', '#form.sug_by_name#', '#form.sug_by_email#',#url.fid#<cfif form.e eq 1>, #form.e#</cfif>)
								
							</cfquery>
			
						</cfif> 
						
					</cfloop>
					
					
	<!--- Send an email alerting the client that someone has given feedback on their business. --->



	

<cfif brand gte 4 and brand lt 5>


						<cfmail to="#c.email#" from="info@jumpstartmarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#form.cid#&be=#url.be#&brand=#brand#&rate=#rate#&rank=#rank#


Sincerely,

		
The Jumpstart Marketer Team
						</cfmail>
					
	</cfif>				
					<cfoutput>
						<cflocation url="dsp_brand_feedback.cfm?insert=1">
					</cfoutput>
					
                    
<cfelseif url.feedback_rate neq 0>



	<cfif form.fieldnames eq 0>
		<cfoutput>
			<cflocation url="dsp_brand_feedback_rate.cfm?radio=1&be=#url.be#&primary=#url.primary#&top_num=#url.top_num#&cid=#url.cid#&uuid=#url.uuid#">
		</cfoutput>
    </cfif>

		<!--- Calculate and Update ratings for this element. --->
	<cfinclude template="functions/calcRatings.cfm">



	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #url.cid#
	</cfquery>		
				
	<!--- Send an email alerting the client that someone has given feedback on their business. --->

	<cfif url.primary eq url.top_num>

	<cfif rate gte 5 and rate lt 6>


						<cfmail to="#c.email#" from="info@jumpstartmarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#&brand=#brand#&rate=#rate#&rank=#rank#&rate=y


Sincerely,

		
The Jumpstart Marketer Team					
	
    
	</cfmail>

	</cfif>
    	
	</cfif>
    
    <cfset url.primary = url.primary + 1>
					
					<cfoutput>
						<cflocation url="dsp_brand_feedback_rate.cfm?update=1&be=#url.be#&primary=#url.primary#&top_num=#url.top_num#&cid=#url.cid#&uuid=#url.uuid#">
					</cfoutput>


<cfelse>

	<cfif url.continue eq 1>
		<cfoutput>
			<cflocation url="dsp_brand_names.cfm?be=#url.be#&sub=1">
		</cfoutput>
	<cfelse>
		<cfif url.be eq "brand">
			<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET business_desc = '#form.business_desc#',
						instructions_brand = '#form.instructions_brand#'
				WHERE cid = #client.cid#
			</cfquery>
		<cfelse>
			<cfquery name="business" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET sub_brand_desc = '#form.sub_brand_desc#',
						instructions_sub_brand = '#form.instructions_sub_brand#'
				WHERE cid = #client.cid#
			</cfquery>		
		</cfif>
		<cfoutput>
			<cflocation url="dsp_brand_names.cfm?be=#url.be#&sub=1">
		</cfoutput>
	</cfif>

</cfif>