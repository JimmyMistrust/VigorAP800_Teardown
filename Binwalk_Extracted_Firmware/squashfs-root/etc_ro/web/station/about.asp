<html>
<head>
<title>Wireless Station About</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

function initTranslation()
{
var e = document.getElementById("aboutTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("about title");

e = document.getElementById("aboutAbout");
e.innerHTML = _("about about");
e = document.getElementById("aboutDriverVersion");
e.innerHTML = _("about driver version");
e = document.getElementById("aboutMacAddr");
e.innerHTML = _("stalist macaddr");
}

function PageInit()
{
initTranslation();
}
</script>

<title>Ralink Wireless Station About</title>
</head>


<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="aboutTitle">Station About</h1>
<hr size="1" />
<br />

<div>
<h2 id="aboutAbout" class="title">About</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" id="aboutDriverVersion">Driver Version</td>
<td><% getStaDriverVer(); %></td>
</tr>
<tr>
<td class="head" id="aboutMacAddr">Mac Address</td>
<td><% getStaMacAddr(); %></td>
</tr>
</table>
</div>

</td></tr>
</table>

</body>
</html>
