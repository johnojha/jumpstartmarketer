<cfparam name="url.be" default=0>


<cfif IsDefined("form.upload_image")>

	<cfscript>
		objUpload = createObject("component","ManageImagesCFC");
		isValid = objUpload.uploadImage(form.be,form.upload_image);
	</cfscript>

	<cfoutput>#isValid#</cfoutput>

<cfelse>

	<cfinclude template="../functions/getCurrentURL.cfm">

	<cfoutput>
	#getCurrentURL()#
	
		<form action="" method="post" enctype="multipart/form-data">
		
		<strong>#replace(ucase(arguments.be),"_"," ","All")#:</strong> <input type="file" name="upload_image"> <br><br>
		<input type="hidden" name="be" value="#url.be#">
		<input type="submit" value="  Upload  ">
		
		</form>
	</cfoutput>
</cfif>



