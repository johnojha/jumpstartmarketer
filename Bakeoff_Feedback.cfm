<cfset ElementList = "brand,brand_logo,sub_brand,sub_brand_logo,generic_descriptor,benefit,attributes,tag_line,rtb,key_graphic,impact,graphic_presentation">
<cfset RateList = "brand,brand_logo,sub_brand,sub_brand_logo,tag_line,rtb,key_graphic,benefit,graphic_presentation">
<cfset RankList = "brand,sub_brand,attributes">
<cfset ChosenList = "generic_descriptor,attributes">



	<!--- Queries for seeing if bake off work has been done, and show the green light --->
	
		<!--- Check the ratings to make sure five or more people have RATED before they get a green light --->
	<cfloop list="#RateList#" index="rL">	
		<cfquery name="rate_#rL#" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_rankings
			WHERE     (cid = #client.cid#)
				AND be = '#rL#'
				AND type = 'rating'
		</cfquery>
	</cfloop>
		<!--- Check the ratings to make sure five or more people have RANKED before they get a green light --->
	<cfloop list="#RankList#" index="rankL">	
		<cfquery name="rank_#rankL#" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_rankings
			WHERE     (cid = #client.cid#)
				AND be = '#rankL#'
				AND type = 'ranking'		
		</cfquery>
	</cfloop>	
		<!--- Check the times_chosen to make sure five or more people have CHOSEN before they get a green light --->
	<cfloop list="#ChosenList#" index="chosenL">	
		<cfquery name="chosen_#chosenL#" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_uuids
			WHERE     (cid = #client.cid#)
				AND business_element = '#chosenL#'		
		</cfquery>
	</cfloop>	
		<!--- Check the BENIFIT to make sure five or more people have done the LADDER Exercise before they get a green light --->
		<cfquery name="benefit_count" datasource="#application.dsn#">
			SELECT DISTINCT benefit_id
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'benefit'		
		</cfquery>
		<!--- Check the EYE TRACKING STUDY (Graphic Presentation) to make sure five or more people have done the Eye Tracking Study before they get a green light --->
		<cfquery name="eye_count" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'graphic_presentation'		
		</cfquery>							
		<!--- Check the BRAND, "four suggestions" feedback, to see if five or more have responded --->
		<cfquery name="b_four" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'brand'		
				AND UUID IS NOT NULL	
		</cfquery>	
		<!--- Check the SUB-BRAND, "four suggestions" feedback, to see if five or more have responded --->
		<cfquery name="sb_four" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'sub_brand'		
				AND UUID IS NOT NULL	
		</cfquery>	
		
	
		
		