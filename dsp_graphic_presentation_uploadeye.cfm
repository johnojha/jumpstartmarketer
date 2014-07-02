
<cfparam name="url.sub" default=0>
<cfparam name="url.email" default=0>
<cfparam name="url.experts" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.be" default=0>
<cfparam name="url.uc" default=0>
<cfparam name="url.big" default=0>
<cfparam name="url.update" default=0>
<cfparam name="url.delete" default=0>
<cfparam name="url.review" default=0>
<cfparam name="url.eye" default=0>
<cfparam name="url.nojpg" default=0>
<cfparam name="url.resize" default=0>
<cfparam name="url.final" default=0><head>	
	<title>
		PowerMarketer Assignments
	</title>
</head>










<link href="styles/style1.css" rel="stylesheet" type="text/css">



<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, generic_descriptor
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>


	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating, gd_n
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
		<cfif url.final eq 0>
			AND eye = 1
		<cfelseif url.final eq 1>
			AND eye2 = 1
		</cfif>
			AND uuid IS NULL
	</cfquery>

	
	


		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">

			
			
			<tr> 
				<td>
				<cfif names.recordcount eq 0>
				<font color="green">

					Please locate your  Graphic Presentation below and click "Upload" 
					<br><br>
					
				</font>
				</cfif>
				</td>
			</tr>		
<!--- 			<tr> 
				<td>
					<b> Graphic Presentations:</b> 
				</td>
			</tr> --->
<cfif url.big eq 1>
			<tr> 
				<td>
					<font color="red"><b>Your  Graphic Presentation is too large in file size. Please resize to be under 200k.</b></font>
				</td>
			</tr>
</cfif>
<cfif url.update eq 1>
			<tr> 
				<td>
					<font color="green"><b>Your  Graphic Presentation has been uploaded for the <cfif url.final eq 1>FINAL </cfif>EYE TRACKING STUDY.</b></font>
				</td>
			</tr>
</cfif>
<cfif url.delete eq 1>
			<tr> 
				<td>
					<font color="green"><b>Your  Graphic Presentation has been deleted.</b></font>
				</td>
			</tr>
</cfif>
<cfif url.nojpg eq 1>
			<tr> 
				<td bgcolor="FFFFCC">
					<font color="red"><b>Your Graphic Presentation has to be in the .jpg format. Please save it as a .jpg.</b></font>
				</td>
			</tr>
</cfif>
<cfif url.resize eq 1>
			<tr> 
				<td bgcolor="FFFFCC">
					<font color="red"><b>Your Graphic Presentation needs to be less than or equal to 600 pixels width & less than or equal to 600 pixels height. Please resize it and try again.</b></font>
				</td>
			</tr>
</cfif>

	<!--- If there is one  Graphic Presentations, then have them review and submit --->
	<cfif names.recordcount eq 0>
	
	
	
			<tr> 
				<td>
				<font color="green">Please upload your winning Graphic Presentation for the <cfif url.final eq 1>FINAL </cfif>EYE TRACKING STUDY.</font>
				<br><br>
				<cfoutput>
				
				
						<cfinclude template="includes/upload_instructions.cfm">
										
				
				
					<form action="act_eye_upload.cfm?be=#url.be#<cfif url.email eq 1>&email=1</cfif><cfif url.experts eq 1>&experts=1</cfif><cfif url.final eq 1>&final=1</cfif>" method="post" enctype="multipart/form-data">

		 Winning Graphic Presentation: <input type="file" name="upload_image"> <br>

		<br>
		<input type="submit" value="Upload">
		</form>
		</cfoutput>
					<br><br>
				</td>
			</tr>	
			
	<cfelse>
		
			<tr> 
				<td>
					<font color="green"><b>Please review your Graphic Presentation below and click Submit.</b></font>
					<cfif url.experts eq 1>
					<br><br>
						<font color="green">***</font> The Connectics Experts will be automatically contacted, and will provide the required feedback for this excercise. 
					</cfif>
					<cfif url.email eq 1>
					<br><br>
						<font color="green">***</font> Please click on the submit button to send the <cfif url.final eq 1>FINAL </cfif>Eye Tracking Study to your target consumers.
					</cfif>
				</td>
			</tr>	
	
	</cfif>		
	
		<cfif names.recordcount neq 0>
			<cfoutput query="names">
				<tr>
					<td align="center">
					<hr>
					<br>

							<img src="images/graphic_presentation/#client.cid#/#names.element_text#" border="0"> 
						
					
					<br><br>
					<a href="act_eye_upload.cfm?be=#url.be#&delete=1&bid=#names.id#<cfif url.email eq 1>&email=1</cfif><cfif url.experts eq 1>&experts=1</cfif>" class="bodylink3">delete this graphic</a>
					<br>
					
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br>
					</td>
				</tr>	
			</cfoutput>
		</cfif>		

	
	<cfif names.recordcount neq 0 AND url.email neq 0>
			<cfoutput>	
	<form name="business" action="act_graphic_presentation_eyenames.cfm?be=#url.be#&eye=1&uc=#url.uc#<cfif url.email eq 1>&email=1</cfif><cfif url.experts eq 1>&experts=1</cfif><cfif url.final eq 1>&final=1</cfif>" method="post">
		
			<tr> 
				<td>
				
				
					
					
						<!--- Include the text fields and select lists of Email address to send exercise to. --->
					<!--- <cfinclude template="functions/chooseEmails_bakeoff.cfm"> --->
					
					
				
				
				
				</td>
			</tr>
		
			<tr> 
				<td bgcolor="3969A4" align="center">
				
					<input type="submit" value="Submit"> 
					
				</td>
			</tr>
			</form>	
			
	</cfoutput>
	</cfif>
	
	  	</table>

