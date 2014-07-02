
<style type="text/css">
	input.radio { width: 1em; height: 1em; width: 20px; height: 20px; }
	input.submit { width: 10em; height: 3em; }
</style>
<link href="styles/style1.css" rel="stylesheet" type="text/css">

<cfparam name="url.feedback" default=0>
<cfparam name="url.cid" default=0>
<cfparam name="url.update" default=0>
<cfparam name="url.e" default=0><head>
<cfparam name="url.cvar" default=0>
<cfparam name="url.counter" default=1>
<cfparam name="url.primary" default=1>
<cfparam name="url.secondary" default=2>
<cfparam name="url.top_num" default=0>
<cfparam name="url.uuid" default=0>
<cfparam name="url.fid" default=0>
<cfparam name="url.rn" default=0>
<cfparam name="url.sample" default=0>

	<title>
		MyPowerMarketer Choice Feedback
	</title>
	
	
</head>






<cfif url.rn eq 0>
	<cfset url.rn = RandRange(1,10)>
</cfif>

<cfquery name="business" datasource="#application.dsn#">
	SELECT id, cid, business_desc, benefit
	FROM t_business
	WHERE cid = #url.cid#
</cfquery>
		
    
    
	<cfquery name="names1" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating, order_num
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = '#url.be#'
		<cfif url.be neq "generic_descriptor">
            AND chosen = 1
		</cfif>
		ORDER BY id
	</cfquery>
    

    	<cfset counter = 0>
    
    	<cfloop query="names1">
        	<cfquery name="up_order" datasource="#application.dsn#">
            	UPDATE t_bake_off
                SET order_num = '#counter + 1#'
               	WHERE id = #names1.id#
            </cfquery>
            
            <cfset counter = counter + 1>
        </cfloop>

    
        
	<cfquery name="names" datasource="#application.dsn#">
		SELECT id, element_text, business_element, legal_clearance, date_submitted, rating, order_num
		FROM         t_bake_off
		WHERE     (cid = #url.cid#)
			AND business_element = '#url.be#'
		<cfif url.be neq "generic_descriptor">
            AND chosen = 1
		</cfif>
		ORDER BY id
	</cfquery>   
    
    
    <cfif url.top_num eq 0>
    	<cfset url.top_num = names.recordcount>
    </cfif>
		
		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="black14" class="print">
<cfif url.primary eq url.top_num>	
			<tr> 
				<td colspan="3">				<br><br><br>
					<font color="green">*** <b>Thank you. Your feedback has been recorded.</b> ***</font>
				<br><br><br>
				<a href="http://www.jumpstartmarketer.com" class="bodylink3">www.jumpstartmarketer.com</a>
				</td>
			</tr>
<cfelse>
			<tr> 
				<td>
					
				</td>
			</tr>

			<tr> 
				<td colspan="3">
					
                    <cfinclude template="includes/dsp_choice_instructions.cfm">
									
				</td>
			</tr>
		<cfoutput>
			<form name="business" action="components/act_choiceExercise.cfm?be=#url.be#&feedback=1&cid=#url.cid#&fid=#url.fid#&rn=#url.rn#&primary=#url.primary#&secondary=#url.secondary#&top_num=#url.top_num#&uuid=#url.uuid#" method="post">
		</cfoutput>
			<cfif names.recordcount eq 0>
				<tr>
					<td colspan="3">
						<strong>There are currently no <cfoutput>#replace(ucase(url.be),"_"," ","All")#</cfoutput> options.</strong>
					</td>
				</tr>
			<cfelse>
            
            
        <cfif url.rn lte 5>
        		<!---Flip the left to right if the random number is less than five.--->
        
				<tr>
					<td align="center" valign="middle" width="40%" height="400">
		
				<cfoutput query="names">
					
					<cfif names.order_num eq url.primary>
						
						<cfif names.element_text CONTAINS ".jpg">
                        	<img src="images/#trim(url.be)#/#url.cid#/#names.element_text#">
                        <cfelse>
							<font size="+3" face="Arial, Helvetica, sans-serif">	#names.element_text# </font>
                        </cfif>
	
						
					<table class="black14" border="0">
						<tr>
							<td>
							<br><br>
						<font size="+3"><input class="radio" type="radio" name="choice_id"  value="#names.id#" style="background-color:red;"></font>
							</td>
						</tr>
					</table>
                    
					</cfif>	

				</cfoutput>
				
					
					
					</td>	
					
					<td>
						&nbsp; &nbsp;
					</td>
					
					<td align="center" valign="middle" width="40%" height="400">			
		
					
				<cfoutput query="names">
					
					<cfif names.order_num eq url.secondary>
						
						<cfif names.element_text CONTAINS ".jpg">
                        	<img src="images/#trim(url.be)#/#url.cid#/#names.element_text#">
                        <cfelse>
							<font size="+3" face="Arial, Helvetica, sans-serif">	#names.element_text# </font>
                        </cfif>
	
						
					<table class="black14" border="0">
						<tr>
							<td>
							<br><br>
						<font size="+3"><input class="radio" type="radio" name="choice_id"  value="#names.id#" style="background-color:red;"></font>
							</td>
						</tr>
					</table>
                    
					</cfif>	
					
				</cfoutput>
						

					</td>
				</tr>
          
          
          <cfelse>
          		<!---Flip the left to right if the random number is more than five.--->
          
 		<tr>
					<td align="center" valign="middle" width="40%" height="400">
		
				<cfoutput query="names">
					
					<cfif names.order_num eq url.secondary>
						
						<cfif names.element_text CONTAINS ".jpg">
                        	<img src="images/#trim(url.be)#/#url.cid#/#names.element_text#">
                        <cfelse>
							<font size="+3" face="Arial, Helvetica, sans-serif">	#names.element_text# </font>
                        </cfif>
	
						
					<table class="black14" border="0">
						<tr>
							<td>
							<br><br>
						<font size="+3"><input class="radio" type="radio" name="choice_id"  value="#names.id#" style="background-color:red;"></font>
							</td>
						</tr>
					</table>
                    
					</cfif>	

				</cfoutput>
				
					
					
					</td>	
					
					<td>
						&nbsp; &nbsp;
					</td>
					
					<td align="center" valign="middle" width="40%" height="400">			
		
					
				<cfoutput query="names">
					
					<cfif names.order_num eq url.primary>
						
						<cfif names.element_text CONTAINS ".jpg">
                        	<img src="images/#trim(url.be)#/#url.cid#/#names.element_text#">
                        <cfelse>
							<font size="+3" face="Arial, Helvetica, sans-serif">	#names.element_text# </font>
                        </cfif>
	
						
					<table class="black14" border="0">
						<tr>
							<td>
							<br><br>
						<font size="+3"><input class="radio" type="radio" name="choice_id"  value="#names.id#" style="background-color:red;"></font>
							</td>
						</tr>
					</table>
                    
					</cfif>	
					
				</cfoutput>
						

					</td>
				</tr>         
          
          </cfif>      
                
                
			</cfif>	
<!--- 			<tr> 
				<td>
					Your Name: <input type="text" name="sug_by_name" size="30"> &nbsp; Your Email: <input type="text" name="sug_by_email" size="30">
				</td>
			</tr> --->
			<tr> 
				<td align="center" bgcolor="336699" colspan="3">
					
				<cfif url.sample eq 0>
					<input type="submit" value="  SUBMIT  "> 
                <cfelseif url.sample eq 1>
                	[The submit button has been disabled for this example]
                </cfif>
				</td>
			</tr>
			</form>	
			
</cfif>
	  	</table>
		<br><br>
	
