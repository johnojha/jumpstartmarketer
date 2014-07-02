
<cftransaction>
	<cfquery name="ratings" datasource="#application.dsn#"> 
		INSERT INTO t_ratings (cid, c_name, business_element, choice_1_text, choice_2_text, choice_3_text, 
								choice_1_rating, choice_2_rating, choice_3_rating, my_choice_rating, 
								rated_by_id, rated_by_name,	date_rated, eid) 
		
		VALUES (#form.sid#,'#form.s_name#','#trim(form.business_element)#','#form.choice_1#','#form.choice_2#', 
				'#form.choice_3#', '#form.my_choice#','#form.choice_1_rating#','#form.choice_2_rating#', '#form.choice_3_rating#',
				'#form.my_choice_rating#',#rated_by_id#, '#rated_by_name#','#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now(),"h:mm tt Z")#', #form.eid#)
	</cfquery>
	
	<!--- Get all the ratings so far, the recordcount is the amount to divide by --->
	<cfquery name="r" datasource="#application.dsn#"> 
		SELECT choice_1_rating, choice_2_rating, choice_3_rating, my_choice_rating
		FROM t_ratings 
		WHERE eid = #form.eid#
	</cfquery>
	
	<!--- Get the current rating of this element feedback session --->
	<cfquery name="rating" datasource="#application.dsn#"> 
		SELECT choice_1_rating, choice_2_rating, choice_3_rating
		FROM t_elements 
		WHERE id = #form.eid#
	</cfquery>

<cfif r.recordcount gt 1>	
		<cfset choice_1_total = 0>
		<cfset choice_2_total = 0>
		<cfset choice_3_total = 0>
		<cfset my_choice_total = 0>
		
		<!--- Get the total of past ratings added together --->
	<cfloop query="r">
		<cfset choice_1_total = choice_1_total + r.choice_1_rating>
		<cfset choice_2_total = choice_2_total + r.choice_2_rating>
		<cfset choice_3_total = choice_3_total + r.choice_3_rating>
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
		<cfset variables.rating_1 = choice_1_total / divider>
		<cfset variables.rating_2 = choice_2_total / divider>
		<cfset variables.rating_3 = choice_3_total / divider>
		<cfset variables.rating_my = my_choice_total / divider>		
		
<!--- 		<cfoutput>
			#choice_1_total#  #variables.rating_1# #divider#
		</cfoutput>
		<cfabort> --->
		
		<!--- Update the element session with the new ratings averages which include this latest rating  --->
	<cfquery name="elements" datasource="#application.dsn#"> 
		UPDATE t_elements 
			SET choice_1_rating = '#NumberFormat(variables.rating_1,"999")#',
				choice_2_rating = '#NumberFormat(variables.rating_2,"999")#',
				choice_3_rating = '#NumberFormat(variables.rating_3,"999")#',
				my_choice_rating = '#NumberFormat(variables.rating_my,"999")#'			
		WHERE id = #form.eid#
	</cfquery>
	<!--- Update the t_business table with the rating of my_choice --->
		<cfquery name="biz" datasource="#application.dsn#"> 
			SELECT #trim(form.business_element)# AS element
			FROM t_business 
			WHERE cid = #form.sid#
		</cfquery>
		<cfif biz.element eq form.my_choice>
			<cfquery name="elements" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET #trim(form.business_element)#_rating = '#NumberFormat(variables.rating_my,"999")#'			
				WHERE cid = #form.sid#
			</cfquery>
		</cfif>
		
<cfelse>	
	<cfquery name="elements" datasource="#application.dsn#"> 
		UPDATE t_elements 
			SET choice_1_rating = '#NumberFormat(form.choice_1_rating,"999")#',
				choice_2_rating = '#NumberFormat(form.choice_2_rating,"999")#',
				choice_3_rating = '#NumberFormat(form.choice_3_rating,"999")#',
				my_choice_rating = '#NumberFormat(form.my_choice_rating,"999")#'			
		WHERE id = #form.eid#
	</cfquery>	
		<!--- Update the t_business table with the rating of my_choice --->
		<cfquery name="biz" datasource="#application.dsn#"> 
			SELECT #trim(form.business_element)# AS element
			FROM t_business 
			WHERE cid = #form.sid#
		</cfquery>
		<cfif biz.element eq form.my_choice>
			<cfquery name="elements" datasource="#application.dsn#"> 
				UPDATE t_business 
					SET #trim(form.business_element)#_rating = '#NumberFormat(form.my_choice_rating,"999")#'			
				WHERE cid = #form.sid#
			</cfquery>
		</cfif>
</cfif>


</cftransaction>

	<cfoutput>
		<cflocation url="index.cfm?fa=my_business&rated=1">
	</cfoutput>