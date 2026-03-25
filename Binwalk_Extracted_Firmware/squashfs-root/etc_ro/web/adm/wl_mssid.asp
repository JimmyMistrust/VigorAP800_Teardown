<html>
<head>
<title>Wireless</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/dtree/dhtml.js"></script>
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
var f;
var w = window.opener.w;
var vlan_enable = window.opener.vl_enable;
var ssid_vlan2 = '<% getCfgZero(1, "SSID_VLAN2"); %>';
var ssid_vlan3 = '<% getCfgZero(1, "SSID_VLAN3"); %>';
var ssid_vlan4 = '<% getCfgZero(1, "SSID_VLAN4"); %>';


function initTranslation()
{
var e = document.getElementById("wizTitle");
e.innerHTML = _("wiz title") + " >> " + _("wiz wireless multi ssid");

e = document.getElementById("mssid");
e.innerHTML = _("wiz wireless multi ssid");
e = document.getElementById("ssid");
e.innerHTML = _("status wlan ssid");
e = document.getElementById("subnet");
e.innerHTML = _("wiz wireless subnet");

e = document.getElementById("lOk");
e.value = _("admin apply");
e = document.getElementById("lCancel");
e.value = _("admin cancel");
}

function initAll()
{
initTranslation();

f = document.frm;
if (vlan_enable != "1") {
f.ssid_vlan2.disabled = true;
f.ssid_vlan3.disabled = true;
f.ssid_vlan4.disabled = true;
}
if ("<% getCfgGeneral(1, "SSID2"); %>" == "" && w.wSsid2 == "")
setVle2Elmt(f.mssid_1, "DrayTek-LAN-B");
else if (w.wSsid2 != "")
setVle2Elmt(f.mssid_1, w.wSsid2);
if (ssid_vlan2 == ""  && w.wSsid_vlan2 == "")
ssid_vlan2 = '2';
else if (w.wSsid_vlan2 != "")
ssid_vlan2 = w.wSsid_vlan2;
setVle2Elmt(f.ssid_vlan2, ssid_vlan2);
if (w.wSsid3 != "") setVle2Elmt(f.mssid_2, w.wSsid3);
if (w.wSsid_vlan3 != "")  ssid_vlan3 = w.wSsid_vlan3;
setVle2Elmt(f.ssid_vlan3, ssid_vlan3);
if (w.wSsid4 != "") setVle2Elmt(f.mssid_3, w.wSsid4);
if (w.wSsid_vlan4 != "") ssid_vlan4 = w.wSsid_vlan4;
setVle2Elmt(f.ssid_vlan4, ssid_vlan4);
}

function onClkOk()
{
if (getVleFromElmt(f.mssid_1, 0) == "") {
setVle2Elmt(f.mssid_2, "");
setVle2Elmt(f.mssid_3, "");
} else if (getVleFromElmt(f.mssid_2, 0) == "")
setVle2Elmt(f.mssid_3, "");

w.wSsid2 = getVleFromElmt(f.mssid_1, 0);
w.wSsid_vlan2 = getVleFromElmt(f.ssid_vlan2, 0);
w.wSsid3 = getVleFromElmt(f.mssid_2, 0);
w.wSsid_vlan3 = getVleFromElmt(f.ssid_vlan3, 0);
w.wSsid4 = getVleFromElmt(f.mssid_3, 0);
w.wSsid_vlan4 = getVleFromElmt(f.ssid_vlan4, 0);

var submit_ssid_num = 1;
for (i = 1; i < 4; i++) {
if (eval("f.mssid_"+i).value != "") {
submit_ssid_num++;
}
}
w.wMSsidNum	 = submit_ssid_num;
setTimeout("window.close()",2000);
//window.close();
}

function onClkBtnCcl()
{
window.close();
}
</script>
</head>

<body onload="initAll()">
<table class="body">
<tr><td>
<h1 id="wizTitle">Multiple SSID</h1>
<hr size="1" />
<br />

<form name="frm">
<h2 id="mssid" class="title">Multiple SSID</h2>
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center" class="config">
<tr><td align="center"></td>
<td align="center" id="ssid">SSID</td>
<td align="center" id="subnet">Subnet</td>
</tr>
<tr><td align="center">2</td>
<td align="center"><input type="text" name="mssid_1" size="25" maxlength="32" value="<% getCfgGeneral(1, "SSID2"); %>" /></td>
<td align="center"><select id="ssid_vlan2" name="ssid_vlan2" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
</td>
</tr>
<tr><td align="center">3</td>
<td align="center"><input type="text" name="mssid_2" size="25" maxlength="32" value="<% getCfgGeneral(1, "SSID3"); %>" /></td>
<td align="center"><select id="ssid_vlan3" name="ssid_vlan3" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
</td>
</tr>
<tr> <td align="center">4</td>
<td align="center"><input type="text" name="mssid_3" size="25" maxlength="32" value="<% getCfgGeneral(1, "SSID4"); %>" /></td>
<td align="center"><select id="ssid_vlan4" name="ssid_vlan4" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
</td>
</tr>
</table><br />

<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type=button class="btnw" value="OK" id="lOk" onClick="onClkOk()"> &nbsp; &nbsp;
<input type=button class="btnw" value="Cancel" id="lCancel" onClick="onClkBtnCcl()">
</td>
</tr>
</table>

</form>

</td></tr>
</table>

</body>
</html>