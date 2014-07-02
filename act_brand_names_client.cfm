
<cfset choiceList = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20">


<cfloop list="#choiceList#" index="i">
	<cfoutput>
		<cfparam name="form.choice_#i#" default="">
	</cfoutput>
</cfloop>


	
					<cfloop list="#choiceList#" index="i">
						
						<cfif evaluate("form.choice_" & i) neq "">  
						
							<cfquery name="business" datasource="#application.dsn#"> 
								INSERT INTO t_bake_off 
									(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted)
									VALUES
									(#client.cid#, '#client.name#', '#replace(evaluate('form.choice_' & i),"'","''")#', '#ucase(form.be)#', '#client.name#', '#client.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#')	
							</cfquery>
			
						</cfif> 
						
					</cfloop>
					
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name, email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>
    
    
    <cfquery name="desc" datasource="#application.dsn#">
    	UPDATE t_business
		SET <cfif url.be eq "brand"> business_desc <cfelseif url.be eq "sub_brand"> sub_brand_desc</cfif> = '#trim(form.business_desc)#' 
		WHERE cid = #client.cid#
        
    </cfquery>
	
	
						<!--- <cfmail to="#c.email#" from="info@jumpstartmarketer.com" subject="You have added options!">
		
Hello #c.name#,

		
You have added options for your business element!

If you have added all the required names, you may proceed to the next Phase.

Please go to:

http://jumpstartmarketer.com/index.cfm?fa=elements&be=#form.be#&updated=1&bg=1


Sincerely,

		
The Jumpstart Marketer Team
			
						</cfmail>--->
					
	<cfoutput>
		<cflocation url="index.cfm?fa=elements&be=#form.be#&updated=1&bg=1">
	</cfoutput>