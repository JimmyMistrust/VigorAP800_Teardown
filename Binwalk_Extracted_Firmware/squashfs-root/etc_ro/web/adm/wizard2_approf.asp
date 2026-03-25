<!-- Copyright (c), Ralink Technology Corporation All Rights Reserved. -->
<html>
<head>
<title>Ralink Wireless Station Add Profile</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/dhtml.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
Butterlate.setTextDomain("wireless");

var pageArgs = searchArgs(window.location.search);
var ssid_slt = pageArgs['ssid'];
var auth_slt = pageArgs['auth'];
var encryp_slt = pageArgs['encryp'];

var f;
var w = parent.wizard;
var ProfNm = "<% getStaNewProfileName(); %>";
var AllProfNm = "<% getStaAllProfileName(); %>";
var adhoc_channel = "<% getStaAdhocChannel(); %>";
var wireless_mode = '<% getCfgZero(1, "WirelessMode"); %>';


var ch1 = "<option value = 1 >1</option>";
var ch2 = "<option value = 2 >2</option>";
var ch3 = "<option value = 3 >3</option>";
var ch4 = "<option value = 4 >4</option>";
var ch5 = "<option value = 5 >5</option>";
var ch6 = "<option value = 6 >6</option>";
var ch7 = "<option value = 7 >7</option>";
var ch8 = "<option value = 8 >8</option>";
var ch9 = "<option value = 9 >9</option>";
var ch10 = "<option value = 10>10</option>";
var ch11 = "<option value = 11>11</option>";
var ch12 = "<option value = 12>12</option>";
var ch13 = "<option value = 13>13</option>";
var ch14 = "<option value = 14>14</option>";
var ch36 = "<option value = 36 >36</option>";
var ch40 = "<option value = 40 >40</option>";
var ch44 = "<option value = 44 >44</option>";
var ch48 = "<option value = 48 >48</option>";
var ch52 = "<option value = 52 >52</option>";
var ch56 = "<option value = 56 >56</option>";
var ch60 = "<option value = 60 >60</option>";
var ch64 = "<option value = 64 >64</option>";
var ch100 = "<option value = 100>100</option>";
var ch104 = "<option value = 104>104</option>";
var ch108 = "<option value = 108>108</option>";
var ch112 = "<option value = 112>112</option>";
var ch116 = "<option value = 116>116</option>";
var ch120 = "<option value = 120>120</option>";
var ch124 = "<option value = 124>124</option>";
var ch128 = "<option value = 128>128</option>";
var ch132 = "<option value = 132>132</option>";
var ch136 = "<option value = 136>136</option>";
var ch140 = "<option value = 140>140</option>";
var ch149 = "<option value = 149>149</option>";
var ch153 = "<option value = 153>153</option>";
var ch157 = "<option value = 157>157</option>";
var ch161 = "<option value = 161>161</option>";
var ch165 = "<option value = 165>165</option>";

var ch34 = "<option value = 34 >34</option>";
var ch38 = "<option value = 38 >38</option>";
var ch42 = "<option value = 42 >42</option>";
var ch46 = "<option value = 46 >46</option>";

function initTranslation()
{
var e = document.getElementById("wizTitle");
e.innerHTML = _("wiz title") + " >> " + _("wiz 2.4g wireless");

e = document.getElementById("addProf");
e.innerHTML = _("wiz add profile");
e = document.getElementById("addprofSysConf");
e.innerHTML = _("addprof system config");
e = document.getElementById("addprofProfName");
e.innerHTML = _("addprof profile name");
e = document.getElementById("addprofSSID");
e.innerHTML = _("station ssid");
e = document.getElementById("addprofNetType");
e.innerHTML = _("station network type");
e = document.getElementById("addprofAdHoc");
e.innerHTML = _("addprof adhoc");
e = document.getElementById("addprofInfra");
e.innerHTML = _("addprof infrastructure");
e = document.getElementById("addprofPWSave");
e.innerHTML = _("addprof power save");
e = document.getElementById("addprofCAM");
e.innerHTML = _("addprof cam");
e = document.getElementById("addprofPWSaveMode");
e.innerHTML = _("addprof power save");
e = document.getElementById("addprofChannel");
e.innerHTML = _("station channel");
e = document.getElementById("addprofPreambleType");
e.innerHTML = _("addprof preamble type");
e = document.getElementById("addprofPremableAuto");
e.innerHTML = _("wireless auto");
e = document.getElementById("addprofPremableLong");
e.innerHTML = _("wireless long");
e = document.getElementById("addprofRTS");
e.innerHTML = _("adv rts threshold");
e = document.getElementById("addprofRTSUsed");
e.innerHTML = _("station used");
e = document.getElementById("addprofFrag");
e.innerHTML = _("adv fragment threshold");
e = document.getElementById("addprofFragUsed");
e.innerHTML = _("station used");
e = document.getElementById("addprofSecurePolicy");
e.innerHTML = _("addprof secure policy");
e = document.getElementById("addprofSecureMode");
e.innerHTML = _("secure security mode");
e = document.getElementById("addprofAdHocSecure");
e.innerHTML = _("secure security mode");
e = document.getElementById("addprofWEP");
e.innerHTML = _("secure wep");
e = document.getElementById("addprofWEPKeyLength");
e.innerHTML = _("addprof wep key length");
e = document.getElementById("addprofWEPKeyEntryMethod");
e.innerHTML = _("addprof wep key entry method");
e = document.getElementById("addprofHex");
e.innerHTML = _("addprof hex");
e = document.getElementById("addprofASCII");
e.innerHTML = _("addprof ascii");
e = document.getElementById("addprofWEPKey");
e.innerHTML = _("secure wep key");
e = document.getElementById("addprofWEPKey1");
e.innerHTML = _("secure wep key1");
e = document.getElementById("addprofWEPKey2");
e.innerHTML = _("secure wep key2");
e = document.getElementById("addprofWEPKey3");
e.innerHTML = _("secure wep key3");
e = document.getElementById("addprofWEPKey4");
e.innerHTML = _("secure wep key4");
e = document.getElementById("addprofDefaultKey");
e.innerHTML = _("secure wep default key");
e = document.getElementById("addprofDKey1");
e.innerHTML = _("secure wep default key1");
e = document.getElementById("addprofDKey2");
e.innerHTML = _("secure wep default key2");
e = document.getElementById("addprofDKey3");
e.innerHTML = _("secure wep default key3");
e = document.getElementById("addprofDKey4");
e.innerHTML = _("secure wep default key4");
e = document.getElementById("addprofWPA");
e.innerHTML = _("secure wpa");
e = document.getElementById("addprofWPAAlg");
e.innerHTML = _("secure wpa algorithm");
e = document.getElementById("addprofPassPhrase");
e.innerHTML = _("secure wpa pass phrase");

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

hideElmtById(document, "div_power_saving_mode");
hideElmtById(document, "div_channel");
hideElmtById(document, "div_b_premable_type");
f.power_saving_mode.disabled = true;
f.channel.disabled = true;
f.b_premable_type.disabled = true;

if (w.wWirelessmode != "") wireless_mode = w.wWirelessmode;
if (w.wProfName != "") ProfNm = w.wProfName;
if (w.wProfSsid != "" && ssid_slt == "") setVle2Elmt(f.Ssid, w.wProfSsid, 0);
else if (ssid_slt && ssid_slt != "") setVle2Elmt(f.Ssid, ssid_slt, 0);
if (w.wProfNetTyp != "") setVle2Elmt(f.network_type, w.wProfNetTyp, 0);
if (w.wProfPowerMd != "") setVle2Elmt(f.power_saving_mode[0], w.wProfPowerMd, 0);
if (w.wProfChn != "") setVle2Elmt(f.channel, w.wProfChn, 0);
if (w.wProfPremable != "") setVle2Elmt(f.b_premable_type, w.wProfPremable, 0);
if (w.wProfRtsEn != "") setVle2Elmt(f.rts_threshold, w.wProfRtsEn, 0);
if (w.wProfRtsVal != "") setVle2Elmt(f.rts_thresholdvalue, w.wProfRtsVal, 0);
if (w.wProfFragement != "") setVle2Elmt(f.fragment_threshold, w.wProfFragement, 0);
if (w.wProfFragVal != "") setVle2Elmt(f.fragment_thresholdvalue, w.wProfFragVal, 0);
if (auth_slt != "" && encryp_slt!= "") {
if (auth_slt.indexOf("WPA") >=0) {
if (auth_slt.indexOf("WPA2") >=0)
f.security_infra_mode.options.selectedIndex = 3;
else
f.security_infra_mode.options.selectedIndex = 2;
if (encryp_slt.indexOf("TKIP") >=0)
f.cipher[0].checked = true;
else
f.cipher[1].checked = true;
}
else
f.security_infra_mode.options.selectedIndex = 0;
} else {
if (w.wProfSecMode != "") {
if (w.wProfNetTyp == "1")
setVle2Elmt(f.security_infra_mode, w.wProfSecMode, 0);
else
setVle2Elmt(f.security_adhoc_mode, w.wProfSecMode, 0);
}
if (w.wProfWpaCiper != "") setVle2Elmt(f.cipher[0], w.wProfWpaCiper, 0);
else setVle2Elmt(f.cipher[0], 0, 0);
}
if (w.wProfWepKeyLen != "") setVle2Elmt(f.wep_key_length, w.wProfWepKeyLen, 0);
if (w.wProfWepKeyMth != "") setVle2Elmt(f.wep_key_entry_method, w.wProfWepKeyMth, 0);
if (w.wProfWepKey1 != "") setVle2Elmt(f.wep_key_1, w.wProfWepKey1, 0);
if (w.wProfWepKey2 != "") setVle2Elmt(f.wep_key_2, w.wProfWepKey2, 0);
if (w.wProfWepKey3 != "") setVle2Elmt(f.wep_key_3, w.wProfWepKey3, 0);
if (w.wProfWepKey4 != "") setVle2Elmt(f.wep_key_4, w.wProfWepKey4, 0);
if (w.wProfDefKey != "") setVle2Elmt(f.wep_default_key, w.wProfDefKey, 0);

if (w.wProfWpaPass != "") setVle2Elmt(f.passphrase, w.wProfWpaPass, 0);

f.profile_name.value = ProfNm;

networkTypeChange();
RTSThresholdChange();
FragmentThresholdChange();
}

function getChannel()
{
var bg_channel = adhoc_channel & 0xFF;
var a_channel = (adhoc_channel >> 8) & 0xFF;

switch (wireless_mode)
{
case 0: // B/G mixed
case 1: // B only
getBGChannel(bg_channel);
break;
case 2: // A only
getAChannel(a_channel);
break;
case 3: // A/B/G mixed
default:
getBGChannel(bg_channel);
getAChannel(a_channel);
break;
}
}

function getBGChannel( channel )
{
switch (channel)
{
case 0:
document.write(ch1+ch2+ch3+ch4+ch5+ch6+ch7+ch8+ch9+ch10+ch11);
break;
case 1:
document.write(ch1+ch2+ch3+ch4+ch5+ch6+ch7+ch8+ch9+ch10+ch11+ch12+ch13);
break;
case 2:
document.write(ch10+ch11);
break;
case 3:
document.write(ch10+ch11+ch12+ch13);
break;
case 4:
document.write(ch14);
break;
case 5:
document.write(ch1+ch2+ch3+ch4+ch5+ch6+ch7+ch8+ch9+ch10+ch11+ch12+ch13+ch14);
break;
case 6:
document.write(ch3+ch4+ch5+ch6+ch7+ch8+ch9);
break;
case 7:
document.write(ch5+ch6+ch7+ch8+ch9+ch10+ch11+ch12+ch13);
break;
default:
break;
}
}

function getAChannel( channel )
{
switch (channel)
{
case 0:
document.write(ch36+ch40+ch44+ch48+ch52+ch56+ch60+ch64+ch149+ch153+ch157+ch161+ch165);
break;
case 1:
document.write(ch36+ch40+ch44+ch48+ch52+ch56+ch60+ch64+ch100+ch104+ch108+ch112+ch116+ch120+ch124+ch128+ch132+ch136+ch140);
break;
case 2:
document.write(ch36+ch40+ch44+ch48+ch52+ch56+ch60+ch64);
break;
case 3:
document.write(ch52+ch56+ch60+ch64+ch149+ch153+ch157+ch161);
break;
case 4:
document.write(ch149+ch153+ch157+ch161+ch165);
break;
case 5:
document.write(ch149+ch153+ch157+ch161);
break;
case 6:
document.write(ch36+ch40+ch44+ch48);
break;
case 7:
document.write(ch36+ch40+ch44+ch48+ch52+ch56+ch60+ch64+ch100+ch104+ch108+ch112+ch116+ch120+ch124+ch128+ch132+ch136+ch140+ch149+ch153+ch157+ch161+ch165);
break;
case 8:
document.write(ch52+ch56+ch60+ch64);
break;
case 9:
document.write(ch34+ch38+ch42+ch46);
break;
case 10:
document.write(ch34+ch36+ch38+ch40+ch42+ch44+ch46+ch48+ch52+ch56+ch60+ch64);
break;
default:
break;
}
}

function networkTypeChange()
{
hideElmtById(document, "div_b_premable_type");
hideElmtById(document, "div_power_saving_mode");
hideElmtById(document, "div_channel");
hideElmtById(document, "div_security_infra_mode");
hideElmtById(document, "div_security_adhoc_mode");

f.b_premable_type.disabled = true;
f.power_saving_mode.disabled = true;
f.channel.disabled = true;
f.security_infra_mode.disabled = true;
f.security_adhoc_mode.disabled = true;

var nmode = 1*f.network_type.options.selectedIndex;
if (nmode==1) {
showElmtById(document, "div_power_saving_mode");
showElmtById(document, "div_security_infra_mode");
f.power_saving_mode.disabled = false;
f.security_infra_mode.disabled = false;
} else {
showElmtById(document, "div_b_premable_type");
showElmtById(document, "div_channel");
showElmtById(document, "div_security_adhoc_mode");
f.b_premable_type.disabled = false;
f.channel.disabled = false;
f.security_adhoc_mode.disabled = false;
}
securityMode();
}


function RTSThresholdChange()
{
if( f.rts_threshold.checked )
f.rts_thresholdvalue.disabled = false;
else
f.rts_thresholdvalue.disabled = true;
}

function FragmentThresholdChange()
{
if( f.fragment_threshold.checked )
f.fragment_thresholdvalue.disabled = false;
else
f.fragment_thresholdvalue.disabled = true;
}

function checkData()
{
var securitymode;
var profilename = f.profile_name.value;
var ssid = f.Ssid.value;

if (f.network_type.value == 1) //infra
securitymode = f.security_infra_mode.value;
else
securitymode = f.security_adhoc_mode.value;

if (profilename.length <=0) {
alert("Pleaes input the Profile Name!");
return false;
} else if (ssid.length <= 0) {
alert("Pleaes input the SSID!");
return false;
} else if (securitymode  == 0 || securitymode  == 1) {
return check_Wep(securitymode);
} else if (securitymode  == 4 ||securitymode == 7 || securitymode == 5) {
var keyvalue = f.passphrase.value;
if (keyvalue.length == 0) {
alert("Please input wpapsk key!");
return false;
}
if (keyvalue.length < 8) {
alert("Please input at least 8 character of wpapsk key !");
return false;
}
} else {
if (AllProfNm.indexOf(profilename) >= 0 && (AllProfNm.length == profilename.length)) {
alert("Duplicate Profile Name!");
return false;
}
}
return true;
}


function wep_switch_key_length()
{
f.wep_key_1.value = "";
f.wep_key_2.value = "";
f.wep_key_3.value = "";
f.wep_key_4.value = "";

if (f.wep_key_length.options.selectedIndex == 0) {//KEY length 64 bits -->
if (f.wep_key_entry_method.options.selectedIndex == 0) {//HEX -->
f.wep_key_1.maxLength = 10;
f.wep_key_2.maxLength = 10;
f.wep_key_3.maxLength = 10;
f.wep_key_4.maxLength = 10;
} else {// ASCII -->
f.wep_key_1.maxLength = 5;
f.wep_key_2.maxLength = 5;
f.wep_key_3.maxLength = 5;
f.wep_key_4.maxLength = 5;
}
} else {// KEY length 128 bits -->
if (f.wep_key_entry_method.options.selectedIndex == 0) {// HEX -->
f.wep_key_1.maxLength = 26;
f.wep_key_2.maxLength = 26;
f.wep_key_3.maxLength = 26;
f.wep_key_4.maxLength = 26;
} else {// ASCII -->
f.wep_key_1.maxLength = 13;
f.wep_key_2.maxLength = 13;
f.wep_key_3.maxLength = 13;
f.wep_key_4.maxLength = 13;
}
}
}

function securityMode()
{
var security_mode;
hideElmtById(document, "div_security_infra_mode");
hideElmtById(document, "div_security_adhoc_mode");

f.security_infra_mode.disabled = true;
f.security_adhoc_mode.disabled = true;

hideWep();
hideElmtById(document, "div_wpa");
hideElmtById(document, "div_wpa_algorithms");
hideElmtById(document, "wpa_passphrase");
f.cipher[0].disabled = true;
f.cipher[1].disabled = true;
f.passphrase.disabled = true;

if (getVleFromElmt(f.network_type, 0)== 1) { //infra
security_mode = f.security_infra_mode.value;
showElmtById(document, "div_security_infra_mode");
f.security_infra_mode.disabled = false;
} else {
security_mode = f.security_adhoc_mode.value;
showElmtById(document, "div_security_adhoc_mode");
f.security_adhoc_mode.disabled = false;
}

if (security_mode == 0 || security_mode == 1) {
showWep();
} else if (security_mode == 4 || security_mode == 7 || security_mode == 5) {
showElmtById(document, "div_wpa");
showElmtById(document, "div_wpa_algorithms");
showElmtById(document, "wpa_passphrase");

f.cipher[0].disabled = false;
f.cipher[1].disabled = false;;
f.passphrase.disabled = false;
}
}

function hideWep()
{
hideElmtById(document, "div_wep");
//f.wep_auth_type.disabled = true;
f.wep_key_length.disabled = true;
f.wep_key_entry_method.disabled = true;
f.wep_key_1.disabled = true;
f.wep_key_2.disabled = true;
f.wep_key_3.disabled = true;
f.wep_key_4.disabled = true;
f.wep_default_key.disabled = true;
}

function showWep()
{
showElmtById(document, "div_wep");

//f.wep_auth_type.disabled = false;
f.wep_key_length.disabled = false;
f.wep_key_entry_method.disabled = false;
f.wep_key_1.disabled = false;
f.wep_key_2.disabled = false;
f.wep_key_3.disabled = false;
f.wep_key_4.disabled = false;
f.wep_default_key.disabled = false;

if (f.wep_key_length.options.selectedIndex == 0) {// KEY length 64 bits -->
if (f.wep_key_entry_method.options.selectedIndex == 0) {// HEX -->
f.wep_key_1.maxLength = 10;
f.wep_key_2.maxLength = 10;
f.wep_key_3.maxLength = 10;
f.wep_key_4.maxLength = 10;
} else {//ASCII -->
f.wep_key_1.maxLength = 5;
f.wep_key_2.maxLength = 5;
f.wep_key_3.maxLength = 5;
f.wep_key_4.maxLength = 5;
}
} else {// KEY length 128 bits -->
if (f.wep_key_entry_method.options.selectedIndex == 0) {// HEX -->
f.wep_key_1.maxLength = 26;
f.wep_key_2.maxLength = 26;
f.wep_key_3.maxLength = 26;
f.wep_key_4.maxLength = 26;
} else {// ASCII -->
f.wep_key_1.maxLength = 13;
f.wep_key_2.maxLength = 13;
f.wep_key_3.maxLength = 13;
f.wep_key_4.maxLength = 13;
}
}
}

function check_Wep(securitymode)
{
var defaultid = f.wep_default_key.value;
var keylen = 0 ;
var keyvalue = eval("f.wep_key_"+defaultid).value;

if (f.wep_key_length.options.selectedIndex == 0) {// KEY length 64 bits -->
if (f.wep_key_entry_method.options.selectedIndex == 0) {// HEX -->
keylen = 10;
} else 	{// ASCII -->
keylen = 5;
}
} else {//KEY length 128 bits -->
if (f.wep_key_entry_method.options.selectedIndex == 0) {// HEX -->
keylen = 26;
} else {//ASCII -->
keylen = 13;
}
}

if (keyvalue.length == 0 && ( securitymode == 1 )) {// shared wep  || md5
alert('Please input wep key'+defaultid+' !');
return false;
}

if (keyvalue.length != 0) {
if (keyvalue.length != keylen) {
alert('Please input '+keylen+' character of wep key !');
return false;
}
}
return true;
}

function onClkNxt()
{
if (checkData() == true) {
w.wProfName = getVleFromElmt(f.profile_name, 0);;
w.wProfSsid = getVleFromElmt(f.Ssid, 0);
w.wProfNetTyp = getVleFromElmt(f.network_type, 0);
w.wProfPowerMd = getVleFromElmt(f.power_saving_mode[0], 0);
w.wProfChn = getVleFromElmt(f.channel, 0);
w.wProfPremable = getVleFromElmt(f.b_premable_type, 0);
w.wProfRtsEn = getVleFromElmt(f.rts_threshold, 0);
w.wProfRtsVal = getVleFromElmt(f.rts_thresholdvalue, 0);
w.wProfFragement = getVleFromElmt(f.fragment_threshold, 0);
w.wProfFragVal = getVleFromElmt(f.fragment_thresholdvalue, 0);
if (w.wProfNetTyp == "1")
w.wProfSecMode = getVleFromElmt(f.security_infra_mode, 0);
else
w.wProfSecMode = getVleFromElmt(f.security_adhoc_mode, 0);
w.wProfWepKeyLen = getVleFromElmt(f.wep_key_length, 0);
w.wProfWepKeyMth = getVleFromElmt(f.wep_key_entry_method, 0);
w.wProfWepKey1 = getVleFromElmt(f.wep_key_1, 0);
w.wProfWepKey2 = getVleFromElmt(f.wep_key_2, 0);
w.wProfWepKey3 = getVleFromElmt(f.wep_key_3, 0);
w.wProfWepKey4 = getVleFromElmt(f.wep_key_4, 0);
w.wProfDefKey = getVleFromElmt(f.wep_default_key, 0);
w.wProfWpaCiper = getVleFromElmt(f.cipher[0], 0);
w.wProfWpaPass = getVleFromElmt(f.passphrase, 0);

document.location.href = "wizard3.asp";
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
<h2 id="addProf" class="title">Setup Profile to connect to AP :</h2>
<table width="100%" border="1" cellspacing="1" cellpadding="3" vspace="2" hspace="2">
<tr><td class="title" colspan="2" id="addprofSysConf">System Configuration</td>
</tr>
<tr><td class="head" id="addprofProfName">Profile Name</td>
<td><input type=text name="profile_name" maxlength=32></td>
</tr>
<tr><td class="head" id="addprofSSID">SSID</td>
<td><input type=text name="Ssid" maxlength=32></td>
</tr>
<tr><td class="head" id="addprofNetType">Network Type</td>
<td><select name="network_type" size="1" onChange="networkTypeChange()">
<option value=0 id="addprofAdHoc">802.11 Ad Hoc</option>
<option value=1 id="addprofInfra" selected>Infrastructure</option></select>
</td>
</tr>
<tr id="div_power_saving_mode">
<td class="head" id="addprofPWSave">Power Saving Mode</td>
<td><input type=radio name="power_saving_mode" value="0" checked><font id="addprofCAM">CAM (Constantly Awake Mode)</font><br>
<input type=radio name="power_saving_mode" value="1"><font id="addprofPWSaveMode">Power Saving Mode</font>
</td>
</tr>
<tr id="div_channel">
<td class="head" id="addprofChannel">Channel</td>
<td><select name="channel" size="1">
<script>getChannel();</script></select>
</td>
</tr>
<tr id="div_b_premable_type">
<td class="head" id="addprofPreambleType">11B Premable Type</td>
<td><select name="b_premable_type" size="1">
<option value=0 id="addprofPremableAuto" selected>Auto</option>
<option value=1 id="addprofPremableLong">Long</option></select>
</td>
</tr>
<tr><td class="head" id="addprofRTS">RTS Threshold</td>
<td><input type=checkbox name=rts_threshold onClick="RTSThresholdChange()"><font id="addprofRTSUsed">Used</font>&nbsp;&nbsp;
<input type=text name=rts_thresholdvalue value=2347>
</td>
</tr>
<tr><td class="head" id="addprofFrag">Fragement Threshold </td>
<td><input type=checkbox name=fragment_threshold onClick="FragmentThresholdChange()"><font id="addprofFragUsed">Used</font>&nbsp;&nbsp;
<input type=text name=fragment_thresholdvalue value=2346>
</td>
</tr>
</table>
<hr size="1" />

<table width="100%" border="1" cellspacing="1" cellpadding="3" vspace="2" hspace="2">
<tr><td class="title" colspan="2" id="addprofSecurePolicy">Security Policy</td>
</tr>
<tr id="div_security_infra_mode">
<td class="head" id="addprofSecureMode">Security Mode</td>
<td><select name="security_infra_mode" id="security_infra_mode" size="1" onChange="securityMode()">
<option value=0>OPEN</option>
<option value=1>SHARED</option>
<option value=4>WPA-Personal</option>
<option value=7>WPA2-Personal</option></select>
</td>
</tr>
<tr id="div_security_adhoc_mode">
<td class="head" id="addprofAdHocSecure">Security Mode</td>
<td><select name="security_adhoc_mode" id="security_adhoc_mode" size="1" onChange="securityMode()">
<option value=0 id="addprofAdHocOpen" selected>OPEN</option>
<option value=1 id="addprofAdHocShared">SHARED</option>
<option value=5 id="addprofAdHocWPA-None">WPA-NONE</option></select>
</td>
</tr>
</table>
<br />

<table width="100%" border="1" cellspacing="1" cellpadding="3" vspace="2" hspace="2" id="div_wep">
<tr><td class="title" colspan="3" id="addprofWEP">Wire Equivalence Protection (WEP)</td>
</tr>
<tr><td class="head" colspan="2" id="addprofWEPKeyLength">WEP Key Length</td>
<td><select name="wep_key_length" size="1" onChange="wep_switch_key_length()">
<option value=0 selected>64 bit (10 hex digits / 5 ascii keys)</option>
<option value=1>128 bit (26 hex digits / 13 ascii keys)</option></select>
</td>
</tr>
<tr><td class="head" colspan="2" id="addprofWEPKeyEntryMethod">WEP Key Entry Method</td>
<td><select name="wep_key_entry_method" size="1" onChange="wep_switch_key_length()">
<option value=0 id="addprofHex" selected >Hexadecimal</option>
<option value=1 id="addprofASCII">Ascii Text</option></select>
</td>
</tr>
<tr><td class="head1" rowspan="4" id="addprofWEPKey">WEP Keys</td>
<td class="head2" id="addprofWEPKey1">WEP Key 1 :</td>
<td><input type=password name=wep_key_1 maxlength=26 value=""></td>
</tr>
<tr><td class="head2" id="addprofWEPKey2">WEP Key 2 : </td>
<td><input type=password name=wep_key_2 maxlength=26 value=""></td>
</tr>
<tr><td class="head2" id="addprofWEPKey3">WEP Key 3 : </td>
<td><input type=password name=wep_key_3 maxlength=26 value=""></td>
</tr>
<tr><td class="head2" id="addprofWEPKey4">WEP Key 4 : </td>
<td><input type=password name=wep_key_4 maxlength=26 value=""></td>
</tr>
<tr><td class="head" colspan="2" id="addprofDefaultKey">Default Key</td>
<td><select name="wep_default_key" size="1">
<option value=1 selected id="addprofDKey1">Key 1</option>
<option value=2 id="addprofDKey2">Key 2</option>
<option value=3 id="addprofDKey3">Key 3</option>
<option value=4 id="addprofDKey4">Key 4</option></select>
</td>
</tr>
</table>

<table width="100%" border="1" cellspacing="1" cellpadding="3" vspace="2" hspace="2" id="div_wpa">
<tr><td class="title" colspan="2" id="addprofWPA">WPA</td>
</tr>
<tr id="div_wpa_algorithms">
<td class="head" id="addprofWPAAlg">WPA Algorithms</td>
<td><input type=radio name="cipher" id="cipher" value="0">TKIP &nbsp;
<input type=radio name="cipher" id="cipher" value="1">AES &nbsp;
</td>
</tr>
<tr id="wpa_passphrase">
<td class="head" id="addprofPassPhrase">Pass Phrase</td>
<td><input type=password name=passphrase size=28 maxlength=64 value=""></td>
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
