
				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET rtb_education = 1
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

										 <div class="black16" align="center"><b>ENDORSEMENTS</b> </div>
								 <br><br>		
				
The Endorsement is an outside authority that endorses your product or service in some way. 
<br><br> 
The Endorsement is illusive, yet can be powerful for the right product or service.  In this context, we are referring to any claim that typically acts as an endorsement, an external authority of some kind.  It does not necessarily have to be a recognizable source. "Doctor Recommended" for instance is vague, yet still infers that an outside source recommends the product.  The Good Housekeeping seal has been used seemingly forever, and is therefore considered unremarkable by the target consumer.  If they actually understood what little is required to display that seal, it would surely lose what little charm it has left. 
<br><br> 
Endorsements are most effective for a product or service that is highly personal and therefore sensitive.  Over-the-counter medications and nutritional supplements are good examples.  Products like these are purchased for the most part on a leap of faith and need support. 
<br><br> 
These Nature Made supplements both have Endorsements incorporated right into their Selling Propositions.  Triple Flex displays the official trademark of the "Arthritis Foundation," and Cholest Off points out that it’s "Clinically Proven.”  Both of these endorsements are appropriate and likely considered Remarkable by their intended target consumers. 

  								<br>
									<img src="images/nature_made1.jpg"><img src="images/nature_made2.jpg">
								 <br><br>  
  
We have also noticed that endorsements are often effective for products or services targeted at children.  This applies mostly to those that are purchased by parents for their children.  Parents seem to feel more comfortable if they are aided in the evaluation process. 
<br><br> 
The "Good Night" book below represents a child/parent event that is as emotionally sensitive as any I can think of.  What self respecting parent wouldn’t want their kid to have happy thoughts while falling asleep?  Having a Endorsement like the "National Parenting Publication Award" is a perfect positioning element to provide that reassurance. 


   								<br>
									<img src="images/good_night.jpg">
								 <br><br> 



								  <br><br> 
<!--- Before you begin working on your Endorsement, click on the Examples button that follows and review the examples to see how they relate to your business.
 <br><br> 
									<a onclick="javascript:popUp('dsp_examples.cfm?be=rtb')">
										<img src="images/examples_white.jpg">
									</a>
 <br><br>  --->
Now that you have a clear understanding of the nature and function of a great Endorsement it is time to create one for your business. 
 <br><br> 
							Please click below.
								<br><br>

								<a href="index.cfm?fa=elements&be=rtb&bg=1"><img src="images/friends_feedback_process.jpg" border="1"></a>
							
						
								<br><br>	

					
					
				</td>
			</tr>
			<tr>
				<td>

				</td>
			</tr>
	</table>		