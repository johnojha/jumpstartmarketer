


				<cfquery name="update" datasource="#application.dsn#"> 
					UPDATE t_client_progress
						SET key_graphic_education = 1
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

									 <div class="black16" align="center"><img src="images/edu_key_graphic.jpg">  </div>
								 <br>	
The Key Graphic is an important visual element that immediately communicates something remarkable about you product or service. It does not include a visual of the product or service you provide, the product visual is addressed separately. 
 <br><br> 
The Key Graphic can be very effective in triggering character to support a Key Attribute or Benefit. If you were selling a room deodorizer that claimed to eliminate tough odors, the key graphic might be a photograph of a skunk in a living room. The skunk is the key graphic that would characterize the toughest odor of all. It's implied that if this product can handle a skunk, it can handle your odor problem. 
 <br><br> 
If you take a close look at the "pop up" ad below you will see this is a realistic analogy. Now is a good time to start looking for the skunk equivalent for your product or service.
 <br><br> 
									<img src="images/thornell.jpg">
								 <br><br>  

If you create a great Key Graphic and are lucky it can also become a MNEMONIC. The word Mnemonic is defined as "a short rhyme, phrase or other mental technique for making information easier to memorize." It is properly pronounced with the first letter "M" silent. Target Consumers are "hard wired" in the brain to lock on to an image and substitute it for your Selling Proposition. That can be a logo or a key graphic. When you see a bright orange graphic like the billboard below, you probably know by now it's an ad for ING Direct and won't bother to acknowledge it. Or if you see a green Gecko, you are likely to think of Geico Insurance. Both of these are great examples of Mnemonics that have been created beyond the brand's trademark.   								<br>
									 <br><br>  
                                    <img src="images/savers.jpg">
								 <br><br>  
 
Beyond graphics, a Mnemonic can also be a sound. For example, I'm sure you remember the old Intel Pentium commercials with that jingle at the end of every commercial? You will find yourself instantly aware of Selling Propositions in TV and radio commercials as soon as you hear that familiar sound. 
<br><br> 
The iPod was introduced with a Key Graphic whose character captured the essence of the product. It became an instant Mnemonic. Initially, it was a black silhouette of its user dancing with its contrasting white player and headphones clearly visible. Today it still retains all of its character and effectiveness, even as it has evolved into a more colorful presentation. 

    								<br><br> 
									<img src="images/ipod.jpg">
								 <br><br>   
<br><br>								

Now that you have a clear understanding of the nature and function of a great Key Graphic, it is time to create one for your business by beginning the <strong>Expert Feedback Process</strong>.

							 <br><br>
								Please click below.
								<br><br>

								<a href="index.cfm?fa=elements&be=key_graphic&bg=1"><img src="images/btn_expert_feedback_process.jpg" border="0"></a>

						<br><br> 


				</td>
			</tr>
			<tr>
				<td>

				</td>
			</tr>
	</table>		