 <cfparam name="form.suggestion_1" default="">
<cfparam name="form.suggestion_2" default="">
<cfparam name="form.suggestion_3" default="">
<cfparam name="url.primary" default=1>
<cfparam name="url.top_num" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="url.rid" default=0>
<cfparam name="url.eid" default=0>
<cfparam name="form.eid" default=0>
<cfparam name="form.sid" default=0>

<!---  <cfoutput>#url.primary#, #form.choice_1#, #form.choice_2#</cfoutput>
<cfabort>  --->


<cfquery name="consumer_#trim(form.business_element)#" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_ratings
			WHERE     (cid = #client.cid#)
				AND business_element = '#trim(form.business_element)#'
		</cfquery>
<cfset conss=evaluate('consumer_' & trim(form.business_element) & '.recordcount')>




<cfif url.uuid eq 0>	
	<cfset url.uuid = CreateUUID()>
</cfif>

	<cfif url.primary eq 1>
    
    	<!--- If the first option is being rated. --->
        <cfquery name="ratings" datasource="#application.dsn#"> 
            INSERT INTO t_ratings (cid, c_name, business_element, choice_1_text,
                                    choice_1_rating, 
                                    rated_by_id, rated_by_name,	date_rated, eid, UUID) 
            
            VALUES (#form.sid#,'#form.s_name#','#trim(form.business_element)#','#form.choice_1#', '#form.choice_1_rating#',
                        #form.rated_by_id#, '#form.rated_by_name#','#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now(),"h:mm tt Z")#', #form.eid#, '#url.uuid#')
        
       		SELECT SCOPE_IDENTITY() AS rid
        
        </cfquery>
        
        <cfset url.rid = ratings.rid>
        
        		<!--- <cfoutput>
			#ratings.rid#
		</cfoutput>
		<cfabort>  --->
        
	<cfelseif url.primary eq 2>
    
   		 <!--- If the second option is being rated. --->
    
  	  <cfquery name="ratings" datasource="#application.dsn#"> 
		UPDATE t_ratings 
        SET choice_2_text = '#form.choice_2#', 
        	choice_2_rating = '#form.choice_2_rating#'
            WHERE id = #url.rid#
	  </cfquery>
    
 	<cfelseif url.primary eq 3>
    
  	  <!--- If the third option is being rated. --->
  	  <cfquery name="ratings" datasource="#application.dsn#"> 
		UPDATE t_ratings 
        SET choice_3_text = '#form.choice_3#', 
        	choice_3_rating = '#form.choice_3_rating#'
            WHERE id = #url.rid#
	  </cfquery>   
    
    </cfif>
    
    
    
	<!--- Get all the ratings so far, the recordcount is the amount to divide by --->
	<cfquery name="r" datasource="#application.dsn#"> 
		SELECT choice_1_rating, choice_2_rating, choice_3_rating, my_choice_rating
		FROM t_ratings 
		WHERE eid = #form.eid#
		AND
	<cfif url.primary eq 1>  
		choice_1_rating IS NOT NULL
	 <cfelseif url.primary eq 2> 
		choice_2_rating IS NOT NULL
	 <cfelseif url.primary eq 3> 
		choice_3_rating IS NOT NULL
	</cfif>
	</cfquery>
	
	<!--- Get the current rating of this element feedback session --->
	<cfquery name="rating" datasource="#application.dsn#"> 
		SELECT choice_1_rating, choice_2_rating, choice_3_rating
		FROM t_elements 
		WHERE id = #form.eid#
	</cfquery>

			<!--- If there has already been ratings --->
<cfif r.recordcount gt 1>	
	
    <cfif url.primary eq 1>  
		<cfset choice_1_total = 0>
	 <cfelseif url.primary eq 2> 
		<cfset choice_2_total = 0>
	 <cfelseif url.primary eq 3> 
		<cfset choice_3_total = 0>
	</cfif>
		<cfset my_choice_total = 0>
		

		
	<!--- <cfoutput>#r.my_choice_rating# #my_choice_total#</cfoutput>	
	<cfabort> --->
		
		<!--- Get the total of past ratings added together --->
	<cfloop query="r">
		<cfif r.my_choice_rating eq "">
			<cfset r.my_choice_rating = 0>
		</cfif>
		<cfif r.choice_1_rating eq "">
			<cfset r.choice_1_rating = 0>
		</cfif>
		<cfif r.choice_2_rating eq "">
			<cfset r.choice_2_rating = 0>
		</cfif>
		<cfif r.choice_3_rating eq "">
			<cfset r.choice_3_rating = 0>
		</cfif>
	<cfif url.primary eq 1>  
		<cfset choice_1_total = choice_1_total + r.choice_1_rating>
	<cfelseif url.primary eq 2> 
		<cfset choice_2_total = choice_2_total + r.choice_2_rating>
	 <cfelseif url.primary eq 3> 
		<cfset choice_3_total = choice_3_total + r.choice_3_rating>
	</cfif>
		<cfset my_choice_total = my_choice_total + r.my_choice_rating>
	</cfloop>
		<!--- Add the latest rating to each total for a new total 
		<cfset choice_1_total = choice_1_total + form.choice_1_rating>
		<cfset choice_2_total = choice_2_total + form.choice_2_rating>
		<cfset choice_3_total = choice_3_total + form.choice_3_rating>
		<cfset my_choice_total = my_choice_total + form.my_choice_rating>--->
		
		<!--- Set the amount to divide by as the recordcount of past ratings, 
		this includes the latest one because the rating insert was already done  --->
		<cfset divider = r.recordcount>
		

		
		<!--- Set the new average for each choice for this particular business element session. --->
	<cfif url.primary eq 1> 
		<cfset variables.rating_1 = choice_1_total / divider>
	<cfelseif url.primary eq 2> 
		<cfset variables.rating_2 = choice_2_total / divider>
	<cfelseif url.primary eq 3> 
		<cfset variables.rating_3 = choice_3_total / divider>
	</cfif>
		<cfset variables.rating_my = my_choice_total / divider>		
		
		
<!--- 		<cfoutput>
			#choice_1_total#  #variables.rating_1# #divider#
		</cfoutput>
		<cfabort> --->
		
		<!--- Update the element session with the new ratings averages which include this latest rating  --->
	<cfquery name="elements" datasource="#application.dsn#"> 
		UPDATE t_elements 
			SET choice_#url.primary#_rating = '#NumberFormat(evaluate('variables.rating_' & url.primary),"999")#'
		WHERE id = #form.eid#
	</cfquery>
			<!--- If the element is equal to the current choice update the current choice rating --->
            
    <cfif url.primary eq 1>  
		<cfquery name="b1" datasource="#application.dsn#"> 
			UPDATE t_business 
			SET #trim(form.business_element)#_rating = '#NumberFormat(variables.rating_1,"999")#'
			WHERE cid = #form.sid#
			AND #trim(form.business_element)# = '#form.choice_1#'
		</cfquery>
    <cfelseif url.primary eq 2>
		<cfquery name="b2" datasource="#application.dsn#"> 
			UPDATE t_business 
			SET #trim(form.business_element)#_rating = '#NumberFormat(variables.rating_2,"999")#'
			WHERE cid = #form.sid#
			AND #trim(form.business_element)# = '#form.choice_2#'
		</cfquery>
    <cfelseif url.primary eq 3>
		<cfquery name="b3" datasource="#application.dsn#"> 
			UPDATE t_business 
			SET #trim(form.business_element)#_rating = '#NumberFormat(variables.rating_3,"999")#'
			WHERE cid = #form.sid#
			AND #trim(form.business_element)# = '#form.choice_3#'
		</cfquery>	
    </cfif>	
	
		<!--- Insert suggestions 	
			<cfset sugList = "1,2,3">	
	<cfloop list="#sugList#" index="i"> 
		<cfif evaluate("form.suggestion_" & i) neq "">
		<cfquery name="suggestions" datasource="#application.dsn#"> 
			INSERT INTO t_suggestions 
				(cid, c_name, business_element, element_suggestion, suggested_by_id, suggested_by_name,	date_suggested, eid) 
			
			VALUES (#form.sid#,'#form.s_name#','#trim(form.business_element)#','#evaluate("form.suggestion_" & i)#',
						#form.rated_by_id#, '#form.rated_by_name#','#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now(),"h:mm tt")#', #form.eid#)
		</cfquery>	
		</cfif>
	</cfloop>	--->

	<!--- Send an email alerting the client that someone has given feedback on their business. --->
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #form.sid#
	</cfquery>

<!--- <cfoutput>
	#c.email#
</cfoutput>
<cfabort>
 --->
<cfif url.primary eq 3>

<cfif conss gte 5 and conss lt 6>


						<cfmail to="#c.email#" from="info@JumpStartMarketer.com" subject="You have received feedback!">
		
Hello #form.s_name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=archives&cid=#form.sid#&be=#trim(form.business_element)#&sha=#conss#


Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>
						</cfif>

						
</cfif>
		
		
<cfelse>	<!--- ELSE If there has not already been ratings --->


	<cfquery name="elements" datasource="#application.dsn#"> 
		UPDATE t_elements 
			SET choice_#url.primary#_rating = '#NumberFormat(evaluate('form.choice_' & url.primary & '_rating'),"999")#'		
		WHERE id = #form.eid#
	</cfquery>	
	
		<!--- Insert suggestions 	
			<cfset sugList = "1,2,3">	
	<cfloop list="#sugList#" index="i"> 
	<cfif evaluate("form.suggestion_" & i) neq "">
		<cfquery name="suggestions" datasource="#application.dsn#"> 
			INSERT INTO t_suggestions 
				(cid, c_name, business_element, element_suggestion, suggested_by_id, suggested_by_name,	date_suggested, eid) 
			
			VALUES (#form.sid#,'#form.s_name#','#trim(form.business_element)#','#evaluate("form.suggestion_" & i)#',
						#form.rated_by_id#, '#form.rated_by_name#','#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now(),"h:mm tt")#', #form.eid#)
		</cfquery>	
	</cfif>
	</cfloop>	
	--->
	
	<!--- Send an email alerting the client that someone has given feedback on their business. --->
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #form.sid#
	</cfquery>






	<cfif url.primary eq 3>

	
<cfif conss gte 5 and conss lt 6>
	
						<cfmail to="#c.email#" from="info@JumpStartMarketer.com" subject="You have received feedback!">
		
Hello #form.s_name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=archives&cid=#form.sid#&be=#trim(form.business_element)#&rest=#conss#


Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>

						</cfif>
						
                        
	</cfif>
		
</cfif>

	<cfif url.primary eq 3>
    	<cflocation url="index.cfm?fa=thank_you">
    </cfif>

<cfset url.primary = url.primary + 1>
	
	<cfoutput>
		<cflocation url="dsp_feedback.cfm?primary=#url.primary#&eid=#form.eid#&sid=#form.sid#&rid=#url.rid#&uuid=#url.uuid#">
	</cfoutput>