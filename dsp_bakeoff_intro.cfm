<cfoutput>
					You are now ready to create your <cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ")#</cfif>. 
					Refer to the <a href="dsp_#url.be#_cont.cfm" class="bakeofflink" target="new"><cfif url.be eq "rtb">ENDORSEMENT<cfelse>#replace(ucase(url.be),"_"," ")#</cfif></a> page for essential education.
					<br>
					<cfoutput>
						Your results for this exercise will be viewable in the <a href="index.cfm?fa=bake_off&be=#url.be#" class="bakeofflink">Expert Feedback Results</a> area.
					</cfoutput>
<!--- 					<br>
					Make sure you get all of your Bake Off results in for your #replace(ucase(url.be),"_"," ")# before proceeding to the <a href="" class="bakeofflink">Connectics process</a> for #replace(ucase(url.be),"_"," ")#.
 --->
 </cfoutput>
