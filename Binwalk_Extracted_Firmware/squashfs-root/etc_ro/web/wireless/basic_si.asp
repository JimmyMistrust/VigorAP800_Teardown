<html>
<head>
<title>Basic Wireless Settings</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var PhyMode  = '<% getCfgZero(1, "WirelessMode"); %>';
var HiddenSSID  = '<% getCfgZero(1, "HideSSID"); %>';
var APIsolated = '<% getCfgZero(1, "NoForwarding"); %>';
var channel_index  = '<% getWlanChannel(); %>';
var fxtxmode = '<% getCfgGeneral(1, "FixedTxMode"); %>';
var countrycode = '<% getCfgGeneral(1, "CountryCode"); %>';
var ht_mcs = '<% getCfgZero(1, "HT_MCS"); %>';
var txBurst = '<% getCfgZero(1, "TxBurst"); %>';
var opmode = "<% getCfgZero(1, "OperationMode"); %>";
var ap800_mode = "<% getCfgZero(1, "800_ap_mode"); %>";
var apcli = "<% getCfgZero(1, "ApCliEnable"); %>";

function style_display_on()
{
if (window.ActiveXObject)
{ // IE
return "block";
}
else if (window.XMLHttpRequest)
{ // Mozilla, Safari,...
return "table-row";
}
}

function macCloneSwitch()
{
if (document.wireless_basic.mac_clone_enabled.checked)
document.wireless_basic.mac_clone_mac0.disabled = false;
else
document.wireless_basic.mac_clone_mac0.disabled = true;
}

function getIdxOfForm( _elmt )
{
var elmt = _elmt;
if ( elmt.type )
{
for ( var i=0; i<elmt.form.length; i++ )
{
if(elmt.name!="" && elmt.form[i].name!=""){
if( elmt.name == elmt.form[i].name) return i;
}else{
if( elmt == elmt.form[i]) return i;
}
}
}
return false;
}

function insertChannelOption(vChannel, band)
{
var y = document.createElement('option');

if (1*band == 24)
{
y.text = ChannelList_24G[1*vChannel - 1];
y.value = 1*vChannel;
}
else if (1*band == 5)
{
y.value = 1*vChannel;
if (1*vChannel <= 140)
y.text = ChannelList_5G[((1*vChannel) - 36) / 4];
else
y.text = ChannelList_5G[((1*vChannel) - 36 - 1) / 4];
}

if (1*band == 24)
var x=document.getElementById("sz11gChannel");
else if (1*band == 5)
var x=document.getElementById("sz11aChannel");

try
{
x.add(y,null); // standards compliant
}
catch(ex)
{
x.add(y); // IE only
}
}

function initTranslation()
{
var e = document.getElementById("basicTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("basic title");

e = document.getElementById("basicWirelessNet");
e.innerHTML = _("basic wireless network");
e = document.getElementById("basicNetMode");
e.innerHTML = _("basic mode");
e = document.getElementById("inetMacClone");
e.innerHTML = _("inet mac clone");

e = document.getElementById("staadvTxBurst");
e.innerHTML = _("basic pkt burst");


e = document.getElementById("basicApply");
e.value = _("wireless apply");
e = document.getElementById("basicCancel");
e.value = _("wireless cancel");
}

// Check profile number and do not be added by user if the number is over 15 to avoid buffer overflow.
function getProfileNumber()
{
var total_num;
var staProfile = "<% getCfgZero(1, "staProfile"); %>";

total_num = staProfile.split(";").length;
if (total_num >= 15)
document.wireless_basic.profAdd.disabled = true;
else
document.wireless_basic.profAdd.disabled = false;
}

function initValue()
{
var MacCloneEnabled = '<% getCfgGeneral(1, "wiMacCloneEnabled0"); %>';

if (MacCloneEnabled == "1") {
document.wireless_basic.mac_clone_enabled.checked = true;
} else {
document.wireless_basic.mac_clone_enabled.checked = false;
}

initTranslation();

macCloneSwitch();

getProfileNumber();
}

function CheckValue()
{
var submit_ssid_num;

if (document.wireless_basic.ssid.value == "")
{
alert("Please enter SSID!");
document.wireless_basic.ssid.focus();
document.wireless_basic.ssid.select();
return false;
}

submit_ssid_num = 1;

for (i = 1; i < 3; i++)
{
if (eval("document.wireless_basic.mssid_"+i).value != "")
{
submit_ssid_num++;
}
}

document.wireless_basic.bssid_num.value = submit_ssid_num;

return true;
}

function selectedProfileChange()
{
document.wireless_basic.deleteProfileButton.disabled=false;
document.wireless_basic.editProfileButton.disabled=false;
document.wireless_basic.activateProfileButton.disabled=false;
}

function submit_apply(parm)
{
document.wireless_basic.hiddenButton.value = parm;
document.wireless_basic.submit();
}

function open_profile_page() {
window.open("add_profile_page.asp","profile_page","toolbar=no, location=yes, scrollbars=yes, resizable=no, width=660, height=600");
}

function edit_profile_page(){
document.wireless_basic.hiddenButton.value = 'edit';
document.wireless_basic.submit();
window.open("edit_profile_page.asp","profile_page","toolbar=no, location=yes, scrollbars=yes, resizable=no, width=660, height=600");
}

function onSubmitStaAdvance()
{
document.sta_advance.wireless_mode.value = document.wireless_basic.wireless_mode.value;
document.sta_advance.mac_clone_mac0.value = document.wireless_basic.mac_clone_mac0.value

if (document.wireless_basic.radioButton.checked) {
document.sta_advance.radiohiddenButton.value = 1;
} else {
document.sta_advance.radiohiddenButton.value = 0;
}

if (document.wireless_basic.mac_clone_enabled.checked) {
if (document.wireless_basic.mac_clone_mac0.value.length == 0) {
alert("MAC Address should not be empty!");
document.wireless_basic.mac_clone_mac0.focus();
return false;
}
var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
var re2 = /.[ACEace02468]:..:..:..:..:.[08]/;	// the eighth bit is the multicast bit, must not be 1, and the last byte must be a multiple of 8
if (!re.test(document.wireless_basic.mac_clone_mac0.value)) {
alert("Please fill the MAC Address in correct format! (XX:XX:XX:XX:XX:XX)");
document.wireless_basic.mac_clone_mac0.focus();
return false;
}
if (document.wireless_basic.mac_clone_mac0.value == "00:00:00:00:00:00" ||
!re2.test(document.wireless_basic.mac_clone_mac0.value)) {
alert("MAC Clone Address should not be Multicast or Invalid MAC Address!");
document.wireless_basic.mac_clone_mac0.focus();
return false;
}
document.sta_advance.mac_clone_enabled.value = 0;
}

if (document.wireless_basic.tx_burst.checked) {
document.sta_advance.tx_burst.value = "on";
}

document.sta_advance.submit();
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="basicTitle">General Setup</h1>
<hr size="1" />
<br />

<form method=post name=wireless_basic action="/goform/setStaProfile" onSubmit="return CheckValue()">

<div>
<h2 id="basicWirelessNet" class="title">General Setting ( IEEE 802.11 )</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td>
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td colspan="2">
<input type="checkbox" id="radioButton" name="radioButton" value=1
<% var radio = getStaRadioStatus();  if (radio == "1") write("checked"); %>>
<span id="basicRadioButton">Enable Wireless LAN</span>
</td>
</tr>
</table>
<table width="600" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td class="head" id="basicNetMode">Mode:</td>
<td>
<select name="wireless_mode" id="wireless_mode" size="1">
<% getStaWirelessMode(); %>
</select>
</td>
</tr>
<tr><td colspan="2"><hr size="1"/></td></tr>
</table>

<div>
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td id="profList" class="title">Profile List</td></tr>
<tr><td>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="title" width=50px id="profSelect">&nbsp;</td>
<td class="title" id="profProfile">Profile</td>
<td class="title" id="profSSID">SSID</td>
<td class="title" id="profChannel">Channel</td>
<td class="title" id="profAuth">Authentication</td>
<td class="title" id="staproEncryp">Encryption</td>
</tr>
<% getStaProfile(); %>
</table>
</td></tr>
</table>

<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type="button" name="addProfileButton" id="profAdd" class="btnw" value="Add" onClick="open_profile_page()"> &nbsp; &nbsp;
<input type="button" name="deleteProfileButton" id="profDel" class="btnw" value="Delete" disabled onClick="submit_apply('delete')"> &nbsp; &nbsp;
<input type="button" name="editProfileButton" id="profEdit" class="btnw" value="Edit" disabled onClick="edit_profile_page()"> &nbsp; &nbsp;
<input type="button" name="activateProfileButton" id="profActive" class="btnw" value="Connect" disabled onClick="submit_apply('activate')">
</td>
</tr>
</table><br>

<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr>
<td><hr size="1" /></td>
</tr>
</table>
</div>

<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td>
<table width="600" cellspacing="0" cellpadding="0" border="0">
<tr><td height="25">Packet-OVERDRIVE</td></tr>
<tr><td height="25">
<input type="checkbox" name="tx_burst"<% var burst = getCfgZero(0, "TxBurst");
if (burst == "1") write("checked"); %>><font id="staadvTxBurst">Tx BURST</font></td>
</tr>
<tr><td height="25" class="title">Note :</td></tr>
<tr>
<td height="25">1.Tx Burst only supports 11g mode.</td>
</tr>
<tr>
<td height="25">2.The same technology must also be supported in AP to boost WLAN performance.</td>
</tr>
</table>
</td></tr>
</table>

<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td>
<table width="600" cellspacing="0" cellpadding="0" border="0">
<tr><td class="head"><input type="checkbox" name="mac_clone_enabled" value="0" onclick="macCloneSwitch()">&nbsp;	<span id="inetMacClone">Mac Clone</span></td>
<td><input name="mac_clone_mac0" maxlength=17 value="<% getCfgGeneral(1, "wiMacCloneMac0"); %>"></td>
</tr>
<tr><td height="25" class="title" colspan="2">Note :</td><tr>
<tr><td colspan="2">1. Please notice that the last byte of this MAC address must be a multiple of 8.</td></tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</div>
<br />

<table width = "100%" border = "0" cellpadding = "2" cellspacing = "1">
<tr align="center">
<td>
<input type="hidden" name="wds_encryp_type">
<input type="hidden" name=hiddenButton value="">
<input type=button class="btnw" value="Apply" id="basicApply" onClick="onSubmitStaAdvance()"> &nbsp; &nbsp;
<input type=reset  class="btnw" value="Cancel" id="basicCancel" onClick="window.location.reload()">
</td>
</tr>
</table>
</form>

<form method=post name="sta_advance" action="/goform/setStaAdvance">
<input type="hidden" name=country_region_bg value="5">
<input type="hidden" name=bg_protection value="0">
<input type="hidden" name=wireless_mode value="0">
<input type="hidden" name=mac_clone_mac0 value="">
<input type="hidden" name=mac_clone_enabled value="1">
<input type="hidden" name=tx_burst value="off">
<input type="hidden" name=radiohiddenButton value="2">
</form>
</td></tr>
</table>

</body>
</html>