<cfparam name="url.clearAtt" default=0>
<cfparam name="url.impact" default=0>


<cfif url.be neq "attributes">
	<!--- If the biz element is not Attributes --->
	<cfquery name="business" datasource="#application.dsn#"> 
		UPDATE t_business 
			SET #url.be# = '#url.choice_text#',
				#url.be#_rating = #url.rating#
		WHERE id = #url.bid#
	</cfquery>
			<cfquery name="my_choice" datasource="#application.dsn#">
				UPDATE t_elements		
					SET my_choice = '#url.choice_text#',
						my_choice_rating = #url.rating#
						WHERE business_element = '#url.be#'	
							AND cid = #client.cid#
			</cfquery>
<cfelse>
	<!--- If the biz element IS Attributes, make list of choices. --->
	<cfif url.clearAtt eq 0>
		<cfquery name="att" datasource="#application.dsn#"> 
			SELECT attributes
			FROM t_business 
			WHERE id = #url.bid#
		</cfquery>	
		<cfquery name="business" datasource="#application.dsn#"> 
			UPDATE t_business 
				<cfif att.attributes eq "">
					SET attributes = '#url.choice_text#'
				<cfelse>
					SET attributes = '#att.attributes#, #url.choice_text#'
				</cfif>
			WHERE id = #url.bid#
		</cfquery>		
			<!--- Get the attributes again to check for multiple entries. --->
			<cfquery name="att2" datasource="#application.dsn#"> 
				SELECT attributes
				FROM t_business 
				WHERE id = #url.bid#
			</cfquery>	
				<!--- Update rating if there this is the first attribute added. --->
			<cfif att2.attributes DOES NOT CONTAIN ",">	
				<cfquery name="business2" datasource="#application.dsn#"> 
					UPDATE t_business 
					SET #url.be#_rating = #url.rating#
					WHERE id = #url.bid#
				</cfquery>			
			</cfif>	
			<cfquery name="my_choice" datasource="#application.dsn#">
				UPDATE t_elements		
					SET my_choice = <cfif att.attributes eq "">'#url.choice_text#'<cfelse>'#att.attributes#, #url.choice_text#'</cfif>
						<cfif att2.attributes DOES NOT CONTAIN ",">
							, my_choice_rating = #url.rating#
						</cfif>
						WHERE business_element = '#url.be#'	
							AND cid = #client.cid#
			</cfquery>
	
			<!--- If it has a multiple entry set to 2 --->
			<cfif att2.attributes CONTAINS ",">
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET #url.be#_choice = 1
					WHERE cid = #client.cid#
				</cfquery>
			<cfelse>
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET #url.be#_choice = '.5'
					WHERE cid = #client.cid#
				</cfquery>
			</cfif>
		
	<cfelse>
			<!--- Clear attribute values --->
		<cfquery name="business" datasource="#application.dsn#"> 
			UPDATE t_business 
				SET attributes = '',
					#url.be#_rating = 0
			WHERE id = #url.bid#
		</cfquery>		
		<cfset "client.#url.be#_choice" = 0>
	</cfif>
</cfif>

<cfif url.be neq "attributes"> 
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET #url.be#_choice = 1
					WHERE cid = #client.cid#
				</cfquery>
</cfif>


	<cfoutput>
		<cflocation url="index.cfm?fa=archives&choice=1&be=#url.be#&impact=#url.impact#">
	</cfoutput>