<head>

<script language='javascript'>
  
  function move_up() {
    scroll_clipper.scrollTop = 0;
  }

</script>

<script language='javascript'>
  
function validateThis(graphicpres)
{

  if (graphicpres.choice_1.value == "")
  {
    alert("Please choose a Graphic Presentation");
    graphicpres.choice_1.focus();
    return (false);
  }
  
  if (graphicpres.choice_2.value == "")
  {
    alert("Please choose a Graphic Presentation");
    graphicpres.choice_2.focus();
    return (false);
  }
  
  if (graphicpres.choice_3.value == "")
  {
    alert("Please choose a Graphic Presentation");
    graphicpres.choice_3.focus();
    return (false);
  }

  return (true);
}

</script>

</head>

	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating
		FROM         t_bake_off
		WHERE     (cid = #client.cid#)
			AND business_element = 'graphic_presentation'
			AND rating <> 0
		ORDER BY id
	</cfquery>


<!--- <cfinclude template="dsp_connectics_redirect.cfm"> --->



	<cfparam name="url.be" default=0>
	
	
		<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">		
			<tr>
				<td valign="top">

						<img src="images/headlines_graphic_presentation.jpg">

				</td>
			</tr>
			<tr>
				<td>
					<img src="images/Element_Header_phase1.jpg">
				</td>
			</tr>
			<tr>
				<td>	
	<ul>
<li>You have now created all the elements of your selling proposition. <br>
	Having completed the "Expert Feedback" and "Consumer Feedback" exercises, you know which options are the most remarkable.
<br><br>
<li> You have also completed the important IMPACT exercise. The results of the IMPACT exercise show you which elements of your selling proposition are considered most important. 
	This information will help you decide which elements you want to featured more prominently in your Graphic Presentation.</li> 
<br><br>
<li> Now it is time to make your GRAPHIC PRESENTAIONS. This means putting different combinations of the elements (Brand, Sub-Brand, Generic Descriptor, etc.) of your selling proposition together in a graphic layout.
	If you have graphic design talent, you can do it yourself. If not, you will need the help of a trained graphic designer.</li>
<br><br> 
<li> We recommend that you develop three alternate layouts using Adobe Photoshop, or Illustrator.</li>
<br><br> 	
<li> You do not have to use all the elements in every GRAPHIC PRESENTATION. One layout may feature the Benefit & Attributes, and Key Graphic more prominently, while antohter has the Brand and Generic Descriptor most prominent. 
</li>
<br><br> 
 <li>It is up to you and your designer to decide what goes into each layout. Use the results from all previous exercises, and the insights you have gained about what elements your consumers respond most favorably to, to design your three different layouts. 
 You want to keep in mind the elements you think have the most potential to influence the buying decision.</li>
<br><br> 	
<li> When you are happy with your three layouts, save each layout as a .jpg and proceed with PHASE 2. </li>
					
	</ul>
				</td>
			</tr>	
			<tr>
				<td>
					<img src="images/Element_Header_phase2.jpg">
				</td>
			</tr>	
			<tr>
				<td>
					<ul>
						
						<li>Now that you have <strong>three different GRAPHIC PRESENTATION alternatives</strong>, you are going to submit them for evaluation. </li>
						<br><br>	
						<li>Your target consumers will <strong>RATE your three Graphic Presentations</strong> from 1 to 100 (100 being remarkable). </li>
						<br><br>					
						<li>Click The "UPLOAD" link below to upload your three Graphic Presentations (.jpg images), and to send them off to be rated by your target consumers.</li>
						<br><br>					
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									Upload  GRAPHIC PRESENTATIONS				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_graphic_presentation_upload.cfm?be=#url.be#&email=1" class="bakeofflink">UPLOAD</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
					
					
					
					
				</td>
			</tr>
            
            
            
            
			<!--- <tr>
				<td>
					<img src="images/Element_Header_phase3.jpg"> <strong>EYE TRACKING STUDY</strong>
				</td>
			</tr>
			<tr>
				<td>
					<ul>
					<li>The purpose of the Eye Tracking Study is to see how well your winning Graphic Presentation
					compares to the results of your Impact Study. The best Graphic Presentation would be closesly aligned with your Impact Study.
					</li>
					<br><br>
					<li> In the <strong>Eye Tracking Study</strong>, your target consumers will be exposed to your winning graphic presentation (highest rated) for a few seconds and then type in what they comprehended.
						They will then be shown your Graphic Presentation again four more times, and type in what they comprehend each time. 
						The result will be a realistic assessment of the order in which your Graphic Presentation is communicating.</li>
					<br><br>
					<li> After you get the results from the eye tracking study, our team will help you interpret the feedback you received.
						 Based on the interpretaion of these results you can tweak your final Graphic Presentation with your designer.</li>
						<br><br>					
						<li>Click The SEND EYE TRACKING link below to select your WINNING graphic presentation, and to send your target consumers the "Eye Tracking Study" exercise.<br></li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									Send the Eye Tracking Study 				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_graphic_presentation_uploadeye.cfm?be=#url.be#&email=1" class="bakeofflink" target="new">SEND EYE TRACKING</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>	
			<tr>
				<td>
					<strong>Final note:</strong>
					<br><br>	
					You now have an optimum layout that fully communicates your Selling Proposition. 
					<br><br>	
					CONGRATULATIONS....you are ready to go to war. 
					<br><br>	
				</td>
			</tr>
			<tr>
				<td>
				&nbsp; &nbsp;	&nbsp;
				</td>
			</tr> --->
		
	
		</table>		



