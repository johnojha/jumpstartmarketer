<cfset ConsumerList = "brand,brand_logo,sub_brand,sub_brand_logo,generic_descriptor,benefit,attributes,tag_line,rtb,key_graphic,graphic_presentation">


<!--- Queries for seeing if CONNECTICS work has been done, and show the green light --->

		<!--- Check the IMPACT, to see if five or more have responded --->		
		<cfquery name="impact_count" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_uuids
			WHERE     (cid = #client.cid#)
				AND be = 'impact'		
		</cfquery>	
		
		<!--- Check the ratings to make sure five or more people have RATED before they get a green light --->
	<cfloop list="#ConsumerList#" index="conL">	
		<cfquery name="consumer_#conL#" datasource="#application.dsn#">
			SELECT DISTINCT UUID
			FROM  t_ratings
			WHERE     (cid = #client.cid#)
				AND business_element = '#conL#'
		</cfquery>
	</cfloop>		
	

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

	
	