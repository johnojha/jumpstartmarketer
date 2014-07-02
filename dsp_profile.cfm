

<cfquery name="profile" datasource="#application.dsn#"> 
	
		SELECT 	
			name,address,city,state,zip,gender,business_type,
			business_cat,impact_point,email,phone,password
            
          FROM  t_clients	
            
            WHERE id = #client.cid#
            
</cfquery>


<cfquery name="buz" datasource="#application.dsn#">
	
		SELECT cid,client_name,profile_business_desc, profile_product_desc
		FROM t_business	
			 WHERE cid = #client.cid#
			
	</cfquery>	

		<table width="600" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="006699">
        	<tr>
            	<td colspan="2" align="center" bgcolor="FFFFFF" >
                	<img src="images/my_profile.jpg" />
					<br><br>
					<li><a href="index.cfm?fa=profile_edit" class="menulink">Edit Profile Info</a></li>
                </td>
            </tr>
	   
			<tr>
				<td bgcolor="FFFFFF">
                	Business Description:
                </td>
				<td bgcolor="FFFFFF">
                	<cfoutput>#buz.profile_business_desc#</cfoutput>
                </td>
            </tr>	
			<tr>
				<td bgcolor="FFFFFF">
                	Product or Service Description:
                </td>
				<td bgcolor="FFFFFF">
                	<cfoutput>#buz.profile_product_desc#</cfoutput>		
                </td>
            </tr>			
			        	
        	<cfoutput query="profile">
			<tr>
				<td bgcolor="FFFFFF">
                	Name:
                </td>
				<td bgcolor="FFFFFF">
                	#profile.name#
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Email Address:<br>
                 	(username)
                </td>
				<td bgcolor="FFFFFF">
                	#profile.email#
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Password:
                </td>
				<td bgcolor="FFFFFF">
                	#profile.password#
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Address:
                </td>
				<td bgcolor="FFFFFF">
                	#profile.address#
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	City:
                </td>
				<td bgcolor="FFFFFF">
                	#profile.city#
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	State
                </td>
				<td bgcolor="FFFFFF">
                	#profile.state#
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Phone:
                </td>
				<td bgcolor="FFFFFF">
                	#profile.phone#
                </td>
            </tr>
			<tr>
				<td bgcolor="FFFFFF">
                	Business Type:
                </td>
				<td bgcolor="FFFFFF">
                	#profile.business_type#
                </td>
            </tr>
            </cfoutput>
         </table>