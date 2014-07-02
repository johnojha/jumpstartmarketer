<style type="text/css">
#nav
{
background:#387ed8;
border-radius:10px;
width:99%;
height:38px;
text-align:center;


padding-left:10px;
}
#nav a
{
	color:#ffffff;
	font-size:16px;
	font-family: "Myriad Pro", Myriad, "Liberation Sans", "Nimbus Sans L", "Helvetica Neue", Helvetica, Arial, sans-serif;
	text-decoration:none;
	
}

.navitem
{
	float:left;
	margin-left:60px;
	height:30px;
	
	padding-top:7px;
	
}

.navitem_first
{
	float:left;
	margin-left:80px;
	background:#002162;
	height:30px;
	width:140px;
	padding-top:7px;
	
}


</style>


 <cfparam name="session.type" default=0>


<cfset plantype=session.type>


<table class="black14" width="100%" border="0">
  <cfif client.cid eq 0>
      <tr>
          <td nowrap="nowrap">

	  <div id="nav">
	<cfif fa eq "home">
	<div class="navitem_first"><a href="index_new.cfm">Home</a> </div>
	<cfelse>
	<div class="navitem"><a href="index_new.cfm">Home</a> </div>
	</cfif>
	
	<cfif fa eq "consultant">
	<div class="navitem_first"><a href="index.cfm?fa=legal&bg=1">Sign Up Now</a></div>
	<cfelse>
	<div class="navitem"><a href="index.cfm?fa=legal&bg=1">Sign Up Now</a></div>
	</cfif>
	
	<cfif fa eq "login">
	<div class="navitem_first"><a href="index.cfm?fa=login">Login</a></div>
	<cfelse>
	<div class="navitem"><a href="index.cfm?fa=login">Login</a></div>

	</cfif>

	<div class="navitem"><a href="video.cfm">Video Demo</a></div>
	

	<cfif fa eq "contact">
	<div class="navitem_first"><a href="index.cfm?fa=contact">Contact Us</a></div>
	<cfelse>
	<div class="navitem"><a href="index.cfm?fa=contact">Contact Us</a></div>

	</cfif>
	
	
	</div>
              
              
          </td>
      </tr>
  
  <cfelse>
      <tr>
          <td nowrap="nowrap">
	  
	  <div id="nav">

	<cfif fa eq "home">
	<div class="navitem_first"><a href="index.cfm?fa=home">Home</a> </div>
	<cfelse>
	<div class="navitem"><a href="index.cfm?fa=home">Home</a> </div>
	</cfif>

	<cfif fa eq "my_business">

		

	       <cfif plantype eq 'brandname'>
	<div class="navitem_first"><a href="index.cfm?fa=my_business_brand">My Business</a></div>
	      </cfif>
	      
	       <cfif plantype eq 'brandlogo'>
	<div class="navitem_first"><a href="index.cfm?fa=my_business_logo">My Business</a></div>
	      </cfif>

	       <cfif plantype eq 'gold'>
	<div class="navitem_first"><a href="index.cfm?fa=my_business_gold">My Business</a></div>
	      </cfif>


	       <cfif plantype eq 'platinum'>
	<div class="navitem_first"><a href="index.cfm?fa=my_business">My Business</a></div>
	      </cfif>

	       <cfif plantype eq 'silver'>
	<div class="navitem_first"><a href="index.cfm?fa=my_business_silver">My Business</a></div>
	      </cfif>
	<cfelse>
	
	
	
	 <cfif plantype eq 'brandname'>
	<div class="navitem"><a href="index.cfm?fa=my_business_brand">My Business</a></div>
	      </cfif>
	      
	       <cfif plantype eq 'brandlogo'>
	<div class="navitem"><a href="index.cfm?fa=my_business_logo">My Business</a></div>
	      </cfif>

	       <cfif plantype eq 'gold'>
	<div class="navitem"><a href="index.cfm?fa=my_business_gold">My Business</a></div>
	      </cfif>


	       <cfif plantype eq 'platinum'>
	<div class="navitem"><a href="index.cfm?fa=my_business">My Business</a></div>
	      </cfif>

	       <cfif plantype eq 'silver'>
	<div class="navitem"><a href="index.cfm?fa=my_business_silver">My Business</a></div>
	      </cfif>
	
	
	</cfif>

	<cfif fa eq "profile">
	<div class="navitem_first"><a href="index.cfm?fa=profile">My Profile</a></div>
	<cfelse>
	<div class="navitem"><a href="index.cfm?fa=profile">My Profile</a></div>
	</cfif>
	
	<cfif fa eq "secrets">
	<div class="navitem_first"><a href="index.cfm?fa=secrets">Secrets to Success</a></div>
	<cfelse>
	<div class="navitem"><a href="index.cfm?fa=secrets">Secrets to Success</a></div>
	</cfif>
	
	<cfif fa eq "intro">
	<div class="navitem_first"><a href="index.cfm?fa=intro">Directions</a></div>

	<cfelse>
	<div class="navitem"><a href="index.cfm?fa=intro">Directions</a></div>

	</cfif>




	<cfif fa eq "support">
	<div class="navitem_first"><a href="index.cfm?fa=support">Support</a></div>
	<cfelse>
	<div class="navitem"><a href="index.cfm?fa=support">Support</a></div>
	</cfif>

	<div class="navitem"><a href="dsp_logout.cfm">Log Out</a></div>
	
	
	</div>
              
        
              </td>
	     

	      


	     

	      
      </tr>
  </cfif>
</table>