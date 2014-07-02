
<cfparam name="url.be" default=0>

<cfoutput>
	<table width="850" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
		<tr>
			<td colspan="2" align="center">
            <BR />
				<img src="images/consultant_#url.be#_header.jpg" />	
                <br />
			</td>
		</tr>
			<tr>
				<td width="320" valign="top">
					<table width="100%" cellpadding="5" cellspacing="1" bgcolor="##666">
                    	<tr>
                        	<td bgcolor="##fbed32">
                            	
                            		<strong>#ucase(replace(url.be,"_"," "))#</strong>
                                
                           	</td>
                            <td bgcolor="##fbed32">
                            	<cfif url.be eq "key_graphic" OR url.be eq "tag_line">
                                	$600
                                <cfelseif  url.be eq "graphic_presentation" OR url.be eq "brand_logo">
                                	$2500
                                <cfelseif url.be eq "generic_descriptor">
                                	$500
				 <cfelseif url.be eq "brand">
                                	$3000
				<cfelseif url.be eq "attributes">
                                	$600
                                <cfelseif url.be eq "jumpstart_marketer">
                                	$699
                                </cfif>
                            </td>
                        <tr>
                            <td bgcolor="FFFFFF" colspan="2" align="center">
                                <img src="images/consultant_gr.jpg" />
                            </td>
                        </tr>	
                    </table>
				</td>
				<td width="480" valign="top" style="padding-left:20px;">
                	<table width="100%" cellspacing="0" cellpadding="5">
                    	<tr>
                        	<td valign="top" colspan="2">
                    <cfif url.be neq "jumpstart_marketer">
                		<strong>What You Get:</strong>
                    </cfif>
                	<cfif url.be eq "brand">
                      <ol>
                      <li>You will receive a call from one of our JumpStart marketing consultants who will work with you to get the background information necessary to create on your behalf. You can expect this call to last from fifteen to thirty minutes.
                      <br /><br />
                      <li>During the course of the call, the consultant will review the virtues of a good brand name for your agreement.
                      <br /><br />
                      <li>The consultant will suggest the category to be searched for legal clearance. Your agreement on the category selected will be required.
                      <br /><br />
                      <li> Each name will be subjected to a "Top Line" legal search within your category. Once you choose your Brand Name you will need to further clear it with a copyright attorney.  Also can you change
                      <br /><br />
                      <li>The consultant will fully explain the pros and cons of having a URL that matches your brand name.  All twenty brand names that get created will be matched with a URL to a .com or .net
                       <br /><br />
                      <li>You will be emailed the list of twenty brand names and will enter each into the Brand Name Expert Feedback exercise. 
                      	<br /><br />
                      </ol>
					 <cfelseif url.be eq "jumpstart_marketer"> 
                     As you work you way through the JumpStart Marketer process, you will begin by generating marketing content for your product or service, and paying your own graphic designers to create your images.
                     If you choose not to use your people at any time during the process, you will be offered the opportunity to hire one of our marketing consultants or graphic designers to do the work for you.
                      <br /><br />
                      The JumpStart Marketer process specifically addresses the 
						following elements:
                      <br /><br />
                      <strong><u>ELEMENTS</u></strong>
                      <br />
                      GENERIC DESCRIPTOR
                      <br />
					  BRAND NAME
                      <br />
                      BRAND LOGO
                      <br />
                      BENEFIT
                      <br />
                      ATTRIBUTES
                      <br />
                      TAG LINE
                      <br />
                      KEY GRAPHIC
                      <br />
                      IMPACT
                      <br />
                      GRPHIC PRESENTATION
                      <br />
	 
					 <cfelseif url.be eq "brand_logo"> 
                     <ol>
                        <li>You will receive a call from one of our JumpStart marketing consultants who   will work with you to get the background information necessary to create on your behalf. You can expect this call to last from fifteen to thirty minutes.
                        <br /><br />
                        <li>During the course of the call, the consultant will review the virtues of a good brand logo for your agreement.
                        <br /><br />
                        <li>The consultant will ask you for all your suggestions for subject matter you feel relevant to your business.
                        <br /><br />
                        <li>You will be emailed six Brand Logo designs for your review.
                        <br /><br />
                        <li>You may ask for three revisions total to any combination of the six designs presented.
                        <br /><br />
                        <li>A jpg of each final design will be emailed to you for submission for the Brand Logo Expert Feedback exercise.
                         <br /><br />      
                      </ol>
 					 <cfelseif url.be eq "generic_descriptor"> 
                     <ol>
                        <li>You will receive a call from one of our JumpStart marketing consultants who will work with you to get the background information necessary to create on your behalf.  You can expect this call to last from fifteen to thirty minutes.
                        <br /><br />
                        <li>You will be emailed a list of eight possible Generic Descriptors that have been ranked in order of preference based on our consultant's experience.
                        <br /><br />
                        <li>You will evaluate the list of Generic Descriptors and choose the six you feel best represent your business. 
                        <br /><br />
                        <li>If necessary, you can request one round of revisions to two of the Generic Descriptors you received.
                        <br /><br />
                        <li>Having chosen your six favorites, you will enter them into the Generic Descriptor Expert Feedback exercise.
                        <br /><br />      
                     </ol>
					 <cfelseif url.be eq "attributes"> 
                     <ol>
                        <li>You will receive a call from one of our JumpStart marketing consultants who will work with you to get the background information necessary to create on your behalf. You can expect this call to last from fifteen to thirty minutes.
                        <br /><br />
                        <li>During the course of the call, the consultant will ask you for your benefit and review the virtues of a good Attribute for your agreement.
                        <br /><br />
                        <li>The consultant will interview you to determine the nature and quantity of Attributes that are relevant to your product.
                        <br /><br />
                        <li>You will receive a list of ten Attributes for your review.
                        <br /><br />
                        <li>You may ask for a total of five revisions to any combination of the Attributes submitted.
                        <br /><br />
                        <li>A final revised list of the ten Attributes will be emailed to you for submission to the Attribute Expert Feedback exercise.
                         <br /><br />  
                     </ol>
					 <cfelseif url.be eq "brand_logo"> 
                     <ol>
                        <li>You will receive a call from one of our JumpStart marketing consultants who will work with you to get the background information necessary to create on your behalf. You can expect this call will last from fifteen to thirty minutes.
                        <br /><br />
                        <li>During the course of the call, the consultant will review the virtues of a good Tag Line for your agreement.
                        <br /><br />
                        <li>You will be emailed a list of six possible Tag Lines that have been ranked in order of preference based on our consultant's experience.
                        <br /><br />
                        <li>If necessary, you can request one round of revisions to two of the Tag Lines you received. 
                        <br /><br />
                        <li>A final revised list of the ten Tag Line will be emailed to you for submission to the Tag Line Expert Feedback exercise.
                        <br /><br />
                      </ol>
					 <cfelseif url.be eq "tag_line"> 
                     <ol>
                        <li>You will receive a call from one of our JumpStart marketing consultants who will work with you to get the background information necessary to create on your behalf. You can expect this call will last from fifteen to thirty minutes.
                        <br /><br />
                        <li>During the course of the call, the consultant will review the virtues of a good Tag Line for your agreement.
                        <br /><br />
                        <li>You will be emailed a list of six possible Tag Lines that have been ranked in order of preference based on our consultant's experience.
                        <br /><br />
                        <li>If necessary, you can request one round of revisions to two of the Tag Lines you received.  
                        <br /><br />
                        <li>A final revised list of the ten Tag Line will be emailed to you for submission to the Tag Line Expert Feedback exercise.
                        <br /><br />
                      </ol>
					 <cfelseif url.be eq "key_graphic"> 
                     <ol>
                        <li>You will receive a call from one of our JumpStart marketing consultants who   will work with you to get the background information necessary to create on your behalf. You can expect this call to last from fifteen to thirty minutes.
                        <br /><br />
                        <li>During the course of the call, the consultant will review the virtues of a good Key Graphic for your agreement.
                        <br /><br />
                        <li>You will be emailed a list of six possible Key Graphics that have been ranked in order of preference based on our consultant's experience.
                        <br /><br />
                        <li>The Key Graphics will be individual or combinations of images found in a search of the Internet. You will be notified of the origin of each knowing you will have to either purchase or recreate (using your graphic designer) the image that wins. 
                        <br /><br />
                        <li>If necessary, you can request three revisions to any combination of the Key Graphics you received.
                        <br /><br />
                        <li>A final revised list of the six Key Graphics will be emailed to you for submission to the Key Graphic Expert Feedback exercise.
                         <br /><br /> 
                      </ol>  
					 <cfelseif url.be eq "graphic_presentation"> 
                     <ol>
                        <li>You will receive a call from one of our JumpStart marketing consultants who will work with you to get the background information necessary to create on your behalf. You can expect this call will last from fifteen to thirty minutes.
                        <br /><br />
                        <li>During the course of the call, the consultant will review the virtues of a good Graphic Presentation for your agreement.
                        <br /><br />
                        <li>You will be emailed three Graphic Presentations based upon your discussion with the consultant and his experience. 
                        <br /><br />
                        <li>If necessary, you can request a total of six revisions to any combination of the Graphic Presentations you received.
                        <br /><br />
                        <li>A JPG of each final Graphic Presentation design will be emailed to you for submission for the Graphic Presentation Expert Feedback exercise.
                        <br /><br />
                        <li>The winning Graphic Presentation will be emailed to you either as a high res Photoshop or Illustrator file.
                         <br /><br />    
                     </ol>                           
                      </cfif>  
                     		</td>
                         </tr>
                        <tr>
                            <td width="50%" style="border-top: solid ##666 2px; background-color:##fbed32;">
                                <div align="left">TOTAL</div>
                            </td>
                            <td width="50%" style="border-top: solid ##666 2px; background-color:##fbed32;">
                                <div align="right">
                                    <cfif url.be eq "key_graphic" OR url.be eq "tag_line" OR url.be eq "attributes">
                                         $600
                                    <cfelseif  url.be eq "graphic_presentation" OR url.be eq "brand_logo">
                                        $2500
                                    <cfelseif url.be eq "generic_descriptor">
                                        $500
				   <cfelseif url.be eq "brand">
                                        $3000
                                    <cfelseif url.be eq "jumpstart_marketer">
                                        $699
                                    </cfif>   	
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="100%" bgcolor="FFFFFF" colspan="2">              
                                <div align="right">
                                	<cfif url.be eq "jumpstart_marketer">
                                    	<a href="index.cfm?fa=legal&bg=1"><img src="images/consultant_get_started.jpg" border="0" /></a>
                                    <cfelse>

				               <form action="https://www.paypal.com/cgi-bin/webscr" method="post">


                                   		
						<input type="hidden" name="cmd" value="_xclick">
    <input type="hidden" name="business" value="ericdchambers69@gmail.com">
    <input type="hidden" name="item_name" value="Jumpstart Marketer">
    <input type="hidden" name="item_number" value="1">

    <cfif url.be eq "brand">
    <input type="hidden" name="amount" id="amt" value="3000">
    </cfif>
     <cfif url.be eq "generic_descriptor">
    <input type="hidden" name="amount" id="amt" value="500">
    </cfif>

     <cfif url.be eq "brand_logo">
    <input type="hidden" name="amount" id="amt" value="2500">
    </cfif>

    <cfif url.be eq "tag_line">
    <input type="hidden" name="amount" id="amt" value="600">
    </cfif>

    <cfif url.be eq "key_graphic">
    <input type="hidden" name="amount" id="amt" value="600">
    </cfif>

    <cfif url.be eq "graphic_presentation">
    <input type="hidden" name="amount" id="amt" value="2500">
    </cfif>

    <cfif url.be eq "attributes">
    <input type="hidden" name="amount" id="amt" value="600">
    </cfif>


    
    <input type="hidden" name="quantity" value="1">		
    <input type="hidden" name="no_note" value="1">
    <input type="hidden" name="currency_code" value="USD">
    <input type="hidden" name="lc" value="US">
    <input type="hidden" name="return" value="http://www.mypowermarketer.com/index.cfm?index.cfm?fa=legal&bg=1">
    <input type="image" src="images/consultant_get_started.jpg" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">


						</form>
                                    </cfif>
                                </div>
                            </td>
                        </tr>
                     </table>                       
				</td>
			</tr>
	</table>
</cfoutput>