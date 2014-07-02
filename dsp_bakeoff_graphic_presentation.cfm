	<cfparam name="url.be" default=0>
	<cfparam name="url.updated" default=0>
	<cfparam name="url.phase" default=0><head>

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

			
			<cfif url.updated eq 1>
					<tr>
						<td>
							<font color="E62128">*** Your <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s have been added. ***
							<br><br>
							If you have entered all 6 <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput>s, please proceed to Phase 2 below.</font>
						</td>
					</tr>
			</cfif>
			
	<cfif url.phase eq 1>
			<tr>
				<td>
					<img src="images/Element_Header_phase1.jpg">
				</td>
			</tr>
			<tr>
				<td>	
	<p>
<style>

ul {list-style-type:square;line-height:30px;}
</style>

<ul>

<li>	You have now created all the elements of your selling proposition. 
Having completed the "Expert Feedback" and "Consumer Feedback" exercises, you know which options are the most remarkable. </li>
<li>	You have also completed the important IMPACT exercise. The results of the IMPACT exercise show you which elements of your selling proposition are considered most important. This information will help you decide which elements you want to feature more prominently in your Graphic Presentation.</li>
<li>	Now it is time to make your GRAPHIC PRESENTAIONS. This means putting different combinations of the elements (Brand, Sub-Brand, Generic Descriptor, etc.) of your selling proposition together in a graphic layout. If you have graphic design talent, you can do it yourself. If not, you will need the help of a trained graphic designer.</li>
<li>	You will need to develop three alternate layouts using Adobe Photoshop, or Illustrator.</li>

</p>

<p>As you develop each layout, one thing should be common to all three, the order in which the eye tracks through each of them. You determine that by analyzing the results from your IMPACT exercise. Go back to the Impact results and print them out so you can refer to them. Look at the top two or three scoring elements and you will most likely find the Benefit and it’s Attribute Driver. These two elements together are where your consumers will make the decision to purchase your product. We refer to this as a trigger. This trigger should be the second thing that consumers see when they encounter your Selling Proposition.</p>
<p>Consumers have been conditioned to look first at the upper left corner of a layout irrespective of it being a package front, billboard, home page, print ad or a consumer package. We therefore recommend you locate your Brand/Generic Descriptor in that space. From there we know they are most comfortable moving to the right and down so we recommend you locate your Benefit/Attribute driver in that space.</p>
<p>As you develop each layout, continually evaluate them by slightly squinting your eyes to see what elements seem to stand out and make the adjustments necessary to accomplish the following two impressions. 1st, the eye should be attracted to the Brand/ Generic Descriptor working as one unit. 2nd, the eye should move to the Benefit/Attribute driver working as one unit. Where it tracks after that is a judgment call for you to make based on your experience and the results of your Impact exercise.</p>

<ul>
<li>
You do not have to use all the elements in every GRAPHIC PRESENTATION. One layout may feature the Benefit & Attributes, and Key Graphic more prominently, while another has the Brand and Generic Descriptor most prominent.
</li>
<li>
It is up to you and your designer to decide what goes into each layout. Use the results from all previous exercises, and the insights you have gained about what elements your consumers respond most favorably to, to design your three different layouts. You want to keep in mind the elements you think have the most potential to influence the buying decision.
</li>

<li>Take time to study the layouts below to get a clear sense of how this critical tracking pattern is executed correctly.</li>

<p>Below is GymRa’s three different layouts:</p>

<img src="gymra.jpg" alt="" width="100%" />

<p>Below are other examples layouts with the Brand, Generic Descriptors, Benefits and Attributes circled in red:</p>



<img src="gymra2.jpg" alt=""   width="100%"/>

<img src="gymra3.jpg" alt=""  width="100%" />

<img src="gymra4.jpg" alt=""   width="100%"/>



<li>When you are happy with your three layouts, save each layout as a .jpg no larger than 1000 x 800 and proceed with PHASE 1.</li>

					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									<p>When you have your three Graphic Presentation layouts, click on the checkbox below and hit SUBMIT.</p>
				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<form action="act_key_graphic_names.cfm?be=graphic_presentation" method="post">
										I have my Graphic Presentations ready: <input type="checkbox" name="graphic_presentation_ready" value="1">
										&nbsp; &nbsp; <input type="submit" value="  SUBMIT  ">
									</form>
								</td>															
							</tr>
						</table>
					</cfoutput>	

				</td>
			</tr>	
	<cfelseif url.phase eq 2>
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
									<a href="dsp_graphic_presentation_upload.cfm?be=#url.be#&email=1" class="bakeofflink" target="new">UPLOAD</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
	
				</td>
			</tr>
		
		<cfelseif url.phase eq 3>	
			
			<tr>
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
					<font color="green">***</font> <strong>NOTE:</strong> <font color="green">***</font>
					<br>
					You will be contacted regarding the results of your EYE TRACKING STUDY to help you interpret the results.
					<br><br>	
					You can view the results for your EYE TRACKING STUDY below your other GRAPHIC PRESENTATION results:
									<table class="black14" cellpadding="5" bgcolor="FFFFFF">
										<tr>
											<td>
												<li><a href="index.cfm?fa=archives&be=#url.be#" class="bakeofflink">CONSUMER FEEDBACK Results</a></li>
											</td>
										</tr>
									</table>
<!--- 					You now have an optimum layout that fully communicates your Selling Proposition. 
					<br><br>	
					CONGRATULATIONS....you are ready to go to war. 
					<br><br>	 --->
				</td>
			</tr>
		
		<cfelseif url.phase eq 4>	
			
			<tr>
				<td>
					<img src="images/Element_Header_phase4.jpg"> <strong>FINAL EYE TRACKING STUDY</strong>
				</td>
			</tr>
			<tr>
				<td>
					<ul>
					<li>The purpose of the <b>FINAL Eye Tracking Study</b> is make some final improvements to your winning Graphic Presentation
					based on the results of your first Eye Tracking Study. Then you will send out your improved winning Graphic Presentation for a final round of Eye Tracking feedback.
					</li>
					<br><br>
					<li> As in the first <strong>Eye Tracking Study</strong>, your target consumers will be exposed to your new and improved winning graphic presentation for a few seconds and then type in what they comprehended.
						They will then be shown your Graphic Presentation again four more times, and type in what they comprehend each time. 
						The result will be a realistic assessment of the order in which your Graphic Presentation is communicating.</li>
					<br><br>
					<li> 
						 Based on the interpretaion of these fianl results you can tweak your final Graphic Presentation again with your designer before taking your product to market.</li>
						<br><br>					
						<li>Click The SEND EYE TRACKING link below to select your improved WINNING graphic presentation, and to send your target consumers the "Final Eye Tracking Study" exercise.<br></li>
						<br><br>
					</ul>
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="10" class="black14" bgcolor="E62128">
							<tr>
								<td bgcolor="FFFFFF" valign="top" align="center">	
									Send the Final Eye Tracking Study 				
								</td>
							</tr>
							<tr>														
								<td bgcolor="FFFFFF" align="center">
									<a href="dsp_graphic_presentation_uploadeye.cfm?be=#url.be#&email=1&final=1" class="bakeofflink" target="new">SEND FINAL EYE TRACKING</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>	
			<tr>
				<td>
					<font color="green">***</font> <strong>NOTE:</strong> <font color="green">***</font>
					<br>
					You will be contacted regarding the results of your FINAL EYE TRACKING STUDY to help you interpret the results.
					<br><br>	
					You can view the results for your EYE TRACKING STUDIES below your other GRAPHIC PRESENTATION results:
									<table class="black14" cellpadding="5" bgcolor="FFFFFF">
										<tr>
											<td>
												<li><a href="index.cfm?fa=archives&be=#url.be#" class="bakeofflink">CONSUMER FEEDBACK Results</a></li>
											</td>
										</tr>
									</table>
<!--- 					You now have an optimum layout that fully communicates your Selling Proposition. 
					<br><br>	
					CONGRATULATIONS....you are ready to go to war. 
					<br><br>	 --->
				</td>
			</tr>
		</cfif>	
			<tr>
				<td>
				&nbsp; &nbsp;	&nbsp;
				</td>
			</tr>
		
	
		</table>		



