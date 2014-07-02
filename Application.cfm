<CFAPPLICATION name="jumpstart" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0,0,10,0)#" 
clientmanagement="yes" clientstorage="jumpstart" >

<CFSET application.dsn = "jumpstart">
<CFSET application.filepath = "C:\home\jumpstartmarketer.com\wwwroot\">
<CFSET application.urlpath = "http://jumpstartmarketer.com/index_new.cfm">


<cfparam name="client.cid" default=0>
<cfparam name="client.name" default=0> 

<cfif client.cid neq 0>
	<cfquery name="client_progress" datasource="#application.dsn#"> 
		SELECT *
		FROM t_client_progress
		WHERE cid = #client.cid#
	</cfquery>
</cfif>

<cfparam name="client.secrets_sp" default=0>
<cfparam name="client.secrets_goal" default=0> 
<cfparam name="client.secrets_impact" default=0>
<cfparam name="client.secrets_paradigm" default=0> 
<cfparam name="client.secrets_model" default=0> 
<cfparam name="client.friends_explained" default=0> 
<cfparam name="client.consumer_explained" default=0> 

<cfparam name="client.brand_education" default=0>
<cfparam name="client.brand_logo_education" default=0>
<cfparam name="client.sub_brand_education" default=0> 
<cfparam name="client.sub_brand_logo_education" default=0> 
<cfparam name="client.generic_descriptor_education" default=0>
<cfparam name="client.benefit_education" default=0> 
<cfparam name="client.attributes_education" default=0>
<cfparam name="client.rtb_education" default=0> 
<cfparam name="client.key_graphic_education" default=0>
<cfparam name="client.tag_line_education" default=0> 
<cfparam name="client.impact_education" default=0>
<cfparam name="client.graphic_presentation_education" default=0> 
<cfparam name="client.eye_tracking_study_education" default=0>

<cfparam name="client.brand_choice" default=0>
<cfparam name="client.brand_logo_choice" default=0>
<cfparam name="client.sub_brand_choice" default=0> 
<cfparam name="client.sub_brand_logo_choice" default=0> 
<cfparam name="client.generic_descriptor_choice" default=0>
<cfparam name="client.benefit_choice" default=0> 
<cfparam name="client.attributes_choice" default=0>
<cfparam name="client.rtb_choice" default=0> 
<cfparam name="client.key_graphic_choice" default=0>
<cfparam name="client.tag_line_choice" default=0> 
<cfparam name="client.impact_choice" default=0>
<cfparam name="client.graphic_presentation_choice" default=0> 





