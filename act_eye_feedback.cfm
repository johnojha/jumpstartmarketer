<cfparam name="url.refresh" default=0>
<cfparam name="url.be" default="graphic_presentation">
<cfparam name="url.counter" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="form.cid" default=0>
<cfparam name="url.final" default=0>

	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT name
		FROM t_clients 
		WHERE id = #form.cid#
	</cfquery>		
	
    
    
    
    
<!---     <cfoutput>
    	(#form.cid#, '#c.name#', '#form.eye_text#', '#ucase(form.be)#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 1, '#form.uuid#')	
    </cfoutput>
    
    <cfabort> --->
    	
		<cfquery name="business" datasource="#application.dsn#"> 
			INSERT INTO t_bake_off 
				(cid, c_name, element_text, business_element, date_submitted, <cfif url.final eq 0>eye<cfelseif url.final eq 1>eye2</cfif>, uuid, order_num)
			VALUES
				(#form.cid#, '#c.name#', '#form.eye_text#', 'graphic_presentation', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 1, '#form.uuid#',#url.counter#)							
		</cfquery>
		
        
        	<cfquery name="count" datasource="#application.dsn#"> 
				SELECT DISTINCT uuid 
            	FROM t_bake_off 
				WHERE cid = #form.cid#
                	AND business_element = 'graphic_presentation'
                    AND <cfif url.final eq 0>eye<cfelseif url.final eq 1>eye2</cfif> = 1			
			</cfquery>
            
            <cfif count.recordcount gte 3 AND url.counter eq 5>
<!--- Send email to keith alerting him to fill out the eye tracking feedback form. --->

	<cfmail to="keith@chambersgroup.com" cc="dtkelly72@live.com" from="info@JumpStartMarketer.com" subject="Eye Tracking Interpretation Needed - JumpMarketer.com">
		
Keith,
		
#client.name# needs your interpretation of their <cfif url.final eq 0>first<cfelseif url.final eq 1>final</cfif> Eye Tracking Study.
		
Please go to:

http://jumpstartmarketer.com/index.cfm?fa=archives_eye&be=eye_tracking_study&final=#url.final#&cid=#client.cid#&omni=1

View the eye tracking feedback below the image.

Then, scroll down, and fill out the form below the results, and click submit.


Sincerely,

		
The Jumpstart Marketer Team
			
	</cfmail>	            
            </cfif>
        
		<cfif url.counter eq 5>
			<cfoutput>
				<cflocation url="dsp_graphic_presentation_eye.cfm?done=1&go=1&final=#url.final#">
			</cfoutput>	
		<cfelse>
			<cfoutput>
				<cflocation url="dsp_graphic_presentation_eye.cfm?update=1&refresh=0&uuid=#form.uuid#&counter=#url.counter#&cid=#form.cid#&go=1&final=#url.final#">
			</cfoutput>			
		</cfif>
		
        
        