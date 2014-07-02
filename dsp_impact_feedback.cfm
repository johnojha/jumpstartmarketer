<cfparam name="url.primary" default=1>
<cfparam name="url.secondary" default=2>
<cfparam name="url.cid" default=0>
<cfparam name="url.feedback" default=0>
<cfparam name="url.done" default=0>
<cfparam name="variables.top_num" default=5>	

<style type="text/css">
	input.radio { width: 1em; height: 1em; width: 20px; height: 20px;}
	input.submit { width: 10em; height: 3em; }
</style>

	
<cfif url.done eq 1>
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="7">
				<tr>
					<td align="center" bgcolor="FFFFCC" colspan="3">
					<br><br><br>
					<font color="green">*** <b>Thank you. Your feedback has been recorded.</b> ***</font>
				<br><br><br>
				<a href="http://www.jumpstartmarketer.com" class="bodylink3">www.jumpstartmarketer.com</a>
					</td>
				</tr>		
	</table>
	<cfabort>
</cfif>



	<cfquery name="options" datasource="#application.dsn#">
		SELECT id, business_element, my_choice, my_choice_rating, order_num
		FROM         t_elements
		WHERE     (cid = #url.cid#)
			 AND (my_choice IS NOT NULL) AND my_choice <> ''
			 AND order_num != 0
		ORDER BY id
	</cfquery>




	<cfset variables.top_num = options.recordcount>
	<cfset new_top_num = variables.top_num - 1>	
<!--- <cfoutput>
		#url.primary# #variables.top_num#
	</cfoutput>

		
	<cfoutput>
		#new_top_num# 
	</cfoutput> 
<cfabort> --->


	<cfif url.primary gt new_top_num> 
		
		
			<cfoutput>
<!---#variables.top_num# #options.recordcount# --->
				<cflocation url="dsp_impact_feedback.cfm?done=1"> 
			</cfoutput>
			<!---  --->
			
	</cfif> 


	<table width="100%" height="600" border="0" cellspacing="0" cellpadding="7">
		<cfoutput>
	<form name="rating" action="act_impact_choice.cfm?primary=#url.primary#&secondary=#url.secondary#&top_num=#variables.top_num#&feedback=1&cid=#url.cid#" method="post">
		</cfoutput>
        
        <cfif url.primary eq 1 AND url.secondary eq 2>
        	<tr>
                <td>
                	<strong>INSTRUCTIONS:</strong>
                   <ul>
                 	<li> It is time to find out which of element of this business is most important to you.
                     <br />
                    <li> Please choose between the two elements below based on which element is most important to you as a consumer.
                     <br />
                    <li> Click submit, and then choose between the next two elements displayed on your screen.
                   	 <br />
                    <li> continue this until the end of the exercise.
                    </ul>
                </td>
            </tr>        
        </cfif>
				<tr>
					<td align="center" bgcolor="FFFFCC" colspan="3">
					<cfoutput>
						<b><font size="+3" face="Arial, Helvetica, sans-serif">Which is most important to you?</font> </b>
					</cfoutput>
					</td>
				</tr>		
				
		

				<tr>
					<td align="center" width="50%" height="400" valign="middle">
	
				<cfoutput query="options">
					
					<cfif options.order_num eq url.primary>
						
						<cfif options.my_choice CONTAINS ".jpg" OR options.my_choice CONTAINS ".gif">
							<img src="images/#options.business_element#/#url.cid#/#options.my_choice#" border="0"> 
						<cfelse>
							<font size="+3">#options.my_choice#</font>
						</cfif>
						
					<table class="black14" border="0">
						<tr>
							<td>
							<br><br>
						<font size="+3"><input class="radio" type="radio" name="choice_id"  value="#options.id#"></font>
							</td>
						</tr>
					</table>
						
					</cfif>	

				</cfoutput>
	
					</td>	
					
					<td>
						&nbsp; &nbsp;
					</td>
					
					<td align="center" width="50%" height="400" valign="middle">		
		
				<cfoutput query="options">
					
					<cfif options.order_num eq url.secondary>
						
						<cfif options.my_choice CONTAINS ".jpg" OR options.my_choice CONTAINS ".gif">
							<img src="images/#options.business_element#/#url.cid#/#options.my_choice#" border="0">  
						<cfelse>
							<font size="+3">#options.my_choice#</font>
						</cfif>
						
					<table class="black14" border="0">
						<tr>
							<td>
							<br><br>
						<font size="+3"><input class="radio" type="radio" name="choice_id"  value="#options.id#"></font>
							</td>
						</tr>
					</table>
					</cfif>	
					
				</cfoutput>
						
					</td>
				</tr>
					<tr>
						<td valign="middle" align="center" bgcolor="336699" colspan="6">
										
							<input type="submit" value="  SUBMIT  " class="submit">
							
							
						</td>
					</tr>
				</table>