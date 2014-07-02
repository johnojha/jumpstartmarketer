		
	<cfif form.qtr eq 1>	
	
		<cf_query name="pab_index_01" datasource="afpps">
		
			SELECT 
				p.p_pay_1, p.p_qtr_1, p.p_percent_1, p.p_fte_1
				<cfif form.fy eq "08">
			 		FROM pab_index i INNER JOIN pab_percents p
				<cfelseif form.fy eq "07">
			 		FROM pab_index i INNER JOIN pab_percents_2007 p
				<cfelseif form.fy eq "06">
					FROM pab_index_2006 i INNER JOIN pab_percents_2006 p
				<cfelseif form.fy eq "05">
					FROM pab_index_FY05 i INNER JOIN pab_percents_FY05 p
				</cfif>
			 ON i.pab_idx = p.p_idx 
			LEFT OUTER JOIN employees e ON p.p_emp_id = e.emp_id
			WHERE 1 = 1
			<cfif form.emp_name neq "">AND p.p_name LIKE '%#form.emp_name#%'</cfif>
			<cfif form.idx_name neq "">AND i.pab_idx LIKE '%#form.idx_name#%'</cfif>
			<cfif form.region neq 0>AND emp_region = '#form.region#'</cfif>
			<cfif form.cost_center neq 0>AND emp_cost_center = '#form.cost_center#'</cfif>		
			<cfif form.idx neq 0>
				<cfset idx_list = replace(form.idx,",","','","ALL")>	
					AND i.pab_idx IN ('#idx_list#')
			<!--- <cfloop list="#form.idx#" index="i"><cfoutput>'#i#',</cfoutput></cfloop> --->	
			</cfif>
			<cfif form.cat neq 0>AND e.emp_category = '#form.cat#'</cfif>
			<cfif form.level_1 neq 0>AND i.level_1 = '#form.level_1#'</cfif>
			<cfif form.level_2 neq 0>AND i.level_2 = '#form.level_2#'</cfif>
			<cfif form.level_3 neq 0>AND i.level_3 = '#form.level_3#'</cfif>
			<cfif form.fy neq 0>AND p.p_fy = '#form.fy#'</cfif>
			
			AND  p.p_ssn IN (SELECT DISTINCT(ssn) FROM PAYROLL_CURRENTFY
			WHERE	pp = 1

		</cf_query>
		
	<cfelseif form.qtr eq 4>	
	
	
	
	</cfif>