<cfparam name="url.element" default=0>
<cfparam name="url.rated" default=0>
<cfparam name="url.sent" default=0>
<cfparam name="mailList" default=0>
<cfparam name="url.nosub" default=0>
<cfparam name="url.existing_brand" default=0>
<cfparam name="url.existing_sub_brand" default=0>

<cfset shaquerystring=0 >


<cfif StructKeyExists(session,"shaurl") >
 <cfset shaquerystring='sent=' & session.shaurl >
<cfelse>
 <cfset shaquerystring=0 >
</cfif>

	<!--- Queries for seeing if friends and consumer work has been done --->

<!---  <cfoutput>
	#client.cid#, #client.name#
</cfoutput>
<cfabort>  --->
	
<cfinclude template="functions/Consumer_Feedback.cfm">

	<cfquery name="b" datasource="#application.dsn#"> 
		SELECT no_brand, no_sub_brand, existing_brand, existing_sub_brand
		FROM t_business 
		WHERE cid = #client.cid#
	</cfquery>			


		<cfquery name="choice" datasource="#application.dsn#">
			SELECT b.id, b.cid, b.brand, b.sub_brand, b.brand_logo, b.sub_brand_logo, b.generic_descriptor, b.benefit, b.attributes, b.tag_line, b.rtb, 
						b.key_graphic, b.impact, b.graphic_presentation, b.brand_rating, b.sub_brand_rating, b.brand_logo_rating, b.sub_brand_logo_rating, b.generic_descriptor_rating, 
						b.benefit_rating, b.attributes_rating, b.tag_line_rating, b.rtb_rating, 
						b.key_graphic_rating, b.impact_rating, b.graphic_presentation_rating, b.no_brand, b.no_sub_brand, existing_brand, existing_sub_brand
			FROM t_business b INNER JOIN
				t_clients c ON c.id = b.cid
			WHERE b.cid = #client.cid#
		</cfquery>		
		
		<table width="800" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="003366">
			<tr>
				<td colspan="2" bgcolor="FFFFFF">
					  <img src="images/my_business_header.jpg" align="left">  
                      <a href="index.cfm?fa=view_sp" class="bodylink"><img src="images/my_selling_proposition.jpg" border="0" align="right" vspace="10" /></a>
				</td>
			</tr>
				<cfif url.element neq 0>
					<tr>
						<td  height="20" colspan="8">
							<font color="yellow">*** Your <cfoutput>#ucase(url.element)# has been submitted.</cfoutput> ***</font>
						</td>
					</tr>
				</cfif>
				<cfif url.sent neq 0>
					<tr>
						<td  height="20" colspan="8">
							<font color="yellow">*** Your <cfoutput>#ucase(url.be)# feedback requests have been sent.</cfoutput> ***</font>
						</td>
					</tr>
				</cfif>
				<cfif url.nosub neq 0>
					<tr>
						<td  height="20" colspan="8">
							<font color="yellow">*** SUB-BRAND has been removed from your selling proposition. ***</font>
						</td>
					</tr>
				</cfif>
				<cfif url.existing_brand neq 0>
					<tr>
						<td  height="20" colspan="8">
							<font color="yellow">*** Your BRAND has been added to your selling proposition. ***</font>
						</td>
					</tr>
				</cfif>
				<cfif url.existing_sub_brand neq 0>
					<tr>
						<td  height="20" colspan="8">
							<font color="yellow">*** Your SUB-BRAND has been added to your selling proposition. ***</font>
						</td>
					</tr>
				</cfif>
				
				
		<cfoutput>
			
		
        <cfif graphic_presentation_uploads.recordcount gte 3 AND 2 eq 1>
			<tr>			
				<cfif eye2_count.recordcount gte 5>
					<cfif ack.acknowledge_yourself eq 0>
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=acknowledge_yourself&bg=1" class="bodylink"><img src="images/headlines_ready_to_launch.jpg" border="0"></a>
				</td>
			</tr>
         </cfif>
         
         
 		<!---Display row for Generic Descriptor--->
			<tr>			
				<cfif choice.generic_descriptor eq "">
					<!--- <cfif consumer_generic_descriptor.recordcount lt 5> --->
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<!--- <cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif>  ---> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=generic_descriptor&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_generic_descriptor.jpg" border="0"></a>
				</td>
			</tr>        
         
		<!---Display row for BRAND--->
			<tr>
            	<cfif choice.generic_descriptor neq "">			
					<cfif choice.brand eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif>

				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=brand&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_brand.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for BRAND LOGO--->
			<tr>			
				<cfif choice.brand neq "">
					<cfif choice.brand_logo eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=brand_logo&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_brand_logo.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for Sub BRAND--->
<!--- 		<cfif b.no_sub_brand neq 1>
			<tr>			
				<cfif choice.brand_logo neq "">
					<cfif choice.sub_brand eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=sub_brand&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_sub_brand.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for Sub BRAND LOGO--->
			<tr>			
				<cfif choice.sub_brand neq "">
					<cfif choice.sub_brand_logo eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=sub_brand_logo&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_sub_brand_logo.jpg" border="0"></a>
				</td>
			</tr>
		</cfif> --->
	
			<!---Display row for BENEFIT--->
			<tr>		
				<cfif choice.brand_logo neq "" OR choice.no_brand eq 1 OR choice.existing_brand eq 1>
					<cfif choice.benefit eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=benefit&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_benefit.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for ATTRIBUTES--->
			<tr>			
				<cfif choice.benefit neq "">
					<cfif choice.attributes eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=attributes&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_attributes.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for TAG LINE--->
			<tr>			
				<cfif choice.attributes neq "">
					<cfif choice.tag_line eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=tag_line&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_tag_line.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for RTB (Endorsements)--->
<!--- 			<tr>			
				<cfif choice.tag_line neq "">
					<cfif choice.rtb eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=rtb&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_rtb.jpg" border="0"></a>
				</td>
			</tr> --->
			<!---Display row for KEY GRAPHIC--->
			<tr>			
				<cfif choice.tag_line neq "">
					<cfif choice.key_graphic eq "">
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=key_graphic&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_key_graphic.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for IMPACT--->
			<tr>			
				<cfif choice.key_graphic neq "">
					<cfif impact_count.recordcount lt 5>
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=impact&be=impact&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_impact.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for GRAPHIC PRESENTATION--->
			<tr>			
				<cfif impact_count.recordcount gte 5>
					<cfif graphic_presentation_uploads.recordcount lte 3 OR eye_count.recordcount lte 5>
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=graphic_presentation&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_graphic_presentation.jpg" border="0"></a>
				</td>
			</tr>
			<!---Display row for EYE TRACKING STUDY--->
			<!--- <tr>			
				<cfif choice.graphic_presentation neq "">
					<cfif eye2_count.recordcount lt 5>
						<td bgcolor="FFFFFF" width="10%" align="right">
							<img src="images/hand_v1.jpg">
						</td>
					<cfelse>
						<td bgcolor="FFFFFF">
							<img src="images/completed_big.jpg">
						</td>	
					</cfif>
				<cfelse>
					<td bgcolor="FFFFFF">&nbsp;
						
					</td>		
				</cfif> 
				<td valign="top" bgcolor="FFFFFF">
					<a href="index.cfm?fa=elements&be=eye_tracking_study&bg=1&sentnew=0&#shaquerystring#" class="bodylink"><img src="images/headlines_eye_tracking_study.jpg" border="0"></a>
				</td>
			</tr> --->
	
		</cfoutput>
		
		
		</table>