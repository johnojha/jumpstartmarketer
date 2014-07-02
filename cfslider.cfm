<head>
<link href="styles/style1.css" rel="stylesheet" type="text/css">
<script
    language="JavaScript"
    src="js/slider.js">
</script>
<link
    href="styles/default.css"
    rel="stylesheet"
    type="text/css">
</head>

<cfset variables.brandVar = 40>
<cfset variables.brandVarpx = variables.brandVar * 2.25>

<body>
<table border="0" bgcolor="000000" width="250">
	<tr>
		<td height="200" height="20" colspan="4">
			&nbsp;
		</td>
		<td height="200" height="20">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			
		</td>
		<td>
			<a href="" class="bodylink">ARCHIVES</a>
		</td>
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="your_slider_id"
        orientation="horizontal"
        distance="225"
        display="your_display1"	 
        style="left: <cfoutput>#variables.brandVarpx#</cfoutput>px;">&nbsp;</div>
</div>
		</td>
	<td>
		<div class="carpe_slider_display_holder" >
    <input class="carpe_slider_display"
        id="your_display1"
        name="your_var_name"
        type="text" 
        from="0" 
        to="100" 
        valuecount="101" 
        value="<cfoutput>#variables.brandVar#</cfoutput>" 
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
		<td width="250" background="images/spectrum.jpg" colspan="4">
		<div class="carpe_horizontal_slider_track">
    <div class="carpe_slider_slit">&nbsp;</div>
    <div class="carpe_slider"
        id="voteslider"
        orientation="horizontal"
        distance="225"
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
	<!---
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
</body>