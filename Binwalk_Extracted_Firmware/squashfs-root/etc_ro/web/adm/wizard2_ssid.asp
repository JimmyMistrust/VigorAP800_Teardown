<html>
<head>
<title>Universal Repeater</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/dhtml.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

var f;
var w = parent.wizard;
var pageArgs = searchArgs(window.location.search);
var ssid_slt = pageArgs['ssid'];
var mac_slt = pageArgs['mac'];

var ssid = '<% getCfgGeneral(1, "ApCliSsid"); %>';
var bssid = '<% getCfgGeneral(1, "ApCliBssid"); %>';
var mode = '<% getCfgGeneral(1, "ApCliAuthMode"); %>';
var enc = '<% getCfgGeneral(1, "ApCliEncrypType"); %>';
var wpapsk = '<% getCfgGeneral(1, "ApCliWPAPSK"); %>';
var keyid = '<% getCfgGeneral(1, "ApCliDefaultKeyId"); %>';
var key1 = '<% getCfgGeneral(1, "ApCliKey1Str"); %>';
var key1type = '<% getCfgGeneral(1, "ApCliKey1Type"); %>';
var key2 = '<% getCfgGeneral(1, "ApCliKey2Str"); %>';
var key2type = '<% getCfgGeneral(1, "ApCliKey2Type"); %>';
var key3 = '<% getCfgGeneral(1, "ApCliKey3Str"); %>';
var key3type = '<% getCfgGeneral(1, "ApCliKey3Type"); %>';
var key4 = '<% getCfgGeneral(1, "ApCliKey4Str"); %>';
var key4type = '<% getCfgGeneral(1, "ApCliKey4Type"); %>';

function SecurityModeSwitch()
{
hideElmtById(document, "div_apcli_default_key");
hideElmtById(document, "div_apcli_key1");
hideElmtById(document, "div_apcli_key2");
hideElmtById(document, "div_apcli_key3");
hideElmtById(document, "div_apcli_key4");
hideElmtById(document, "div_apcli_wpapsk");

f.apcli_default_key[0].disabled = true;
f.apcli_default_key[1].disabled = true;
f.apcli_default_key[2].disabled = true;
f.apcli_default_key[3].disabled = true;
f.apcli_key1.disabled = true;
f.apcli_key2.disabled = true;
f.apcli_key3.disabled = true;
f.apcli_key4.disabled = true;
f.apcli_wpapsk.disabled = true;

f.apcli_enc.options.length = 0;
if (f.apcli_mode.options.selectedIndex == 0 || f.apcli_mode.options.selectedIndex == 1) {
if (f.apcli_mode.options.selectedIndex == 0) {
f.apcli_enc.options[0] = new Option("None", "NONE");
f.apcli_enc.options[1] = new Option("WEP", "WEP");
} else {
f.apcli_enc.options[0] = new Option("WEP", "WEP");
}
showElmtById(document, "div_apcli_default_key");
showElmtById(document, "div_apcli_key1");
showElmtById(document, "div_apcli_key2");
showElmtById(document, "div_apcli_key3");
showElmtById(document, "div_apcli_key4");
f.apcli_default_key[0].disabled = false;
f.apcli_default_key[1].disabled = false;
f.apcli_default_key[2].disabled = false;
f.apcli_default_key[3].disabled = false;
f.apcli_key1.disabled = false;
f.apcli_key2.disabled = false;
f.apcli_key3.disabled = false;
f.apcli_key4.disabled = false;
}
else if (f.apcli_mode.options.selectedIndex == 2 || f.apcli_mode.options.selectedIndex == 3) {
f.apcli_enc.options[0] = new Option("TKIP", "TKIP");
f.apcli_enc.options[1] = new Option("AES", "AES");
showElmtById(document, "div_apcli_wpapsk");
f.apcli_wpapsk.disabled = false;
}
}

function initTranslation()
{
var e = document.getElementById("wizTitle");
e.innerHTML = _("wiz title") + " >> " + _("wiz 2.4g wireless");

e = document.getElementById("apcliSelect");
e.innerHTML = _("wiz apcli select");
e = document.getElementById("apcliSet");
e.innerHTML = _("wiz apcli set");
e = document.getElementById("apcliSSID");
e.innerHTML = _("status wlan ssid");
e = document.getElementById("apcliMAC");
e.innerHTML = _("wiz apcli mac");
e = document.getElementById("apcliMode");
e.innerHTML = _("wiz apcli mode");
e = document.getElementById("apcliEnc");
e.innerHTML = _("wiz apcli ecn");
e = document.getElementById("apcliWEPKey");
e.innerHTML = _("wiz apcli wepkey");
for (var i = 1; i <= 4; i++) {
e = eval("document.getElementById('apcliWEPKey"+i+"')");
e.innerHTML =  _("wiz apcli keys");
}
e = document.getElementById("apcliPass");
e.innerHTML = _("wiz apcli passphase");

e = document.getElementById("lBack");
e.value = _("wiz back");
e = document.getElementById("lNext");
e.value = _("wiz next");
var e = document.getElementById("lCancel");
e.value = _("admin cancel");
}

function initValue()
{
initTranslation();

f = document.frm;

if (w.wURSsid != "")  ssid = w.wURSsid;
if (w.wURBSsid != "")  bssid = w.wURBSsid;
if (w.wURMode != "")  mode = w.wURMode;
if (w.wUREnc != "")  enc = w.wUREnc;
if (w.wURWpapsk != "")  wpapsk = w.wURWpapsk;
if (w.wURKeyid != "")  keyid = w.wURKeyid;
if (w.wURKey1 != "")  key1 = w.wURKey1;
if (w.wURKey1Type != "")  key1type = w.wURKey1Type;
if (w.wURKey2 != "")  key2 = w.wURKey2;
if (w.wURKey2Type != "")  key2type = w.wURKey2Type;
if (w.wURKey3 != "")  key3 = w.wURKey3;
if (w.wURKey3Type != "")  key3type = w.wURKey3Type;
if (w.wURKey4 != "")  key4 = w.wURKey4;
if (w.wURKey4Type != "")  key4type = w.wURKey4Type;

if (ssid_slt && ssid_slt != "")
ssid = ssid_slt;
if (mac_slt && mac_slt != "")
bssid = mac_slt;
setVle2Elmt(f.apcli_bssid, bssid, 0);
setVle2Elmt(f.apcli_ssid, ssid, 0);
setVle2Elmt(f.apcli_mode, mode, 0);
setVle2Elmt(f.apcli_wpapsk, wpapsk, 0);
setVle2Elmt(f.apcli_key1, key1, 0);
setVle2Elmt(f.apcli_key2, key2, 0);
setVle2Elmt(f.apcli_key3, key3, 0);
setVle2Elmt(f.apcli_key4, key4, 0);
if (keyid != "")
setVle2Elmt(f.apcli_default_key[0], keyid, 0);

setVle2Elmt(f.apcli_key1type, key1type, 0);
setVle2Elmt(f.apcli_key2type, key2type, 0);
setVle2Elmt(f.apcli_key3type, key3type, 0);
setVle2Elmt(f.apcli_key4type, key4type, 0);

SecurityModeSwitch();

setVle2Elmt(f.apcli_enc, enc, 0);
}

function CheckInjection(str)
{
var len = str.length;
for (var i = 0; i < str.length; i++) {
if (str.charAt(i) == ';' || str.charAt(i) == ',' ||
str.charAt(i) == '\r' || str.charAt(i) == '\n') {
return false;
}
else
continue;
}
return true;
}

function CheckWep()
{
var defaultid = getVleFromElmt(f.apcli_default_key[0], 0);

if (f.apcli_enc.value == "WEP") {
if (!defaultid) defaultid = 1;
if (eval("f.apcli_key"+defaultid).value.length == 0) {
alert('Please input wep key'+defaultid+'!');
eval("f.apcli_key"+defaultid).focus();
return false;
}
for (var i = 1; i < 5; i++) {
if (eval("f.apcli_key"+i+"type").options.selectedIndex == 0) {
var mykey = eval("f.apcli_key"+i);
if (mykey.value.length != 0 && mykey.value.length != 5 && mykey.value.length != 13) {
alert('Please input 5 or 13 characters of wep key'+i);
mykey.focus();
return false;
}
if (!CheckInjection(mykey.value)) {
alert('Wep key'+i+' contains invalid characters!');
mykey.focus();
return false;
}
} else if (eval("f.apcli_key"+i+"type").options.selectedIndex == 1) {
var mykey = eval("f.apcli_key"+i);
if (mykey.value.length != 0 && mykey.value.length != 10 && mykey.value.length != 26) {
alert('Please input 10 or 26 characters of wep key'+i);
mykey.focus();
return false;
}
if (!checkHex(mykey.value)) {
alert('Invalid Wep key'+i+' format!');
mykey.focus();
return false;
}
}
}
}
return true;
}

function CheckWpa()
{
if (f.apcli_wpapsk.value.length < 8) {
alert("Pass Phrase length should be larger than 8!");
f.apcli_wpapsk.focus();
return false;
}
if (!CheckInjection(f.apcli_wpapsk.value)) {
alert('Invalid characters in Pass Phrase.');
f.apcli_wpapsk.focus();
return false;
}
return true;
}

function onClkNxt()
{
if (f.apcli_ssid.value == '') {
alert('empty SSID!');
f.apcli_ssid.focus();
return false;
}

if (f.apcli_bssid.value != '') {
var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
if (!re.test(f.apcli_bssid.value)) {
alert("BSSID format error!");
f.apcli_bssid.focus();
return false;
}
}

if (f.apcli_mode.options.selectedIndex == 0 || f.apcli_mode.options.selectedIndex == 1)
if(!CheckWep()) return false;
else if (f.apcli_mode.options.selectedIndex == 2 || f.apcli_mode.options.selectedIndex == 3)
if(!CheckWpa()) return false;
else {
alert('Unknown Security Mode!');
return false;
}

w.wURSsid = getVleFromElmt(f.apcli_ssid, 0);
w.wURBSsid = getVleFromElmt(f.apcli_bssid, 0);
w.wURMode = getVleFromElmt(f.apcli_mode, 0);
w.wUREnc = getVleFromElmt(f.apcli_enc, 0);
w.wURWpapsk = getVleFromElmt(f.apcli_wpapsk, 0);
if (!getVleFromElmt(f.apcli_default_key[0], 0))
w.wURKeyid = "";
else
w.wURKeyid = getVleFromElmt(f.apcli_default_key[0], 0);
w.wURKey1 = getVleFromElmt(f.apcli_key1, 0);
w.wURKey1Type = getVleFromElmt(f.apcli_key1type, 0);
w.wURKey2 = getVleFromElmt(f.apcli_key2, 0);
w.wURKey2Type = getVleFromElmt(f.apcli_key2type, 0);
w.wURKey3 = getVleFromElmt(f.apcli_key3, 0);
w.wURKey3Type = getVleFromElmt(f.apcli_key3type, 0);
w.wURKey4 = getVleFromElmt(f.apcli_key4, 0);
w.wURKey4Type = getVleFromElmt(f.apcli_key4type, 0);

document.location.href = "wizard4_security.asp";
//	document.location.href = "wizard3.asp";
}

function onClkBtnCcl()
{
if(confirm(_("wiz cancel confirm"))) {
parent.location = "/home.asp";
}
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="wizTitle">Universal Repeater</h1>
<hr size="1" />
<br />

<form name="frm">
<h2 id="apcliSelect" class="title">Please input the SSID you want to connect to :</h2>
<h2 id="apcliSet" class="title">Universal Repeater Parameters</h2>

<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td id="apcliSSID">SSID</td>
<td><input type=text name="apcli_ssid" size=20 maxlength=32></td>
</tr>
<tr><td id="apcliMAC">MAC Address (Optional)</td>
<td><input type=text name="apcli_bssid" size=20 maxlength=17></td>
</tr>
<tr><td id="apcliMode">Security Mode</td>
<td><select name="apcli_mode" id="apcli_mode" size="1" onchange="SecurityModeSwitch()">
<option value="OPEN">Open</option>
<option value="SHARED">Shared</option>
<option value="WPAPSK">WPA/PSK</option>
<option value="WPA2PSK">WPA2/PSK</option></select>
</td>
</tr>
<tr><td id="apcliEnc">Encryption Type</td>
<td><select name="apcli_enc" id="apcli_enc" size="1"></select></td>
</tr>
<tr id="div_apcli_default_key"><td colspan="2" id="apcliWEPKey">WEP Keys</td>
</tr>
<tr id="div_apcli_key1">
<td><input type="radio" name="apcli_default_key" value="1">
<span id="apcliWEPKey1">Key</span>&nbsp;1 :</td>
<td><input type="password" name="apcli_key1" id="apcli_key1" maxlength="26">
<select id="apcli_key1type" name="apcli_key1type">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr id="div_apcli_key2">
<td><input type="radio" name="apcli_default_key" value="2">
<span id="apcliWEPKey2">Key</span>&nbsp;2 :</td>
<td><input type="password" name="apcli_key2" id="apcli_key2"maxlength="26">
<select id="apcli_key2type" name="apcli_key2type">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr id="div_apcli_key3">
<td><input type="radio" name="apcli_default_key" value="3">
<span id="apcliWEPKey3">Key</span>&nbsp;3 :</td>
<td><input type="password" name="apcli_key3" id="apcli_key3" maxlength="26">
<select id="apcli_key3type" name="apcli_key3type">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr id="div_apcli_key4">
<td><input type="radio" name="apcli_default_key" value="4">
<span id="apcliWEPKey4">Key</span>&nbsp;4 :</td>
<td><input type="password" name="apcli_key4" id="apcli_key4" maxlength="26">
<select id="apcli_key4type" name="apcli_key4type">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr id="div_apcli_wpapsk">
<td id="apcliPass">Pass Phrase</td>
<td><input type=password name="apcli_wpapsk" size=20 maxlength=64></td>
</tr>
</table>
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="right">
<td><input type=button class="btnw" value="Back" id="lBack" onClick="JavaScript:history.back();">&nbsp;&nbsp;
<input type=button class="btnw" value="Next" id="lNext" onClick="onClkNxt()">&nbsp;&nbsp;
<input type=button class="btnw" value="Cancel" id="lCancel" onClick="onClkBtnCcl()"></td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>
