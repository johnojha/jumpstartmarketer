<cfparam name="url.continue" default=0>
<cfparam name="form.email" default=0>
<cfparam name="form.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.feedback2" default=0>
<cfparam name="url.e" default=0>
<cfparam name="url.phase" default=0>
<cfparam name="url.uuid" default=0>


<cfinclude template="functions/Element_Progress.cfm">
<cfset rank=evaluate('rank_' & url.be & '.recordcount')>

<cfset rate=evaluate('rate_' & url.be & '.recordcount')>




<cfif form.email neq 0>
 
 
  <cfif url.phase eq 1>
  
	<cfquery name="del" datasource="#application.dsn#"> 
		DELETE FROM
		t_bake_off 
		WHERE cid = #client.cid#
		AND business_element = 'attributes'
	</cfquery>
	
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>

	
<cfset counter = 0>	

	<cfset choiceList = "1,2,3,4,5,6,7,8,9,10">
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.att" & i) neq "">  
						
							<cfset counter = counter + 1>
							
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, att_n)
									VALUES
									(#client.cid#, '#client.name#', '#Replace(evaluate('form.att' & i),"'","''")#', '#ucase(form.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', #counter#)							
							</cfquery>
								
						</cfif> 
						
					</cfloop>
	
					
	<cfoutput>
		<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&updated=1">
	</cfoutput>
				
					
		<cfelseif url.phase eq 2>					
					
					<!--- Send off the exercise to the bakeoff emails chosen. --->
			<cfinclude template="functions/sendEmails_bakeoff.cfm">

					
			<cfoutput>
				<cflocation url="index.cfm?fa=elements&be=#url.be#&bg=1&sent=2&sentnew=0">
			</cfoutput>

		</cfif>








<cfelseif form.experts neq 0>

	<cfquery name="del" datasource="#application.dsn#"> 
		DELETE FROM
		t_bake_off 
		WHERE cid = #client.cid#
		AND business_element = 'attributes'
	</cfquery>
	
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>

	<cfquery name="update_benefit" datasource="#application.dsn#"> 
		UPDATE t_business 
		SET benefit = '#form.benefit#'
		WHERE cid = #client.cid#
	</cfquery>
		
	<cfset choiceList = "1,2,3,4,5">
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.phys_att" & i) neq "">  
						
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, att_type, expert)
									VALUES
									(#client.cid#, '#client.name#', '#evaluate('form.phys_att' & i)#', '#ucase(form.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 'physical', 1)							
							</cfquery>
			
						</cfif> 
						
					</cfloop>
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.per_att" & i) neq "">  
						
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, att_type, expert)
									VALUES
									(#client.cid#, '#client.name#', '#evaluate('form.per_att' & i)#', '#ucase(form.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 'performance', 1)							
							</cfquery>
			
						</cfif> 
						
					</cfloop>

					<cfset emailList = "ericc@chambersgroup.com,keith@chambersgroup.com,brandenc@chambersgroup.com,dtkelly72@yahoo.com,john_ojha@yahoo.com">
					<cfloop list="#emailList#" index="i">
						
						<cfmail to="#i#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		

		
#client.name# has requested your expert feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_attributes_feedback.cfm?cid=#client.cid#&feedback=1&be=#form.be#&e=1

Your participation is much appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						
					</cfloop>
					
	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&be=#url.be#&sent=1&sentnew=0">
	</cfoutput>

<cfelseif url.feedback2 neq 0>
	
	
	
			<!--- Update the rankings for this element. --->
	<cfinclude template="functions/calcRankings.cfm">
	
					
				
					
	<!--- Send an email alerting the client that someone has given feedback on their business. --->


	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #url.cid#
	</cfquery>
	
	<cfif rank gte 4 and rank lt 5>
						<cfmail to="#c.email#" from="info@jumpstartmarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#&rank=#rank#


Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

</cfif>

					<cfoutput>
						<cflocation url="dsp_brand_feedback2.cfm?update=1&be=#url.be#">
					</cfoutput>	

					
<cfelseif url.feedback eq 1>


	<!--- Include the code for  RATING EXERCISE FEEDBACK..... --->
	
	<cfif form.fieldnames eq 0>
		<cfoutput>
			<cflocation url="dsp_#url.be#_feedback.cfm?radio=1&be=#url.be#&primary=#url.primary#&top_num=#url.top_num#&cid=#url.cid#&uuid=#url.uuid#">
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
						<cfmail to="#c.email#" from="info@MyPowerMarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=bake_off&cid=#url.cid#&be=#url.be#&rate=#rate#


Sincerely,

		
The Jumpstart Marketer Team					
	
	</cfmail>
	</cfif>
	
	</cfif>
    
    <cfset url.primary = url.primary + 1>
    				
					<cfoutput>
						<cflocation url="dsp_#url.be#_feedback.cfm?update=1&be=#url.be#&primary=#url.primary#&top_num=#url.top_num#&cid=#url.cid#&uuid=#url.uuid#">
					</cfoutput>



<cfelse>

	<cfquery name="del" datasource="#application.dsn#"> 
		DELETE FROM
		t_bake_off 
		WHERE cid = #client.cid#
		AND business_element = 'attributes'
	</cfquery>
	
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>
	
	<cfset choiceList = "1,2,3,4,5">
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.phys_att" & i) neq "">  
						
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, att_type)
									VALUES
									(#client.cid#, '#client.name#', '#evaluate('form.phys_att' & i)#', '#ucase(form.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 'physical')							
							</cfquery>
			
						</cfif> 
						
					</cfloop>
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.per_att" & i) neq "">  
						
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, att_type)
									VALUES
									(#client.cid#, '#client.name#', '#evaluate('form.per_att' & i)#', '#ucase(form.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 'performance')							
							</cfquery>
			
						</cfif> 
						
					</cfloop>
	
		<cfoutput>
			<cflocation url="dsp_attributes_names.cfm?be=#url.be#&sub=1">
		</cfoutput>


</cfif>