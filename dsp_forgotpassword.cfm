
<script type="text/javascript" language="javascript">

function checkemail()
{
  var email=document.getElementById("txtEmail").value;

  if(email=='')
  {
    alert("Please enter your email");
    return false;
  }

}


</script>

<br /><br />
<table class="black14" width="300" cellpadding="0" cellspacing="0" border="0" bgcolor="F6F7F9">
	
	
	<tr>
		<td colspan="3">
		<br /><br />
		</td>
	</tr>

	<tr>
	 <td colspan=3">

	 <span style="padding-left:50px;color:blue;text-align:center;font-size:16px;"><strong>Forgot your password ?</strong></span>

	 </td>

	</tr>

	
	<form action="act_forgotpassword.cfm" method="post">
	<cfif url.sent eq 1>
			<tr>
				<td colspan="3">
						<br><br>
							<font color="green">
								Your password has been sent to your email address.Please check.
							</font>
						<br><br>
				</td>
			</tr>
</cfif>
		
	<tr>
		<td colspan="3" align="center" style="color:blue;">
		Please Enter your Email
		</td>
	</tr>	
	<tr>
		<td colspan="3" align="center">
		<input type="text" name="txtEmail" id="txtEmail" />
		</td>
	</tr>

	<tr>
		<td colspan="3" align="center">
		<input type="submit" value="Submit"  onclick="return checkemail();" />
		</td>
	</tr>
    
    
	</form>

	
</table>