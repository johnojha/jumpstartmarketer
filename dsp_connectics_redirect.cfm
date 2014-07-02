
<cfparam name="next.recordcount" default=0>


	<cfquery name="c" datasource="#application.dsn#">
		SELECT id, cid, business_element
		FROM         t_elements
		WHERE     (cid = #client.cid#)
			AND business_element = '#url.be#'
	</cfquery>
	
	<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
		<cfquery name="next" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM         t_rankings
			WHERE     (cid = #client.cid#)
				AND be = '#url.be#'
				AND type = 'ranking'
		</cfquery>		
	<cfelseif url.be eq "tag_line" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "benefit" OR url.be eq "brand_logo" OR url.be eq "sub_brand_logo">
		<cfquery name="next" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM         t_rankings
			WHERE     (cid = #client.cid#)
				AND be = '#url.be#'
				AND type = 'rating'
		</cfquery>	
	<cfelseif url.be eq "generic_descriptor">
		<cfquery name="next" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_uuids
			WHERE     (cid = #client.cid#)
				AND be = '#url.be#'	
				AND (uuid IS NOT NULL)		
		</cfquery>	
	<cfelseif url.be eq "graphic_presentation">	
		<cfquery name="next" datasource="#application.dsn#">
			SELECT id
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'graphic_presentation'	
		</cfquery>		
	</cfif>

<!--- <cfoutput>#next.recordcount#</cfoutput>
<cfabort> --->


<cfif url.be neq "graphic_presentation">	
	<cfif next.recordcount lt 5>
			<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" bgcolor="FFFFFF">
				<tr> 
					<td  align="center" valign="bottom" colspan="2" nowrap>
					<cfoutput>
						<font color="red">YOU MUST COMPLETE THE FINAL EXPERT FEEDBACK EXERCISE FOR #Ucase(replace(url.be,"_"," "))#,</font> 
							<br><br>
						and have <font color="red">RECEIVED FEEDBACK FROM FIVE OR MORE PEOPLE</font> before proceeding with the CONSUMER FEEDBACK Exercises.
						<br><br>
						<a href="index.cfm?fa=elements&be=#url.be#&bg=1">EXPERT FEEDBACK Exercise</a>
					</cfoutput>
					</td>
				</tr>	
			</table>
			<cfabort>
	
	</cfif>	
<cfelse>
	<cfif next.recordcount lt 3>
			<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" bgcolor="FFFFFF">
				<tr> 
					<td  align="center" valign="bottom" colspan="2" nowrap>
					<cfoutput>
						<font color="red">YOU MUST COMPLETE THE PREVIOUS EXERCISE FOR #Ucase(replace(url.be,"_"," "))#,</font> 
							<br><br>
						and have <font color="red">UPLOADED 3 Graphic Presentations</font> before proceeding with the CONSUMER FEEDBACK Exercises.
						<br><br>
						<a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1">UPLOADED Graphic Presentations</a>
					</cfoutput>
					</td>
				</tr>	
			</table>
			<cfabort>
	
	</cfif>		
</cfif>


<cfif c.recordcount neq 0>
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" bgcolor="FFFFFF">
			<tr> 
				<td  align="center" valign="bottom" colspan="2" nowrap>
				<cfoutput>
					<font color="red">YOU HAVE ALREADY SENT OUT THE CONSUMER FEEDBACK EXERCISE FOR #Ucase(replace(url.be,"_"," "))#,</font> 
						<br><br>
					you can now go to the <a href="index.cfm?fa=archives&be=#url.be#">CONSUMER FEEDBACK Results</a> area.
					<br><br>				
				</cfoutput>
				</td>
			</tr>	
		</table>
		<!--- <cfabort> --->
</cfif>	
