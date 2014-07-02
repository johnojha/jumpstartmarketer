<cfparam name="url.q1" default=0>
<cfparam name="url.q2" default=0>
<cfparam name="form.tenmil" default=0>
<cfparam name="form.research" default=0>



		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="black14" bgcolor="FFFFFF">
			<tr> 
				<td  align="left" colspan="2">
					
				</td>
			</tr>
<cfif url.q1 eq 0 and url.q2 eq 0>
			<tr>
				<td>
<b>SPECIAL QUALIFICATIONS:</b>
<br><br>
1) Does the product or service you are working on generate $10,000,000 or more in annual gross sales?
	<br><br>
 please click on the appropriate button below.
<br><br>

<form name="sq" action="index.cfm?fa=special&q1=1&bg=1" method="post">
    &nbsp;  &nbsp; &nbsp;  <input type="radio" name="tenmil" value="yes"> It does                                        
	<br><br>
  	&nbsp;  &nbsp; &nbsp;  <input type="radio" name="tenmil" value="no"> It does not  
  	<br><br>
    &nbsp;  &nbsp; &nbsp;   <input type="submit" value="  Submit  ">
</form>
<br><br>

				</td>
			</tr>
</cfif>

<cfif url.q1 eq 1>
	<cfif form.tenmil eq "no">
			<tr>
				<td>
<b>SPECIAL QUALIFICATIONS:</b>
<br><br>
2) Are you are currently working in the field of marketing research, marketing intelligence, marketing innovation or consumer insights?
<br><br>
Please click on the appropriate button below.
<br><br>

<form name="sq" action="index.cfm?fa=special&q2=1&bg=1" method="post">
    &nbsp;  &nbsp; &nbsp;  <input type="radio" name="research" value="yes"> Yes                                      
	<br><br>
  	&nbsp;  &nbsp; &nbsp;  <input type="radio" name="research" value="no"> No
  	<br><br>
    &nbsp;  &nbsp; &nbsp;   <input type="submit" value="  Submit  ">
</form>
<br><br>

				</td>
			</tr>
	<cfelse>
		<tr>
			<td>
			<br><br>
			Jumpstart Marketer has been specifically developed to accommodate small and medium size businesses.
			 <br><br>
			As your business does not qualify, you will not be able to use Jumpstart Marketer. 
			<br><br>
			We recommend that you <a href="index.cfm?fa=contact" class="bakeofflink">contact The Chambers Group</a> directly where your business can be accommodated. Thank you for your interest, we wish you success.			
			</td>
		</tr>
	</cfif>
</cfif>

<cfif url.q2 eq 1>
	<cfif form.research eq "yes">
	<tr>
		<td>
			<br><br>
			My Power Marketer has been specifically developed to accommodate businesses that have no access to traditional marketing research. 
			<br><br>
			As your business does not qualify, you will not be able to use My Power Marketer. 
			<br><br>
			Please <a href="index.cfm?fa=contact" class="bakeofflink">contact The Chambers Group</a> directly for more information on this matter. 
			<br><br>
			Thank you for your interest, we wish you success.			
		</td>
	</tr>
	<cfelse>
		<cflocation url="index.cfm?fa=legal&bg=1">
	</cfif>
</cfif>
	</table>		