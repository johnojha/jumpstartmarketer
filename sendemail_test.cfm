<html>
<head>
    <title>Sending a simple e-mail</title>
</head>
<body>
<h1>Sample e-mail</h1>
<cfmail
    from="info@MyPowerMarketer.com"
    to="#URL.email#"
    subject="Sample e-mail from ColdFusion">

This is a sample e-mail message to show basic e-mail capability.

</cfmail>

<cfoutput>
The e-mail was sent.

</cfoutput>

</body>
</html>