


		<cfquery name="del" datasource="#application.dsn#"> 
			DELETE t_eye_interpret 
            WHERE cid = #url.cid#
            		AND final = #url.final#			
		</cfquery>

<cfset iList = "1,2,3,4,5">

<cfloop list="#iList#" index="i">
	<cfquery name="interpret" datasource="#application.dsn#"> 
			INSERT INTO t_eye_interpret 
				(cid, order_num, element_text, final)
			VALUES
				(#url.cid#, #i#, '#evaluate("form.interpret_" & i)#', #url.final#)							
		</cfquery>
</cfloop>

	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #url.cid#
	</cfquery>

	<cfmail to="#trim(c.email)#,ericc@chambersgroup.com,dtkelly72@yahoo.com,john_ojha@yahoo.com" from="info@JumpStartMarketer.com" subject="You have received feedback!">
		
Hello #c.name#,

		
You have received feedback on an aspect of your business!
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=archives_eye&be=eye_tracking_study&final=#url.final#


Sincerely,

		
The Jumpstart Marketer Team
			
	</cfmail>	

<br><br><br>

Your EYE TRACKING STUDY Interpretation has been submitted.