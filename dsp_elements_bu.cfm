	<cfparam name="url.be" default=0>
	
	
		<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr>
				<td>	
					<cfoutput>
						<img src="images/Element_Header_#url.be#.jpg">
					</cfoutput>
				</td>
			</tr>
			<tr>
				<td>
					<cfif url.be eq "brand">
					<li><b>Brand:</b>  The idendifier by which your product or service becomes known and referred to by the target consumer.</li>
					<cfif url.be eq "sub_brand">
					
					</cfif>
				</td>
			</tr>	
			<tr>
				<td nowrap>
				<br>
					<li><strong>A great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> should be:</strong> <br>
				
					&nbsp; &nbsp; &nbsp; &nbsp; - Short <br>
					&nbsp; &nbsp; &nbsp; &nbsp; - Poetic <br>
					&nbsp; &nbsp; &nbsp; &nbsp; - Memorable <br>
					&nbsp; &nbsp; &nbsp; &nbsp; - Have Character 
				
				</td>
			</tr>	
			<tr>
				<td>
				<br>
				<li>A great brand should never define or describe the product.</li>
				<li>Examples of great <cfoutput>#replace(ucase(url.be),"_"," ")#</cfoutput> names are... </li><br>
					&nbsp; &nbsp; &nbsp; &nbsp; - Google, Splenda, iPod, Amazon & Tide <br>
					&nbsp; &nbsp; &nbsp; &nbsp; - Notice they do not define the product. <br>
				<br><br>
				</td>
			</tr>
			<tr>
				<td bgcolor="FFFFCC" align="center">
				<font color="green">*** <strong>We highly recommend you learn more about BRANDS before creating your own.</strong> ***</font> 
						<br>
					<strong>Please click on either "READ TEXT" or "WATCH VIDEO" below.	</strong>			
				</td>
			</tr>
			<tr>
				<td align="center">	
					<cfoutput>
						<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14" bgcolor="000000">
							<tr>
								<td rowspan="2" valign="middle" bgcolor="FFFFCC" nowrap align="center" width="10%">
									<font color="CC0000">Step 1.</font>
								</td>
								<td bgcolor="354E66" rowspan="2" valign="top" width="50%">	
									You must learn this  #replace(ucase(url.be),"_"," ")# information <br>
									in order to have this process work effectively.			
								</td>
								<td bgcolor="CC0000" align="center" width="40%">
									<a href="dsp_#url.be#_cont.cfm" class="bodylink2" target="new"><b>READ TEXT</b></a>
								</td>
							</tr>
							<tr>							
								<td bgcolor="99CCFF" align="center" class="black14" nowrap width="40%">
									<b>WATCH VIDEO</b>
								</td>															
							</tr>
							<tr>
								<td bgcolor="000000" height="10" colspan="3">
									
								</td>
							</tr>
						</table>
					</cfoutput>
				</td>
			</tr>
			<tr>
				<td>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center">
				<strong>After you have reviewed the above content, <br>
				<font color="green">click below to begin the <font color="black">Bake Off</font> Process.</font></strong>	<br>	
							<cfoutput>					
					<a href="index.cfm?fa=bakeoff_#url.be#&be=#url.be#&bg=1"><img src="images/Element_header_#url.be#.jpg" border="0"><img src="images/continue_white.jpg" border="0"><img src="images/Element_header_bakeoff.jpg" border="0">
							</cfoutput>													
											 <br><br>		
				</td>
			</tr>			
	
		</table>		