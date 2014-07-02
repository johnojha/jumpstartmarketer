<cfparam name="url.be" default=0>

<cfset ElementList = "brand,brand_logo,sub_brand,sub_brand_logo,generic_descriptor,benefit,attributes,tag_line,rtb,key_graphic,impact,graphic_presentation">
<cfset RateList = "brand,brand_logo,sub_brand,sub_brand_logo,tag_line,rtb,key_graphic,graphic_presentation">
<cfset RankList = "brand,sub_brand,attributes">
<cfset ChosenList = "generic_descriptor,attributes">
<cfset ConsumerList = "brand,sub_brand,generic_descriptor,benefit,attributes,tag_line,rtb,key_graphic,graphic_presentation">




	<!--- Queries for seeing if friends work has been done, and to establish progress. --->
	
		<!--- Check the ratings to make sure five or more people have RATED before they can go to the next phase --->
	
	<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "tag_line" OR url.be eq "rtb" OR url.be eq "key_graphic" OR url.be eq "benefit" OR url.be eq "graphic_presentation">
		<cfquery name="rate_#url.be#" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_rankings
			WHERE     (cid = #client.cid#)
				AND be = '#url.be#'
				AND type = 'rating'
		</cfquery>		
	</cfif>

		<!--- Check the ratings to make sure five or more people have RANKED before they can go to the next phase--->
	<cfif url.be eq "brand" OR url.be eq "sub_brand" OR url.be eq "attributes">
			<cfquery name="rank_#url.be#" datasource="#application.dsn#">
				SELECT DISTINCT UUID
				FROM  t_rankings
				WHERE     (cid = #client.cid#)
					AND be = '#url.be#'
					AND type = 'ranking'	
			</cfquery>
	</cfif>
	
	
	
		<!--- Check the times_chosen to make sure five or more people have CHOSEN before they can go to the next phase --->
	<cfif url.be eq "generic_descriptor" OR url.be eq "attributes">	
		<cfquery name="chosen_#url.be#" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_uuids
			WHERE     (cid = #client.cid#)
				AND be = '#url.be#'	
				AND (uuid IS NOT NULL)		
		</cfquery>
	</cfif>
	
	
		<!--- Check for "client suggestions", to see if the client has added enough options themselves. --->
		<cfquery name="#url.be#_client" datasource="#application.dsn#">
			SELECT id
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = '#url.be#'	
		</cfquery>		
		
		
	
		<!--- Check the BENIFIT to make sure five or more people have done the LADDER Exercise before they can go to the next phase --->
		<cfquery name="benefit_count" datasource="#application.dsn#">
			SELECT DISTINCT benefit_id
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'benefit'		
		</cfquery>
					
		<!--- Check the BRAND, "four suggestions" feedback, to see if five or more have responded --->
		<cfquery name="brand_four" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'brand'	
				AND UUID IS NOT NULL	
		</cfquery>	
		<!--- Check the SUB-BRAND, "four suggestions" feedback, to see if five or more have responded --->
		<cfquery name="sub_brand_four" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'sub_brand'	
				AND UUID IS NOT NULL		
		</cfquery>	
	
	
<!--- Queries for seeing if CONSUMER FEEDBACK work has been done, and 5 or more people have responded. --->


	<cfif url.be eq "impact">
	<!--- Check the IMPACT, to see if five or more have responded --->	
			
		<cfquery name="impact_count" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_uuids
			WHERE     (cid = #client.cid#)
				AND be = 'impact'	
		</cfquery>	
		
	<cfelse>
	<!--- Check the ratings to make sure five or more people have RATED before they can go on to the next element. --->
		
		<cfquery name="consumer_#url.be#" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_ratings
			WHERE     (cid = #client.cid#)
				AND business_element = '#url.be#'
		</cfquery>
	
	</cfif>		
	
	<cfif url.be eq "graphic_presentation">	
		<!--- Check of GP uploads --->
		<cfquery name="graphic_presentation_uploads" datasource="#application.dsn#">
			SELECT id
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'graphic_presentation'	
		</cfquery>			
		<!--- Check the EYE TRACKING STUDY (Graphic Presentation) to make sure five or more people have done the Eye Tracking Study before they can go to the next phase --->
		<cfquery name="eye_count" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'graphic_presentation'	
				AND eye = 1
		</cfquery>		
	</cfif>