<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>


	
	<cfset choiceList = "#form.fieldnames#">
	
		<cfif ListLen(choiceList) gt 4>
				<cfif url.email eq 1>
					<cfoutput>
						<cflocation url="dsp_attributes_names2.cfm?over=1&be=#url.be#&email=1">
					</cfoutput>
				<cfelseif url.experts eq 1>
					<cfoutput>
						<cflocation url="dsp_attributes_names2.cfm?over=1&be=#url.be#&experts=1">
					</cfoutput>	
				<cfelse>
					<cfoutput>
						<cflocation url="dsp_attributes_names2.cfm?over=1&be=#url.be#">
					</cfoutput>							
				</cfif>					
		</cfif>
	
							<cfquery name="business" datasource="#application.dsn#"> 
								UPDATE t_bake_off 
									SET chosen = 0,
										att_n = 0
									WHERE business_element = 'attributes'
									AND cid = #client.cid#
							</cfquery>
					
					<cfset counter = 0>
					
					<cfloop list="#choiceList#" index="i">
			
							<cfquery name="business" datasource="#application.dsn#"> 
								UPDATE t_bake_off 
									SET chosen = 1,
										att_n = #(counter + 1)#
									WHERE id = #i#
							</cfquery>
						
						<cfset counter = counter + 1>
						
					</cfloop>
					
				<cfif url.email eq 1>
					<cfoutput>
						<cflocation url="dsp_attributes_names2.cfm?chosen=1&be=#url.be#&email=1">
					</cfoutput>
				<cfelseif url.experts eq 1>
					<cfoutput>
						<cflocation url="dsp_attributes_names2.cfm?chosen=1&be=#url.be#&experts=1">
					</cfoutput>	
				<cfelse>
					<cfoutput>
						<cflocation url="dsp_attributes_names2.cfm?chosen=1&be=#url.be#&sub=1">
					</cfoutput>							
				</cfif>	