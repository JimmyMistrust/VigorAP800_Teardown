<html>
<head>
<title>Apple iOS Keep Alive Settings</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" Content="No-cach">
<meta http-equiv="Expires" Content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" language="JavaScript">
Butterlate.setTextDomain("admin");
Butterlate.setTextDomain("main");

function initTranslation()
{
var e = document.getElementById("IOSKeepAliveTitle");
e.innerHTML = _("parent application")+" >> "+_("treeapp ioskeepalive");
e = document.getElementById("ioskeepaliveEnable");
e.innerHTML = _("ioskeepalive enable");
e = document.getElementById("ioskeepaliveIntro");
e.innerHTML = _("ioskeepalive intro");
e = document.getElementById("ioskeepaliveIdx1");
e.innerHTML = _("ioskeepalive index");
e = document.getElementById("ioskeepaliveIdx2");
e.innerHTML = _("ioskeepalive index");
e = document.getElementById("ioskeepaliveipaddr1");
e.innerHTML = _("ioskeepalive ipaddress");
e = document.getElementById("ioskeepaliveipaddr2");
e.innerHTML = _("ioskeepalive ipaddress");
e = document.getElementById("ioskeepaliveApply");
e.value = _("ioskeepalive apply");
e = document.getElementById("ioskeepaliveCancel");
e.value = _("ioskeepalive cancel");
}

function initValue()
{
initTranslation();
var keepalive = "<% getCfgGeneral(1, "ioskeepaliveEnabled", 1); %>";

if(keepalive == "1")
document.webKeepAlive.keepaliveEnFlag.checked = true;
else
document.webKeepAlive.keepaliveEnFlag.checked = false;
}

</script>
</head>

<body onload="initValue()">
<table class="body">
<tr><td>
<h1 id="IOSKeepAliveTitle">Apple iOS Keep Alive</h1>
<hr size="1" />
<br />

<form method=post name="webKeepAlive" action="/goform/ioskeepalive_enable">
<table align=center width=100% cellspacing="2" cellpadding="1" border="0" class="config">
<tr><td><input type=checkbox name=keepaliveEnFlag>&nbsp;
<span id="ioskeepaliveEnable">Enable Apple iOS Keep Alive</span></td></tr>
<tr>
<tr><td class="title" valign="top"><span id="IOSKeepAliveTitle">Apple iOS Keep Alive</span>:</td></tr>
<tr><td><span id="ioskeepaliveIntro">Apple iOS Keep Alive can keep Wifi connection of iOS device by sending UDP port 5353 packets every 5 seconds.</span></td></tr>
</table>
<br>
<br>
<table width=100% cellspacing="2" cellpadding="1" border="0" class="config">
<tr><th id="ioskeepaliveIdx1" width=10%>Index</th>
<th id="ioskeepaliveipaddr1" align=center width=40%>Apple iOS Keep Alive IP Address</th>
<th id="ioskeepaliveIdx2" width=10%>Index</th>
<th id="ioskeepaliveipaddr2" align=center width=40%>Apple iOS Keep Alive IP Address</th>
</tr>
<script>
var aryModelPath = ["<% getCfgGeneral(1, "ioskeepalive0", 1); %>", "<% getCfgGeneral(1, "ioskeepalive1", 1); %>",
"<% getCfgGeneral(1, "ioskeepalive2", 1); %>", "<% getCfgGeneral(1, "ioskeepalive3", 1); %>",
"<% getCfgGeneral(1, "ioskeepalive4", 1); %>", "<% getCfgGeneral(1, "ioskeepalive5", 1); %>"];
var str ="";
for(var i=0;i<aryModelPath.length;i+=2) {

str += "<tr class=" + ((i+2)%4?"config_even":"config_odd") +">";
str += "<td align=center width=10%><a href='keepalive_content.asp?idx=" + i + "'>" + (i+1) + "</a></td>";
if (aryModelPath[i].length == 1)
str += "<td width=40%></td>";
else
str += "<td align=center width=40%>" + aryModelPath[i]+ "</td>";
str += "<td align=center width=10%><a href='keepalive_content.asp?idx=" + (i+1) + "'>" + (i+2) + "</a></td>";
if (aryModelPath[i+1].length ==1)
str += "<td width=40%></td></tr>";
else
str += "<td align=center width=40%>" + aryModelPath[i+1]+ "</td></tr>";
}
document.write(str);
</script>
</table>
<br>
<table align=center>
<tr><td>
<input class="btnw" type="submit" value="OK" id="ioskeepaliveApply" name="ioskeepaliveApply">&nbsp;&nbsp;
<input class="btnw" type="button" value="Cancel" id="ioskeepaliveCancel" name="ioskeepaliveCancel" onclick="window.location.reload()">
</td></tr>
</table>
</form>

</body>
</html>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/jquery.js"></script>
<script>
var _fw_upgrade_notify	='<% getCfgGeneral(1, "fw_upgrade_notify", 1); %>';
var _aryInfo = [<% getUpgradeInfo(); %>];// [0]:exit new fw  [1]:ver
var _curt_ver = '<% getSdkVersion(); %>';
var _lanIP = '<% getLanIp(); %>';
fw_urpgrade_auto_detect(_fw_upgrade_notify,_aryInfo,_curt_ver,_lanIP);
</script>