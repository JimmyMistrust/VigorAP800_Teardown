<html>
<head>
<title>Reboot System</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
var vlan_enable = '<% getCfgGeneral(1, "WL_VLAN"); %>';
var opmode = '<% getCfgZero(1, "OperationMode"); %>';
var ap800_mode = '<% getCfgZero(1, "800_ap_mode"); %>';

var vlan_exit = 0;
if (opmode == "0") {
if (ap800_mode == "0" || ap800_mode == "3")
vlan_exit = 1;
else
vlan_exit = 0;
} else if (opmode == "3")
vlan_exit = 1;

function initTranslation()
{
var e = document.getElementById("rebootTitle");
e.innerHTML = _("parent system maintenance")+" >> "+_("reboot title");

e = document.getElementById("rebootSystem");
e.innerHTML = _("reboot system");
for (var i = 1; i <= 4; i++) {
e = eval("document.getElementById('rebootStr"+i+"')");
e.innerHTML = eval("_('reboot back str"+i+"')");
}
}

function pageInit()
{
initTranslation();
}
</script>
</head>

<body onload="pageInit()">
<table class="body">
<tr><td>
<h1 id="rebootTitle">Reboot System</h1>
<hr size="1" />
<br />

<div>
<h2 id="rebootSystem" class="title">Reboot System</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td>
<table align="center" border="0" cellspacing="0" width="380" cellpadding="8">
<tr>
<td width="100%">
<img align=middle src="/graphics/note.gif" alt="Hint">
<span id="rebootStr1">Router is restarting. Please wait for around</span>
<b>&nbsp;<span id="rebootStr2">30 seconds</span></b>.
<span id="rebootStr3">After booting router, you could click the following URL</span><br>
<b>LAN-A&nbsp;<a href="javascript:top.location='http://192.168.1.2'">http:// 192.168.1.2</a></b><br>
<b>LAN-B&nbsp;<a href="javascript:top.location='http://192.168.2.2'">http:// 192.168.2.2</a></b><br>
<span id="rebootStr4">to connect to router's homepage again.</span>
</td>
</tr>
</table>
</td></tr>
</table>
</div>

</td></tr>
</table>

</body>
</html>