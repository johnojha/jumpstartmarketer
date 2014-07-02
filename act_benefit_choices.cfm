<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>


	
	<cfset choiceList = "#form.fieldnames#">
	
		<cfif ListLen(choiceList) gt 10>
				<cfif url.email eq 1>
					<cfoutput>
						<cflocation url="dsp_benefit_names2.cfm?over=1&be=#url.be#&email=1">
					</cfoutput>
				<cfelseif url.experts eq 1>
					<cfoutput>
						<cflocation url="dsp_benefit_names2.cfm?over=1&be=#url.be#&experts=1">
					</cfoutput>	
				<cfelse>
					<cfoutput>
						<cflocation url="dsp_benefit_names2.cfm?over=1&be=#url.be#">
					</cfoutput>							
				</cfif>					
		</cfif>
	
							<cfquery name="business" datasource="#application.dsn#"> 
								UPDATE t_bake_off 
									SET chosen = 0
									WHERE business_element = '#url.be#'
									AND cid = #client.cid#
							</cfquery>
	
					<cfloop list="#choiceList#" index="i">
			
							<cfquery name="business" datasource="#application.dsn#"> 
								UPDATE t_bake_off 
									SET chosen = 1
									WHERE id = #i#
							</cfquery>
						
					</cfloop>
					
				<cfif url.email eq 1>
					<cfoutput>
						<cflocation url="dsp_benefit_names2.cfm?chosen=1&be=#url.be#&email=1">
					</cfoutput>
				<cfelseif url.experts eq 1>
					<cfoutput>
						<cflocation url="dsp_benefit_names2.cfm?chosen=1&be=#url.be#&experts=1">
					</cfoutput>	
				<cfelse>
					<cfoutput>
						<cflocation url="dsp_benefit_names2.cfm?chosen=1&be=#url.be#">
					</cfoutput>							
				</cfif>	