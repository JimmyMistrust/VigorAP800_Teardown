<html>
<head>
<title>CAM General Setup</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/dtree/dhtml.js"></script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="lTitle"></h1>
<hr size="1" /><br />
<form name="camfunlst">
<table bgcolor="#a9a9a9" width="100" cellpadding="2" cellspacing="0" border="0">
<tr><td align=center><b>Client<b></td>
</tr>
</table>

<table width="700" cellpadding="2" cellspacing="0" border="1">
<tr><td align=center colspan="1">&nbsp;</td>
<td colspan="3" align="center"><b>Model Name<b></td>
</tr>
<tr><td colspan="1" align="left"><b>Function Name<b></td>
<td colspan="3" align="center"><b>AP 800<b></td>
</tr>
<tr align=center><td colspan="1"><b>&nbsp;<b></td>
<td colspan="1"><b>1.0.5<b></td>
<td colspan="1"><b>1.1.0<b></td>
<td colspan="1"><b>1.1.1<b></td>
</tr>
<tr><td colspan="1" align="left"><b>Register<b></td>
<td colspan="3">&nbsp;</td>
</tr>
<tr><td>DHCP</td>
<td align=center>V</td>
<td align=center>V</td>
<td align=center>V</td>
</tr>
<tr><td>Static IP</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>V</td>
</tr>
<tr><td colspan="1" align="left"><b>Profile<b></td>
<td colspan="3">&nbsp;</td>
</tr>
<tr><td>2.4GHz</td>
<td align=center>V</td>
<td align=center>V</td>
<td align=center>V</td>
</tr>
<tr><td>5GHz</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>V</td>
</tr>
<tr><td>AP Mode</td>
<td align=center>V</td>
<td align=center>V</td>
<td align=center>V</td>
</tr>
<tr><td>Repeater Mode</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>V</td>
</tr>
<tr><td>Client Disable Auto Provision</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>V</td>
</tr>
<tr><td>WLAN Enable/Disable</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
<tr><td colspan="1" align="left"><b>Station List<b></td>
<td colspan="3">&nbsp;</td>
</tr>
<tr><td>Station List</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>V</td>
</tr>
<tr><td colspan="1" align="left"><b>Load Balance<b></td>
<td colspan="3">&nbsp;</td>
</tr>
<tr><td>Load Balance</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
<tr><td colspan="1" align="left"><b>Traffic Graph<b></td>
<td colspan="3">&nbsp;</td>
</tr>
<tr><td>Traffic Graph</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>V</td>
</tr>
<tr><td colspan="1" align="left"><b>Rogue AP Detection<b></td>
<td colspan="3">&nbsp;</td>
</tr>
<tr><td>Rogue AP Detection</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
<tr><td colspan="1" align="left"><b>AP Maintenance<b></td>
<td colspan="3">&nbsp;</td>
</tr>
<tr><td>Config Backup/Restore</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
<tr><td>Firmware Upgrade</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
<tr><td>Remote Reboot</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
<td align=center>&nbsp;</td>
</tr>
</table>
<table>
<br>
<tr><td></td></tr>
</table>
</form>
</td></tr>
</table>
</body>
</html>
<script language="JavaScript" type="text/javascript">
var f = document.camfunlst;
Butterlate.setTextDomain("internet");

function initTranslation()
{
var e = document.getElementById("lTitle");
e.innerHTML = _("parent cam")+" >> "+_("lan apmc funlst");

}

function initValue()
{
initTranslation();
}

</script>
