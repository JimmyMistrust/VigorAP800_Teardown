<html>
<head>
<title>Operation Mode</title>
<link rel="stylesheet" href="style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<style type="text/css">
p {
font-size: 12pt;
font-weight: bold;
font-family: Arial, Helvetica, sans-serif;
color: #990033;
}
</style>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

function initTranslation()
{
var e = document.getElementById("oTitle");
e.innerHTML = _("opmode title");

e = document.getElementById("oModeAP");
e.innerHTML = _("opmode mode ap");
e = document.getElementById("oModeAP_5g");
e.innerHTML = _("opmode mode ap");
e = document.getElementById("oModeAPIntro");
e.innerHTML = _("opmode mode ap intro");
e = document.getElementById("oModeAPIntro_5g");
e.innerHTML = _("opmode mode ap intro");
e = document.getElementById("oModeStation");
e.innerHTML = _("opmode mode sta");
e = document.getElementById("oModeStationIntro");
e.innerHTML = _("opmode mode sta intro");
e = document.getElementById("oModeAPBriP2P");
e.innerHTML = _("opmode mode apbp2p");
e = document.getElementById("oModeAPBriP2PIntro");
e.innerHTML = _("opmode mode apbp2p intro");
e = document.getElementById("oModeAPBriP2MP");
e.innerHTML = _("opmode mode apbp2mp");
e = document.getElementById("oModeAPBriP2MPIntro");
e.innerHTML = _("opmode mode apbp2mp intro");
e = document.getElementById("oModeAPBriWDS");
e.innerHTML = _("opmode mode apbwds");
e = document.getElementById("oModeAPBriWDSIntro");
e.innerHTML = _("opmode mode apbwds intro");
e = document.getElementById("oModeAPBriWDSIntro1");
e.innerHTML = _("opmode mode apbwds intro1");
e = document.getElementById("oModeUR");
e.innerHTML = _("opmode mode ur");
e = document.getElementById("oModeURIntro");
e.innerHTML = _("opmode mode ur intro");
e = document.getElementById("oWlMode_2g");
e.innerHTML = _("wiz 2.4g wireless");
e = document.getElementById("oWlMode_5g");
e.innerHTML = _("wiz 5g wireless");

e = document.getElementById("oApply");
e.value = _("admin apply");
//	e = document.getElementById("oCancel");
//	e.value = _("main cancel");
}

function initValue()
{
var opmode = "<% getCfgGeneral(1, "OperationMode"); %>";
var ap800_mode = "<% getCfgGeneral(1, "800_ap_mode"); %>";

initTranslation();
//	alert("parent.opmode="+parent.opmode+"   parent.ap800_mode="+parent.ap800_mode);
if((parent.opmode != opmode) || (parent.ap800_mode != ap800_mode)) {
parent.menu.location.reload();
parent.act_sta.location.reload();
}
parent.opmode = opmode;
parent.ap800_mode = ap800_mode;
if (opmode == "0") {
switch (ap800_mode) {
case "0":
document.opmode.opMode[0].checked = true;
break;
case "1":
document.opmode.opMode[2].checked = true;
break;
case "2":
document.opmode.opMode[3].checked = true;
break;
case "3":
document.opmode.opMode[4].checked = true;
break;
default:
break;
}
} else if (opmode == "2")
document.opmode.opMode[1].checked = true;
else if (opmode == "3")
document.opmode.opMode[5].checked = true;
}
</script>
</head>

<body onLoad="initValue()">
<table class="body"><tr><td>

<h1 id="oTitle"></h1>
<hr size="1" />
<br />

<form method="post" name="opmode" action="/goform/setOpMode">
<p id="oWlMode_2g">2.4G Wireless</p>

<table cellpadding="2" cellspacing="1" width="90%">
<dl>
<dt>
<input type="radio" name="opMode" id="opMode" value="0">
<b id="oModeAP">AP Mode :</b>
</dt>
<dd id="oModeAPIntro"></dd>
<dt>
<input type="radio" name="opMode" id="opMode" value="2">
<b id="oModeStation">Station-Infrastructure :</b>
</dt>
<dd id="oModeStationIntro"></dd>
<dt>
<input type="radio" name="opMode" id="opMode" value="4">
<b id="oModeAPBriP2P">AP Bridge-Point to Point :</b>
</dt>
<dd id="oModeAPBriP2PIntro"></dd>
<dt>
<input type="radio" name="opMode" id="opMode" value="5">
<b id="oModeAPBriP2MP">AP Bridge-Point to Multi-Point :</b>
</dt>
<dd id="oModeAPBriP2MPIntro"></dd>
<dt>
<input type="radio" name="opMode" id="opMode" value="6">
<b id="oModeAPBriWDS">AP Bridge-WDS Mode :</b>
</dt>
<dd id="oModeAPBriWDSIntro"></dd>
<dd id="oModeAPBriWDSIntro1"></dd>
<dt>
<input type="radio" name="opMode" id="opMode" value="3">
<b id="oModeUR">Universal Repeater :</b>
</dt>
<dd id="oModeURIntro"></dd>
</dl>
</table>

<p id="oWlMode_5g">5G Wireless</p>
<table cellpadding="2" cellspacing="1" width="90%">
<dl>
<dt>
<input type="radio" name="opMode_5g" id="opMode_5g" value="0" checked>
<b id="oModeAP_5g">AP Mode :</b>
</dt>
<dd id="oModeAPIntro_5g"></dd>
</dl>
</table>

<br />
<table width = "100%" border = "0" cellpadding = "2" cellspacing = "1">
<tr align="left">
<td class="title" valign="top">Note:</td>
<td><span id="scanStr">5G Wireless only works when N65 dongle is connected to USB port of AP800.</span><br>
</td>
</tr>
</table>

<table width = "100%" border = "0" cellpadding = "2" cellspacing = "1">
<tr align="center">
<td>
<input type="button" class="btnw" value="OK" id="oApply" onClick="if (confirm(_('msg lan connection lost'))) document.opmode.submit();">&nbsp;&nbsp;
</td>
</tr>
</table>
</form>

</td></tr>
</table>
</body>
</html>
