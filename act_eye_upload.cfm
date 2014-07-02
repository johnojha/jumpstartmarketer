<cfparam name="url.delete" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.bakeoff" default=0>
<cfparam name="url.eye" default=0>
<cfparam name="url.final" default=0>

<cfif url.delete eq 1>

	<cfquery name="get" datasource="#application.dsn#"> 
		SELECT element_text 
		FROM t_bake_off 
		WHERE id = #url.bid#
	</cfquery>


	<cffile action="delete" file="#application.filepath#images\#url.be#\#client.cid#\#get.element_text#"> 
	
	<cfquery name="d" datasource="#application.dsn#"> 
		DELETE t_bake_off 
		WHERE id = #url.bid#
	</cfquery>
	
	<cfif url.email eq 1>	
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?delete=1&be=#url.be#&email=1">
		</cfoutput>
	<cfelseif url.experts eq 1>
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?delete=1&be=#url.be#&experts=1">
		</cfoutput>	
	<cfelse>
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?delete=1&be=#url.be#">
		</cfoutput>	
	</cfif>
	
</cfif>


<cffile action="upload" filefield="upload_image" destination="#application.filepath#images\#url.be#\#client.cid#\" nameconflict="overwrite"> 

  <CF_ImageSize file="#application.filepath#images\#url.be#\#client.cid#\#file.ServerFile#">
     

<!--- If the image dimensions are too big then delete it. --->
<!--- <cfif width gt 600 OR height gt 600>
	<cffile action="delete" file="#application.filepath#images\#url.be#\#client.cid#\#file.ServerFile#"> 
	
	<cfif url.email eq 1>	
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?resize=1&be=#url.be#&email=1&final=#url.final#">
		</cfoutput>
	<cfelseif url.experts eq 1>
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?resize=1&be=#url.be#&experts=1&final=#url.final#">
		</cfoutput>	
	<cfelse>
		<cfif url.bakeoff eq 1>
			<cfoutput>
				<cflocation url="index.cfm?fa=bake_off&be=#url.be#&edit=1&resize=1&added=1&final=#url.final#">
			</cfoutput>	
		<cfelse>
			<cfoutput>
				<cflocation url="dsp_#url.be#_uploadeye.cfm?update=1&be=#url.be#&resize=1&final=#url.final#">
			</cfoutput>
		</cfif>	
	</cfif>
</cfif>	 --->


<!--- If the file size is greater that 200k, then delete it. --->
<!--- <cfif file.filesize gt 204800>
	<cffile action="delete" file="#application.filepath#images\#url.be#\#client.cid#\#file.ServerFile#"> 
	
	<cfif url.email eq 1>	
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?big=1&be=#url.be#&email=1&final=#url.final#">
		</cfoutput>
	<cfelseif url.experts eq 1>
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?big=1&be=#url.be#&experts=1&final=#url.final#">
		</cfoutput>	
	<cfelse>
		<cfif url.bakeoff eq 1>
			<cfoutput>
				<cflocation url="index.cfm?fa=bake_off&be=#url.be#&edit=1&big=1&added=1&final=#url.final#">
			</cfoutput>	
		<cfelse>
			<cfoutput>
				<cflocation url="dsp_#url.be#_uploadeye.cfm?update=1&be=#url.be#&big=1&final=#url.final#">
			</cfoutput>
		</cfif>	
	</cfif>
	
</cfif> --->


<!--- If the file is not a jpg, then delete it. --->
<cfif file.serverfileext neq "jpg">
	<cffile action="delete" file="#application.filepath#images\#url.be#\#client.cid#\#file.ServerFile#"> 
	
	<cfif url.email eq 1>	
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?nojpg=1&be=#url.be#&email=1&final=#url.final#">
		</cfoutput>
	<cfelseif url.experts eq 1>
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?nojpg=1&be=#url.be#&experts=1&final=#url.final#">
		</cfoutput>	
	<cfelse>
		<cfif url.bakeoff eq 1>
			<cfoutput>
				<cflocation url="index.cfm?fa=bake_off&be=#url.be#&edit=1&nojpg=1&added=1&final=#url.final#">
			</cfoutput>	
		<cfelse>
			<cfoutput>
				<cflocation url="dsp_#url.be#_uploadeye.cfm?update=1&be=#url.be#&nojpg=1&final=#url.final#">
			</cfoutput>
		</cfif>	
	</cfif>
	
</cfif>
	
	<cfquery name="c" datasource="#application.dsn#"> 
		SELECT email
		FROM t_clients 
		WHERE id = #client.cid#
	</cfquery>
		<!--- Delete existing eye tracking graphic --->
		<cfquery name="d" datasource="#application.dsn#"> 
			DELETE t_bake_off 
			WHERE id = #client.cid#
			AND business_element = 'graphic_presentation'
		<cfif url.final eq 0>
			AND eye = 1
		<cfelseif url.final eq 1>
			AND eye2 = 1
		</cfif>
			AND uuid = ''
		</cfquery>
			<!--- Add new eye tracking graphic --->
		<cfquery name="business" datasource="#application.dsn#"> 
			INSERT INTO t_bake_off 
				(cid, c_name, element_text, business_element, sug_by_name, sug_by_email, date_submitted, <cfif url.final eq 0>eye<cfelseif url.final eq 1>eye2</cfif>)
			VALUES
				(#client.cid#, '#client.name#', '#File.ServerFile#', '#ucase(url.be)#', '#client.name#', '#c.email#', '#DateFormat(Now(),"mm/dd/yyyy")# #TimeFormat(Now())#', 1)							
		</cfquery>

<!--- Your image, <cfoutput><b>#File.ServerFile#</b></cfoutput> --->

	<cfif url.email eq 1>	
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?update=1&be=#url.be#&email=1&final=#url.final#">
		</cfoutput>
	<cfelseif url.experts eq 1>
		<cfoutput>
			<cflocation url="dsp_#url.be#_uploadeye.cfm?update=1&be=#url.be#&experts=1&final=#url.final#">
		</cfoutput>	
	<cfelse>
		<cfif url.bakeoff eq 1>
			<cfoutput>
				<cflocation url="index.cfm?fa=bake_off&be=#url.be#&edit=1&added=1&final=#url.final#">
			</cfoutput>	
		<cfelse>
			<cfoutput>
				<cflocation url="dsp_#url.be#_uploadeye.cfm?update=1&be=#url.be#&final=#url.final#">
			</cfoutput>
		</cfif>	
	</cfif>