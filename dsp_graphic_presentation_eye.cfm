
<cfparam name="url.refresh" default=0>
<cfparam name="url.be" default="graphic_presentation">
<cfparam name="url.counter" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="url.done" default=0>
<cfparam name="url.update" default=0>
<cfparam name="client.begin" default=0>
<cfparam name="url.go" default=0>
<cfparam name="url.final" default=0>

<link href="styles/style1.css" rel="stylesheet" type="text/css">


<script language="javascript">
	function focusEye()   {
			document.eye.eye_text.focus();
		}
</script>

<body <cfif url.refresh neq 0>onload="focusEye()"</cfif>>

<cfif url.go eq 0>	

			<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14">	
				<cfoutput>
					<form action="dsp_graphic_presentation_eye.cfm?be=#url.be#&cid=#url.cid#&go=1&final=#url.final#" method="post">
				</cfoutput>
				<tr>
					<td>
						<strong><cfif url.final eq 1>FINAL </cfif>EYE TRACKING STUDY - INSTRUCTIONS</strong>
						<br><br>
						<ul>
							<li> When you begin this exercise, you will be shown a layout for a few seconds.</li>
								<br><br>
							<li> When the layout disappears, you will write in the box provided for you the first thing you saw. </li>
								<br><br>
							<li> You will be shown the layout four more times. </li>
								<br><br>			
							 <li> Each time when the layout disapears, write in the box provided for you whatever new elements you recall about the layout. 
								 <br><br>
							 <li> Do not repeat anything you have already written down.</li> 		 		
						</ul>
						<br><br>
						<font color="green">EXAMPLE:</font>  
						<br><br>
						If what you see is a Cheerios cereal box, and the first thing you see is the word Cheerios, then you write "Cheerios" in the box.
						<br><br>
						When you look at the layout again, You write whatever you see next. (you must not repeat what you have previously written)
						<br><br><br>
					</td>
				</tr>	
				<tr>
					<td align="center" bgcolor="CCCCCC">
						<input type="submit" value="  BEGIN  ">
					</td>
				</tr>
					</form>
			</table>


<cfelse>



		<cfif url.done eq 1>
			<table width="500" border="0" cellspacing="1" cellpadding="3" class="black14">	
				<tr>
					<td align="center" bgcolor="FFFFCC">
					<br><br>
						You have completed the <cfif url.final eq 1>FINAL </cfif>EYE TRACKING STUDY.<br><br>
						Thank you for your participation.
						<br><br>
					</td>
				</tr>	
			</table>
			<cfabort>
		</cfif>
		



<cfif url.refresh eq 0>
	<cfif url.counter eq 0 OR url.counter eq 1>
		<cfoutput>
			<head>
				<meta http-equiv="Refresh" content="3; url=dsp_graphic_presentation_eye.cfm?refresh=1&cid=#url.cid#&uuid=#url.uuid#&counter=#url.counter#&go=1&final=#url.final#" />
			</head>
		</cfoutput>
	<cfelseif url.counter eq 2 OR url.counter eq 3>
		<cfoutput>
			<head>
				<meta http-equiv="Refresh" content="4; url=dsp_graphic_presentation_eye.cfm?refresh=1&cid=#url.cid#&uuid=#url.uuid#&counter=#url.counter#&go=1&final=#url.final#" />
			</head>
		</cfoutput>	
	<cfelseif url.counter eq 4>
		<cfoutput>
			<head>
				<meta http-equiv="Refresh" content="5; url=dsp_graphic_presentation_eye.cfm?refresh=1&cid=#url.cid#&uuid=#url.uuid#&counter=#url.counter#&go=1&final=#url.final#" />
			</head>
		</cfoutput>	
	</cfif>
</cfif>



	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = 'graphic_presentation'
		<cfif url.final eq 0>
			AND eye = 1
		<cfelseif url.final eq 1>
			AND eye2 = 1
		</cfif>
			AND uuid IS NULL
	</cfquery>

	<cfquery name="previous" datasource="#application.dsn#">
		SELECT id, element_text, business_element, uuid
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = 'graphic_presentation'
		<cfif url.final eq 0>
			AND eye = 1
		<cfelseif url.final eq 1>
			AND eye2 = 1
		</cfif>
			AND uuid = '#trim(url.uuid)#'
			AND uuid <> '0'
	</cfquery>



<cfset url.counter = url.counter + 1>
<cfif url.counter eq 1>
	<cfset url.uuid = CreateUUID()>
</cfif>
		

		<cfoutput>
	<form name="eye" action="act_eye_feedback.cfm?refresh=1&counter=#url.counter#&final=#url.final#" method="post">
		</cfoutput>
			<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14">	
			<cfif url.update eq 1>	
				<tr>
					<td align="center">
						Your Feedback has been recorded.
						<br><br>
						Please view the layout below....
					</td>
				</tr>	
			</cfif>
			
			<cfif url.refresh eq 0>	
				<tr>
					<td align="center">
						<cfoutput>
							<img src="images/graphic_presentation/#url.cid#/#names.element_text#">
						</cfoutput>
					</td>
				</tr>	
			<cfelse>
				<tr>
					<td align="center">
                    	<cfif url.counter eq 1>
							<font size="+2">What is the first thing you see?</font>
                        <cfelse>
                        	<font size="+2">What is the next thing you see?</font>
                        </cfif>
							<br><br>
						<input type="text" size="40" name="eye_text">
						<cfoutput>
							<input type="hidden" name="uuid" value="#url.uuid#">
							<input type="hidden" name="be" value="eye_tracking_study">
							<input type="hidden" name="cid" value="#url.cid#">
						</cfoutput>
					</td>
				</tr>
				<cfif previous.recordcount neq 0>
					<tr>
						<td align="center">
								<br><br>
								<font size="+1">Your previous answers...</font>
								<br><br>								
								<table border="0" cellspacing="1" cellpadding="3" class="black14">	
								<cfoutput query="previous">
										<tr>	
											<td align="left">
												<li><font size="+1" color="maroon">#previous.element_text#</font><br></li>
											</td>
										</tr>		
								</cfoutput>
								</table>	
							<br><br>
						</td>
					</tr>
				</cfif>	
				<tr>
					<td align="center">
							
						<input type="submit" value="  Submit  ">
						
					</td>
				</tr>
			</cfif>
			</table>
	</form>		
	
	
</cfif>

</body>