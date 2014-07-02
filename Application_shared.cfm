<CFAPPLICATION name="jumpstart" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0,0,10,0)#" 
clientmanagement="yes" clientstorage="jumpstart" >

<CFSET application.dsn = "jumpstart">
<CFSET application.filepath = "C:\Websites\145544Th8\">
<CFSET application.urlpath = "">


<cfparam name="client.cid" default=0>
<cfparam name="client.name" default=0> 

