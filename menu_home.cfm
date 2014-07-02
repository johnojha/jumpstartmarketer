<table>
<cfif client.cid eq 0>
	<tr>
		<td>			
			<a href="index.cfm?fa=legal&bg=1" class="homemenulink">Register</a>
			<br><br>			
			<a href="javascript:popUp('dsp_video_intro.cfm')" class="homemenulink">Video Tour</a>
			<br><br>	
			<a href="index.cfm?fa=home" class="homemenulink">Login</a>
			<br><br>			
<!--- 			<a href="index.cfm?fa=secrets" class="homemenulink">Secrets to<br>Success</a>
			<br><br> --->
			<a href="index.cfm?fa=about&bg=1" class="homemenulink">About Us</a>
			<br><br>			
<!--- 			<a href="index.cfm?fa=support" class="homemenulink">Support</a>
			<br><br> --->
			<a href="index.cfm?fa=contact" class="homemenulink">Contact Us</a>
		</td>
	</tr>
<cfelse>
	<tr>
		<td>
<!--- 			<a href="index.cfm?fa=home" class="homemenulink">Home</a>
			<br><br> --->
			<a href="index.cfm?fa=my_business" class="homemenulink">My Business</a>
			<br><br>
<!--- 			<a href="index.cfm?fa=mail" class="homemenulink">Your Emails</a>
			<br><br>	 --->		
			<a href="index.cfm?fa=support" class="homemenulink">Support</a>
			<br><br>
			<a href="index.cfm?fa=secrets" class="homemenulink">Secrets to<br>Success</a>
			<br><br>			
			<a href="index.cfm?fa=intro" class="homemenulink">Instructions</a>
			<br><br>
			<a href="index.cfm?fa=contact" class="homemenulink">Contact Us</a>
		</td>
	</tr>
</cfif>
</table>