
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
<cfparam name="url.resize" default=0><head>	
	
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
			AND uuid IS NULL
			AND eye <> 1
		ORDER BY id DESC
	</cfquery>

	<cfset url.uc = names.recordcount + 1>
	
<!---
		<cfif names.recordcount gte 3>
				 	If they have already uploaded graphics, Send the user to consumer feedback for Graphic Pres. 
				<cflocation url="index.cfm?fa=graphic_presentation&be=graphic_presentation&upload=1">					
		</cfif>
--->		





		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
	<cfif url.sub eq 0>
			
			
			<tr> 
				<td>
				<cfif names.recordcount lte 2>
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
				<td bgcolor="FFFFCC">
					<font color="red"><b>Your  Graphic Presentation is too large in file size. Please resize to be under 200k.</b></font>
				</td>
			</tr>
</cfif>
<cfif url.update eq 1>
			<tr> 
				<td bgcolor="FFFFCC">
					<font color="red"><b>Your  Graphic Presentation number <cfoutput>#(url.uc - 1)#</cfoutput> has been uploaded.</b></font>
				</td>
			</tr>
</cfif>
<cfif url.delete eq 1>
			<tr> 
				<td bgcolor="FFFFCC">
					<font color="red"><b>Your  Graphic Presentation has been deleted.</b></font>
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
					<font color="red"><b>Your Graphic Presentation needs to be less than or equal to 1000 pixels width & less than or equal to 1000 pixels height. Please resize it and try again.</b></font>
				</td>
			</tr>
</cfif>

			<cfif names.recordcount gte 3>
				<tr>
					<td bgcolor="FFFFCC">
					<br><br>
						<!--- 	Send the user to consumer feedback for Graphic Pres. --->
						If you are happy with the Graphic Presentations below proceed to:
						
						<br><br>
						<li><a href="index.cfm?fa=consumer_exercise&be=graphic_presentation" class="bakeofflink">Graphic Presentation Consumer Feedback</a></li>	
					<br><br>
					</td>
				</tr>

			</cfif>


	<!--- If there are 3  Graphic Presentations, then have them review and submit --->
	<cfif names.recordcount lte 2>
	
	
		
	
	
			<tr> 
				<td>
				<font color="green">Please upload  Graphic Presentation number <cfoutput>#url.uc#</cfoutput>.</font>
				<br><br>
				<cfoutput>
				
				
				
				<cfinclude template="includes/upload_instructions.cfm">	
				
				
				
					<form action="act_key_graphic_upload.cfm?be=#url.be#&uc=#url.uc#<cfif url.email eq 1>&email=1</cfif><cfif url.experts eq 1>&experts=1</cfif><cfif url.eye eq 1>&eye=1</cfif>" method="post" enctype="multipart/form-data">

		 <strong>Graphic Presentation:</strong> <input type="file" name="upload_image"> <br>
		<br>
		<br>
		<input type="submit" value="  Upload  ">
		</form>
		</cfoutput>
					<br><br>
				</td>
			</tr>	
			
	<cfelse>
		
<!--- 			<tr> 
				<td>
					<font color="green"><b>Please review your 3  Graphic Presentations below, and click Submit.</b></font>
					<cfif url.experts eq 1>
					<br><br>
						<font color="green">***</font> The Connectics Experts will be automatically contacted, and will provide the required feedback for this excercise. 
					</cfif>
					<cfif url.email eq 1>
					<br><br>
						<font color="green">***</font> When you click the Submit button, your graphic presentations will be sent to your target consumers for evaluation.
					</cfif>
				</td>
			</tr>	 --->
	
	</cfif>		
	
		<cfif names.recordcount gt 0>
			<cfoutput query="names">
				<tr>
					<td align="center">
					<hr>
					<br>

							<img src="images/graphic_presentation/#client.cid#/#names.element_text#" border="0"> 
						
					
					<br><br>
					<a href="act_key_graphic_upload.cfm?be=#url.be#&delete=1&bid=#names.id#<cfif url.email eq 1>&email=1</cfif><cfif url.experts eq 1>&experts=1</cfif>" class="bodylink3">delete this graphic</a>
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

	
	
	
	
	
	
	
			<cfif url.uc eq 4>		
			<cfoutput>	
	<form name="business" action="act_key_graphic_names.cfm?be=#url.be#&uc=#url.uc#<cfif url.email eq 1>&email=1</cfif><cfif url.experts eq 1>&experts=1</cfif>" method="post">
		<cfif names.recordcount gte 3>
			<tr> 
				<td>
				
				
					
					
						<!--- Include the text fields and select lists of Email address to send exercise to. --->
					<!--- <cfinclude template="functions/chooseEmails_bakeoff.cfm"> --->
					
					

				
				
				
				</td>
			</tr>
		</cfif>
<!--- 			<tr> 
				<td bgcolor="3969A4" align="center">
				
					<input type="submit" value="Submit"> 
					
				</td>
			</tr> --->
			</form>	
			
				</cfoutput>
			</cfif>	
	<cfelse>
			<tr> 
				<td>
					<b>My Buisness Description:</b>
				</td>
			</tr>
			<tr> 
				<td>
					<cfoutput>#business.business_desc#</cfoutput>
				</td>
			</tr>	
			<tr> 
				<td>
					<br>
					<font color="green">***</font> 
					Please review all of the  Graphic Presentations one-by-one and circle the number at the bottom of the page that most expresses your judgment. 
					<br><br>
					Evaluate it as if you were going to purchase this product or service. 
					<br><br>
					<b>Rate it a 1 if it has no bearing on your decision or a 7 if you are significantly influenced by its presence. </b>
					<br><br>
					You may also rate it anywhere in between as appropriate. 
 					
				</td>
			</tr>		
			<cfif names.recordcount eq 0>
				<tr>
					<td>
						<strong>There are currently no  Graphic Presentations.</strong>
					</td>
				</tr>
			<cfelse>
			
			<cfoutput query="names">
				<tr>
					<td align="center">
					<hr>
					<br>

							<img src="images/graphic_presentation/#client.cid#/#names.element_text#" border="0"> 
						
					
					<br>
					<br>
					Rate 1 to 7, 7 if you are significantly influenced by its presence.
					<br><br>
					<br>
					<table class="black14" border="0">
						<tr>
							<td nowrap="nowrap" align="center">
								&nbsp;
								<font size="+3">1</font>
								 &nbsp;
							</td>
							<td nowrap="nowrap" align="center">
								&nbsp;
								<font size="+3">2</font>
								 &nbsp;
							</td>
							<td nowrap="nowrap" align="center">
								&nbsp;
								<font size="+3">3</font>
								 &nbsp;
							</td>
							<td nowrap="nowrap" align="center">
								&nbsp;
								<font size="+3">4</font>
								 &nbsp;
							</td>
							<td nowrap="nowrap" align="center">
								&nbsp;
								<font size="+3">5</font>
								 &nbsp;
							</td>
							<td nowrap="nowrap" align="center">
								&nbsp;
								<font size="+3">6</font>
								 &nbsp;
							</td>
							<td nowrap="nowrap" align="center">
								&nbsp;
								<font size="+3">7</font>
								 &nbsp;
							</td>
						</tr>
						<tr>
							<td align="center" nowrap="nowrap" colspan="7">
								<img src="images/spectrum_bg.jpg">
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap" align="center">
								<font size="1">Rejected</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Poor</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Weak</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Average</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Preferred</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Strong</font>
							</td>
							<td nowrap="nowrap" align="center">
								<font size="1">Remarkable</font>
							</td>
						</tr>
					</table>
					<br>
					<hr>					
					</td>
				</tr>
				<tr>
					<td bgcolor="Gray">
					<br><br>
					</td>
				</tr>	
			</cfoutput>				
				
			</cfif>	
</cfif>
	  	</table>
		<br><br>
	<cfif url.sub eq 1>	
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="noprint">
			<tr> 
				<td>
					<form>
						<input type="button" value=" Print this page "  onclick="window.print();return false;" / >
					</form> 
				</td>
			</tr>
		</table>	
	</cfif>		
