<table class="white14">
	<tr>
		<td height="130">&nbsp;
		
		</td>
	</tr>
<cfif client.cid eq 0>

	<tr>
		<td>
			<a href="index.cfm?fa=home_hidden" class="menulink">Home</a>
			<br><br>			
			<a href="javascript:popUp('dsp_video_intro.cfm')" class="menulink">Video Tour</a>
			<br><br>	
<!--- 			<a href="index.cfm?fa=secrets" class="menulink">Secrets to<br>Success</a>
			<br><br> --->
			<a href="index.cfm?fa=special" class="menulink">Register</a>
			<br><br>
			<a href="index.cfm?fa=about&bg=1" class="menulink">About Us</a>
			<br><br>			
<!--- 			<a href="index.cfm?fa=support" class="menulink">Support</a>
			<br><br> --->
			<a href="index.cfm?fa=contact" class="menulink">Contact Us</a>
			<br><br>
		</td>
	</tr>

<cfelse>
	<tr>
		<td>
<!--- 			<a href="javascript:void(0);" onclick="history.back(); return false;" class="menulink">Back <</a>
			<br><br> --->			
			<a href="index.cfm?fa=home_hidden" class="menulink">Home</a>
			<br><br>
			<a href="index.cfm?fa=my_business" class="menulink">My Business</a>
			<br><br>			
<!--- 			<a href="index.cfm?fa=mail" class="menulink">Your Emails</a>
			<br><br>	 --->		
			<a href="index.cfm?fa=profile" class="menulink">My Profile</a>
			<br><br>	
			<a href="index.cfm?fa=secrets" class="menulink">Secrets to<br>Success</a>
			<br><br>			
			<a href="index.cfm?fa=intro" class="menulink">Instructions</a>
			<br><br>			
			<a href="index.cfm?fa=support" class="menulink">Support</a>
			<br><br>
			<a href="dsp_logout.cfm" class="menulink">Log Out</a>
			<br><br> 
		</td>
	</tr>
</cfif>
</table>