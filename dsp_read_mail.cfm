
<cfparam name="url.mid" default=0>

<cfquery name="mail" datasource="#application.dsn#">
	SELECT id, sid, s_name, s_email, rid, r_name, r_email, business_element, email_subject, email_text, date_submitted
	FROM t_mail
	WHERE id = #url.mid#
</cfquery>

<cfquery name="read" datasource="#application.dsn#">
	UPDATE  t_mail
	SET new_r = 0
	WHERE id = #url.mid#
</cfquery>

		<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
			<tr> 
				<td  align="left" colspan="2">
					<a href="#" onClick="history.go(-1)" class="tinylink">Back</a> 
				</td>
			</tr>
			<tr> 
				<td  align="left" valign="bottom" class="header16">
					
				</td>
			</tr>
		<cfoutput query="mail">
			<tr>
				<td>
					<a href="index.cfm?fa=compose_mail&sid=#mail.sid#" class="bodylink">
					Reply</a>
				</td>
			</tr>

			<tr> 
				<td>
					#mail.date_submitted# 
					<br>
					#mail.email_subject# 
					<br>
					from: #mail.s_name#
					<br><br>
					Regarding: #ucase(mail.business_element)#
				</td>
			</tr>
			<tr>
				<td>			
					#mail.email_text# 				
				</td>
			</tr>
		</cfoutput>
		</table>	