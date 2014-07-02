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

	


<!--- <cfinclude template="dsp_connectics_redirect.cfm"> --->



	<cfparam name="url.be" default=0>
	
	
		
	


<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">		
			<tr>
				<td valign="top">

						<img src="images/headlines_eye_tracking_study.jpg">

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
					<img src="images/Element_Header_phase1.jpg"> <strong>EYE TRACKING STUDY</strong>
				</td>
			</tr>
			<tr>
				<td>
					<ul>
					<li>The purpose of the Eye Tracking Study is to see how well your winning Graphic Presentation
					compares to the results of your Impact Study. The best Graphic Presentation would be closesly aligned with your Impact Study.
					</li>
					<br><br>
					<li> In the <strong>Eye Tracking Study</strong>, marketing experts from Jumpstart Marketer will be exposed to your winning graphic presentation (highest rated) for a few seconds and then type in what they comprehended.
						They will then be shown your Graphic Presentation again four more times, and type in what they comprehend each time. 
						The result will be a realistic assessment of the order in which your Graphic Presentation is communicating.</li>
					<br><br>
					<li> After you get the results from the eye tracking study, our team will interpret the feedback you received, and input the interpreted results.
						 Based on the results you get, you can tweak your final Graphic Presentation with your designer, to make the most important elements more prominent.</li>
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
									<a href="dsp_graphic_presentation_uploadeye.cfm?be=graphic_presentation&email=1" class="bakeofflink" target="new">SEND EYE TRACKING</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>	

		
	<cfelseif url.phase eq 2>	
			
			<tr>
				<td>
					<img src="images/Element_Header_phase2.jpg"> <strong>FINAL EYE TRACKING STUDY</strong>
				</td>
			</tr>
			<tr>
				<td>
					<ul>
					<li>The purpose of the <b>FINAL Eye Tracking Study</b> is make some final improvements to your winning Graphic Presentation
					based on the results of your first Eye Tracking Study. Then you will send out your improved winning Graphic Presentation for a final round of Eye Tracking feedback.
					</li>
					<br><br>
					<li> As in the first <strong>Eye Tracking Study</strong>,  marketing experts from Jumpstart Marketer will be exposed to your new and improved winning graphic presentation for a few seconds and then type in what they comprehended.
						They will then be shown your Graphic Presentation again four more times, and type in what they comprehend each time. 
						The result will be a realistic assessment of the order in which your Graphic Presentation is communicating.</li>
					<br><br>
					<li> 
						 Based on the interpretaion of these final results you can tweak your final Graphic Presentation again with your designer before taking your product to market.</li>
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
									<a href="dsp_graphic_presentation_uploadeye.cfm?be=graphic_presentation&email=1&final=1" class="bakeofflink" target="new">SEND FINAL EYE TRACKING</a>
								</td>															
							</tr>
						</table>
					</cfoutput>	
					<hr>
				</td>
			</tr>	
	
		</cfif>			
        	<tr>
				<td>
					<font color="green">***</font> <strong>NOTE:</strong> <font color="green">***</font>
					<br>
					You can view the results of your EYE TRACKING STUDIES next to your IMPACT exercise results below.
					<br><br>	
									<table class="black14" cellpadding="5" bgcolor="FFFFFF">
										<tr>
											<td>
                                            	<cfoutput>
                                                	<cfif url.phase eq 1>
														<li><a href="index.cfm?fa=archives_eye&be=#url.be#&final=0" class="bakeofflink">EXPERT FEEDBACK Results</a></li>
                                                    <cfelseif url.phase eq 2>
                                                    	<li><a href="index.cfm?fa=archives_eye&be=#url.be#&final=1" class="bakeofflink">EXPERT FEEDBACK Results</a></li>
                                                    </cfif> 
                                                </cfoutput>
											</td>
										</tr>
									</table>

				</td>
			</tr>
			<tr>
				<td>
				&nbsp; &nbsp;	&nbsp;
				</td>
			</tr>
		
	
		</table>		



