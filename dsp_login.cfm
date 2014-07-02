
<cfparam name="url.logf" default=0>
<cfparam name="url.logout" default=0>

<br /><br />
<table class="black14" width="300" cellpadding="0" cellspacing="0" border="0" bgcolor="F6F7F9">
	<tr>
		<td colspan="3">
		<br /><br />
		</td>
	</tr>
	<tr>
		<td>
			<img src="images/home_page_V3_4_2_email.jpg">    
		</td>
        <td>
        	<img src="images/home_page_V3_4_2_pass.jpg">
        </td>
	</tr>
	<form action="act_login.cfm" method="post">
		<tr>
			<td width="50%">
			<input type="text" name="email" size="20" value=""> 
			</td>
			<td width="50%">
			<input type="password" name="password" size="20">
			</td>
		</tr>
	<tr>
		<td colspan="3" align="center">
		<input type="image" value="login" src="images/home_page_V3_4_2_login.jpg" alt="Login" name="image">
		</td>
	</tr>	

	<tr>
		<td colspan="3" align="center">
		forgotten your password? <a href="index.cfm?fa=forgotpassword&sent=0">Click Here</a>
		</td>
	</tr>
    <tr>
		<td colspan="3">
			<!--- <img src="images/home_page_V3_4_2_forgot.jpg"> --->
		</td>
	</tr>
	<tr>
		<td align="right">
			New Users:
		</td>
        <td nowrap="nowrap">
        	&nbsp; <a href="index.cfm?fa=consultant&be=jumpstart_marketer"><img src="images/home_page_V3_4_2_reg.jpg" border=0 alt="Register"></a>
        </td>
	</tr>    
    
	</form>

	<tr>
		<td colspan="3" height="16">
		<cfif logf eq 1>
			<font color="red">Your Login attempt failed. Please try again.</font>
		<cfelseif logf eq 1>
			<font color="red">You have been logged out.</font>
		<cfelse>
			
		</cfif>
		</td>
	</tr>
</table>