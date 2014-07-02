<cfparam name="url.update" default="0">
<cfparam name="form.phone" default="0">


<cfif url.update eq 0>

	<cftransaction>
	
	<cfquery name="personal" datasource="#application.dsn#"> 
	
		INSERT INTO t_clients		
			(name,address,city,state,zip,religion,gender,<!--- marital_status,ethnicity,religion,citizenship,children,grand_children,
			pets,home,estimated_value,income_range, household_income,active_sports, spectator_sports, recreation,  ---> email,phone,password)
			
			VALUES 
			
			('#form.name#','#form.address#','#form.city#','#form.state#','#form.zip#','#form.religion#',
			<cfif IsDefined("form.male")>
				'male',
			<cfelseif IsDefined("form.female")>
				'female',
			<cfelse>
				'',
			</cfif>

<!--- 			<cfif IsDefined("form.single")>
				'single',
			<cfelseif IsDefined("form.married")>
				'married',
			<cfelseif IsDefined("form.divorced")>
				'divorced',
			<cfelseif IsDefined("form.widowed")>
				'widowed',
			<cfelse>
				'',
			</cfif>
				'#form.ethnicity#','#form.religion#','#form.citizenship#','#form.children#','#form.grand_children#','#form.pets#',
					'#form.home#','#form.estimated_value#','#form.income_range#','#form.household_income#',
					'#form.active_sports#','#form.spectator_sports#','#form.recreation#',  --->
                    '#form.email#','#form.phone#','#form.password#')
			
			 SELECT scope_identity() as cid;
			 
	</cfquery>
	
	<cfquery name="info" datasource="#application.dsn#">
		SELECT id, email, password, name FROM t_clients WHERE id = #personal.cid#
	</cfquery>	
	
		<cfset client.cid = personal.cid>
		<cfset client.name = info.name>
        <cfset client.username = info.email>
		<cfset client.email = info.email>
		
		
		<cfdirectory action="create" directory="#application.filepath#images\key_graphic\#personal.cid#">
		
		<cfdirectory action="create" directory="#application.filepath#images\brand_logo\#personal.cid#">
		<cfdirectory action="create" directory="#application.filepath#images\sub_brand_logo\#personal.cid#">
		<cfdirectory action="create" directory="#application.filepath#images\impact\#personal.cid#">
		<cfdirectory action="create" directory="#application.filepath#images\graphic_presentation\#personal.cid#">

		
	<cfquery name="progress" datasource="#application.dsn#">
		INSERT INTO t_client_progress 
			(cid, c_name)		
		VALUES ('#client.cid#','#client.name#')
	</cfquery>	
				
		
<cfmail from="info@JumpStartMarketer.com" to="#form.email#" subject="Welcome to JumpStartMarketer.com!">
			
Greetings #form.name#,
			
Thank you for signing up for JumpStartMarketer.com.
You are now ready to harness all the same consulting horsepower that
America's most famous brands enjoy, without the outrageous expense.
			
Your username is your 
email address: #form.email#
password: #form.password#
			
Keep this information for your reference.
You can login at:
			
http://www.jumpstartmarketer.com
			
Sincerely,
			
			
Eric Chambers
www.JumpStartMarketer.com
			
			
</cfmail>

<cfmail from="info@JumpStartMarketer.com" to="ericc@chambersgroup.com,john_ojha@yahoo.com,brandenc@chambersgroup.com,keith@chambersgroup.com,daisy@chambersgroup.com" subject="Welcome to JumpStartMarketer.com!">
			
Greetings Admin,
			
New user has signup on the site

username is  
email address: #form.email#
password: #form.password#
			
Keep this information for your reference.
You can login at:
			
http://www.jumpstartmarketer.com
			
Sincerely,
			
			
Eric Chambers
www.JumpStartMarketer.com
			
			
</cfmail>
		
	</cftransaction>

	<cflock scope="session" type="exclusive" timeout="10" >
         <cfset session.type = form.religion>
         </cflock>
	
	<cfoutput>
		<cflocation url="index.cfm?fa=payment&type=#form.religion#">
	</cfoutput>

<cfelse>

	<cfquery name="personal" datasource="#application.dsn#">
	
		UPDATE t_clients
			SET 
			name = '#form.name#',
			address = '#form.address#',
			city = '#form.city#',
			state = '#form.state#',
			zip = '#form.zip#',
			<cfif IsDefined("form.male")>
				gender = 'male',
			<cfelseif IsDefined("form.female")>
				gender = 'female',
			<cfelse>
				gender = '',
			</cfif>
			<cfif IsDefined("form.single")>
				marital_status = 'single',
			<cfelseif IsDefined("form.married")>
				marital_status = 'married',
			<cfelseif IsDefined("form.divorced")>
				marital_status = 'divorced',
			<cfelseif IsDefined("form.widowed")>
				marital_status = 'widowed',
			<cfelse>
				marital_status = '',
			</cfif>
			ethnicity = '#form.ethnicity#',
			religion = '#form.religion#',
			citizenship = '#form.citizenship#',
			children = '#form.children#',
			grand_children = '#form.grand_children#',
			pets = '#form.pets#',
			home = '#form.home#',
			estimated_value = '#form.estimated_value#',
			income_range = '#form.income_range#',
			household_income = '#form.household_income#',
			active_sports = '#form.active_sports#',
			spectator_sports = '#form.spectator_sports#',
			recreation = '#form.recreation#',
			business_type = '#form.business_type#',
			business_cat = '#form.business_cat#',
			impact_point = '#form.impact_point#'
			email = '#form.email#',
			phone = '#form.phone#'
			password = '#form.password#'
	
	WHERE id = #client.cid#
	
	</cfquery>

</cfif>