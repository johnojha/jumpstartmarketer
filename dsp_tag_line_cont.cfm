				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET tag_line_education = 1
					WHERE cid = #client.cid#
				</cfquery>



			<SCRIPT LANGUAGE="JavaScript">	
				function popUp(URL) {
				day = new Date();
				id = day.getTime();
				eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=350,height=500,left = 476,top = 332');");
				}
			</script>

<link href="styles/style1.css" rel="stylesheet" type="text/css">

	<cfquery name="level" datasource="#application.dsn#">
		SELECT expert
		FROM t_clients
		WHERE id = #client.cid#
	</cfquery>


		<table width="600" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr>
				<td>
<A HREF="javascript:window.print()" class="bodylink3">Print This Page</a>									
<br><br>	

			
								 <div class="black16" align="center"><img src="images/edu_tag_line.jpg">  </div>
								 <br>
The Tag Line is three to five words that are attached to the selling proposition, with the intent that the target consumer will remember it. It is typically used in advertising and not often found on a consumer-packaged product. 
 <br><br> 
Most tag lines are clever or cute and, therefore, somewhat short-lived. Since they can become stale quickly, it's not a good idea to have it on the package or brochure that could take six months or longer to move off the store shelves. We feel a lone tag line suffers the same shortcomings as an isolated bullet point – when unsupported, they seem to have no power. 
 <br><br> 
An effective way to develop a tag line is to pick up a familiar line or cliché that can be applied to your product. Hollywood is famous for using this technique. In the example of the movie "The Reaping" the tag line "What Hath God Wrought" is larger than the actual movie title. The marketing team most likely concluded that the tag line added more character than the title. It is also likely more memorable given that it's a familiar line from The Bible.

 								 <br><br> 
									<img src="images/reaping.jpg">
								 <br><br> 

Shorter is sweeter and if you think three to five words is not enough to get it done consider these two. The tag line is "Claritin Clear" is short, poetic, memorable, and a direct interpretation of the brand's benefit. It's not an over-promise or a line that will wear out in six months. We particularly like this one because it's a benefit and seems to be a powerful one.									
 								<br><br> 
						<img src="images/claritin_clear.jpg">
								 <br><br> 
 
"Just Do It" is another legendary three-word tag line I'm sure you know. Neither of these lines appears on any packaging, yet Nike's has become a "household word" based upon its redundant use in print and broadcast advertising. This one seems to be a challenge and addresses the user, not the product. We would never recommend putting this one on a package until well established.   								<br>
									 <br><br> 
                                    <img src="images/nike.jpg">
								 <br><br> 
In the following ad you can see a very effective use of a tag line. "We put the law on your side" is located where the target consumer is likely to see it immediately after the brand name. The fundamental purpose of a good tag line is to cause the target consumer to want to know more about the product. 
									 <br><br> 
                                    <img src="images/legal_zoom.jpg">
								 <br><br> 

Now that you have a clear understanding of the nature and function of a great Tag Line, it is time to create one for your business by beginning the <strong>Expert Feedback Process</strong>.

							 <br><br>
								Please click below.
								<br><br>

								<a href="index.cfm?fa=elements&be=tag_line&bg=1"><img src="images/btn_expert_feedback_process.jpg" border="0"></a>
							
						
								<br><br>
	 


						<br><br> 

					
				</td>
			</tr>
			<tr>
				<td>

				</td>
			</tr>
	</table>		