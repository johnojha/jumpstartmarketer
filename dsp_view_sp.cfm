<script
    language="JavaScript"
    src="js/sliderStatic.js">
</script>
<link
    href="styles/default.css"
    rel="stylesheet"
    type="text/css">
</head>


<cfquery name="elements" datasource="#application.dsn#">
	SELECT b.id, b.cid, b.brand, b.brand_logo, b.sub_brand, b.sub_brand_logo, b.generic_descriptor, b.benefit, b.attributes, b.tag_line, b.rtb, 
				b.key_graphic, b.impact, b.graphic_presentation, b.brand_rating, b.sub_brand_rating, b.generic_descriptor_rating, 
				b.benefit_rating, b.attributes_rating, b.tag_line_rating, b.rtb_rating, 
				b.key_graphic_rating, b.impact_rating, b.graphic_presentation_rating, b.no_brand, b.no_sub_brand
	FROM t_business b INNER JOIN
		t_clients c ON c.id = b.cid
	WHERE b.cid = #client.cid#
</cfquery>


<cfquery name="rating" datasource="#application.dsn#">
	SELECT id, cid, brand, brand_logo, sub_brand, sub_brand_logo, generic_descriptor, benefit, attributes, tag_line, rtb, 
				key_graphic, impact, graphic_presentation
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<cfquery name="o_rating" datasource="#application.dsn#">
	SELECT id, cid, brand_rating, brand_logo_rating, sub_brand_rating, sub_brand_logo_rating, generic_descriptor_rating, benefit_rating, attributes_rating, tag_line_rating, rtb_rating, 
				key_graphic_rating, impact_rating, graphic_presentation_rating
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<cfquery name="o_r" datasource="#application.dsn#">
	SELECT SUM(<cfif elements.brand_logo eq "">brand_rating<cfelse>brand_logo_rating</cfif> + <cfif elements.sub_brand_logo eq "">sub_brand_rating<cfelse>sub_brand_logo_rating</cfif> + generic_descriptor_rating + benefit_rating + attributes_rating + tag_line_rating + rtb_rating + 
				key_graphic_rating + impact_rating + graphic_presentation_rating) AS oSum
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>



	<cfset oList = "">

 <cfoutput query="o_rating">
 	<cfif o_rating.brand_logo_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.brand_logo_rating)>	
	<cfelse>	
		<cfif o_rating.brand_rating neq 0>
			<cfset oList = ListAppend(oList,o_rating.brand_rating)>
		</cfif>
	</cfif>
 	<cfif o_rating.sub_brand_logo_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.sub_brand_logo_rating)>	
	<cfelse>	
		<cfif o_rating.sub_brand_rating neq 0>
			<cfset oList = ListAppend(oList,o_rating.sub_brand_rating)>
		</cfif>
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
			<table>
				<tr> 
					<td  align="left">
					<a href="#" onClick="history.go(-1)" class="tinylink">Back</a> 
					</td>
				</tr>
			</table>
<center>

	<img src="images/selling_prop_header.jpg" align="middle">
<cfoutput query="elements">
	<table border="1" bgcolor="FFFFFF" class="black14">
		<tr>
			<td colspan="2" align="center">
				
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<cfif elements.no_sub_brand eq 0>
				<cfif elements.brand_logo neq "">
					<img src="images/brand_logo/#client.cid#/#elements.brand_logo#">	
				<cfelse>
					<cfif elements.brand neq "">
						#ucase(elements.brand)#
					<cfelse>
						BRAND
					</cfif>				
				</cfif>
			<cfelse>
				<cfif elements.brand_logo neq "">
					<img src="images/brand_logo/#client.cid#/#elements.brand_logo#">	
				<cfelse>
					<cfif elements.brand neq "">
						<font size="+6">#ucase(elements.brand)#</font>
					<cfelse>
						<font size="+6">BRAND</font>
					</cfif>
				</cfif>		
			</cfif>
			</td>
		</tr>
<!--- 		<tr>
			<td colspan="2" nowrap>
			<cfif elements.no_sub_brand eq 0>
				<cfif elements.sub_brand_logo neq "">
					<img src="images/sub_brand_logo/#client.cid#/#elements.sub_brand_logo#">	
				<cfelse>
					<cfif elements.sub_brand neq "">
						<font size="+6">#ucase(elements.sub_brand)#</font>
					<cfelse>
						<font size="+6">SUB-BRAND</font>
					</cfif>	
				</cfif>
			</cfif>		
			</td>
		</tr> --->
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
				<cfif elements.tag_line neq "">
					<font size="2">#ucase(elements.tag_line)#</font>
				<cfelse>
					<font size="2">TAG LINE</font>	
				</cfif>					
				<br><br><br>	
				<!--- <cfif elements.rtb neq "">
					<font size="2">#ucase(elements.rtb)#</font>
				<cfelse>
					<font size="2">ENDORSEMENT</font>	
				</cfif>	 --->
					
			</td>
			<td nowrap>
				<cfif elements.benefit neq "">
					<font size="4">#ucase(elements.benefit)#</font><br>
				<cfelse>
					<font size="4">BENEFIT</font><br>
				</cfif>			
				
				<cfif elements.attributes neq "">
					<font size="1">#ucase(replace(elements.attributes,",","<br>"))#</font>
				<cfelse>
				<font size="1">ATTRIBUTE </font><br>
				<font size="1">ATTRIBUTE </font>
				</cfif>	
				
			</td>
		</tr>
	</table>
</cfoutput>	
		<!---Begin Remarkability Meter--->	
		<br>
		<font color="white" face="arial">Overall Remarkability Meter </font><br>
<table border="0" bgcolor="FFFFFF" class="black14">
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
        to="100" <!---  --->
        valuecount="101" 
        value="<cfoutput>#NumberFormat(variables.o_rating_final,"999")#</cfoutput>"  
        typelock="off" /></div>	
	</td>
	</tr>
	<tr class="black10">
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
	<!--- &nbsp;&nbsp;<img src="images/my_impact_point_pres.jpg" align="middle"> --->
	
	</center>