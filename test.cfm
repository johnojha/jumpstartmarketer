<cfquery name="eye" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid
		FROM         t_bake_off
		WHERE     (cid = 74)
			AND business_element = 'graphic_presentation'
			AND eye = 1
			<!--- AND uuid <> '0' --->
	</cfquery>
    
    
    <cfoutput>
    		#eye.element_text#<br>
    </cfoutput>
