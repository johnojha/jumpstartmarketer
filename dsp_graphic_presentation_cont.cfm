

				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET graphic_presentation_education = 1
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
	
		<!--- Lower level description --->	
						<div class="black16" align="center"><img src="images/edu_graphic_presentation.jpg">  </div>
								 <br>	
		
The Graphic Presentation is made up of the words and graphics that combine to communicate your selling proposition. 
 <br><br>  
At your Impact Point, you will organize all of the critical elements into your Graphic Presentation. These days the most obvious example of Graphic Presentation at the Impact Point is a home page on the Internet. You can review and judge the effectiveness of thousands if you go online and surf through any category that interests you. Our observation is that Internet businesses most often use poor graphic communication. They settle by using just their name and a generic descriptor or what they sell. You should also take some time to check out storefronts by Googling "retail storefronts" and you will be surprised how little they communicate their selling propositions.  The best example of Graphic Presentation at the Impact Point is on consumer goods packages. You can review and judge the effectiveness of thousands if you Google "product package design". 
 <br><br>  
Your graphic presentation has a very specific order. There are exceptions, but for simplicity I will present them to you in the most common order. 
 <br><br>  
1ST: The overall IMPACT of your Graphic Presentation must set you aside from competitors at first glance. This will cause your target consumer to engage in your Selling Proposition. Think about it… you could have the best selling proposition in the world, but your potential customers won't get that far if you don't have effective impact to draw them in. 
 <br><br>  
2nd: Your BRAND NAME is second in importance. Your target consumers will use it to remember you in the future. It will characterize your product or service. 
 <br><br>  
3rd: Next is your GENERIC DESCRIPTOR. It will simply define your product or service. It should be smaller (about one third the height) and located immediately after your brand name so that they work as one message. 
 <br><br>  
4th: KEY GRAPHIC is next. It should add character to one or more of your positioning elements. This could be a photograph, an illustration, or even an easy peek through a retail window. 
<br><br>   
5th: Your BENEFIT and ATTRIBUTES are next. These are relatively ineffective when alone, but very powerful when positioned together. Your Benefit (only one) should precede your Attributes (two are perfect). Remember the Attributes empower the Benefit. 
 <br><br>  
6th: The TAG LINE is somewhat schizophrenic in its application. You must decide its role and apply it accordingly. I do not recommend that it appear on a consumer goods package at all. However on the other hand, it may be the most dominant element on a billboard ad. On a storefront, it may play an intermediate role. 
<br><br>  
Let's take a look at the Gymra website below as it relates to the total graphic presentation. This site is very well organized. Look at the flow from the brand name/generic descriptor in the upper left down through the benefit, "You will love the way you look" continuing down through the attributes that support it. What remains is simply to learn how it works and that too is very well executed.

    								<br><br>  
									<img src="images/gymra_gp.jpg">
								 <br><br>   

Let's also look at the new Toss' N Done laundry detergent below. This too is very well organized. Look at the flow from the Arm & Hammer brand name down to the Toss' N Done sub-brand/generic descriptor on down through the benefit, "Fast & Easy" continuing down through the attributes that support it. There is nothing more to communicate to its intended consumer. This product is targeted to unsophisticated users who want it to simplify their lives.
    								<br><br> 
									<img src="images/toss_n_done.jpg">
								 <br><br>   

Now that you have a clear understanding of the nature and function of a great Graphic Presentation, it is time to create one for your business by beginning the <strong>Consumer Feedback Process</strong>.

							 <br><br>
								Please click below.
								<br><br>

								<a href="index.cfm?fa=elements&bg=1&be=graphic_presentation"><img src="images/btn_consumer_feedback_process.jpg" border="0"></a>
							
						
								<br><br>

				</td>
			</tr>
			<tr>
				<td>

				</td>
			</tr>
	</table>		