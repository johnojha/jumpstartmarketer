		

<cfparam name="url.pers" default=0>

<body>			


<form action="act_project_form.cfm"  method="post">
		
		<table width="800" border="0" cellspacing="1" cellpadding="5" class="black14" bgcolor="006699">
		<cfif url.pers neq 0>
			<tr> 
				<td  align="left" colspan="2" bgcolor="FFFFFF">
					<font color="green">***</font> Your NEW USER information has been recorded. <font color="green">***</font>  <br>
					An email with your login details has been sent to you.<br>
					Please continue Registration below.
				</td>
			</tr>	
		</cfif>      
        	<tr>
            	<td colspan="2" bgcolor="FFFFFF">
                <img src="images/project_form.jpg">
                <br>
    An <strong>Impact Point</strong> is simply where your target consumers encounter your sales message.
    <br><br>
    For instance: Retail Package, Store Front, Book Cover, Website Home Page, Yellow Pages Ad, Billboard, Magazine Ad, Newspaper Ad, CD Cover, DVD Cover
    
    
<br><br>
All products and services have multiple impact points.  For instance if you were operating a dry cleaning company your sales message is conveyed when target consumers encounter your store front, your yellow pages ad, your brochure and your web site. 
 <br><br>
Your <strong>Key Impact Point</strong> is the one that you consider most important. Typically that is the impact point that gets the most exposure. Let's assume for the dry cleaning business it is the storefront.
<br><br>
As you proceed you will need to choose your key impact point. Your key impact point will be the subject of the work that you will do here, at JumpStartMarketer.com, in developing a remarkable sales message. 
<br><br>
Once you have completed development of your remarkable sales message as applied to your key impact point, you may reapply that information to your remaining impact points as appropriate.
<br><br>
As an example, the owner of the dry cleaning company might take the storefront through the process, and then create its yellow pages ad using what he has learned. 
<br><br>
                </td>
            </tr>
		<tr>
				<td align="right" bgcolor="FFFFFF">
					Select Your KEY IMPACT POINT:
				</td>
				<td bgcolor="FFFFFF">
					<select name="key_impact_point" size="1">
						<option value="">Select...</option>
                        <option value="Website">Website</option> 
						<option value="Retail Package">Retail Package</option>
                        <option value="Store Front">Store Front</option>
						<option value="Print ad">Print ad</option>
                        <option value="Internet Ad">Internet Ad</option>
						<option value="Billboard">Billboard</option>
						<option value="TV Commercial">TV Commercial</option>
                        <option value="Infomercial">Infomercial</option>
                        <option value="Smart Phone">Smart Phone</option>
					</select>
				</td>
			</tr>	            
        	<tr>
				<td align="right" bgcolor="FFFFFF" nowrap>
					Are you selling a Product or Service at your Key Impact Point?:
				</td>
				<td bgcolor="FFFFFF">
					<select name="business_type" size="1">
						<option value="">Select...</option>
						<option value="Product">Product</option>
						<option value="Service">Service</option>
					</select>
				</td>
			</tr>	
			<tr>
				<td align="right" bgcolor="FFFFFF">
					Select the Category You Compete in:
				</td>
				<td bgcolor="FFFFFF">
					<select name="business_cat" size="1">

<option value="Accounting" selected>Select industry...</option><option value="Accounting" class="corp fin">Accounting</option>
<option value="Airlines/Aviation" class="man tech tran">Airlines/Aviation</option>
<option value="Alternative Dispute Resolution" class="leg org">Alternative Dispute Resolution</option>
<option value="Alternative Medicine" class="hlth">Alternative Medicine</option>
<option value="Animation" class="art med">Animation</option>
<option value="Apparel &amp; Fashion" class="good">Apparel &amp; Fashion</option>
<option value="Architecture &amp; Planning" class="cons">Architecture &amp; Planning</option>
<option value="Arts and Crafts" class="art med rec">Arts and Crafts</option>
<option value="Automotive" class="man">Automotive</option>
<option value="Aviation &amp; Aerospace" class="gov man">Aviation &amp; Aerospace</option>
<option value="Banking" class="fin">Banking</option>
<option value="Biotechnology" class="gov hlth tech">Biotechnology</option>
<option value="Broadcast Media" class="med rec">Broadcast Media</option>
<option value="Building Materials" class="cons">Building Materials</option>
<option value="Business Supplies and Equipment" class="corp man">Business Supplies and Equipment</option>
<option value="Capital Markets" class="fin">Capital Markets</option>
<option value="Chemicals" class="man">Chemicals</option>
<option value="Civic &amp; Social Organization" class="org serv">Civic &amp; Social Organization</option>
<option value="Civil Engineering" class="cons gov">Civil Engineering</option>
<option value="Commercial Real Estate" class="cons corp fin">Commercial Real Estate</option>
<option value="Computer &amp; Network Security" class="tech">Computer &amp; Network Security</option>
<option value="Computer Games" class="med rec">Computer Games</option>
<option value="Computer Hardware" class="tech">Computer Hardware</option>
<option value="Computer Networking" class="tech">Computer Networking</option>
<option value="Computer Software" class="tech">Computer Software</option>
<option value="Construction" class="cons">Construction</option>
<option value="Consumer Electronics" class="good man">Consumer Electronics</option>
<option value="Consumer Goods" class="good man">Consumer Goods</option>
<option value="Consumer Services" class="org serv">Consumer Services</option>
<option value="Cosmetics" class="good">Cosmetics</option>
<option value="Dairy" class="agr">Dairy</option>
<option value="Defense &amp; Space" class="gov tech">Defense &amp; Space</option>
<option value="Design" class="art med">Design</option>
<option value="Dry Cleaning and Laundry" class="laundry">Dry Cleaning & Laundry</option>
<option value="Education Management" class="edu">Education Management</option>
<option value="E-Learning" class="edu org">E-Learning</option>
<option value="Electrical/Electronic Manufacturing" class="good man">Electrical/Electronic Manufacturing</option>
<option value="Entertainment" class="med rec">Entertainment</option>
<option value="Environmental Services" class="org serv">Environmental Services</option>
<option value="Events Services" class="corp rec serv">Events Services</option>
<option value="Executive Office" class="gov">Executive Office</option>
<option value="Facilities Services" class="corp serv">Facilities Services</option>
<option value="Farming" class="agr">Farming</option>
<option value="Financial Services" class="fin">Financial Services</option>
<option value="Fine Art" class="art med rec">Fine Art</option>
<option value="Fishery" class="agr">Fishery</option>
<option value="Food &amp; Beverages" class="rec serv">Food &amp; Beverages</option>
<option value="Food Production" class="good man serv">Food Production</option>
<option value="Fund-Raising" class="org">Fund-Raising</option>
<option value="Furniture" class="good man">Furniture</option>
<option value="Gambling &amp; Casinos" class="rec">Gambling &amp; Casinos</option>
<option value="Glass, Ceramics &amp; Concrete" class="cons man">Glass, Ceramics &amp; Concrete</option>
<option value="Government Administration" class="gov">Government Administration</option>
<option value="Government Relations" class="gov">Government Relations</option>
<option value="Graphic Design" class="art med">Graphic Design</option>
<option value="Health, Wellness and Fitness" class="hlth rec">Health, Wellness and Fitness</option>
<option value="Higher Education" class="edu">Higher Education</option>
<option value="Hospital &amp; Health Care" class="hlth">Hospital &amp; Health Care</option>
<option value="Hospitality" class="rec serv tran">Hospitality</option>
<option value="Human Resources" class="corp">Human Resources</option>
<option value="Import and Export" class="corp good tran">Import and Export</option>
<option value="Individual &amp; Family Services" class="org serv">Individual &amp; Family Services</option>
<option value="Industrial Automation" class="cons man">Industrial Automation</option>
<option value="Information Services" class="med serv">Information Services</option>
<option value="Information Technology and Services" class="tech">Information Technology and Services</option>
<option value="Insurance" class="fin">Insurance</option>
<option value="International Affairs" class="gov">International Affairs</option>
<option value="International Trade and Development" class="gov org tran">International Trade and Development</option>
<option value="Internet" class="tech">Internet</option>
<option value="Investment Banking" class="fin">Investment Banking</option>
<option value="Investment Management" class="fin">Investment Management</option>
<option value="Judiciary" class="gov leg">Judiciary</option>
<option value="Law Enforcement" class="gov leg">Law Enforcement</option>
<option value="Law Practice" class="leg">Law Practice</option>
<option value="Legal Services" class="leg">Legal Services</option>
<option value="Legislative Office" class="gov leg">Legislative Office</option>
<option value="Leisure, Travel &amp; Tourism" class="rec serv tran">Leisure, Travel &amp; Tourism</option>
<option value="Libraries" class="med rec serv">Libraries</option>
<option value="Logistics and Supply Chain" class="corp tran">Logistics and Supply Chain</option>
<option value="Luxury Goods &amp; Jewelry" class="good">Luxury Goods &amp; Jewelry</option>
<option value="Machinery" class="man">Machinery</option>
<option value="Management Consulting" class="corp">Management Consulting</option>
<option value="Maritime" class="tran">Maritime</option>
<option value="Market Research" class="corp">Market Research</option>
<option value="Marketing and Advertising" class="corp med">Marketing and Advertising</option>
<option value="Mechanical or Industrial Engineering" class="cons gov man">Mechanical or Industrial Engineering</option>
<option value="Media Production" class="med rec">Media Production</option>
<option value="Medical Devices" class="hlth">Medical Devices</option>
<option value="Medical Practice" class="hlth">Medical Practice</option>
<option value="Mental Health Care" class="hlth">Mental Health Care</option>
<option value="Military" class="gov">Military</option>
<option value="Mining &amp; Metals" class="man">Mining &amp; Metals</option>
<option value="Motion Pictures and Film" class="art med rec">Motion Pictures and Film</option>
<option value="Museums and Institutions" class="art med rec">Museums and Institutions</option>
<option value="Music" class="art rec">Music</option>
<option value="Nanotechnology" class="gov man tech">Nanotechnology</option>
<option value="Newspapers" class="med rec">Newspapers</option>
<option value="Non-Profit Organization Management" class="org">Non-Profit Organization Management</option>
<option value="Oil &amp; Energy" class="man">Oil &amp; Energy</option>
<option value="Online Media" class="med">Online Media</option>
<option value="Outsourcing/Offshoring" class="corp">Outsourcing/Offshoring</option>
<option value="Package/Freight Delivery" class="serv tran">Package/Freight Delivery</option>
<option value="Packaging and Containers" class="good man">Packaging and Containers</option>
<option value="Paper &amp; Forest Products" class="man">Paper &amp; Forest Products</option>
<option value="Performing Arts" class="art med rec">Performing Arts</option>
<option value="Pharmaceuticals" class="hlth tech">Pharmaceuticals</option>
<option value="Philanthropy" class="org">Philanthropy</option>
<option value="Photography" class="art med rec">Photography</option>
<option value="Plastics" class="man">Plastics</option>
<option value="Political Organization" class="gov org">Political Organization</option>
<option value="Primary/Secondary Education" class="edu">Primary/Secondary Education</option>
<option value="Printing" class="med rec">Printing</option>
<option value="Professional Training &amp; Coaching" class="corp">Professional Training &amp; Coaching</option>
<option value="Program Development" class="corp org">Program Development</option>
<option value="Public Policy" class="gov">Public Policy</option>
<option value="Public Relations and Communications" class="corp">Public Relations and Communications</option>
<option value="Public Safety" class="gov">Public Safety</option>
<option value="Publishing" class="med rec">Publishing</option>
<option value="Railroad Manufacture" class="man">Railroad Manufacture</option>
<option value="Ranching" class="agr">Ranching</option>
<option value="Real Estate" class="cons fin good">Real Estate</option>
<option value="Recreational Facilities and Services" class="rec serv">Recreational Facilities and Services</option>
<option value="Religious Institutions" class="org serv">Religious Institutions</option>
<option value="Renewables &amp; Environment" class="gov man org">Renewables &amp; Environment</option>
<option value="Research" class="edu gov">Research</option>
<option value="Restaurants" class="rec serv">Restaurants</option>
<option value="Retail" class="good man">Retail</option>
<option value="Security and Investigations" class="corp org serv">Security and Investigations</option>
<option value="Semiconductors" class="tech">Semiconductors</option>
<option value="Shipbuilding" class="man">Shipbuilding</option>
<option value="Sporting Goods" class="good rec">Sporting Goods</option>
<option value="Sports" class="rec">Sports</option>
<option value="Staffing and Recruiting" class="corp">Staffing and Recruiting</option>
<option value="Supermarkets" class="good">Supermarkets</option>
<option value="Telecommunications" class="gov tech">Telecommunications</option>
<option value="Textiles" class="man">Textiles</option>
<option value="Think Tanks" class="gov org">Think Tanks</option>
<option value="Tobacco" class="good">Tobacco</option>
<option value="Translation and Localization" class="corp gov serv">Translation and Localization</option>
<option value="Transportation/Trucking/Railroad" class="tran">Transportation/Trucking/Railroad</option>
<option value="Utilities" class="man">Utilities</option>
<option value="Venture Capital &amp; Private Equity" class="fin tech">Venture Capital &amp; Private Equity</option>
<option value="Veterinary" class="hlth">Veterinary</option>
<option value="Warehousing" class="tran">Warehousing</option>
<option value="Wholesale" class="good">Wholesale</option>
<option value="Wine and Spirits" class="good man rec">Wine and Spirits</option>
<option value="Wireless" class="tech">Wireless</option>
<option value="Writing and Editing" class="art med rec">Writing and Editing</option>
<option value="Other" class="art med rec">Other</option>
					</select>
				</td>
			</tr>	
		<tr>
				<td align="left" colspan="2" bgcolor="FFFFFF">
                <br><br>
					In one sentence please describe the <strong>product or service</strong> you will be selling at your Key Imapct Point.
                    <br><br>
                    <strong>NOTE:</strong> You can only put one product or service through at a time.
                    
				</td>
			</tr>	
            <tr>
				<td align="left" colspan="2" bgcolor="FFFFFF">
                Describe the product or service you are selling:<br>
					<textarea name="product_service_desc" rows="5" cols="60"></textarea>					
				</td>
			</tr>
<!---         	<tr>
				<td align="right" bgcolor="FFFFFF">
					My Target Consumer:
				</td>
				<td bgcolor="FFFFFF">
                
					Male<input type="checkbox" name="male"> &nbsp; &nbsp; Female<input type="checkbox" name="female">
                    <br>
                     Both Male & Female<input type="checkbox" name="male_female">
				</td>
			</tr>
			<tr>
				<td align="right" bgcolor="FFFFFF">
					Target Consumer Age Range: 
				</td>
				<td bgcolor="FFFFFF">
					<select name="age_range" size="1">
						<option value="All"> All </option>
                        <option value="All Adults"> All Adults</option>
						<option value="1 and 15"> 15 and under </option>
						<option value="16 and 25"> 16 - 25 </option>
						<option value="26 and 45"> 26 - 45 </option>
						<option value="46 and 65"> 46 - 65 </option>
						<option value="65 and 100"> over 65 </option>
					</select>
				</td>
			</tr>	 --->		
			<tr> 
				<td  align="center" colspan="2" bgcolor="336699">
					<input type="Submit" value="Submit">
				</td>
			</tr>
       
          </table>