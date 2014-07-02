

				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET brand_logo_education = 1
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


			<br><br>		
<A HREF="javascript:window.print()" class="bodylink3">Print This Page</a>							 <div class="black16" align="center"><img src="images/edu_brand_logo.jpg"> </div>   
								 <br>

What is generally referred to as a logo has two possible graphic components. <br />
(1) The logotype which is your brand name that has been graphically altered to achieve the appearance of uniqueness.
<br /> 
(2) The logo which is your brand symbol that can be used to communicate the brand without using its words. 
 <br><br>	
Using the following nine rental car brand trademarks, I will demonstrate the virtues of a strong trademark.

 <br><br>	
	 	 	 
<img src="images/rentalcars.jpg" />

 	 	 	 

<br><br>				
 
	 		


<strong>Alamo</strong> has no logo but has placed its logotype inside of a rectangular shape. It is generally bad idea to place your brand name inside a graphic as it restricts its size. Compare the size of the “Alamo” typeface relative to the others. Fox, Enterprise and Dollar suffer the same size restrictions issue.
<br><br>	
<strong>National</strong> is a logotype with an accompanying logo that is a heavily stabilized “N”. The logo will gain consumer recognition over time and can be used without the logotype.
<br><br>	
<strong>Hertz, Avis and Thrifty</strong> have only a logotype that is mildly stylized.
<br><br>	
<strong>Budget</strong> has a logotype and a logo. The logo has a radical horizontal shape that does not work well with the logotype. Together they create an absurd horizontal shape that forces the brand name to be very small.
<br><br>	
<strong>Dollar</strong> has incorporated their logo inside of their logotype, which is common and often effective. In this scenario you are always exposing the logo anytime you use the logotype. The logo can be pulled out and used by itself when appropriate.
<br><br>	
<strong>Advantage Rent-A-Car</strong> chose to include the “rent-a-car” generic descriptor in its logotype, which seems to diminish the importance of the name “Advantage”. Add its logo symbol and it is very busy when compared to the others.
<br><br>	
<strong>Enterprise</strong> has a stylized logo “E” that works well for them but along with the logotype is all contained within a shape. Unless the logo or logotype is pulled out of the shape they will always be smaller than those like Hertz, Avis and Thrifty.
<br><br>		
NOTE: The logotype of Hertz, Avis and Thrifty could have been more graphically stylized to add more character and still have remained easy to see and read.
<br><br>	
Here are a few more great examples of brand 
<br /><br />
<img src="images/brand_logo_examples.jpg" />
	
	<br /><br />							
								
								Now that you have a clear understanding of the nature and function of a great Brand Logo, it is time to create one for your business by beginning the <strong>Expert Feedback Process</strong>.
								
								 <br><br>
								Please click ONE option below.
								<br><br>

								<li><a href="index.cfm?fa=bakeoff_brand_logo&be=brand_logo&bg=1&phase=1">I want to develop a BRAND LOGO</a></li>
                                <br><br>
                                <li><a href="index.cfm?fa=upload_logo&be=brand_logo">I have an existing BRAND LOGO</a></li>
							

						<br><br> 
								 
								 
				</td>
			</tr>
			<tr>
				<td>

				</td>
			</tr>
	</table>		