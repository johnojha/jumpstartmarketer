

<cfquery name="profile" datasource="#application.dsn#"> 
	
		SELECT 	
			name,address,city,state,zip,gender,business_type,
			business_cat,impact_point,email,phone,password
            
          FROM  t_clients	
            
            WHERE id = #client.cid#
            
</cfquery>

	<cfquery name="business" datasource="#application.dsn#">
	
		SELECT cid,client_name,profile_business_desc,profile_product_desc,business_type,target_consumer,age_range
		FROM t_business	
			 WHERE cid = #client.cid#
			
	</cfquery>	

		<table width="600" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="336699">
        	<tr>
            	<td colspan="2" align="center" bgcolor="FFFFFF">
                	<img src="images/my_profile.jpg" />
                </td>
            </tr>
       <form method="post" action="act_profile.cfm">    	
	   		
			<tr>
				<td bgcolor="FFFFFF">
                	Business Description:
                </td>
				<td bgcolor="FFFFFF">
                	<input name="profile_business_desc" type="text" value="<cfoutput query="business">#trim(business.profile_business_desc)#</cfoutput>">
						
                </td>
            </tr>	
			<tr>
				<td bgcolor="FFFFFF">
                	Product or Service Description:
                </td>
				<td bgcolor="FFFFFF">
                	<textarea name="profile_product_desc" rows="6" cols="50"><cfoutput query="business">#trim(business.profile_product_desc)#</cfoutput>
					</textarea>			
                </td>
            </tr>			
			
	   
        	<cfoutput query="profile">
			<tr>
				<td bgcolor="FFFFFF">
                	Your Name:
                </td>
				<td bgcolor="FFFFFF">
                	<input type="text" name="name" size="30" value="#profile.name#">
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Email Address:<br>
                 	(username)
                </td>
				<td bgcolor="FFFFFF">
                	<input type="text" name="email" size="30" value="#profile.email#">
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Password:
                </td>
				<td bgcolor="FFFFFF">
                	<input type="text" name="password" size="20" value="#profile.password#">
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Address:
                </td>
				<td bgcolor="FFFFFF">
                	<input type="text" name="address" size="30" value="#profile.address#">
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	City:
                </td>
				<td bgcolor="FFFFFF">
                	<input type="text" name="city" size="30" value="#profile.city#">
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	State
                </td>
				<td bgcolor="FFFFFF">
                	<input type="text" name="state" size="2" value="#profile.email#">
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Phone:
                </td>
				<td bgcolor="FFFFFF">
                	<input type="text" name="phone" size="30" value="#profile.phone#">
                </td>
            </tr>
			<tr>
				<td colspan="2" align="center" bgcolor="FFFFFF">
					<input type="submit" value="  SUBMIT CHANGES  ">
				</td>	
			</tr>
		
            </cfoutput>
	</form>
         </table>