<cfparam name="url.update" default="0">
<cfparam name="form.age_range" default="0">


<cfif url.update eq 0>


	<cfquery name="business" datasource="#application.dsn#">
	
		INSERT INTO t_business	
			(cid,client_name,product_service_desc,business_type,target_consumer,age_range,key_impact_point,business_cat)
			
			VALUES 
			
			('#client.cid#','#client.name#','#trim(form.product_service_desc)#','#form.business_type#',
			<cfif IsDefined("form.male")>
				'male',
			<cfelseif IsDefined("form.female")>
				'female',
			<cfelseif IsDefined("form.male_female")>
				'male and female',
			<cfelse>
				'',
			</cfif>
				'#form.age_range#','#form.key_impact_point#','#form.business_cat#')
			
			 
	</cfquery>
	

	
	
	<cfoutput>
		<cflocation url="index.cfm?fa=intro&business=1">
	</cfoutput>

<cfelse>

	<cfquery name="business" datasource="#application.dsn#">
	
		UPDATE t_business
			SET 
			business_desc = '#trim(form.business_desc)#',
           	<!--- sub_brand_desc = '#trim(form.sub_brand_desc)#', --->
			business_type = '#form.business_type#',
			<cfif IsDefined("form.male")>
				target_consumer = 'male',
			<cfelseif IsDefined("form.female")>
				target_consumer = 'female',
			<cfelseif IsDefined("form.male_female")>
				'male and female',
			</cfif>
			age_range = '#form.age_range#'
		WHERE cid = #client.cid#
	
	</cfquery>

</cfif>