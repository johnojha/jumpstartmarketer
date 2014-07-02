
<cfparam name="url.sent" default=0>


	<table width="800" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr> 
				<td  align="left" colspan="2">
					<a href="#" onClick="history.go(-1)" class="tinylink">Back</a> 
				</td>
			</tr>
		<form action="act_support.cfm" method="post">
<cfif url.sent eq 1>
			<tr>
				<td colspan="2">
						<br><br>
							<font color="green">
								Your Support Ticket has been submitted and logged.
							</font>
						<br><br>
				</td>
			</tr>
</cfif>
			<tr>
				<td colspan="2">
							<img src="images/support.jpg" />	
 								<br><br>
							Enter your name, email address, and your message for support.
							<br><br>
				</td>
			</tr>
			<tr>
				<td align="right">
						Your Name: 
				</td>
				<td>
							<input type="text" name="name" size="30">
				</td>
			</tr>
			<tr>
				<td align="right">
						Your Email: 
				</td>
				<td>
							<input type="text" name="email" size="30">
				</td>
			</tr>
			<tr>
				<td align="right">
						Message: 
				</td>
				<td>
					<textarea name="message" rows="10" cols="60"></textarea>
				</td>			
			</tr>	
				<cfoutput>
					<input type="hidden" name="cid" value="#client.cid#">
					<input type="hidden" name="UUID" value="#CreateUUID()#">
				</cfoutput>			
			<tr>
				<td colspan="2" align="center" bgcolor="FFFFFF">										
				<input type="submit" value="  SUBMIT  ">
				</td>
			</tr>
			
		</form> 
	</table>