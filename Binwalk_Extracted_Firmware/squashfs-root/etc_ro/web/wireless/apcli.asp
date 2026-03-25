<html>
<head>
<title>Universal Repeater</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");
Butterlate.setTextDomain("internet");

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
var channel  = '<% getWlanChannel(); %>';
var sChannelAuto = '<% getWlanChannel_AutoSelect();%>';

function SecurityModeSwitch()
{
document.getElementById("div_apcli_default_key").style.display = "none";
document.wireless_apcli.apcli_default_key[0].disabled = true;
document.wireless_apcli.apcli_default_key[1].disabled = true;
document.wireless_apcli.apcli_default_key[2].disabled = true;
document.wireless_apcli.apcli_default_key[3].disabled = true;
document.getElementById("div_apcli_key1").style.display = "none";
document.wireless_apcli.apcli_key1.disabled = true;
document.getElementById("div_apcli_key2").style.display = "none";
document.wireless_apcli.apcli_key2.disabled = true;
document.getElementById("div_apcli_key3").style.display = "none";
document.wireless_apcli.apcli_key3.disabled = true;
document.getElementById("div_apcli_key4").style.display = "none";
document.wireless_apcli.apcli_key4.disabled = true;
document.getElementById("div_apcli_wpapsk").style.display = "none";
document.wireless_apcli.apcli_wpapsk.disabled = true;

var mysel = document.wireless_apcli.apcli_enc;
mysel.options.length = 0;
if (document.wireless_apcli.apcli_mode.options.selectedIndex == 0) {
mysel.options[0] = new Option("None", "NONE");
mysel.options[1] = new Option("WEP", "WEP");
document.getElementById("div_apcli_default_key").style.display = "";
document.wireless_apcli.apcli_default_key[0].disabled = false;
document.wireless_apcli.apcli_default_key[1].disabled = false;
document.wireless_apcli.apcli_default_key[2].disabled = false;
document.wireless_apcli.apcli_default_key[3].disabled = false;
document.getElementById("div_apcli_key1").style.display = "";
document.wireless_apcli.apcli_key1.disabled = false;
document.getElementById("div_apcli_key2").style.display = "";
document.wireless_apcli.apcli_key2.disabled = false;
document.getElementById("div_apcli_key3").style.display = "";
document.wireless_apcli.apcli_key3.disabled = false;
document.getElementById("div_apcli_key4").style.display = "";
document.wireless_apcli.apcli_key4.disabled = false;
}
else if (document.wireless_apcli.apcli_mode.options.selectedIndex == 1) {
mysel.options[0] = new Option("WEP", "WEP");
document.getElementById("div_apcli_default_key").style.display = "";
document.wireless_apcli.apcli_default_key[0].disabled = false;
document.wireless_apcli.apcli_default_key[1].disabled = false;
document.wireless_apcli.apcli_default_key[2].disabled = false;
document.wireless_apcli.apcli_default_key[3].disabled = false;
document.getElementById("div_apcli_key1").style.display = "";
document.wireless_apcli.apcli_key1.disabled = false;
document.getElementById("div_apcli_key2").style.display = "";
document.wireless_apcli.apcli_key2.disabled = false;
document.getElementById("div_apcli_key3").style.display = "";
document.wireless_apcli.apcli_key3.disabled = false;
document.getElementById("div_apcli_key4").style.display = "";
document.wireless_apcli.apcli_key4.disabled = false;
}
else if (document.wireless_apcli.apcli_mode.options.selectedIndex == 2) {
mysel.options[0] = new Option("TKIP", "TKIP");
mysel.options[1] = new Option("AES", "AES");
document.getElementById("div_apcli_wpapsk").style.display = "";
document.wireless_apcli.apcli_wpapsk.disabled = false;
}
else if (document.wireless_apcli.apcli_mode.options.selectedIndex == 3) {
mysel.options[0] = new Option("TKIP", "TKIP");
mysel.options[1] = new Option("AES", "AES");
document.getElementById("div_apcli_wpapsk").style.display = "";
document.wireless_apcli.apcli_wpapsk.disabled = false;
}
}

function connectionTypeSwitch()
{
document.getElementById("div_apcliStaticIp").style.display = "none";
document.wireless_apcli.staticIp.disabled = true;
document.getElementById("div_apcliStaticNetmask").style.display = "none";
document.wireless_apcli.staticNetmask.disabled = true;
document.getElementById("div_apcliStaticGateway").style.display = "none";
document.wireless_apcli.staticGateway.disabled = true;
document.getElementById("div_apcliDhcpHost").style.display = "none";
document.wireless_apcli.hostname.disabled = true;

if (document.wireless_apcli.connectionType.options.selectedIndex == 0) { // STATIC
document.getElementById("div_apcliStaticIp").style.display = "";
document.wireless_apcli.staticIp.disabled = false;
document.getElementById("div_apcliStaticNetmask").style.display = "";
document.wireless_apcli.staticNetmask.disabled = false;
document.getElementById("div_apcliStaticGateway").style.display = "";
document.wireless_apcli.staticGateway.disabled = false;
} else if (document.wireless_apcli.connectionType.options.selectedIndex == 1) { // DHCP
document.getElementById("div_apcliDhcpHost").style.display = "";
document.wireless_apcli.hostname.disabled = false;
}
}

function onChg11gChannel()
{
var mChannel = parseInt(document.wireless_apcli.sz11gChannel.value);
var e = document.getElementById("sz11gChText");
e.innerHTML = "";

if(mChannel==0)
e.innerHTML = " (Best Channel: "+sChannelAuto+")";
}

function initTranslation()
{
var e = document.getElementById("apcliTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("apcli title");

e = document.getElementById("apcliSet");
e.innerHTML = _("apcli set");
e = document.getElementById("apcliSSID");
e.innerHTML = _("wireless ssid");
e = document.getElementById("apcliMAC");
e.innerHTML = _("apcli mac");
e = document.getElementById("apcliMode");
e.innerHTML = _("apcli mode");
e = document.getElementById("apcliEnc");
e.innerHTML = _("apcli ecn");
e = document.getElementById("apcliWEPKey");
e.innerHTML = _("apcli wepkey");
for (var i = 1; i <= 4; i++) {
e = eval("document.getElementById('apcliWEPKey"+i+"')");
e.innerHTML =  _("wireless wepkey");
}
e = document.getElementById("apcliPass");
e.innerHTML = _("apcli passphase");
e = document.getElementById("basicFreqGAuto");
e.innerHTML = _("basic frequency auto");
e = document.getElementById("apnote");
e.innerHTML = _("basic note");
e = document.getElementById("apclinote");
e.innerHTML = _("apcli text note");
e = document.getElementById("basicFreqG");
e.innerHTML = _("station channel");

e = document.getElementById("apcliApply");
e.value = _("wireless apply");
e = document.getElementById("apcliCancel");
e.value = _("wireless cancel");

e = document.getElementById("apcliIPConfig");
e.innerHTML = _("apcli ip config");
e = document.getElementById("apcliConnectionType");
e.innerHTML = _("wan connection type");
e = document.getElementById("apcliConnTypeStatic");
e.innerHTML = _("wan connection type static");
e = document.getElementById("apcliConnTypeDhcp");
e.innerHTML = _("wan connection type dhcp");

e = document.getElementById("apcliStaticIp");
e.innerHTML = _("inet ip");
e = document.getElementById("apcliStaticNetmask");
e.innerHTML = _("inet netmask");
e = document.getElementById("apcliStaticGateway");
e.innerHTML = _("inet gateway");

e = document.getElementById("apcliDhcpHost");
e.innerHTML = _("inet devicename");
}

function initValue()
{
initTranslation();

var f = document.wireless_apcli;
var connectionType = "<% getCfgGeneral(1, "wanConnectionMode"); %>";

setVle2Elmt(f.apcli_ssid, ssid, 0);
setVle2Elmt(f.apcli_bssid, bssid, 0);
setVle2Elmt(f.sz11gChannel, channel, 0);
onChg11gChannel();

if (mode == "OPEN")
document.wireless_apcli.apcli_mode.options.selectedIndex = 0;
else if (mode == "SHARED")
document.wireless_apcli.apcli_mode.options.selectedIndex = 1;
else if (mode == "WPAPSK")
document.wireless_apcli.apcli_mode.options.selectedIndex = 2;
else if (mode == "WPA2PSK")
document.wireless_apcli.apcli_mode.options.selectedIndex = 3;

document.wireless_apcli.apcli_wpapsk.value = wpapsk;

if (keyid != "")
document.wireless_apcli.apcli_default_key[parseInt(keyid)-1].checked = true;

document.wireless_apcli.apcli_key1.value = key1;
document.wireless_apcli.apcli_key2.value = key2;
document.wireless_apcli.apcli_key3.value = key3;
document.wireless_apcli.apcli_key4.value = key4;

document.wireless_apcli.apcli_key1type.options.selectedIndex = 1*key1type ? 0 : 1;
document.wireless_apcli.apcli_key2type.options.selectedIndex = 1*key2type ? 0 : 1;
document.wireless_apcli.apcli_key3type.options.selectedIndex = 1*key3type ? 0 : 1;
document.wireless_apcli.apcli_key4type.options.selectedIndex = 1*key4type ? 0 : 1;

SecurityModeSwitch();

setVle2Elmt(f.apcli_enc, enc, 0);

if (connectionType == "STATIC") {
document.wireless_apcli.connectionType.options.selectedIndex = 0;
} else {
document.wireless_apcli.connectionType.options.selectedIndex = 1;
}
connectionTypeSwitch();

}

function CheckHex(str)
{
var len = str.length;

for (var i = 0; i < str.length; i++) {
if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
(str.charAt(i) >= 'A' && str.charAt(i) <= 'F')) {
continue;
}
else
return false;
}
return true;
}

function CheckInjection(str)
{
var len = str.length;
for (var i = 0; i < str.length; i++) {
if ( str.charAt(i) == '\r' || str.charAt(i) == '\n'){
return false;
}else
continue;
}
return true;
}

function CheckWep()
{
var defaultid;

for (var i = 0; i < 4; i++) {
if (document.wireless_apcli.apcli_default_key[i].checked)
defaultid = document.wireless_apcli.apcli_default_key[i].value;
}

if (document.wireless_apcli.apcli_enc.value == "WEP") {
if (eval("document.wireless_apcli.apcli_key"+defaultid).value.length == 0) {
alert('Please input wep key'+defaultid+'!');
eval("document.wireless_apcli.apcli_key"+defaultid).focus();
return false;
}
}

for (var i = 1; i < 5; i++) {
if (eval("document.wireless_apcli.apcli_key"+i+"type").options.selectedIndex == 0) {
var mykey = eval("document.wireless_apcli.apcli_key"+i);
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
} else if (eval("document.wireless_apcli.apcli_key"+i+"type").options.selectedIndex == 1) {
var mykey = eval("document.wireless_apcli.apcli_key"+i);
if (mykey.value.length != 0 && mykey.value.length != 10 && mykey.value.length != 26) {
alert('Please input 10 or 26 characters of wep key'+i);
mykey.focus();
return false;
}
if (!CheckHex(document.wireless_apcli.apcli_key1.value)) {
alert('Invalid Wep key'+i+' format!');
mykey.focus();
return false;
}
}
}

return true;
}

function CheckWpa()
{
if (document.wireless_apcli.apcli_wpapsk.value.length < 8) {
alert("Pass Phrase length should be larger than 8!");
document.wireless_apcli.apcli_wpapsk.focus();
return false;
}
if (!CheckInjection(document.wireless_apcli.apcli_wpapsk.value)) {
alert('Invalid characters in Pass Phrase.');
document.wireless_apcli.apcli_wpapsk.focus();
return false;
}
return true;
}

function CheckValue()
{
if (document.wireless_apcli.apcli_ssid.value == '') {
alert('empty SSID!');
document.wireless_apcli.apcli_ssid.focus();
return false;
} else {
if (document.wireless_apcli.apcli_ssid.value.length > 32) {
alert('SSID acceptable length must be less than 32!');
document.wireless_apcli.apcli_ssid.focus();
return false;
}
}

if (document.wireless_apcli.apcli_bssid.value != '') {
var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
if (!re.test(document.wireless_apcli.apcli_bssid.value)) {
alert("BSSID format error!");
document.wireless_apcli.apcli_bssid.focus();
return false;
}
}

if (document.wireless_apcli.connectionType.options.selectedIndex == 0) { //STATIC
if (!checkIpAddr(document.wireless_apcli.staticIp, false))
return false;
if (!checkIpAddr(document.wireless_apcli.staticNetmask, true))
return false;
if (document.wireless_apcli.staticGateway.value != "")
if (!checkIpAddr(document.wireless_apcli.staticGateway, false))
return false;
} else if (document.wireless_apcli.connectionType.options.selectedIndex == 1) { //DHCP
var re = /^[\w]+$/;
var routername = document.wireless_apcli.hostname.value;
if (!re.test(routername) && routername != "") {
alert(_("msg router name error"));
return false;
}
}

if (document.wireless_apcli.apcli_mode.options.selectedIndex == 0)
return CheckWep();
else if (document.wireless_apcli.apcli_mode.options.selectedIndex == 1)
return CheckWep();
else if (document.wireless_apcli.apcli_mode.options.selectedIndex == 2)
return CheckWpa();
else if (document.wireless_apcli.apcli_mode.options.selectedIndex == 3)
return CheckWpa();
else {
alert('Unknown Security Mode!');
return false;
}
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="apcliTitle">Universal Repeater</h1>
<hr size="1" />
<br />

<form method="post" name="wireless_apcli" action="/goform/wirelessApcli" onSubmit="return CheckValue()">
<h2 id="apcliSet" class="title">Universal Repeater Parameters</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" id="apcliSSID">SSID</td>
<td><input type=text name="apcli_ssid" size=20 maxlength=32></td>
</tr>
<tr>
<td class="head" id="apcliMAC">MAC Address (Optional)</td>
<td><input type=text name="apcli_bssid" size=20 maxlength=17></td>
</tr>
<tr>
<td class="head" id="basicFreqG">Channel :</td>
<td><select name="sz11gChannel" size="1" onchange="onChg11gChannel()">
<option value=0 id="basicFreqGAuto">AutoSelect</option>
<% getWlan11gChannels(); %>
</select>
<span id="sz11gChText">(best channel:)</span>
</td>
</tr>
<tr>
<td class="head" id="apcliMode">Security Mode</td>
<td>
<select name="apcli_mode" id="apcli_mode" size="1" onchange="SecurityModeSwitch()">
<option value="OPEN">Open</option>
<option value="SHARED">Shared</option>
<option value="WPAPSK">WPA/PSK</option>
<option value="WPA2PSK">WPA2/PSK</option>
</select>
</td>
</tr>
<tr>
<td class="head" id="apcliEnc">Encryption Type</td>
<td>
<select name="apcli_enc" id="apcli_enc" size="1">
</select>
</td>
</tr>
<tr id="div_apcli_default_key">
<td colspan="2" id="apcliWEPKey">WEP Keys</td>
</tr>
<tr id="div_apcli_key1">
<td class="head">
<input type="radio" name="apcli_default_key" value="1">
<span id="apcliWEPKey1">Key</span>&nbsp;1 :
</td>
<td>
<input type="password" name="apcli_key1" id="apcli_key1" maxlength="26">
<select id="apcli_key1type" name="apcli_key1type">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr id="div_apcli_key2">
<td class="head">
<input type="radio" name="apcli_default_key" value="2">
<span id="apcliWEPKey2">Key</span>&nbsp;2 :
</td>
<td>
<input type="password" name="apcli_key2" id="apcli_key2" maxlength="26">
<select id="apcli_key2type" name="apcli_key2type">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr id="div_apcli_key3">
<td class="head">
<input type="radio" name="apcli_default_key" value="3">
<span id="apcliWEPKey3">Key</span>&nbsp;3 :
</td>
<td>
<input type="password" name="apcli_key3" id="apcli_key3" maxlength="26">
<select id="apcli_key3type" name="apcli_key3type">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr id="div_apcli_key4">
<td class="head">
<input type="radio" name="apcli_default_key" value="4">
<span id="apcliWEPKey4">Key</span>&nbsp;4 :
</td>
<td>
<input type="password" name="apcli_key4" id="apcli_key4" maxlength="26">
<select id="apcli_key4type" name="apcli_key4type">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr id="div_apcli_wpapsk">
<td class="head" id="apcliPass">Pass Phrase</td>
<td><input type="password" name="apcli_wpapsk" size=20 maxlength=64></td>
</tr>
</table>

<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="center">
<td id="apnote" class="title" size="15">Note : </td>
<td id="apclinote" align="left">If Channel is modified, the Channel setting of AP would also be changed.</td>
</td>
</tr>
</table>
<br />

<!-- ================= Connection Type ================= -->
<h2 id="apcliIPConfig" class="title">Universal Repeater IP Configuration</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config" border="0">
<tr>
<td class="head" id="apcliConnectionType">Connection Type</td>
<td>
<select name="connectionType" size="1" onChange="connectionTypeSwitch();">
<option value="STATIC" id="apcliConnTypeStatic">Static IP</option>
<option value="DHCP" id="apcliConnTypeDhcp">DHCP</option>
</select>
</td>
</tr>
<tr id="div_apcliStaticIp">
<td class="head" id="apcliStaticIp">IP Address</td>
<td><input name="staticIp" maxlength=15 value="<% getCfgGeneral(1, "wan_ipaddr"); %>"></td>
</tr>
<tr id="div_apcliStaticNetmask">
<td class="head" id="apcliStaticNetmask">Subnet Mask</td>
<td><input name="staticNetmask" maxlength=15 value="<% getCfgGeneral(1, "wan_netmask"); %>">
</td>
</tr>
<tr id="div_apcliStaticGateway">
<td class="head" id="apcliStaticGateway">Default Gateway</td>
<td><input name="staticGateway" maxlength=15 value="<% getCfgGeneral(1, "wan_gateway"); %>">
</td>
</tr>
<tr id="div_apcliDhcpHost">
<td class="head" id="apcliDhcpHost">Device Name</td>
<td><input type="text" name="hostname" maxlength="32" value="<% getCfgGeneral(1, "HostName"); %>"></td>
</tr>
</table>

<br />
<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type="submit" class="btnw" value="OK" id="apcliApply">&nbsp;&nbsp;
<input type="reset"  class="btnw" value="Cancel" id="apcliCancel" onClick="window.location.reload()">
</td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>
