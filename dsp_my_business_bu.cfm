<head>
<link href="styles/style1.css" rel="stylesheet" type="text/css">
<script
    language="JavaScript"
    src="js/sliderStatic.js">
</script>
<link
    href="styles/default.css"
    rel="stylesheet"
    type="text/css">
</head>



<cfparam name="url.element" default=0>
<cfparam name="url.rated" default=0>
<cfparam name="url.sent" default=0>
<cfparam name="mailList" default=0>
<cfparam name="url.nosub" default=0>

<cfquery name="myRating" datasource="#application.dsn#">
	SELECT id, brand_rating, sub_brand_rating, generic_descriptor_rating, benefit_rating, attributes_rating, 
				tag_line_rating, rtb_rating, key_graphic_rating, impact_rating, graphic_presentation_rating
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<!--- Set variables for displaying the pixels --->
<cfset variables.brand_rating_px = myRating.brand_rating * 2.25>
<cfset variables.sub_brand_rating_px = myRating.sub_brand_rating * 2.25>
<cfset variables.generic_descriptor_rating_px = myRating.generic_descriptor_rating * 2.25>
<cfset variables.benefit_rating_px = myRating.benefit_rating * 2.25>
<cfset variables.attributes_rating_px = myRating.attributes_rating * 2.25>
<cfset variables.tag_line_rating_px = myRating.tag_line_rating * 2.25>
<cfset variables.rtb_rating_px = myRating.rtb_rating * 2.25>
<cfset variables.key_graphic_rating_px = myRating.key_graphic_rating * 2.25>
<cfset variables.impact_rating_px = myRating.impact_rating * 2.25>
<cfset variables.graphic_presentation_rating_px = myRating.graphic_presentation_rating * 2.25>


<cfquery name="mail" datasource="#application.dsn#">
	SELECT id, rid, business_element
	FROM t_mail
	WHERE rid = #client.cid#
	AND new_r = 1 
</cfquery>

<cfquery name="elements" datasource="#application.dsn#">
	SELECT b.id, b.cid, b.brand, b.sub_brand, b.generic_descriptor, b.benefit, b.attributes, b.tag_line, b.rtb, 
				b.key_graphic, b.impact, b.graphic_presentation, b.brand_rating, b.sub_brand_rating, b.generic_descriptor_rating, 
				b.benefit_rating, b.attributes_rating, b.tag_line_rating, b.rtb_rating, 
				b.key_graphic_rating, b.impact_rating, b.graphic_presentation_rating, b.no_brand, b.no_sub_brand
	FROM t_business b INNER JOIN
		t_clients c ON c.id = b.cid
	WHERE b.cid = #client.cid#
		AND c.email = '#client.email#'
</cfquery>

	<!--- Queries for seeing if bake off work has been done, and show the green light --->
		<cfquery name="b" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'brand'
					AND rating < 4
			ORDER BY id
		</cfquery>
		<cfquery name="sb" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'sub_brand'
					AND rating < 4
			ORDER BY id
		</cfquery>
		<cfquery name="gd" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'generic_descriptor'
					AND rating > 2
			ORDER BY id
		</cfquery>
		<cfquery name="be" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'benefit'
			ORDER BY id
		</cfquery>
		<cfquery name="att" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'attributes'
					AND rating >= 2
			ORDER BY id
		</cfquery>
		<cfquery name="tag" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'tag_line'
					AND rating > 4
			ORDER BY id
		</cfquery>
		<cfquery name="rtb" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'rtb'
					AND rating > 4
			ORDER BY id
		</cfquery>
		<cfquery name="kg" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'key_graphic'
					AND rating > 4
			ORDER BY id
		</cfquery>
		<cfquery name="imp" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'impact'
					AND rating > 4
			ORDER BY id
		</cfquery>
		<cfquery name="gp" datasource="#application.dsn#">
			SELECT id, element_text, rating
			FROM         t_bake_off
			WHERE     (cid = #client.cid#)
				AND business_element = 'graphic_presentation'
					AND rating > 4
			ORDER BY id
		</cfquery>

<cfquery name="rating" datasource="#application.dsn#">
	SELECT id, cid, brand, sub_brand, generic_descriptor, benefit, attributes, tag_line, rtb, 
				key_graphic, impact, graphic_presentation
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<cfquery name="o_rating" datasource="#application.dsn#">
	SELECT id, cid, brand_rating, sub_brand_rating, generic_descriptor_rating, benefit_rating, attributes_rating, tag_line_rating, rtb_rating, 
				key_graphic_rating, impact_rating, graphic_presentation_rating
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<cfquery name="o_r" datasource="#application.dsn#">
	SELECT SUM(brand_rating + sub_brand_rating + generic_descriptor_rating + benefit_rating + attributes_rating + tag_line_rating + rtb_rating + 
				key_graphic_rating + impact_rating + graphic_presentation_rating) AS oSum
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<cfif mail.recordcount neq 0>
	<cfset mailList = ValueList(mail.business_element)>
</cfif>

	<cfset oList = "">

 <cfoutput query="o_rating">
	<cfif o_rating.brand_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.brand_rating)>
	</cfif>
	<cfif o_rating.sub_brand_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.sub_brand_rating)>
	</cfif>
	<cfif o_rating.generic_descriptor_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.generic_descriptor_rating)>
	</cfif>
	<cfif o_rating.benefit_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.benefit_rating)>
	</cfif>	
	<cfif o_rating.attributes_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.attributes_rating)>
	</cfif>	
	<cfif o_rating.tag_line_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.tag_line_rating)>
	</cfif>	
	<cfif o_rating.rtb_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.rtb_rating)>
	</cfif>	
	<cfif o_rating.key_graphic_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.key_graphic_rating)>
	</cfif>	
	<cfif o_rating.impact_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.impact_rating)>
	</cfif>	
	<cfif o_rating.graphic_presentation_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.graphic_presentation_rating)>
	</cfif>
</cfoutput> 


<cfset variables.divi = ListLen(oList)>
<cfif variables.divi neq 0>
	<cfset variables.o_rating_final = o_r.oSum / variables.divi>
	<cfset variables.o_rating_final_px = variables.o_rating_final * 2.25>
<cfelse>
	<cfset variables.o_rating_final = 0>
	<cfset variables.o_rating_final_px = 0>
</cfif>

<body>

<!--- Holder table begins --->
<table>
	<tr>
		<td>
		


<table border="0" bgcolor="000000" class="white14">

<!---Begin Brand--->
	<tr>
		<td height="20" colspan="2">
		<cfif client.cid neq 0>
			<cfoutput>
			Welcome: <br>
			<strong>#client.name#</strong>
			</cfoutput>		
		</cfif>
			<!--- <cfoutput>#mailList#</cfoutput> ---> 
		</td>

		<td  height="20" colspan="6">
			<img src="images/my_business.jpg">
			<a href="index.cfm?fa=secrets" class="bodylink"><img src="images/secrets2.jpg" border="0"></a><br>
			<div align="center"><img src="images/basic_positioning.jpg"></div>
		</td>
		<td>&nbsp;
			
		</td>
		<td width="100">&nbsp;
			 &nbsp; &nbsp; &nbsp; &nbsp;
		</td>
	</tr>
<cfif url.element neq 0>
	<tr>
		<td  height="20" colspan="6">
			<font color="yellow">*** Your <cfoutput>#ucase(url.element)# has been submitted.</cfoutput> ***</font>
		</td>
	</tr>
</cfif>
<cfif url.sent neq 0>
	<tr>
		<td  height="20" colspan="6">
			<font color="yellow">*** Your <cfoutput>#ucase(url.be)# feedback requests have been sent.</cfoutput> ***</font>
		</td>
	</tr>
</cfif>
<cfif url.rated neq 0>
	<tr>
		<td  height="20" colspan="6">
			<font color="yellow">*** Thank you for taking part in the Connectics process.<br>
										Your ratings have been submitted. ***</font>
		</td>
	</tr>
</cfif>
<cfif url.nosub neq 0>
	<tr>
		<td  height="20" colspan="6">
			<font color="yellow">*** SUB_BRAND has been removed from your selling proposition. ***</font>
		</td>
	</tr>
</cfif>
	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "brand">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>
		</td>
		<td valign="bottom">
		
		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=elements&be=brand&bg=1" class="bodylink">BRAND</a>
		</td>
		<td nowrap>
		
			<cfif b.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=brand" class="bodylink">Bake Off</a> | 
			
			<cfif elements.brand neq "" AND elements.brand_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
			
			<a href="index.cfm?fa=archives&be=brand" class="bodylink">Connectics</a>&nbsp;
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider" 
        id="your_slider_id"
        orientation="horizontal"
        distance="233"
        display="your_display1"
        style="left: <cfoutput>#variables.brand_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder">
    <input class="carpe_slider_display"
        id="your_display1"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.brand_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>	

<!---Begin Sub-Brand--->	

	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "sub_brand">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>		
		</td>
		<td valign="bottom">
		
		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=sub_brand_cont&bg=1" class="bodylink">SUB-BRAND</a>
		</td>
		<td nowrap>
		
			<cfif sb.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=sub_brand" class="bodylink">Bake Off</a> | 
			
			<cfif elements.sub_brand neq "" AND elements.sub_brand_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
			
			<a href="index.cfm?fa=archives&be=sub_brand" class="bodylink">Connectics</a>&nbsp;
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id2"
        orientation="horizontal"
        distance="233"
        display="your_display2"	 
        style="left: <cfoutput>#variables.sub_brand_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display2"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.sub_brand_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>		

<!---Begin Generic Descriptor--->	

	<tr>
		<td valign="bottom">
		<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "generic_descriptor">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
		</cfif>					
		</td>
		<td valign="bottom">

		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=gen_desc_cont&bg=1" class="bodylink">GENERIC DESCRIPTOR</a>
		</td>
		<td nowrap>
		
			<cfif gd.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=generic_descriptor" class="bodylink">Bake Off</a> | 
			
			<cfif elements.generic_descriptor neq "" AND elements.generic_descriptor_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
			
			<a href="index.cfm?fa=archives&be=generic_descriptor" class="bodylink">Connectics</a>&nbsp;
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id3"
        orientation="horizontal"
        distance="233"
        display="your_display3"	 
        style="left: <cfoutput>#variables.generic_descriptor_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display3"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.generic_descriptor_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		
		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>		
	
<!---Begin Benefit--->	

	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "benefit">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>					
		</td>
		<td valign="bottom">

		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=benefit_cont&bg=1" class="bodylink">BENEFIT</a>
		</td>
		<td nowrap>
		
			<cfif be.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=benefit" class="bodylink">Bake Off</a> | 
			
			<cfif elements.benefit neq "" AND elements.benefit_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>			
			
			<a href="index.cfm?fa=archives&be=benefit" class="bodylink">Connectics</a>&nbsp;
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id4"
        orientation="horizontal"
        distance="233"
        display="your_display4"	 
        style="left: <cfoutput>#variables.benefit_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display4"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.benefit_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>	
	
	
<!---Begin Attributes--->	

	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "attributes">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>			
		</td>
		<td valign="bottom">

		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=attributes_cont&bg=1" class="bodylink">ATTRIBUTES</a>
		</td>
		<td nowrap>
		
			<cfif att.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=attributes" class="bodylink">Bake Off</a> | 
			
			<cfif elements.attributes neq "" AND elements.attributes_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>	
						
			<a href="index.cfm?fa=archives&be=attributes" class="bodylink">Connectics</a>&nbsp; 
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id5"
        orientation="horizontal"
        distance="233"
        display="your_display5"	 
        style="left: <cfoutput>#variables.attributes_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display5"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.attributes_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>		
	
<!---Begin Tag Line--->	

	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "tag_line">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>					
		</td>
		<td valign="bottom">

		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=tagline_cont&bg=1" class="bodylink">TAG LINE</a>
		</td>
		<td nowrap>
		
			<cfif tag.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=tagline" class="bodylink">Bake Off</a> | 
			
			<cfif elements.tag_line neq "" AND elements.tag_line_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>	
			
			<a href="index.cfm?fa=archives&be=tag_line" class="bodylink">Connectics</a>&nbsp; 
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id6"
        orientation="horizontal"
        distance="233"
        display="your_display6"	 
        style="left: <cfoutput>#variables.tag_line_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display6"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.tag_line_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>		
	
<!---Begin R.T.B. (Reason to Believe)--->	

	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "rtb">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>					
		</td>
		<td valign="bottom">

		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=rtb_cont&bg=1" class="bodylink">R.T.B. (Reason to Believe)</a>
		</td>
		<td nowrap>
		
			<cfif rtb.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=rtb" class="bodylink">Bake Off</a> | 
			
			<cfif elements.rtb neq "" AND elements.rtb_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>				
			
			<a href="index.cfm?fa=archives&be=rtb" class="bodylink">Connectics</a>&nbsp; 
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id7"
        orientation="horizontal"
        distance="233"
        display="your_display7"	 
        style="left: <cfoutput>#variables.rtb_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display7"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.rtb_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>		


<!---Begin Key Graphic--->	

	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "key_graphic">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>					
		</td>
		<td valign="bottom">

		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=key_graphic_cont&bg=1" class="bodylink">KEY GRAPHIC</a>
		</td>
		<td nowrap>
		
			<cfif kg.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=key_graphic" class="bodylink">Bake Off</a> | 
			
			<cfif elements.key_graphic neq "" AND elements.key_graphic_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>				
			
			<a href="index.cfm?fa=archives&be=key_graphic" class="bodylink">Connectics</a>&nbsp; 
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id8"
        orientation="horizontal"
        distance="233"
        display="your_display8"	 
        style="left: <cfoutput>#variables.key_graphic_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display8"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.key_graphic_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>		
	
	
	<!---Begin Impact--->	

	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "impact">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>					
		</td>
		<td valign="bottom">

		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=impact_cont&bg=1" class="bodylink">IMPACT</a>
		</td>
		<td nowrap>
		
			<cfif imp.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=impact" class="bodylink">Bake Off</a> | 
			
			<cfif elements.impact neq "" AND elements.impact_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>				
			
			<a href="index.cfm?fa=archives&be=impact" class="bodylink">Connectics</a>&nbsp; 
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id9"
        orientation="horizontal"
        distance="233"
        display="your_display9"	 
        style="left: <cfoutput>#variables.impact_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display9"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.impact_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>		
	
	
	<!---Begin GRAPHIC PRESENTATION--->	

	<tr>
		<td valign="bottom">
			<cfif mail.recordcount neq 0>
				<cfif mailList CONTAINS "graphic_presentation">
					<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
				</cfif>
			</cfif>					
		</td>
		<td valign="bottom">

		</td>
		<td width="200" class="header16" nowrap="nowrap" valign="middle">
			<a href="index.cfm?fa=graphic_presentation_cont&bg=1" class="bodylink">GRAPHIC PRESENTATION</a>
		</td>
		<td nowrap>
		
			<cfif gp.recordcount gt 0>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>
		
			<a href="index.cfm?fa=bake_off&be=graphic_presentation" class="bodylink">Bake Off</a> | 
			
			<cfif elements.graphic_presentation neq "" AND elements.graphic_presentation_rating gte 1>
				<img src="images/green_light.jpg">
			<cfelse>
				<img src="images/red_light.jpg">
			</cfif>				
			
			<a href="index.cfm?fa=archives&be=graphic_presentation" class="bodylink">Connectics</a>&nbsp;
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id10"
        orientation="horizontal"
        distance="233"
        display="your_display10"	 
        style="left: <cfoutput>#variables.graphic_presentation_rating_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display10"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#myRating.graphic_presentation_rating#</cfoutput>" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>			
	
<!---	
	<tr>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="voteslider"
        orientation="horizontal"
        distance="233"
        display="vote1"	 
        style="left: 0px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="vote1"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="0" 
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td width="30%">
			Unremarkable 
		</td>
		<td width="20%">
			Preferred 
		</td>
		<td width="25%" align="center">
			Strongly <br>
			Preferred 
		</td>
		<td width="25%">
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td>

		</td>
	</tr>
	
	<tr>
		<td width="250">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id2"
        orientation="horizontal"
        distance="100"
        display="your_display2"
        style="left: 0px;">&nbsp;</div>
</div>
		</td>
	</tr>
	<tr>
		<td>
		<br>
<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display2"
        name="your_var_name2"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="0" 
        typelock="off" /></div>		
		</td>
	</tr>
	--->
</table>		


		</td>
		
<!--- Second column in big table begins	 --->	
	<td valign="top" class="white14">
	
	<img src="images/my_selling_prop.jpg" align="middle">
<cfoutput query="elements">
	<table border="1" bgcolor="FFFFFF" class="black14">
		<tr>
			<td colspan="2" align="center">
				
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<cfif elements.no_sub_brand eq 0>
				<cfif elements.brand neq "">
					#ucase(elements.brand)#
				<cfelse>
					BRAND
				</cfif>
			<cfelse>
				<cfif elements.brand neq "">
					<font size="+6">#ucase(elements.brand)#</font>
				<cfelse>
					<font size="+6">BRAND</font>
				</cfif>				
			</cfif>
			</td>
		</tr>
		<tr>
			<td colspan="2" nowrap>
			<cfif elements.no_sub_brand eq 0>
				<cfif elements.sub_brand neq "">
					<font size="+6">#ucase(elements.sub_brand)#</font>
				<cfelse>
					<font size="+6">SUB-BRAND</font>
				</cfif>	
			</cfif>		
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<!--- <font size="2">SEGMENTATION</font><br> --->
				<cfif elements.generic_descriptor neq "">
					<font size="2">#ucase(elements.generic_descriptor)#</font>
				<cfelse>
					<font size="2">GENERIC DESCRIPTOR</font>
				</cfif>
				
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<cfif elements.key_graphic eq "">
				<font size="+6">KEY</font><br>
				<font size="+6">GRAPHIC</font><br>
			<cfelse>
				<img src="images/key_graphic/#client.cid#/#elements.key_graphic#">			
			</cfif>
			</td>
		</tr>
		<tr>
			<td nowrap>
				<br><br><br>	
				<cfif elements.rtb neq "">
					<font size="2">#ucase(elements.rtb)#</font>
				<cfelse>
					<font size="2">REASON TO BELIEVE</font>	
				</cfif>	
					
			</td>
			<td nowrap>
				<cfif elements.benefit neq "">
					<font size="4">#ucase(elements.benefit)#</font><br>
				<cfelse>
					<font size="4">BENEFIT</font><br>
				</cfif>			
				
				<cfif elements.attributes neq "">
					<font size="1">#ucase(elements.attributes)#</font><br> 
				<cfelse>
				<font size="1">ATTRIBUTE DRIVER</font><br>
				<font size="1">ATTRIBUTE DRIVER</font>
				</cfif>	
				
			</td>
		</tr>
	</table>
</cfoutput>	
		<!---Begin GRAPHIC PRESENTATION--->	
		<br>
		Overall Remarkability Meter <br>
<table border="0" bgcolor="000000" class="white14">
	<tr>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id11"
        orientation="horizontal"
        distance="233"
        display="your_display11"	 
        style="left: <cfoutput>#variables.o_rating_final_px#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder">
    <input class="carpe_slider_display"
        id="your_display11"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#NumberFormat(variables.o_rating_final,"999")#</cfoutput>"  
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="white10">
		<td>
			Unremarkable 
		</td>		<td>
			Average
		</td>
		<td align="center">
			Strongly <br>
			Preferred 
		</td>
		<td>
			Remarkable
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
</table>
	<br><br>
	&nbsp;&nbsp;<img src="images/my_impact_point_pres.jpg" align="middle">
	
	
	</td>		
	</tr>
</table>
</body>