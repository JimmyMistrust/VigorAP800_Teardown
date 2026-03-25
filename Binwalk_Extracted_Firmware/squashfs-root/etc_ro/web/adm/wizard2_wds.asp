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
</head>

<body onload="initAll()">
<table class="body">
<tr><td>
<h1 id="wizTitle">2.4G Wireless</h1>
<hr size="1" />
<br />

<form name="frm">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr><td class="title" id="note">Note :</td>
<td id="note_wds">Enter the configuration of APs which AP 800 want to connect.</td>
</tr>
<tr><td></td>
<td id="note_wdsfull">Remote AP should always set LAN-A MAC address to connect AP800 WDS.</td>
</tr>
<tr><td colspan="2">

<table width="100%" cellspacing="0" cellpadding="2" class="config">
<tr><td colspan="2"><table border="0">
<tr><td width="20%" id="wdsPhyMode" class="title">Phy Mode:</td>
<td width="80%">HTMIX<input type="hidden" id="wds_phy_mode" name="wds_phy_mode" value="HTMIX;HTMIX;HTMIX;HTMIX"></td>
</tr></table></td></tr>
<tr><td colspan="2"><hr size="1" /></td></tr>
<tr><td valign="top">

<table width="340" cellspacing="0" cellpadding="2">
<tr><td class="title" nowrap>
<span id="wdsSingle" style="display:none">Security:</span>
<span id="wdsMulti" style="display:none">1.&nbsp;
<span id="wdssubnet0">Subnet</span>
<select id="wds_vlan0" name="wds_vlan0" size="1" style="margin-right: 5px">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
<span id="wdsSecurity0">Security:</span></span>
</td>
</tr>
<tr><td style="text-indent: 10px;">
<input type="radio" name="wds_encryp_type0" value="NONE" onclick="WdsSecurityOnChange(0)"><span id="wdsDis0">Disabled</span>&nbsp;
<input type="radio" name="wds_encryp_type0" value="WEP" onclick="WdsSecurityOnChange(0)">WEP&nbsp;
<input type="radio" name="wds_encryp_type0" value="TKIP" onclick="WdsSecurityOnChange(0)">TKIP&nbsp;
<input type="radio" name="wds_encryp_type0" value="AES" onclick="WdsSecurityOnChange(0)">AES&nbsp;
</td>
</tr>
<tr><td style="text-indent: 15px;">
<span id="wdsKey0">Key</span>&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="text" maxlength="64" size="28" name="wds_encryp_key0">
</td>
</tr>
<tr><td class="title" id="wdsPeerMac0">Peer Mac Address:</td></tr>
<tr><td style="text-indent: 5px;">&nbsp;
<input type="text" maxlength="2" name="peer1MAC1" onkeypress="onTxtMac(1, 0)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer1MAC2" onkeypress="onTxtMac(1, 1)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer1MAC3" onkeypress="onTxtMac(1, 2)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer1MAC4" onkeypress="onTxtMac(1, 3)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer1MAC5" onkeypress="onTxtMac(1, 4)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer1MAC6" onkeypress="onTxtMac(1, 5)" class="hex" size="2">
</td>
</tr>
</table>

<table width="340" id="wds_full_0" style="display:none">
<tr><td><hr size="1" /></td></tr>
<tr><td class="title">2.&nbsp;
<span id="wdssubnet1">Subnet</span>
<select id="wds_vlan1" name="wds_vlan1" size="1" style="margin-right: 5px">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
<span id="wdsSecurity1">Security:</span>
</td>
</tr>
<tr><td style="text-indent: 10px;">
<input type="radio" name="wds_encryp_type1" value="NONE" onclick="WdsSecurityOnChange(1)"><span id="wdsDis1">Disabled</span>&nbsp;
<input type="radio" name="wds_encryp_type1" value="WEP" onclick="WdsSecurityOnChange(1)">WEP&nbsp;
<input type="radio" name="wds_encryp_type1" value="TKIP" onclick="WdsSecurityOnChange(1)">TKIP&nbsp;
<input type="radio" name="wds_encryp_type1" value="AES" onclick="WdsSecurityOnChange(1)">AES&nbsp;
</td>
</tr>
<tr><td style="text-indent: 15px;">
<span id="wdsKey1">Key</span>&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="text" maxlength="64" size="28" name="wds_encryp_key1" />
</td>
</tr>
<tr><td class="title" id="wdsPeerMac1">Peer Mac Address:</td></tr>
<tr><td style="text-indent: 5px;">&nbsp;
<input type="text" maxlength="2" name="peer2MAC1" onkeypress="onTxtMac(2, 0)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer2MAC2" onkeypress="onTxtMac(2, 1)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer2MAC3" onkeypress="onTxtMac(2, 2)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer2MAC4" onkeypress="onTxtMac(2, 3)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer2MAC5" onkeypress="onTxtMac(2, 4)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer2MAC6" onkeypress="onTxtMac(2, 5)" class="hex" size="2">
</td>
</tr>
</table>

</td><td valign="top" id="wds_full_1" style="display:none;border-left: 1px solid #808080;">

<table width="340" cellspacing="0" cellpadding="2">
<tr><td class="title">3.&nbsp;
<span id="wdssubnet2">Subnet</span>
<select id="wds_vlan2" name="wds_vlan2" size="1" style="margin-right: 5px">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
<span id="wdsSecurity2">Security:</span>
</td>
</tr>
<tr><td style="text-indent: 10px;">
<input type="radio" name="wds_encryp_type2" value="NONE" onclick="WdsSecurityOnChange(2)"><span id="wdsDis2">Disabled</span>&nbsp;
<input type="radio" name="wds_encryp_type2" value="WEP" onclick="WdsSecurityOnChange(2)">WEP&nbsp;
<input type="radio" name="wds_encryp_type2" value="TKIP" onclick="WdsSecurityOnChange(2)">TKIP&nbsp;
<input type="radio" name="wds_encryp_type2" value="AES" onclick="WdsSecurityOnChange(2)">AES&nbsp;
</td>
</tr>
<tr><td style="text-indent: 15px;">
<span id="wdsKey2">Key</span>&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="text" maxlength="64" size="28" name="wds_encryp_key2" />
</td>
</tr>
<tr><td class="title" id="wdsPeerMac2">Peer Mac Address:</td></tr>
<tr><td style="text-indent: 5px;">&nbsp;
<input type="text" maxlength="2" name="peer3MAC1" onkeypress="onTxtMac(3, 0)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer3MAC2" onkeypress="onTxtMac(3, 1)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer3MAC3" onkeypress="onTxtMac(3, 2)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer3MAC4" onkeypress="onTxtMac(3, 3)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer3MAC5" onkeypress="onTxtMac(3, 4)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer3MAC6" onkeypress="onTxtMac(3, 5)" class="hex" size="2">
</td>
</tr>
<tr><td><hr size="1" /></td></tr>
<tr><td class="title">4.&nbsp;
<span id="wdssubnet3">Subnet</span>
<select id="wds_vlan3" name="wds_vlan3" size="1" style="margin-right: 5px">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
<span id="wdsSecurity3">Security:</span>
</td>
</tr>
<tr><td style="text-indent: 10px;">
<input type="radio" name="wds_encryp_type3" value="NONE" onclick="WdsSecurityOnChange(3)"><span id="wdsDis3">Disabled</span>&nbsp;
<input type="radio" name="wds_encryp_type3" value="WEP" onclick="WdsSecurityOnChange(3)">WEP&nbsp;
<input type="radio" name="wds_encryp_type3" value="TKIP" onclick="WdsSecurityOnChange(3)">TKIP&nbsp;
<input type="radio" name="wds_encryp_type3" value="AES" onclick="WdsSecurityOnChange(3)">AES&nbsp;
</td>
</tr>
<tr><td style="text-indent: 15px;">
<span id="wdsKey3">Key</span>&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="text" maxlength="64" size="28" name="wds_encryp_key3" />
</td>
</tr>
<tr><td class="title" id="wdsPeerMac3">Peer Mac Address:</td></tr>
<tr><td style="text-indent: 5px;">&nbsp;
<input type="text" maxlength="2" name="peer4MAC1" onkeypress="onTxtMac(4, 0)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer4MAC2" onkeypress="onTxtMac(4, 1)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer4MAC3" onkeypress="onTxtMac(4, 2)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer4MAC4" onkeypress="onTxtMac(4, 3)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer4MAC5" onkeypress="onTxtMac(4, 4)" class="hex" size="2">&nbsp;:
<input type="text" maxlength="2" name="peer4MAC6" onkeypress="onTxtMac(4, 5)" class="hex" size="2">
</td>
</tr>
</table>

</td>
</tr>
</table>

</td></tr>
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
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

var f = document.frm;
var w = parent.wizard;
var mwds = 4;

var wdsList  = '<% getCfgGeneral(1, "WdsList"); %>';
var wdsPhyMode  = '<% getCfgZero(1, "WdsPhyMode"); %>';
var wdsEncrypType  = '<% getCfgGeneral(1, "WdsEncrypType"); %>';
var wdsVlan0  = '<% getCfgGeneral(1, "WdsVlan0"); %>';
var wdsVlan1  = '<% getCfgGeneral(1, "WdsVlan1"); %>';
var wdsVlan2  = '<% getCfgGeneral(1, "WdsVlan2"); %>';
var wdsVlan3  = '<% getCfgGeneral(1, "WdsVlan3"); %>';
var wdsEncrypKey0  = '<% getCfgGeneral(1, "Wds0Key"); %>';
var wdsEncrypKey1  = '<% getCfgGeneral(1, "Wds1Key"); %>';
var wdsEncrypKey2  = '<% getCfgGeneral(1, "Wds2Key"); %>';
var wdsEncrypKey3  = '<% getCfgGeneral(1, "Wds3Key"); %>';

var ArryEncType = [f.wds_encryp_type0[0], f.wds_encryp_type1[0], f.wds_encryp_type2[0], f.wds_encryp_type3[0]];
var ArryWdsVlan = [f.wds_vlan0, f.wds_vlan1, f.wds_vlan2, f.wds_vlan3];
var ArryWdsKey = [f.wds_encryp_key0, f.wds_encryp_key1, f.wds_encryp_key2, f.wds_encryp_key3];

function initAll()
{
initTranslation();

if (w.wOpmode != 4) {
showElmtById(document, "wds_full_0");
showElmtById(document, "wds_full_1");
showElmtById(document, "wdsMulti");
}else {
showElmtById(document, "wdsSingle");
}
if (w.wOpmode != 6) {
hideElmtById(document, "note_wdsfull");
for (var i=0; i<4; i++) {
hideElmtById(document, "wds_vlan"+i);
hideElmtById(document, "wdssubnet"+i);
}
}
if(w.wSsidSubEn != 1) {
f.wds_vlan0.disabled = true;
f.wds_vlan1.disabled = true;
f.wds_vlan2.disabled = true;
f.wds_vlan3.disabled = true;
}

if (w.wWdsPhyMode != "") wdsPhyMode = w.wWdsPhyMode;
if (w.wWdsEncryType != "") wdsEncrypType = w.wWdsEncryType;

if (wdsEncrypType != "") {
values = wdsEncrypType.split(";");
for (i = 0; i < mwds; i++) {
idx = getIdxbyName(f, "wds_encryp_type"+i);
if (values[i])
setVle2Elmt(ArryEncType[i], values[i].toUpperCase(), 0);
else
setVle2Elmt(ArryEncType[i], "NONE", 0);
}
}

if (w.wOpmode == 5 || w.wOpmode == 6) {
for (i = 0; i < 4; i++) {
if (eval("w.wWdsVlan"+i) != "") eval("wdsVlan"+i) = eval("w.wWdsVlan"+i);
if (eval("w.wWdsKey"+i) != "") eval("wdsEncrypKey"+i) = eval("w.wWdsKey"+i);
if (eval("wdsVlan"+i) != "")
setVle2Elmt(ArryWdsVlan[i], eval("wdsVlan"+i), 0);
setVle2Elmt(ArryWdsKey[i], eval("wdsEncrypKey"+i), 0);
}

if (w.wWdsMacList != "") wdsList = w.wWdsMacList;
if (wdsList != "") {
wdslistArray = wdsList.split(";");
for (i = 0; i < wdslistArray.length; i++) {
if (wdslistArray[i] == '')
continue;
wdspeerArray = wdslistArray[i].split(":");
eval("f.peer"+(i+1)+"MAC1").value = wdspeerArray[0];
eval("f.peer"+(i+1)+"MAC2").value = wdspeerArray[1];
eval("f.peer"+(i+1)+"MAC3").value = wdspeerArray[2];
eval("f.peer"+(i+1)+"MAC4").value = wdspeerArray[3];
eval("f.peer"+(i+1)+"MAC5").value = wdspeerArray[4];
eval("f.peer"+(i+1)+"MAC6").value = wdspeerArray[5];
}
}
} else if (w.wOpmode == 4) {
if (w.wWdsKey0 != "") wdsEncrypKey0 = w.wWdsKey0;
setVle2Elmt(ArryWdsKey[0], wdsEncrypKey0, 0);

if (w.wWdsMacList != "") wdsList = w.wWdsMacList;
if (wdsList != "") {
wdslistArray = wdsList.split(";");
if (wdslistArray[0] != '') {
wdspeerArray = wdslistArray[0].split(":");
f.peer1MAC1.value = wdspeerArray[0];
f.peer1MAC2.value = wdspeerArray[1];
f.peer1MAC3.value = wdspeerArray[2];
f.peer1MAC4.value = wdspeerArray[3];
f.peer1MAC5.value = wdspeerArray[4];
f.peer1MAC6.value = wdspeerArray[5];
}
}
}
for (var i=0; i<4; i++)
WdsSecurityOnChange(i);
}

function onTxtMac(i, idx)
{
if (idx==0) setTimeout( "adjHex(f.peer"+i+"MAC1)", 10 );
if (idx==1) setTimeout( "adjHex(f.peer"+i+"MAC2)", 10 );
if (idx==2) setTimeout( "adjHex(f.peer"+i+"MAC3)", 10 );
if (idx==3) setTimeout( "adjHex(f.peer"+i+"MAC4)", 10 );
if (idx==4) setTimeout( "adjHex(f.peer"+i+"MAC5)", 10 );
if (idx==5) setTimeout( "adjHex(f.peer"+i+"MAC6, 1)", 10 );
}

function initTranslation()
{
var e = document.getElementById("wizTitle");
e.innerHTML = _("wiz title") + " >> " + _("wiz 2.4g wireless");

e = document.getElementById("note");
e.innerHTML = _("wiz wireless wds note");
e = document.getElementById("note_wds");
e.innerHTML = _("wiz wireless wds note1");
e = document.getElementById("note_wdsfull");
e.innerHTML = _("wiz wireless wds note2");
e = document.getElementById("wdsPhyMode");
e.innerHTML = _("wiz wireless phy mode");
for (var i=0; i<4; i++) {
e = document.getElementById("wdssubnet"+i);
e.innerHTML = _("wiz wireless subnet");
e = document.getElementById("wdsSecurity"+i);
e.innerHTML = _("wiz wireless security");
e = document.getElementById("wdsDis"+i);
e.innerHTML = _("wiz wireless disabled");
e = document.getElementById("wdsKey"+i);
e.innerHTML = _("wiz wireless key");
e = document.getElementById("wdsPeerMac"+i);
e.innerHTML = _("wiz wireless peer mac");
}
e = document.getElementById("wdsSingle");
e.innerHTML = _("wiz wireless security");
e = document.getElementById("lBack");
e.value = _("wiz back");
e = document.getElementById("lNext");
e.value = _("wiz next");
var e = document.getElementById("lCancel");
e.value = _("admin cancel");
}

function WdsSecurityOnChange(i)
{
if (eval("f.wds_encryp_type"+i+"[0]").checked == false)
eval("f.wds_encryp_key"+i).disabled = false;
else
eval("f.wds_encryp_key"+i).disabled = true;
}

function CheckEncKey(i)
{
var key = eval("f.wds_encryp_key"+i).value;
var encryp_type = getVleFromElmt(ArryEncType[i], 0);
//	alert(encryp_type );
if (encryp_type == "WEP") {
if (key.length == 10 || key.length == 26) {
var re = /[A-Fa-f0-9]{10,26}/;
if (!re.test(key)) {
alert("WDS"+i+"Key should be a 10/26 hexdecimal or a 5/13 ascii");
eval("f.wds_encryp_key"+i).focus();
eval("f.wds_encryp_key"+i).select();
return false;
} else
return true;
} else if (key.length == 5 || key.length == 13) {
return true;
} else {
alert("WDS"+i+"Key should be a 10/26 hexdecimal or a 5/13 ascii");
eval("f.wds_encryp_key"+i).focus();
eval("f.wds_encryp_key"+i).select();
return false;
}
} else if (encryp_type == "TKIP" || encryp_type == "AES") {
if (key.length < 8 || key.length > 64) {
alert("WDS"+i+"Key should be with length 8~64");
eval("f.wds_encryp_key"+i).focus();
eval("f.wds_encryp_key"+i).select();
return false;
} else if (key.length == 64) {
var re = /[A-Fa-f0-9]{64}/;
if (!re.test(key)) {
alert("WDS"+i+"Key should be a 64 hexdecimal");
eval("f.wds_encryp_key"+i).focus();
eval("f.wds_encryp_key"+i).select();
return false;
} else
return true;
} else
return true;
}
return true;
}

function onClkNxt()
{
var re = /[A-Fa-f0-9]{2}/;

w.wWdsPhyMode = getVleFromElmt(f.wds_phy_mode, 0);
if (w.wOpmode == 6) {
w.wWdsVlan0 = getVleFromElmt(f.wds_vlan0, 0);
w.wWdsVlan1 = getVleFromElmt(f.wds_vlan1, 0);
w.wWdsVlan2 = getVleFromElmt(f.wds_vlan2, 0);
w.wWdsVlan3 = getVleFromElmt(f.wds_vlan3, 0);
}

if (w.wOpmode == 5 || w.wOpmode == 6) {
for (i=0; i<4; i++) {
w.wWdsEncryType += getVleFromElmt(ArryEncType[i], 0);
if (i != 3) w.wWdsEncryType += ";";
}
if (!CheckEncKey(0) || !CheckEncKey(1) || !CheckEncKey(2) || !CheckEncKey(3))
return false;

var all_wds_list = '';
for (i = 1; i <= 4; i++) {
wds_peer_list = '';
if ( (eval("f.peer"+i+"MAC1").value + eval("f.peer"+i+"MAC2").value +
eval("f.peer"+i+"MAC3").value + eval("f.peer"+i+"MAC4").value +
eval("f.peer"+i+"MAC5").value + eval("f.peer"+i+"MAC6").value ) != "") {
for (j = 1; j <= 6; j++) {
if (eval("f.peer"+i+"MAC"+j).value == "") {
alert(_("wiz wds mac empty"));
eval("f.peer"+i+"MAC"+j).focus();
eval("f.peer"+i+"MAC"+j).select();
return false;
} else if (!re.test(eval("f.peer"+i+"MAC"+j).value)) {
alert(_("wiz wds mac error"));
eval("f.peer"+i+"MAC"+j).focus();
eval("f.peer"+i+"MAC"+j).select();
return false;
} else {
wds_peer_list += eval("f.peer"+i+"MAC"+j).value;
if (j != 6) wds_peer_list += ':';
}
}
if (wds_peer_list == "00:00:00:00:00:00") {
alert(_("wiz wds mac invalid"));
return false;
}
}
all_wds_list += wds_peer_list + ';';
var aryWdsList = all_wds_list.split(";");
for (var j=0; j<aryWdsList.length; j++) {
for (var k=(j+1); k<aryWdsList.length;k++){
if (aryWdsList[j]== "" && aryWdsList[k]!= "") {
alert("The Security of index "+(j+1)+" must be set earlier than index "+ (k+1) +".");
return false;
}
}
}
}

} else if (w.wOpmode == 4) {
w.wWdsEncryType = getVleFromElmt(f.wds_encryp_type0[0], 0);
if (!CheckEncKey(0)) return false;

wds_peer_list = all_wds_list = '';
if ( (f.peer1MAC1.value + f.peer1MAC2.value + f.peer1MAC3.value + f.peer1MAC4.value +
f.peer1MAC5.value + f.peer1MAC6.value ) != "") {
for (j = 1; j <= 6; j++) {
if (eval("f.peer1MAC"+j).value == "") {
alert(_("wiz wds mac empty"));
eval("f.peer1MAC"+j).focus();
eval("f.peer1MAC"+j).select();
return false;
} else if (!re.test(eval("f.peer1MAC"+j).value)) {
alert(_("wiz wds mac error"));
eval("f.peer1MAC"+j).focus();
eval("f.peer1MAC"+j).select();
return false;
} else {
wds_peer_list += eval("f.peer1MAC"+j).value;
if (j != 6) wds_peer_list += ':';
}
}
}
all_wds_list += wds_peer_list + ';';
}
w.wWdsMacList = all_wds_list;

w.wWdsKey0 = getVleFromElmt(f.wds_encryp_key0, 0);
w.wWdsKey1 = getVleFromElmt(f.wds_encryp_key1, 0);
w.wWdsKey2 = getVleFromElmt(f.wds_encryp_key2, 0);
w.wWdsKey3 = getVleFromElmt(f.wds_encryp_key3, 0);

if (w.wOpmode == 6)
document.location.href = "wizard4_security.asp";
else
document.location.href = "wizard3.asp";
}

function onClkBtnCcl()
{
if(confirm(_("wiz cancel confirm"))) {
parent.location = "/home.asp";
}
}
</script>