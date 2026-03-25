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
var f;
var pageArgs = searchArgs(window.location.search);
var idx = -1;
if(pageArgs['idx'])
idx = parseInt(pageArgs['idx']);
var aryModelPath = ["<% getCfgGeneral(1, "ioskeepalive0", 1); %>", "<% getCfgGeneral(1, "ioskeepalive1", 1); %>",
"<% getCfgGeneral(1, "ioskeepalive2", 1); %>", "<% getCfgGeneral(1, "ioskeepalive3", 1); %>",
"<% getCfgGeneral(1, "ioskeepalive4", 1); %>", "<% getCfgGeneral(1, "ioskeepalive5", 1); %>"];


function initTranslation()
{
var e = document.getElementById("IOSKeepAliveTitle");
e.innerHTML = _("parent application")+" >> "+_("treeapp ioskeepalive");
e = document.getElementById("ipaddress");
e.innerHTML = _("ioskeepalive ipaddress");
e = document.getElementById("ioskeepaliveAdd");
e.value = _("ioskeepalive add");
e = document.getElementById("ioskeepaliveDel");
e.value = _("ioskeepalive clear");
e = document.getElementById("ioskeepaliveReset");
e.value = _("ioskeepalive cancel");
}

function initValue()
{
f = document.IOSIPADDR;
initTranslation();
setVle2Elmt(f.idx, idx, 0);
setVle2Elmt(f.ioskeepaliveipaddr, aryModelPath[idx], 0);
}

function onClkAdd()
{
if (!checkIpAddr(document.IOSIPADDR.ioskeepaliveipaddr, false))
return false;
f.submit();
}

function onClkDel()
{
f.del.value = 1;
f.submit();
}
</script>
</head>

<body onload="initValue()">
<table class="body">
<tr><td>
<h1 id="IOSKeepAliveTitle">Apple iOS Keep Alive</h1>
<hr size="1" />
<br />

<!-- ========== Model/Firmware form ========== -->
<form method=post name="IOSIPADDR" action="/goform/ioskeepalive_edit">
<h1 id="IOSKeepAliveTitle">Apple iOS Keep Alive</h1>
<table align=center width=100% cellspacing="2" cellpadding="1" border="0" class="config">
<tr>
<td class="param_label" id="ipaddress">Apple iOS Keep Alive IP Address:</td>
<td><input type="text" maxlength="100" size="30" name="ioskeepaliveipaddr" id="ioskeepaliveipaddr">
<input type="hidden" name="idx">
<input type="hidden" name="del" value=0></td>
</tr>
</table><br>

<table align=center>
<tr><td>
<input class="btnw" type="button" value="Add" id="ioskeepaliveAdd" name="ioskeepaliveAdd" onclick="onClkAdd()">&nbsp;&nbsp;
<input class="btnw" type="button" value="Clear" id="ioskeepaliveDel" name="ioskeepaliveDel" onclick="onClkDel()">&nbsp;&nbsp;
<input class="btnw" type="button" value="Cancel" id="ioskeepaliveReset" name="ioskeepaliveReset" onclick="window.location='keep_alive.asp';">
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