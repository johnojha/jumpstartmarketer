		<!--- Get client criteria --->
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT business_type 
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>
		<!--- get peer criteria to establish who should be sent emails requesting feedback --->
	<cfquery name="temp" datasource="#application.dsn#"> 
		SELECT id, email, name
		FROM t_consumer_emails
		WHERE ID IN (1,3,4,5,21,22,23,24,25,26,27,28,1023) 
	</cfquery>

<!--- <cfoutput query="temp">
	#temp.email# <br />
</cfoutput> --->

<!--- 	<cfoutput>#form.choice_1# --- #form.choice_2#</cfoutput>--->
    <!--- <cfabort>  --->

		<!--- Insert business element, this provides a platform to rate the session --->
	<cfquery name="element" datasource="#application.dsn#"> 
		INSERT INTO t_elements (cid, c_name, business_element, choice_1, choice_2, choice_3, date_submitted) 
		
		VALUES (#client.cid#,'#client.name#','#trim(form.business_element)#','#trim(Replace(form.choice_1,""""," "))#','#trim(Replace(form.choice_2,""""," "))#', 
				'#trim(Replace(form.choice_3,""""," "))#','#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#')
	</cfquery>
		
	<cfquery name="getid" datasource="#application.dsn#"> 
		SELECT MAX(id) as elementid
		FROM t_elements 
	</cfquery>
		<!--- Set the current MAIN choice 
	<cfquery name="business" datasource="#application.dsn#"> 
		UPDATE t_business 
			SET #form.business_element# = '#form.my_choice#'
		WHERE cid = #client.cid#
	</cfquery>--->



<!--- Send to all those specified in the temp criteria to get feedback --->
<!--- <cfoutput query="temp">

	<cfquery name="mail" datasource="#application.dsn#"> 
		INSERT INTO t_mail 
		(sid, s_name, s_email, rid, r_name, r_email, business_element, email_subject, email_text, date_submitted)
			VALUES
		(#client.cid#,'#client.name#','#client.username#',#temp.id#,'#temp.name#','#temp.email#','#trim(form.business_element)#',
			'Connectics Feedback Request', 
			'Hello #temp.name#,<br><br>
			 You have been selected to provide feedback for a client using the JumpStartMarketing.com Connectics system.
			 <br><br>
			 Please go to the link below to provide the desired feedback. 
			 <br><br>
			 <a href="http://jumpstartmarketer.com/index.cfm?fa=feedback&eid=#getid.elementid#&sid=#client.cid#" class="bodylink">Provide #ucase(form.business_element)# Feedback</a>
			 <br><br>
			 Your involvement is much appreciated.
			  <br><br>
			 The Jumpstart Marketer Team','#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now(),"h:mm tt")#')		
			 
			 SELECT scope_identity() as mid;	
			 			
	</cfquery>	

</cfoutput>	 --->

	


<!--- 	<cfmail to="#temp.email#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com" query="temp">
		
Hello #temp.name#,
		
Someone has requested your feedback on an aspect of their business.
		
Please go to: http://jumpstartmarketer.com/index.cfm?fa=read_mail&cid=#temp.id#&mid=#mail.mid#
		
Thank you,
		
The Jumpstart Marketer Team
			
	</cfmail>  --->


<!--- Send to all those specified in the temp criteria to get feedback --->
<cfoutput query="temp">

	<cfmail to="#temp.email#" from="info@JumpStartMarketer.com" subject="Feedback Request from JumpStartMarketer.com">
		
Hello #temp.name#
		
#client.name# has requested your feedback on an aspect of their business.
		
Please go to:

http://jumpstartmarketer.com/dsp_feedback.cfm?eid=#getid.elementid#&sid=#client.cid#&fid=#temp.id#

Your participation is greatly appreciated.

Sincerely,

		
The Jumpstart Marketer Team
			
	</cfmail>		

</cfoutput>	

	<cfoutput>
		<cflocation url="index.cfm?fa=archives&be=#form.business_element#&sent=1">
	</cfoutput>