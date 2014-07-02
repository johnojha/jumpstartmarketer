<cfparam name="url.continue" default=0>
<cfparam name="form.email" default=0>
<cfparam name="form.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.feedback2" default=0>
<cfparam name="form.e" default=0>
<cfparam name="form.feedback_name" default=0>
<cfparam name="client.feedback_name" default=0>
<cfparam name="url.fid" default=0>

<cfinclude template="functions/Element_Progress.cfm">

<cfset fedbck2=evaluate('rate_' & url.be & '.recordcount') >
<cfset rate=evaluate('rate_' & url.be & '.recordcount')>
	


<cfif form.email neq 0>

	

					
					
					<!--- Send off the exercise to the bakeoff emails chosen. --->
			<cfinclude template="functions/sendEmails_bakeoff.cfm">



					
	<cfoutput>

		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=1&sentnew=0">
	</cfoutput>


<cfelseif form.experts neq 0>



					<cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_benefit_feedback.cfm?cid=#client.cid#&ladder1=1&be=#form.be#&e=1

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
	
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=1&sentnew=0">
	

	</cfoutput>

<cfelseif url.feedback neq 0>
	
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #form.cid#
	</cfquery>
	
	
	
				<cfif IsDefined("form.ladder1_text")>
						
						<cfset client.feedback_name = form.feedback_name>
						
						<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, date_submitted, ladder_id, benefit_id<cfif form.e eq 1>, expert</cfif>, sug_by_name,fid)
									VALUES
									(#form.cid#, '#c.name#', '#Replace(form.ladder1_text,"'","''")#', 'benefit', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 1, '#client.benefit_id#'<cfif form.e eq 1>, #form.e#</cfif>, '#client.feedback_name#','#url.fid#')
								
						</cfquery>
				
					<cfoutput>
						<cflocation url="dsp_benefit_feedback.cfm?cid=#form.cid#&be=benefit&ladder2=1">
					</cfoutput>
				
				<cfelseif IsDefined("form.ladder2_text")>
					
					<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, date_submitted, ladder_id, benefit_id<cfif form.e eq 1>, expert</cfif>, sug_by_name,fid)
									VALUES
									(#form.cid#, '#c.name#', '#Replace(form.ladder2_text,"'","''")#', 'benefit', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 2, '#client.benefit_id#'<cfif form.e eq 1>, #form.e#</cfif>, '#client.feedback_name#','#url.fid#')
								
						</cfquery>
				
					<cfoutput>
						<cflocation url="dsp_benefit_feedback.cfm?cid=#form.cid#&be=benefit&ladder3=1">
					</cfoutput>

				<cfelseif IsDefined("form.ladder3_text")>
					
					<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, date_submitted, ladder_id, benefit_id<cfif form.e eq 1>, expert</cfif>, sug_by_name,fid)
									VALUES
									(#form.cid#, '#c.name#', '#Replace(form.ladder3_text,"'","''")#', 'benefit', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 3, '#client.benefit_id#'<cfif form.e eq 1>, #form.e#</cfif>, '#client.feedback_name#','#url.fid#')
								
						</cfquery>
						<cfif benefit_count.recordcount gte 5 and  benefit_count.recordcount lt 6>
						<cfmail to="#c.email#" from="info@jumpstartmarketer.com" subject="You have received feedback!">
		
						Hello #c.name#,

		
						You have received feedback on an aspect of your business!
		
						Please go to:

						http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#form.cid#&be=#form.be#


						Sincerely,

		
					The Jumpstart Marketer Team					
	
						</cfmail>	
					</cfif>
				
					<cfoutput>
						<cflocation url="dsp_benefit_feedback.cfm?cid=#form.cid#&be=benefit&ladder6=1&fid=#url.fid#">
					</cfoutput>
	
				<cfelseif IsDefined("form.ladder4_text")>
					
					<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, date_submitted, ladder_id, benefit_id<cfif form.e eq 1>, expert</cfif>, sug_by_name,fid)
									VALUES
									(#form.cid#, '#c.name#', '#Replace(form.ladder4_text,"'","''")#', 'benefit', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 4, '#client.benefit_id#'<cfif form.e eq 1>, #form.e#</cfif>, '#client.feedback_name#','#url.fid#')
								
						</cfquery>
				
					<cfoutput>
						<cflocation url="dsp_benefit_feedback.cfm?cid=#form.cid#&be=benefit&ladder5=1">
					</cfoutput>
	
				<cfelseif IsDefined("form.ladder5_text")>
					
					<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, date_submitted, ladder_id, benefit_id<cfif form.e eq 1>, expert</cfif>, sug_by_name,fid)
									VALUES
									(#form.cid#, '#c.name#', '#Replace(form.ladder5_text,"'","''")#', 'benefit', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 5, '#client.benefit_id#'<cfif form.e eq 1>, #form.e#</cfif>, '#client.feedback_name#','#url.fid#')
								
						</cfquery>
						
		<!--- When last benefit is added Send an email alerting the client that someone has given feedback on their business. --->

<cfif benefit_count.recordcount gte 5 and  benefit_count.recordcount lt 6>
						<cfmail to="#c.email#" from="info@jumpstartmarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#form.cid#&be=#form.be#


Sincerely,

		
The Jumpstart Marketer Team					
	
	</cfmail>	
	</cfif>
				
					<cfoutput>
						<cflocation url="dsp_benefit_feedback.cfm?cid=#form.cid#&be=benefit&ladder6=1&fid=#url.fid#">
					</cfoutput>
	
	
	
								
				</cfif>

<cfelseif url.feedback2 neq 0>


		
		<!--- For rating the Phase 2 BENEFITS --->
		
	<cfif form.fieldnames eq 0>
		<cfoutput>
			<cflocation url="dsp_benefit_feedback2.cfm?radio=1&be=#url.be#&primary=#url.primary#&top_num=#url.top_num#&cid=#url.cid#&fid=#url.fid#&uuid=#url.uuid#">
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

<cfif evaluate('rate_' & url.be & '.recordcount') gte 5 and evaluate('rate_' & url.be & '.recordcount') lt 6>
	<cfmail to="#c.email#" from="info@jumpstartmarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#&feedback=#fedbck2#


Sincerely,

		
The Jumpstart Marketer Team					
	
	</cfmail>
	</cfif>
</cfif>		

    <cfset url.primary = url.primary + 1>
			
					<cfoutput>
						<cflocation url="dsp_benefit_feedback2.cfm?&be=#url.be#&primary=#url.primary#&top_num=#url.top_num#&cid=#url.cid#&fid=#url.fid#&uuid=#url.uuid#">
					</cfoutput>


		

<cfelse>

	<cfif url.continue eq 1>
		<cfoutput>
			<cflocation url="dsp_benefit_names.cfm?be=#url.be#&sub=1">
		</cfoutput>
	<cfelse>
		<cfquery name="business" datasource="#application.dsn#"> 
			UPDATE t_business 
				SET business_desc = '#form.business_desc#'
			WHERE cid = #client.cid#
		</cfquery>
	
		<cfoutput>
			<cflocation url="dsp_benefit_names.cfm?be=#url.be#&sub=1">
		</cfoutput>
	</cfif>

</cfif>