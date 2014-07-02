<cfif IsDefined("url.cid")>
	<cfset client.cid = url.cid>
</cfif>


<cfquery name="sent_mail" datasource="#application.dsn#">
	SELECT DISTINCT id, r_name, s_name, r_name, email_subject, date_submitted
	FROM         t_mail
	WHERE     (sid = #client.cid#)
	ORDER BY date_submitted DESC, s_name, id, email_subject  
</cfquery>
<cfquery name="received_mail" datasource="#application.dsn#">
	SELECT DISTINCT id, s_name, r_name, email_subject, date_submitted
	FROM         t_mail
	WHERE     (rid = #client.cid#)
	ORDER BY date_submitted DESC, s_name, r_name, id, email_subject  
</cfquery>

		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
		
			<tr> 
				<td  align="left" colspan="2">
					<a href="#" onClick="history.go(-1)" class="tinylink2">Back</a> 
				</td>
			</tr>		
			<tr> 
				<td  align="left" valign="bottom" class="header16" colspan="2">
					<img src="images/received_mail.jpg">
				</td>
			</tr>
		
			<tr>
				<td bgcolor="666666">
				delete
				</td>
				<td align="center" bgcolor="666666">
					Emails from other Business Owners
				</td>
			</tr>
		<form name="mail" action="act_mail.cfm?del=1" method="post">
		
		  <cfoutput query="received_mail">
			<tr>
				<td>
				<input type="checkbox" name="#received_mail.id#">
				</td>
				<td>
					<a href="index.cfm?fa=read_mail&mid=#received_mail.id#" class="bodylink">
					#received_mail.date_submitted# - #received_mail.email_subject# </a> &nbsp; from: #received_mail.s_name#
				</td>
			</tr>
		 </cfoutput>	
			<tr> 
				<td  align="left" colspan="2">
					<input type="submit" value="Delete">
				</td>
			</tr>	
 
		</form>
		
		
		
<!--- 			<tr> 
				<td  align="left" valign="bottom" class="header16">
					<img src="images/sent_mail.jpg">
				</td>
			</tr>
		<cfoutput query="sent_mail">
			<tr>
				<td>
					<a href="index.cfm?fa=read_mail&mid=#sent_mail.id#" class="bodylink">
					#sent_mail.date_submitted# - #sent_mail.email_subject#  to: #sent_mail.r_name#</a>
				</td>
			</tr>
		</cfoutput> --->
		</table>	