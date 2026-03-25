<html>
<head>
<title>Basic Wireless Settings</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var f;
var wl_5g = '<% get5GExist(); %>';
var opmode = '<% getCfgZero(1, "OperationMode"); %>';
var ap800_mode = "<% getCfgZero(1, "800_ap_mode"); %>";
var radio_off = '<% getCfgZero(1, "RadioOff_3572"); %>';
var vlan_enable = '<% getCfgGeneral(1, "WL_VLAN"); %>';
var HiddenSSID  = '<% getCfgZero(1, "HideSSID_3572"); %>';
var APIsolated = '<% getCfgZero(1, "NoForwarding_3572"); %>';
var PhyMode  = '<% getCfgZero(1, "WirelessMode_3572"); %>';
var fxtxmode = '<% getCfgGeneral(1, "FixedTxMode_3572"); %>';
var ht_mcs = '<% getCfgZero(1, "HT_MCS_3572"); %>';
var ssid_vlan1 = '<% getCfgZero(1, "SSID_VLAN5"); %>';
var ssid_vlan2 = '<% getCfgZero(1, "SSID_VLAN6"); %>';
var ssid_vlan3 = '<% getCfgZero(1, "SSID_VLAN7"); %>';
var channel  = '<% getWlanChannel_5g(); %>';
var sExtChannel = '<% getCfgZero(1, "HT_EXTCHA_3572"); %>';
var CountryRegion = '<% getCfgZero(1, "CountryRegionABand_3572"); %>';
var WLIsolate = '<% getCfgGeneral(1, "WirelessIsolate5G"); %>';
var WLVlanId = '<% getCfgGeneral(1, "WirelessVlan5G"); %>';
var client_limit_5G_enable = '<% getCfgZero(1, "ClientLimit5G_Enable_3572"); %>';
var client_limit_5G = '<% getCfgGeneral(1, "ClientLimit5G_3572"); %>'
var vlan_info = "<% getCfgZero(1, "ManagementVlan"); %>";

//var ChannelList_5G = ["5180MHz (Channel 36)", "5200MHz (Channel 40)", "5220MHz (Channel 44)",
//					"5240MHz (Channel 48)", "5260MHz (Channel 52)", "5280MHz (Channel 56)",
//					"5300MHz (Channel 60)", "5320MHz (Channel 64)", "5500MHz (Channel 100)",
//					"5520MHz (Channel 104)", "5540MHz (Channel 108)", "5560MHz (Channel 112)",
//					"5580MHz (Channel 116)", "5600MHz (Channel 120)", "5620MHz (Channel 124)",
//					"5640MHz (Channel 128)", "5660MHz (Channel 132)", "5680MHz (Channel 136)",
//					"5700MHz (Channel 140)", "5745MHz (Channel 149)", "5765MHz (Channel 153)",
//					"5785MHz (Channel 157)", "5805MHz (Channel 161)", "5825MHz (Channel 165)"];
var ChannelList_5G = [[36,40,44,48,52,56,60,64,149,153,157,161,165],
[36,40,44,48,52,56,60,64,100,104,108,112,116,120,124,128,132,136,140],
[36,40,44,48,52,56,60,64],
[52,56,60,64,149,153,157,161],
[149,153,157,161,165],[149,153,157,161],
[36,40,44,48],
[36,40,44,48,52,56,60,64,100,104,108,112,116,120,124,128,132,136,140,149,153,157,161,165],
[52,56,60,64],
[36,40,44,48,52,56,60,64,100,104,108,112,116,132,136,140,149,153,157,161,165],
[36,40,44,48,52,56,60,64,100,104,108,112,116,120,149,153,157,161]];

var aryExtChValue = [36,40,44,48,52,56,60,64,100,104,108,112,116,120,124,128,132,136,149,153,157,161];
HT5GExtCh = new Array(22);
HT5GExtCh[0] = new Array(1, "5200MHz (Channel 40)"); // channel 36's extension channel
HT5GExtCh[1] = new Array(0, "5180MHz (Channel 36)"); // channel 40's extension channel
HT5GExtCh[2] = new Array(1, "5240MHz (Channel 48)"); // channel 44's extension channel
HT5GExtCh[3] = new Array(0, "5220MHz (Channel 44)"); // channel 48's extension channel
HT5GExtCh[4] = new Array(1, "5280MHz (Channel 56)"); // channel 52's extension channel
HT5GExtCh[5] = new Array(0, "5260MHz (Channel 52)"); // channel 56's extension channel
HT5GExtCh[6] = new Array(1, "5320MHz (Channel 64)"); // channel 60's extension channel
HT5GExtCh[7] = new Array(0, "5300MHz (Channel 60)"); // channel 64's extension channel
HT5GExtCh[8] = new Array(1, "5520MHz (Channel 104)"); // channel 100's extension channel
HT5GExtCh[9] = new Array(0, "5500MHz (Channel 100)"); // channel 104's extension channel
HT5GExtCh[10] = new Array(1, "5560MHz (Channel 112)"); // channel 108's extension channel
HT5GExtCh[11] = new Array(0, "5540MHz (Channel 108)"); // channel 112's extension channel
HT5GExtCh[12] = new Array(1, "5600MHz (Channel 120)"); // channel 116's extension channel
HT5GExtCh[13] = new Array(0, "5580MHz (Channel 116)"); // channel 120's extension channel
HT5GExtCh[14] = new Array(1, "5640MHz (Channel 128)"); // channel 124's extension channel
HT5GExtCh[15] = new Array(0, "5620MHz (Channel 124)"); // channel 128's extension channel
HT5GExtCh[16] = new Array(1, "5680MHz (Channel 136)"); // channel 132's extension channel
HT5GExtCh[17] = new Array(0, "5660MHz (Channel 132)"); // channel 136's extension channel
HT5GExtCh[18] = new Array(1, "5765MHz (Channel 153)"); // channel 149's extension channel
HT5GExtCh[19] = new Array(0, "5745MHz (Channel 149)"); // channel 153's extension channel
HT5GExtCh[20] = new Array(1, "5805MHz (Channel 161)"); // channel 157's extension channel
HT5GExtCh[21] = new Array(0, "5785MHz (Channel 157)"); // channel 161's extension channel



function enableVLAN()
{
var vlan_enable = getVleFromElmt(f.vlan_enable, 0);

if (vlan_enable == "1") {
f.ssid_vlan1.disabled = false;
f.ssid_vlan2.disabled = false;
f.ssid_vlan3.disabled = false;
} else {
setVle2Elmt(f.ssid_vlan1, 0, 0);
setVle2Elmt(f.ssid_vlan2, 0, 0);
setVle2Elmt(f.ssid_vlan3, 0, 0);
f.ssid_vlan1.disabled = true;
f.ssid_vlan2.disabled = true;
f.ssid_vlan3.disabled = true;
}
}

function initExtChannel()
{
var mChannel = 1*getVleFromElmt(f.sz11aChannel, 0);

f.sExtChannel.options.length = 0;
for (var i=0; i<aryExtChValue.length; i++) {
if (aryExtChValue[i] == mChannel) {
f.sExtChannel.options[0] = new Option(HT5GExtCh[i][1], HT5GExtCh[i][0]);
break;
} else {
f.sExtChannel.options[0] = new Option(_("basic frequency auto"), "0");
}
}
}

function insertChannelOption(vChannel)
{
var y = document.createElement('option');

y.value = 1*vChannel;
var freq = 5180+(1*vChannel-36)*5;
y.text = freq + "MHz (Channel " + vChannel + ")";

var x=document.getElementById("sz11aChannel");

try {
x.add(y,null); // standards compliant
}
catch(ex) {
x.add(y); // IE only
}
}

function Check5GBandChannelException()
{
var w_mode = getVleFromElmt(f.wirelessmode, 0);

var x = document.getElementById("sz11aChannel")
var current_length = f.sz11aChannel.options.length;

for (var ch_idx = current_length - 1; ch_idx > 0; ch_idx--) {
x.remove(ch_idx);
}
for (var i=0; i< ChannelList_5G[CountryRegion*1].length; i++) {
var chn = ChannelList_5G[CountryRegion*1][i];
if (w_mode != 2 && chn == 165) continue;
insertChannelOption(chn);
}
}

function initTranslation()
{
var e = document.getElementById("basicTitle");
e.innerHTML = _("parent wireless lan 5g")+" >> "+_("basic title");

e = document.getElementById("basicWirelessNet");
e.innerHTML = _("basic wireless network");
e = document.getElementById("basicWirelessEnable");
e.innerHTML = _("basic enable");
e = document.getElementById("basicNetMode");
e.innerHTML = _("basic mode");
e = document.getElementById("basicHideSSID");
e.innerHTML = _("basic hssid");
e = document.getElementById("basicSSID");
e.innerHTML = _("basic ssid");
e = document.getElementById("basicSubnet");
e.innerHTML = _("basic subnet");
e = document.getElementById("basicIsolatedSSID");
e.innerHTML = _("basic isolate");
e = document.getElementById("basicVLANID");
e.innerHTML = _("basic vlan id");
e = document.getElementById("basicIsolatedLAN");
e.innerHTML = _("basic isolated lan");
e = document.getElementById("basicIsolatedLAN1");
e.innerHTML = _("basic isolated lan");

e = document.getElementById("basicHssidTitle");
e.innerHTML = _("basic hssid title");
e = document.getElementById("basicHssidIntro");
e.innerHTML = _("basic hssid intro");
e = document.getElementById("basicIsolateTitle");
e.innerHTML = _("basic isolate");
e = document.getElementById("basicIsolateIntro");
e.innerHTML = _("basic isolate intro");
e = document.getElementById("basicIsolateLanIntro");
e.innerHTML = _("basic isolate lan intro");

e = document.getElementById("basicFreqA");
e.innerHTML = _("basic frequency");
e = document.getElementById("basicFreqAAuto");
e.innerHTML = _("basic frequency auto");
e = document.getElementById("basicRateAuto");
e.innerHTML = _("wireless auto");
e = document.getElementById("basicRate");
e.innerHTML = _("basic rate");
e = document.getElementById("basicExtChn");
e.innerHTML = _("basic ext channel");

e = document.getElementById("basicApply");
e.value = _("wireless apply");
e = document.getElementById("basicCancel");
e.value = _("wireless cancel");
}

function initValue()
{
var ssidArray;
var HiddenSSIDArray;

initTranslation();

if (wl_5g == "0") {
showElmtById(document, "warning");
}

f = document.wireless_basic;

if(1){ //aki G41086
document.getElementById("basicIsolatedLAN").style.display = "none";
document.getElementById("basicIsolatedLAN0").style.display = "none";
document.getElementById("isolated_lan0").style.display = "none";
document.getElementById("isolated_lan1").style.display = "none";
document.getElementById("isolated_lan2").style.display = "none";
}

if (opmode == '2') {
hideElmtByClass(document, "tr", "stat_info");
hideElmtByClass(document, "td", "stat_info");
} else if (opmode == 0 && (ap800_mode == 1 || ap800_mode == 2)) {
hideElmtByClass(document, "tr", "stat_info");
hideElmtByClass(document, "td", "stat_info");
}

setVle2Elmt(f.wirelessmode, PhyMode, 0);

var HiddenSSIDArray = HiddenSSID.split(";");
for (i=0;i<3;i++) {
if (HiddenSSIDArray[i] == "1")
f.hssid[i].checked = true;
else
f.hssid[i].checked = false;
}

var APIsolatedArray = APIsolated.split(";");
for (i=0;i<3;i++) {
if (APIsolatedArray[i] == "1")
f.isolated_ssid[i].checked = true;
else
f.isolated_ssid[i].checked = false;
}

if (radio_off == 1)
f.radioButton.checked = false;
else
f.radioButton.checked = true;

setVle2Elmt(f.vlan_enable, vlan_enable);
if (vlan_enable == "1") {
setVle2Elmt(f.ssid_vlan1, ssid_vlan1);
setVle2Elmt(f.ssid_vlan2, ssid_vlan2);
setVle2Elmt(f.ssid_vlan3, ssid_vlan3);
}
enableVLAN();

wirelessModeChange(0);
setVle2Elmt(f.sz11aChannel, channel, 0);
initExtChannel();
setVle2Elmt(f.sExtChannel, sExtChannel);

if (WLIsolate == "") WLIsolate = "0;0;0";
if (WLVlanId == "") WLVlanId = "0;0;0";
var isolated_lans = WLIsolate.split(";");
var vlans_id = WLVlanId.split(";");

for (var i=0;i<3;i++) {
if (isolated_lans[i] == 0)
f.isolated_lan[i].checked = false;
else
f.isolated_lan[i].checked = true;
eval("f.vlan_id"+i).value = vlans_id[i];
onClkIsoLan(i);
}

client_limit_5G_enable = 1*client_limit_5G_enable;
if (client_limit_5G_enable == 1)
document.wireless_basic.client_limit_5G_enable.checked = true;
else
document.wireless_basic.client_limit_5G_enable.checked = false;

if (!client_limit_5G){
document.wireless_basic.client_limit_5G.value = "64";
} else {
document.wireless_basic.client_limit_5G.value = client_limit_5G;
}
}

function wirelessModeChange(init)
{
var wmode = getVleFromElmt(f.wirelessmode, 0);

if (wmode == 2) {
showElmtById(document, "div_abg_rate");
hideElmtById(document, "div_extChannel");
} else {
showElmtById(document, "div_extChannel");
hideElmtById(document, "div_abg_rate");
}
if (fxtxmode == "OFDM" || fxtxmode == "ofdm") {
if (ht_mcs != 33) {
ht_mcs = 1*ht_mcs + 1;
f.abg_rate.options.selectedIndex = ht_mcs;
} else {
f.abg_rate.options.selectedIndex = 0;
}
}
Check5GBandChannelException();
if (init == 1) initExtChannel();
}

function onClkIsoLan(idx)
{
if (f.isolated_lan[idx].checked) {
eval("f.vlan_id"+idx).disabled = true;
} else {
eval("f.vlan_id"+idx).disabled = false;
}
}

function onChg11aChannel()
{
initExtChannel();
}

function CheckValue()
{
var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
var re2 = /.[ACEace02468]:..:..:..:..:../;	// the eighth bit is the multicast bit, must not be 1

if (f.ssid.value == "")
{
alert("Please enter SSID!");
f.ssid.focus();
f.ssid.select();
return false;
}

if (f.mssid_2.value != "" && f.mssid_1.value == "") {
alert("SSID2 can't be empty!");
f.mssid_1.focus();
f.mssid_1.select();
return false;
}
submit_ssid_num = 1;
var re = /^[\w|\-|\s|\.]+$/;
var ssid_val = "";
for (i = 0; i < 3; i++){
if(i==0)
ssid_val = f.ssid.value;
else
ssid_val = eval("f.mssid_"+i).value;
if(ssid_val != ""){
if (!re.test(ssid_val)) {
alert("The value of SSID is invalid, SSID only support 'A-Z,a-z,0-9,_,- and space', please re-enter!");
return false;
}
}
if (i>0 && eval("f.mssid_"+i).value != "") {
submit_ssid_num++;
}
}
f.bssid_num.value = submit_ssid_num;

var submit_isolated_lan = "";
if (f.isolated_lan[0].checked)
submit_isolated_lan += "1";
else
submit_isolated_lan += "0";
for (var i=1; i<3;i++) {
if (f.isolated_lan[i].checked)
submit_isolated_lan += ";1";
else
submit_isolated_lan += ";0";
}
f.submit_isolated_lan.value = submit_isolated_lan;

for (var i=0; i<3;i++) {
if (!f.isolated_lan[i].checked) {
var vid = eval("f.vlan_id"+i).value;
if (vid == 0) continue;
if (!isAllNum(vid) || vid < 0 || vid > 4095) {
alert(_("basic vlan id error"));
eval("document.wireless_basic.vlan_id"+i).focus();
return false;
}
}
}

if (vlan_info.length <= 1)
vlan_info = "0;0;0";
var vlan = vlan_info.split(";");
var vlanstatus=0;
var lan_num = 0;
if(f.radioButton.checked && vlan[0]!="0"){
if(f.vlan_enable.checked){
for (var i=0; i<3;i++) {
vid = eval("document.wireless_basic.vlan_id"+i).value;
lan_num = eval("document.wireless_basic.ssid_vlan"+(i+1)).value;
if(lan_num=="1" && vid==vlan[1] && vid!="0") {
vlanstatus=1;
break;
}
}
for (var i=0; i<3;i++) {
vid = eval("document.wireless_basic.vlan_id"+i).value;
lan_num = eval("document.wireless_basic.ssid_vlan"+(i+1)).value;
if(lan_num=="2" && vid==vlan[2] && vid!="0") {
vlanstatus+=2;
break;
}
}
if(vlanstatus==1){
alert("Error: LAN-A\r\nManagement VLAN ID conficts with Wireless VLAN ID");
return false;
}else if(vlanstatus==2){
alert("Error: LAN-B\r\nManagement VLAN ID conficts with Wireless VLAN ID");
return false;
}else if(vlanstatus==3){
alert("Error: LAN-A & LAN-B\r\nManagement VLAN ID conficts with Wireless VLAN ID");
return false;
}
}else{
for (var i=0; i<3;i++) {
vid = eval("document.wireless_basic.vlan_id"+i).value;
if(vid==vlan[1]){
alert("Error\r\nManagement VLAN ID conficts with Wireless VLAN ID");
return false;
}
}
}
}
var client_limit_5G_num = document.wireless_basic.client_limit_5G.value;
if (!isAllNum(client_limit_5G_num)){
alert(_("Client limitation attribute error"));
return false;
} else if (client_limit_5G_num < 3 || client_limit_5G_num > 64){
alert(_("Client limitation attribute must in 3~64."));
return false;
}

if (confirm(_("msg lan connection lost")))
return true;
else
return false;
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="basicTitle">General Setup</h1>
<hr size="1" />
<br />

<form method="post" name="wireless_basic" action="/goform/wirelessBasic_5g" onSubmit="return CheckValue()">

<div>
<h2 id="basicWirelessNet" class="title">General Setting ( IEEE 802.11 )</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td>
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td colspan="2">
<input type="checkbox" name="radioButton" value="1"/>
<span id="basicWirelessEnable">Enable Wireless LAN</span>
</td>
</tr>
</table>
<table width="600" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td colspan="2">
<input type="checkbox" name="client_limit_5G_enable" /> Enable Limit Client (3-64)
<input type="text" name="client_limit_5G" value="" maxlength="2" size="4" /> (default: 64)
</td>
</tr>
<tr><td colspan="2"><hr size="1"/></td></tr>
<tr>
<td class="head" id="basicNetMode">Mode :</td>
<td>
<select name="wirelessmode" id="wirelessmode" size="1" onChange="wirelessModeChange(1)">
<option value=2>11a Only</option>
<option value=11>11n Only (5G)</option>
<option value=8>Mixed (11a+11n)</option>
</select>
</td>
</tr>
<tr><td colspan="2"><hr size="1"/></td></tr>
</table>
<input type="hidden" name="bssid_num" value="1">
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr class="stat_info"><td colspan="6">
<input type="checkbox" name="vlan_enable" value="1" onclick="enableVLAN()"> Enable 2 Subnet (Simulate 2 APs)
</td></tr>
<tr>
<td width="5%" height="25"></td>
<td width="12%" align="center" id="basicHideSSID">Hide SSID</td>
<td width="30%" align="center" id="basicSSID">SSID</td>
<td width="15%" class="stat_info" align="center" id="basicSubnet">Subnet</td>
<td width="15%" align="center" id="basicIsolatedLAN">Isolate LAN</td>
<td width="15%" align="center" id="basicIsolatedSSID">Isolate Member</td>
<td width="15%" align="center" id="basicVLANID">VLAN ID (0:Untagged)</td>
</tr>
<tr>
<td height="25" align="center">1</td>
<td align="center"><input type="checkbox" name="hssid" value="0" /></td>
<td align="center">
<input type="text" name="ssid" size="25" maxlength="32" value="<% getCfgGeneral(1, "SSID1_3572"); %>" />
</td>
<td align="center" class="stat_info">
<select id="ssid_vlan1" name="ssid_vlan1" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
</td>
<td align="center" id="isolated_lan0"><input type="checkbox" name="isolated_lan" value="0" onclick="onClkIsoLan(0)" /></td>
<td align="center"><input type="checkbox" name="isolated_ssid" value="0" /></td>
<td align="center"><input type="text" name="vlan_id0" size="4" /></td>
</tr>
<tr>
<td height="25" align="center">2</td>
<td align="center"><input type="checkbox" name="hssid" value="1" /></td>
<td align="center">
<input type="text" name="mssid_1" size="25" maxlength="32" value="<% getCfgGeneral(1, "SSID2_3572"); %>" />
</td>
<td align="center" class="stat_info">
<select id="ssid_vlan2" name="ssid_vlan2" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
</td>
<td align="center" id="isolated_lan1"><input type="checkbox" name="isolated_lan" value="1" onclick="onClkIsoLan(1)" /></td>
<td align="center"><input type="checkbox" name="isolated_ssid" value="1" /></td>
<td align="center"><input type="text" name="vlan_id1" size="4" /></td>
</tr>
<tr>
<td height="25" align="center">3</td>
<td align="center"><input type="checkbox" name="hssid" value="2" /></td>
<td align="center">
<input type="text" name="mssid_2" size="25" maxlength="32" value="<% getCfgGeneral(1, "SSID3_3572"); %>" />
</td>
<td align="center" class="stat_info">
<select id="ssid_vlan3" name="ssid_vlan3" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
</td>
<td align="center" id="isolated_lan2"><input type="checkbox" name="isolated_lan" value="2" onclick="onClkIsoLan(2)" /></td>
<td align="center"><input type="checkbox" name="isolated_ssid" value="2" /></td>
<td align="center"><input type="text" name="vlan_id2" size="4" /></td>
</tr>
</table>
<br />
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr>
<td class="title" width="120"><span id="basicHssidTitle">Hide SSID</span>:</td>
<td id="basicHssidIntro">Prevent SSID from being scanned.</td>
</tr>
<tr id="basicIsolatedLAN0">
<td class="title" valign="top"><span id="basicIsolatedLAN1">Isolate LAN</span>:</td>
<td><span id="basicIsolateLanIntro">Wireless clients (stations) with the same SSID cannot access wired PCs on LAN.</span></td>
</tr>
<tr>
<td class="title" valign="top"><span id="basicIsolateTitle">Isolate Member</span>:</td>
<td id="basicIsolateIntro">Wireless clients (stations) with the same SSID cannot access for each other.</td>
</tr>
<tr><td colspan="2"><hr size="1"/></td></tr>
</table>
<table width="600" cellspacing="1" cellpadding="2" border="0" align="center">
<tr>
<td class="head" id="basicFreqA">Channel :</td>
<td>
<select id="sz11aChannel" name="sz11aChannel" size="1" onchange="onChg11aChannel()">
<option value=0 id="basicFreqAAuto">AutoSelect</option>
</select>
</td>
</tr>
<tr id="div_extChannel">
<td class="head" id="basicExtChn">Extension Channel :</td>
<td><select id="sExtChannel" name="sExtChannel" size="1">
</select>
</td>
</tr>
<tr id="div_abg_rate">
<td class="head" id="basicRate">Rate :</td>
<td><select name="abg_rate" size="1">
<option value=0 id="basicRateAuto">Auto</option>
<option value=6>6 Mbps</option>
<option value=9>9 Mbps</option>
<option value=12>12 Mbps</option>
<option value=18>18 Mbps</option>
<option value=24>24 Mbps</option>
<option value=36>36 Mbps</option>
<option value=48>48 Mbps</option>
<option value=54>54 Mbps</option></select>
</td>
</tr>
</table>

</td>
</tr>
</table>
</div>
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type="hidden" name="wds_list">
<input type="hidden" name="submit_isolated_lan">
<input type=submit class="btnw" value="OK" id="basicApply"> &nbsp; &nbsp;
<input type=reset  class="btnw" value="Cancel" id="basicCancel" onClick="window.location.reload()">
</td>
</tr>
</table>

<div class="alert" id="warning" style="display:none">
No attached 5G wireless dongle was detected. Please attach a dongle and reload this page.
</div>
</form>

</td></tr>
</table>

</body>
</html>
