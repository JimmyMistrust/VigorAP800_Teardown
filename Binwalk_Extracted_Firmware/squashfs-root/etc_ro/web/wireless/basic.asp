<html>
<head>
<title>Basic Wireless Settings</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<style type="text/css">
#basicNote {font-weight: bold; font-family: Arial, Helvetica, sans-serif; margin-left: 5px}
</style>
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
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
var radio_off = '<% getCfgZero(1, "RadioOff"); %>';
var mssidb = "<% getMBSSIDBuilt(); %>";
var wdsMode  = '<% getCfgZero(1, "WdsEnable"); %>';
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
var rfic = '<% getCfgGeneral(1, "RFICType"); %>';
var ssid_vlan1 = '<% getCfgZero(1, "SSID_VLAN1"); %>';
var ssid_vlan2 = '<% getCfgZero(1, "SSID_VLAN2"); %>';
var ssid_vlan3 = '<% getCfgZero(1, "SSID_VLAN3"); %>';
var ssid_vlan4 = '<% getCfgZero(1, "SSID_VLAN4"); %>';
var wmmCapable = '<% getCfgZero(1, "WmmCapable"); %>';
var sExtChannel = '<% getCfgZero(1, "HT_EXTCHA"); %>';
var channel_width = '<% getCfgZero(1, "HT_BW"); %>';
var vlan_enable = '<% getCfgGeneral(1, "WL_VLAN"); %>';
var MacCloneEnabled1 = '<% getCfgGeneral(1, "wiMacCloneEnabled1"); %>';
var TRStream = '<% getCfgZero(1, "HT_TxStream"); %>';
var tx_power = '<% getCfgZero(1, "TxPower"); %>';
var WLIsolate = '<% getCfgGeneral(1, "WirelessIsolate"); %>';
var WLVlanId = '<% getCfgGeneral(1, "WirelessVlan"); %>';
var client_limit_enable = '<% getCfgZero(1, "ClientLimit_Enable"); %>';
var client_limit = '<% getCfgGeneral(1, "ClientLimit"); %>';

var ChannelList_24G = ["2412MHz (Channel 1)", "2417MHz (Channel 2)", "2422MHz (Channel 3)",
"2427MHz (Channel 4)", "2432MHz (Channel 5)", "2437MHz (Channel 6)",
"2442MHz (Channel 7)", "2447MHz (Channel 8)", "2452MHz (Channel 9)",
"2457MHz (Channel 10)", "2462MHz (Channel 11)", "2467MHz (Channel 12)",
"2472MHz (Channel 13)", "2484MHz (Channel 14)"];

var ChannelList_5G = ["5180MHz (Channel 36)", "5200MHz (Channel 40)", "5220MHz (Channel 44)",
"5240MHz (Channel 48)", "5260MHz (Channel 52)", "5280MHz (Channel 56)",
"5300MHz (Channel 60)", "5320MHz (Channel 64)", "5500MHz (Channel 100)",
"5520MHz (Channel 104)", "5540MHz (Channel 108)", "5560MHz (Channel 112)",
"5580MHz (Channel 116)", "5600MHz (Channel 120)", "5620MHz (Channel 124)",
"5640MHz (Channel 128)", "5660MHz (Channel 132)", "5680MHz (Channel 136)",
"5700MHz (Channel 140)", "5745MHz (Channel 149)", "5765MHz (Channel 153)",
"5785MHz (Channel 157)", "5805MHz (Channel 161)", "5825MHz (Channel 165)"];
var sChannelAuto = '<% getWlanChannel_AutoSelect();%>';
var vlan_info = "<% getCfgZero(1, "ManagementVlan"); %>";
function macCloneSwitch()
{
if (document.wireless_basic.mac_clone_enabled.checked)
document.wireless_basic.mac_clone_mac1.disabled = false;
else
document.wireless_basic.mac_clone_mac1.disabled = true;
}

function enableVLAN()
{
var f = document.wireless_basic;
var vlan_enable = f.vlan_enable.checked;

if (vlan_enable == "1") {
f.ssid_vlan1.disabled = false;
f.ssid_vlan2.disabled = false;
f.ssid_vlan3.disabled = false;
f.ssid_vlan4.disabled = false;
f.wds_vlan0.disabled = false;
f.wds_vlan1.disabled = false;
f.wds_vlan2.disabled = false;
f.wds_vlan3.disabled = false;
} else {
f.ssid_vlan1.options.selectedIndex = 0;
f.ssid_vlan2.options.selectedIndex = 0;
f.ssid_vlan3.options.selectedIndex = 0;
f.ssid_vlan4.options.selectedIndex = 0;
f.ssid_vlan1.disabled = true;
f.ssid_vlan2.disabled = true;
f.ssid_vlan3.disabled = true;
f.ssid_vlan4.disabled = true;
f.wds_vlan0.disabled = true;
f.wds_vlan1.disabled = true;
f.wds_vlan2.disabled = true;
f.wds_vlan3.disabled = true;
}
}

function onTxtMac(i, idx)
{
if (i!= 0) {
if (idx==0) setTimeout( "adjHex(document.wireless_basic.peer"+i+"MAC1)", 10 );
if (idx==1) setTimeout( "adjHex(document.wireless_basic.peer"+i+"MAC2)", 10 );
if (idx==2) setTimeout( "adjHex(document.wireless_basic.peer"+i+"MAC3)", 10 );
if (idx==3) setTimeout( "adjHex(document.wireless_basic.peer"+i+"MAC4)", 10 );
if (idx==4) setTimeout( "adjHex(document.wireless_basic.peer"+i+"MAC5)", 10 );
if (idx==5) setTimeout( "adjHex(document.wireless_basic.peer"+i+"MAC6, 1)", 10 );
} else {
if (idx==0) setTimeout( "adjHex(document.wireless_basic.wds_1_peer1MAC1)", 10 );
if (idx==1) setTimeout( "adjHex(document.wireless_basic.wds_1_peer1MAC2)", 10 );
if (idx==2) setTimeout( "adjHex(document.wireless_basic.wds_1_peer1MAC3)", 10 );
if (idx==3) setTimeout( "adjHex(document.wireless_basic.wds_1_peer1MAC4)", 10 );
if (idx==4) setTimeout( "adjHex(document.wireless_basic.wds_1_peer1MAC5)", 10 );
if (idx==5) setTimeout( "adjHex(document.wireless_basic.wds_1_peer1MAC6, 1)", 10 );
}
}

function WdsSecurityOnChange(i)
{
opmode = 1*opmode;
ap800_mode = 1*ap800_mode;

if (i != -1) {
if (opmode == 0 && (ap800_mode == 2 || ap800_mode == 3)) {
if (eval("document.wireless_basic.wds_encryp_type"+i+"[0]").checked == false)
eval("document.wireless_basic.wds_encryp_key"+i).disabled = false;
else
eval("document.wireless_basic.wds_encryp_key"+i).disabled = true;
} else
eval("document.wireless_basic.wds_encryp_key"+i).disabled = true;
} else {
if (opmode == 0 && ap800_mode == 1) {
if (document.wireless_basic.wds_1_encryp_type0[0].checked == false)
document.wireless_basic.wds_1_encryp_key0.disabled = false;
else
document.wireless_basic.wds_1_encryp_key0.disabled = true;
} else
document.wireless_basic.wds_1_encryp_key0.disabled = true;
}
}

function WdsSecurity_disable(i)
{
if (i != -1) {
eval("document.wireless_basic.wds_encryp_type"+i+"[0]").disabled = true;
eval("document.wireless_basic.wds_encryp_type"+i+"[1]").disabled = true;
eval("document.wireless_basic.wds_encryp_type"+i+"[2]").disabled = true;
eval("document.wireless_basic.wds_encryp_type"+i+"[3]").disabled = true;
} else {
document.wireless_basic.wds_1_encryp_type0[0].disabled = true;
document.wireless_basic.wds_1_encryp_type0[1].disabled = true;
document.wireless_basic.wds_1_encryp_type0[2].disabled = true;
document.wireless_basic.wds_1_encryp_type0[3].disabled = true;
}
}

function WdsPeerMac_disable(i)
{
if (i != 0) {
eval("document.wireless_basic.peer"+i+"MAC1").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC2").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC3").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC4").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC5").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC6").disabled = true;
} else {
document.wireless_basic.wds_1_peer1MAC1.disabled = true;
document.wireless_basic.wds_1_peer1MAC2.disabled = true;
document.wireless_basic.wds_1_peer1MAC3.disabled = true;
document.wireless_basic.wds_1_peer1MAC4.disabled = true;
document.wireless_basic.wds_1_peer1MAC5.disabled = true;
document.wireless_basic.wds_1_peer1MAC6.disabled = true;
}
}

function WdsModeOnChange()
{
opmode = 1*opmode;
ap800_mode = 1*ap800_mode;

if(opmode == 0 && ap800_mode == 0){
document.getElementById("basicIsolatedLAN").style.display = "none";
document.getElementById("basicIsolatedLAN0").style.display = "none";
document.getElementById("isolated_lan0").style.display = "none";
document.getElementById("isolated_lan1").style.display = "none";
document.getElementById("isolated_lan2").style.display = "none";
document.getElementById("isolated_lan3").style.display = "none";
}

if (opmode == 0 && (ap800_mode == 2 || ap800_mode == 3)) {
document.wireless_basic.wds_encryp_type0.disabled = false;
document.wireless_basic.wds_encryp_type1.disabled = false;
document.wireless_basic.wds_encryp_type2.disabled = false;
document.wireless_basic.wds_encryp_type3.disabled = false;
if (ap800_mode == 2) {
document.wireless_basic.wds_vlan0.disabled = true;
document.getElementById("wdssubnet0").style.display = "none";
document.getElementById("wds_vlan0").style.display = "none";
document.wireless_basic.wds_vlan1.disabled = true;
document.getElementById("wdssubnet1").style.display = "none";
document.getElementById("wds_vlan1").style.display = "none";
document.wireless_basic.wds_vlan2.disabled = true;
document.getElementById("wdssubnet2").style.display = "none";
document.getElementById("wds_vlan2").style.display = "none";
document.wireless_basic.wds_vlan3.disabled = true;
document.getElementById("wdssubnet3").style.display = "none";
document.getElementById("wds_vlan3").style.display = "none";
}

if (ap800_mode == 3)
document.getElementById("note_wdsfull").style.display = "";

document.wireless_basic.wds_1_encryp_type0.disabled = true;
WdsSecurity_disable(-1);
WdsPeerMac_disable(0);
} else if (opmode == 0 && ap800_mode == 1) {
document.wireless_basic.wds_1_encryp_type0.disabled = false;

document.wireless_basic.wds_encryp_type0.disabled = true;
document.wireless_basic.wds_encryp_type1.disabled = true;
document.wireless_basic.wds_encryp_type2.disabled = true;
document.wireless_basic.wds_encryp_type3.disabled = true;
document.wireless_basic.wds_vlan0.disabled = true;
document.wireless_basic.wds_vlan1.disabled = true;
document.wireless_basic.wds_vlan2.disabled = true;
document.wireless_basic.wds_vlan3.disabled = true;

WdsSecurity_disable(0);
WdsSecurity_disable(1);
WdsSecurity_disable(2);
WdsSecurity_disable(3);
WdsPeerMac_disable(1);
WdsPeerMac_disable(2);
WdsPeerMac_disable(3);
WdsPeerMac_disable(4);
} else {
document.wireless_basic.wds_1_encryp_type0.disabled = true;
WdsSecurity_disable(-1);
WdsPeerMac_disable(0);

document.wireless_basic.wds_encryp_type0.disabled = true;
document.wireless_basic.wds_encryp_type1.disabled = true;
document.wireless_basic.wds_encryp_type2.disabled = true;
document.wireless_basic.wds_encryp_type3.disabled = true;
document.wireless_basic.wds_vlan0.disabled = true;
document.wireless_basic.wds_vlan1.disabled = true;
document.wireless_basic.wds_vlan2.disabled = true;
document.wireless_basic.wds_vlan3.disabled = true;

WdsSecurity_disable(0);
WdsSecurity_disable(1);
WdsSecurity_disable(2);
WdsSecurity_disable(3);
WdsPeerMac_disable(1);
WdsPeerMac_disable(2);
WdsPeerMac_disable(3);
WdsPeerMac_disable(4);
}

WdsSecurityOnChange(-1);
WdsSecurityOnChange(0);
WdsSecurityOnChange(1);
WdsSecurityOnChange(2);
WdsSecurityOnChange(3);
}

function initWDS()
{
var wdslistArray, wdspeerArray;
var wdsEncTypeArray;

opmode = 1*opmode;
ap800_mode = 1*ap800_mode;

if (opmode == 0 && (ap800_mode == 2 || ap800_mode == 3)) {
if (wdsEncrypType != "") {
wdsEncTypeArray = wdsEncrypType.split(";");
for (i = 1; i <= wdsEncTypeArray.length; i++) {
k = i - 1;
if (wdsEncTypeArray[k] == "NONE" || wdsEncTypeArray[k] == "none")
eval("document.wireless_basic.wds_encryp_type"+k+"[0]").checked = true;
else if (wdsEncTypeArray[k] == "WEP" || wdsEncTypeArray[k] == "wep")
eval("document.wireless_basic.wds_encryp_type"+k+"[1]").checked = true;
else if (wdsEncTypeArray[k] == "TKIP" || wdsEncTypeArray[k] == "tkip")
eval("document.wireless_basic.wds_encryp_type"+k+"[2]").checked = true;
else if (wdsEncTypeArray[k] == "AES" || wdsEncTypeArray[k] == "aes")
eval("document.wireless_basic.wds_encryp_type"+k+"[3]").checked = true;
}
}

for (i = 0; i < 4; i++) {
if (eval("wdsVlan"+i) != "")
eval("document.wireless_basic.wds_vlan"+i).options.selectedIndex = parseInt(eval("wdsVlan"+i)) - 1;
}

document.wireless_basic.wds_encryp_key0.value = wdsEncrypKey0;
document.wireless_basic.wds_encryp_key1.value = wdsEncrypKey1;
document.wireless_basic.wds_encryp_key2.value = wdsEncrypKey2;
document.wireless_basic.wds_encryp_key3.value = wdsEncrypKey3;

if (wdsList != "") {
wdslistArray = wdsList.split(";");
for (i = 1; i <= wdslistArray.length; i++) {
if (wdslistArray[i-1] == '')
continue;
wdspeerArray = wdslistArray[i-1].split(":");
eval("document.wireless_basic.peer"+i+"MAC1").value = wdspeerArray[0];
eval("document.wireless_basic.peer"+i+"MAC2").value = wdspeerArray[1];
eval("document.wireless_basic.peer"+i+"MAC3").value = wdspeerArray[2];
eval("document.wireless_basic.peer"+i+"MAC4").value = wdspeerArray[3];
eval("document.wireless_basic.peer"+i+"MAC5").value = wdspeerArray[4];
eval("document.wireless_basic.peer"+i+"MAC6").value = wdspeerArray[5];
}
}
} else if (opmode == 0 && ap800_mode == 1) {
if (wdsEncrypType != "") {
wdsEncTypeArray = wdsEncrypType.split(";");
if (wdsEncTypeArray[0] == "NONE" || wdsEncTypeArray[0] == "none")
document.wireless_basic.wds_1_encryp_type0[0].checked = true;
else if (wdsEncTypeArray[0] == "WEP" || wdsEncTypeArray[0] == "wep")
document.wireless_basic.wds_1_encryp_type0[1].checked = true;
else if (wdsEncTypeArray[0] == "TKIP" || wdsEncTypeArray[0] == "tkip")
document.wireless_basic.wds_1_encryp_type0[2].checked = true;
else if (wdsEncTypeArray[0] == "AES" || wdsEncTypeArray[0] == "aes")
document.wireless_basic.wds_1_encryp_type0[3].checked = true;
}

document.wireless_basic.wds_1_encryp_key0.value = wdsEncrypKey0;

if (wdsList != "") {
wdslistArray = wdsList.split(";");
if (wdslistArray[0] != '') {
wdspeerArray = wdslistArray[0].split(":");
document.wireless_basic.wds_1_peer1MAC1.value = wdspeerArray[0];
document.wireless_basic.wds_1_peer1MAC2.value = wdspeerArray[1];
document.wireless_basic.wds_1_peer1MAC3.value = wdspeerArray[2];
document.wireless_basic.wds_1_peer1MAC4.value = wdspeerArray[3];
document.wireless_basic.wds_1_peer1MAC5.value = wdspeerArray[4];
document.wireless_basic.wds_1_peer1MAC6.value = wdspeerArray[5];
}
}
}

WdsModeOnChange();
}

function initExtChannel()
{
var mChannel = parseInt(document.wireless_basic.sz11gChannel.value);
var e = document.getElementById("sz11gChText");
e.innerHTML = "";

switch(mChannel) {
case 0:
document.wireless_basic.sExtChannel.options.length = 0;
document.wireless_basic.sExtChannel.options[0] = new Option("AutoSelect", "0");
e.innerHTML = " (Best Channel: "+sChannelAuto+")";
break;
case 1:
case 2:
case 3:
case 4:
document.wireless_basic.sExtChannel.options.length = 0;
document.wireless_basic.sExtChannel.options[0] = new Option(ChannelList_24G[mChannel+3], "1");
break;
case 5:
case 6:
case 7:
document.wireless_basic.sExtChannel.options.length = 0;
document.wireless_basic.sExtChannel.options[0] = new Option(ChannelList_24G[mChannel-5], "0");
document.wireless_basic.sExtChannel.options[1] = new Option(ChannelList_24G[mChannel+3], "1");
break;
case 8:
document.wireless_basic.sExtChannel.options.length = 0;
document.wireless_basic.sExtChannel.options[0] = new Option(ChannelList_24G[mChannel-5], "0");
if ((countrycode == "JP") || (countrycode == "FR")) {
document.wireless_basic.sExtChannel.options[1] = new Option(ChannelList_24G[mChannel+3], "1");
}
break;
case 9:
document.wireless_basic.sExtChannel.options.length = 0;
document.wireless_basic.sExtChannel.options[0] = new Option(ChannelList_24G[mChannel-5], "0");
if ((countrycode == "JP") || (countrycode == "FR")) {
document.wireless_basic.sExtChannel.options[1] = new Option(ChannelList_24G[mChannel+3], "1");
}
break;
case 10:
document.wireless_basic.sExtChannel.options.length = 0;
document.wireless_basic.sExtChannel.options[0] = new Option(ChannelList_24G[5], "0");
if (countrycode == "JP") {
document.wireless_basic.sExtChannel.options[1] = new Option(ChannelList_24G[13], "1");
}
break;
case 11:
case 12:
case 13:
case 14:
document.wireless_basic.sExtChannel.options.length = 0;
document.wireless_basic.sExtChannel.options[0] = new Option(ChannelList_24G[mChannel-5], "0");
break;
}
}

function CheckWDSEncKey()
{
var key;
key = document.wireless_basic.wds_1_encryp_key0.value;

if (document.wireless_basic.wds_1_encryp_type0[1].checked == true) {
if (key.length == 10 || key.length == 26) {
var re = /[A-Fa-f0-9]{10,26}/;
if (!re.test(key)) {
alert("WDS Key should be a 10/26 hexdecimal or a 5/13 ascii");
document.wireless_basic.wds_1_encryp_key0.focus();
document.wireless_basic.wds_1_encryp_key0.select();
return false;
}
else
return true;
}
else if (key.length == 5 || key.length == 13) {
return true;
}
else {
alert("WDS Key should be a 10/26 hexdecimal or a 5/13 ascii");
document.wireless_basic.wds_1_encryp_key0.focus();
document.wireless_basic.wds_1_encryp_key0.select();
return false;
}
}
else if (document.wireless_basic.wds_1_encryp_type0[2].checked == true ||
document.wireless_basic.wds_1_encryp_type0[3].checked == true)
{
if (key.length < 8 || key.length > 64) {
alert("WDS Key should be with length 8~64");
document.wireless_basic.wds_1_encryp_key0.focus();
document.wireless_basic.wds_1_encryp_key0.select();
return false;
}
if (key.length == 64) {
var re = /[A-Fa-f0-9]{64}/;
if (!re.test(key)) {
alert("WDS Key should be a 64 hexdecimal");
document.wireless_basic.wds_1_encryp_key0.focus();
document.wireless_basic.wds_1_encryp_key0.select();
return false;
}
else
return true;
}
else
return true;
}
return true;
}

function CheckEncKey(i)
{
var key;
key = eval("document.wireless_basic.wds_encryp_key"+i).value;

if (eval("document.wireless_basic.wds_encryp_type"+i+"[1]").checked == true) {
if (key.length == 10 || key.length == 26) {
var re = /[A-Fa-f0-9]{10,26}/;
if (!re.test(key)) {
alert("WDS"+i+"Key should be a 10/26 hexdecimal or a 5/13 ascii");
eval("document.wireless_basic.wds_encryp_key"+i).focus();
eval("document.wireless_basic.wds_encryp_key"+i).select();
return false;
}
else
return true;
}
else if (key.length == 5 || key.length == 13) {
return true;
}
else {
alert("WDS"+(i+1)+" Key should be a 10/26 hexdecimal or a 5/13 ascii");
eval("document.wireless_basic.wds_encryp_key"+i).focus();
eval("document.wireless_basic.wds_encryp_key"+i).select();
return false;
}
}
else if (eval("document.wireless_basic.wds_encryp_type"+i+"[2]").checked == true ||
eval("document.wireless_basic.wds_encryp_type"+i+"[3]").checked == true)
{
if (key.length < 8 || key.length > 64) {
alert("WDS"+(i+1)+" Key should be with length 8~64");
eval("document.wireless_basic.wds_encryp_key"+i).focus();
eval("document.wireless_basic.wds_encryp_key"+i).select();
return false;
}
if (key.length == 64) {
var re = /[A-Fa-f0-9]{64}/;
if (!re.test(key)) {
alert("WDS"+(i+1)+" Key should be a 64 hexdecimal");
eval("document.wireless_basic.wds_encryp_key"+i).focus();
eval("document.wireless_basic.wds_encryp_key"+i).select();
return false;
}
else
return true;
}
else
return true;
}
return true;
}

function CheckWDSValue()
{
var all_wds_list, wds_peer_list;
var all_wds_enc_type = '';

opmode = 1*opmode;
ap800_mode = 1*ap800_mode;

if (opmode == 0 && (ap800_mode == 2 || ap800_mode == 3)) {
for (i = 0; i < 4; i++) {
if (eval("document.wireless_basic.wds_encryp_type"+i+"[0]").checked)
all_wds_enc_type += eval("document.wireless_basic.wds_encryp_type"+i+"[0].value");
else if (eval("document.wireless_basic.wds_encryp_type"+i+"[1]").checked)
all_wds_enc_type += eval("document.wireless_basic.wds_encryp_type"+i+"[1].value");
else if (eval("document.wireless_basic.wds_encryp_type"+i+"[2]").checked)
all_wds_enc_type += eval("document.wireless_basic.wds_encryp_type"+i+"[2].value");
else if (eval("document.wireless_basic.wds_encryp_type"+i+"[3]").checked)
all_wds_enc_type += eval("document.wireless_basic.wds_encryp_type"+i+"[3].value");

if (i != 3)
all_wds_enc_type += ";";
}
document.wireless_basic.wds_encryp_type.value = all_wds_enc_type;

if (!CheckEncKey(0) || !CheckEncKey(1) || !CheckEncKey(2) || !CheckEncKey(3))
return false;

all_wds_list = '';

var re = /[A-Fa-f0-9]{2}/;
for (i = 1; i <= 4; i++) {
wds_peer_list = '';
if ( (eval("document.wireless_basic.peer"+i+"MAC1").value +
eval("document.wireless_basic.peer"+i+"MAC2").value +
eval("document.wireless_basic.peer"+i+"MAC3").value +
eval("document.wireless_basic.peer"+i+"MAC4").value +
eval("document.wireless_basic.peer"+i+"MAC5").value +
eval("document.wireless_basic.peer"+i+"MAC6").value ) != "") {

for (j = 1; j <= 6; j++) {
if (eval("document.wireless_basic.peer"+i+"MAC"+j).value == "") {
alert("Please fill WDS remote AP MAC Address!");
eval("document.wireless_basic.peer"+i+"MAC"+j).focus();
eval("document.wireless_basic.peer"+i+"MAC"+j).select();
return false;
} else if (!re.test(eval("document.wireless_basic.peer"+i+"MAC"+j).value)) {
alert("Please fill WDS remote AP MAC Address in correct format!");
eval("document.wireless_basic.peer"+i+"MAC"+j).focus();
eval("document.wireless_basic.peer"+i+"MAC"+j).select();
return false;
} else {
wds_peer_list += eval("document.wireless_basic.peer"+i+"MAC"+j).value;
if (j != 6)
wds_peer_list += ':';
}
if (wds_peer_list == "00:00:00:00:00:00") {
alert("Mac address isn't valid.");
return false;
}
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

if (all_wds_list == "") {
alert("WDS remote AP MAC Address are empty !!!");
document.wireless_basic.peer1MAC1.focus();
document.wireless_basic.peer1MAC1.select();
return false;
} else {
document.wireless_basic.wds_list.value = all_wds_list;
for (i = 1; i <= 4; i++) {
eval("document.wireless_basic.peer"+i+"MAC1").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC2").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC3").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC4").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC5").disabled = true;
eval("document.wireless_basic.peer"+i+"MAC6").disabled = true;
}
}
} else if (opmode == 0 && ap800_mode == 1) {
if (document.wireless_basic.wds_1_encryp_type0[0].checked)
all_wds_enc_type += document.wireless_basic.wds_1_encryp_type0[0].value;
else if (document.wireless_basic.wds_1_encryp_type0[1].checked)
all_wds_enc_type += document.wireless_basic.wds_1_encryp_type0[1].value;
else if (document.wireless_basic.wds_1_encryp_type0[2].checked)
all_wds_enc_type += document.wireless_basic.wds_1_encryp_type0[2].value;
else if (document.wireless_basic.wds_1_encryp_type0[3].checked)
all_wds_enc_type += document.wireless_basic.wds_1_encryp_type0[3].value;

document.wireless_basic.wds_encryp_type.value = all_wds_enc_type;

if (!CheckWDSEncKey())
return false;

all_wds_list = '';

var re = /[A-Fa-f0-9]{2}/;
wds_peer_list = '';
if ( (document.wireless_basic.wds_1_peer1MAC1.value +
document.wireless_basic.wds_1_peer1MAC2.value +
document.wireless_basic.wds_1_peer1MAC3.value +
document.wireless_basic.wds_1_peer1MAC4.value +
document.wireless_basic.wds_1_peer1MAC5.value +
document.wireless_basic.wds_1_peer1MAC6.value ) != "") {

for (j = 1; j <= 6; j++) {
if (eval("document.wireless_basic.wds_1_peer1MAC"+j).value == "") {
alert("Please fill WDS remote AP MAC Address!");
eval("document.wireless_basic.wds_1_peer1MAC"+j).focus();
eval("document.wireless_basic.wds_1_peer1MAC"+j).select();
return false;
} else if (!re.test(eval("document.wireless_basic.wds_1_peer1MAC"+j).value)) {
alert("Please fill WDS remote AP MAC Address in correct format!");
eval("document.wireless_basic.wds_1_peer1MAC"+j).focus();
eval("document.wireless_basic.wds_1_peer1MAC"+j).select();
return false;
} else {
wds_peer_list += eval("document.wireless_basic.wds_1_peer1MAC"+j).value;
if (j != 6)
wds_peer_list += ':';
}
}
}

all_wds_list += wds_peer_list + ';';
if (all_wds_list == "") {
alert("WDS remote AP MAC Address are empty !!!");
document.wireless_basic.wds_1_peer1MAC1.focus();
document.wireless_basic.wds_1_peer1MAC1.select();
return false;
} else {
document.wireless_basic.wds_list.value = all_wds_list;
document.wireless_basic.wds_1_peer1MAC1.disabled = true;
document.wireless_basic.wds_1_peer1MAC2.disabled = true;
document.wireless_basic.wds_1_peer1MAC3.disabled = true;
document.wireless_basic.wds_1_peer1MAC4.disabled = true;
document.wireless_basic.wds_1_peer1MAC5.disabled = true;
document.wireless_basic.wds_1_peer1MAC6.disabled = true;
}
} else {
document.wireless_basic.wds_encryp_type.value = "";
document.wireless_basic.wds_list.value = "";
}

return true;
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

function Check5GBandChannelException()
{
var w_mode = document.wireless_basic.wirelessmode.options.selectedIndex;

if ((1*w_mode == 7) || (1*w_mode == 8))
{
var x = document.getElementById("sz11aChannel")
var current_length = document.wireless_basic.sz11aChannel.options.length;
var current_index = document.wireless_basic.sz11aChannel.options.selectedIndex;
var current_channel = document.wireless_basic.sz11aChannel.value;

if (1*current_index == 0)
{
if (1*channel_index != 0)
current_index = 1;
}

for (ch_idx = current_length - 1; ch_idx > 0; ch_idx--)
{
x.remove(ch_idx);
}

if (document.wireless_basic.n_bandwidth[1].checked == true)
{
if ((countrycode == 'NONE') || (countrycode == 'FR') || (countrycode == 'US') ||
(countrycode == 'IE') || (countrycode == 'JP') || (countrycode == 'HK'))
{
for(ch = 36; ch <= 48; ch+=4)
insertChannelOption(ch, 5);
}

if ((countrycode == 'NONE') || (countrycode == 'FR') || (countrycode == 'US') ||
(countrycode == 'IE') || (countrycode == 'TW') || (countrycode == 'HK'))
{
for(ch = 52; ch <= 64; ch+=4)
insertChannelOption(ch, 5);
}

if (countrycode == 'NONE')
{
for(ch = 100; ch <= 136; ch+=4)
insertChannelOption(ch, 5);
}

if ((countrycode == 'NONE') || (countrycode == 'US') || (countrycode == 'TW') ||
(countrycode == 'CN') || (countrycode == 'HK'))
{
for(ch = 149; ch <= 161; ch+=4)
insertChannelOption(ch, 5);
}

if ((1*current_channel == 140) || (1*current_channel == 165))
{
document.wireless_basic.sz11aChannel.options.selectedIndex = (1*current_index) -1;
}
else
{
document.wireless_basic.sz11aChannel.options.selectedIndex = (1*current_index);
}
}
else
{
if ((countrycode == 'NONE') || (countrycode == 'FR') || (countrycode == 'US') ||
(countrycode == 'IE') || (countrycode == 'JP') || (countrycode == 'HK'))
{
for(ch = 36; ch <= 48; ch+=4)
insertChannelOption(ch, 5);
}

if ((countrycode == 'NONE') || (countrycode == 'FR') || (countrycode == 'US') ||
(countrycode == 'IE') || (countrycode == 'TW') || (countrycode == 'HK'))
{
for(ch = 52; ch <= 64; ch+=4)
insertChannelOption(ch, 5);
}

if (countrycode == 'NONE')
{
for(ch = 100; ch <= 140; ch+=4)
insertChannelOption(ch, 5);
}

if ((countrycode == 'NONE') || (countrycode == 'US') || (countrycode == 'TW') ||
(countrycode == 'CN') || (countrycode == 'HK'))
{
for(ch = 149; ch <= 161; ch+=4)
insertChannelOption(ch, 5);
}

if ((countrycode == 'NONE') || (countrycode == 'US') ||
(countrycode == 'CN') || (countrycode == 'HK'))
{
insertChannelOption(165, 5);
}

document.wireless_basic.sz11aChannel.options.selectedIndex = (1*current_index);
}
}
else if (1*w_mode == 6)
{
var x = document.getElementById("sz11aChannel")
var current_length = document.wireless_basic.sz11aChannel.options.length;
var current_index = document.wireless_basic.sz11aChannel.options.selectedIndex;

for (ch_idx = current_length - 1; ch_idx > 0; ch_idx--)
{
x.remove(ch_idx);
}

if ((countrycode == 'NONE') || (countrycode == 'FR') || (countrycode == 'US') ||
(countrycode == 'IE') || (countrycode == 'JP') || (countrycode == 'HK'))
{
for(ch = 36; ch <= 48; ch+=4)
insertChannelOption(ch, 5);
}

if ((countrycode == 'NONE') || (countrycode == 'FR') || (countrycode == 'US') ||
(countrycode == 'IE') || (countrycode == 'TW') || (countrycode == 'HK'))
{
for(ch = 52; ch <= 64; ch+=4)
insertChannelOption(ch, 5);
}

if (countrycode == 'NONE')
{
for(ch = 100; ch <= 140; ch+=4)
insertChannelOption(ch, 5);
}

if ((countrycode == 'NONE') || (countrycode == 'US') || (countrycode == 'TW') ||
(countrycode == 'CN') || (countrycode == 'HK'))
{
for(ch = 149; ch <= 161; ch+=4)
insertChannelOption(ch, 5);
}

if ((countrycode == 'NONE') || (countrycode == 'US') ||
(countrycode == 'CN') || (countrycode == 'HK'))
{
insertChannelOption(165, 5);
}

document.wireless_basic.sz11aChannel.options.selectedIndex = (1*current_index);
}
}

function initTranslation()
{
var e = document.getElementById("basicTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("basic title");

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
e = document.getElementById("inetMacClone");
e.innerHTML = _("inet mac clone");
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
//	e = document.getElementById("basicSSID4Title");
//	e.innerHTML = _("basic ssid4 title");
//	e = document.getElementById("basicSSID4Intro");
//	e.innerHTML = _("basic ssid4 intro");

e = document.getElementById("basicFreqA");
e.innerHTML = _("basic frequency");
e = document.getElementById("basicFreqAAuto");
e.innerHTML = _("basic frequency auto");
e = document.getElementById("basicFreqB");
e.innerHTML = _("basic frequency");
e = document.getElementById("basicFreqBAuto");
e.innerHTML = _("basic frequency auto");
e = document.getElementById("basicFreqG");
e.innerHTML = _("basic frequency");
e = document.getElementById("basicFreqGAuto");
e.innerHTML = _("basic frequency auto");
e = document.getElementById("basicRate");
e.innerHTML = _("basic rate");
e = document.getElementById("basicPkt");
e.innerHTML = _("basic pkt");
e = document.getElementById("basicPktTxBurst");
e.innerHTML = _("basic pkt burst");
e = document.getElementById("basicPktNote");
e.innerHTML = _("basic note");
e = document.getElementById("basicPktStr1");
e.innerHTML = _("basic pkt str1");
e = document.getElementById("basicPktStr2");
e.innerHTML = _("basic pkt str2");
e = document.getElementById("basicExtChn");
e.innerHTML = _("basic ext channel");

//	e = document.getElementById("wmmCapable");
//	e.innerHTML = _("wmm capable");
//	e = document.getElementById("wmmEnable");
//	e.innerHTML = _("wireless enable");
//	e = document.getElementById("wmmDisable");
//	e.innerHTML = _("wireless disable");

e = document.getElementById("bscAntenna");
e.innerHTML = _("basic antenna");
e = document.getElementById("basicNote");
e.innerHTML = _("basic note");
e = document.getElementById("TRNote");
e.innerHTML = _("basic antenna note");
e = document.getElementById("bscTxPower");
e.innerHTML = _("basic tx power");
e = document.getElementById("bscChnWth");
e.innerHTML = _("basic channel width");
e = document.getElementById("chn_wth_auto");
e.innerHTML = _("basic channel width auto");
e = document.getElementById("chn_wth_20");
e.innerHTML = _("basic channel width 20");

e = document.getElementById("basicApply");
e.value = _("wireless apply");
e = document.getElementById("basicCancel");
e.value = _("wireless cancel");
}

function initValue()
{
var ssidArray;
var HiddenSSIDArray;
var channel_11a_index;
var current_channel_length;
var wdth;

initTranslation();
if (countrycode == '')
countrycode = 'NONE';

document.getElementById("div_11a_channel").style.visibility = "hidden";
document.getElementById("div_11a_channel").style.display = "none";
document.wireless_basic.sz11aChannel.disabled = true;
document.getElementById("div_11b_channel").style.visibility = "hidden";
document.getElementById("div_11b_channel").style.display = "none";
document.wireless_basic.sz11bChannel.disabled = true;
document.getElementById("div_11g_channel").style.visibility = "hidden";
document.getElementById("div_11g_channel").style.display = "none";
document.wireless_basic.sz11gChannel.disabled = true;
document.getElementById("div_n_extChannel").style.visibility = "hidden";
document.getElementById("div_n_extChannel").style.display = "none";
document.wireless_basic.sExtChannel.disabled = true;

if ((opmode != '0' || '<% getDpbSta(); %>' != '1' || '<% getCfgZero(1, "ethConvert"); %>' != '1') && opmode != '2' &&
ap800_mode != '1' && ap800_mode != '2')	// refer to treeapp.asp. show client limit settings only when page stainfo.asp is available. G38664
showElmtByClass(document, "tr", "client_limit_clomn");
//$('tr.client_limit_clomn').show();

PhyMode = 1*PhyMode;

if (channel_width == '0' && sExtChannel == '0') {
wdth = 1;
document.wireless_basic.chn_wth[0].checked = false;
document.wireless_basic.chn_wth[1].checked = true;
} else {
wdth = 0;
document.wireless_basic.chn_wth[0].checked = true;
document.wireless_basic.chn_wth[1].checked = false;
}

if ((rfic == "2") || (rfic == "4")) {
document.wireless_basic.wirelessmode.options[6] = new Option("11a only", "2");
document.wireless_basic.wirelessmode.options[7] = new Option("11a/n mixed mode", "8");
document.wireless_basic.wirelessmode.options[8] = new Option("11n only(5G)", "11");
}
if ((PhyMode == 0) || (PhyMode == 4) || (PhyMode == 9) || (PhyMode == 6) || (PhyMode == 7))
{
if (PhyMode == 0)
document.wireless_basic.wirelessmode.options.selectedIndex = 3;
else if (PhyMode == 4)
document.wireless_basic.wirelessmode.options.selectedIndex = 1;
else if (PhyMode == 9)
document.wireless_basic.wirelessmode.options.selectedIndex = 5;
else if (PhyMode == 6)
document.wireless_basic.wirelessmode.options.selectedIndex = 2;
else if (PhyMode == 7)
document.wireless_basic.wirelessmode.options.selectedIndex = 4;
if (PhyMode == 9 || PhyMode == 6 || PhyMode == 7) {
if (wdth == 0) {
document.getElementById("div_n_extChannel").style.visibility = "visible";
document.getElementById("div_n_extChannel").style.display = style_display_on();
document.wireless_basic.sExtChannel.disabled = false;
}
}

document.getElementById("div_11g_channel").style.visibility = "visible";
document.getElementById("div_11g_channel").style.display = style_display_on();
document.wireless_basic.sz11gChannel.disabled = false;
}
else if (PhyMode == 1)
{
document.wireless_basic.wirelessmode.options.selectedIndex = 0;
document.getElementById("div_11b_channel").style.visibility = "visible";
document.getElementById("div_11b_channel").style.display = style_display_on();
document.wireless_basic.sz11bChannel.disabled = false;
}
else if ((PhyMode == 2) || (PhyMode == 8) || (PhyMode == 11))
{
if (PhyMode == 2)
document.wireless_basic.wirelessmode.options.selectedIndex = 6;
else if (PhyMode == 8) {
document.wireless_basic.wirelessmode.options.selectedIndex = 7;
if (wdth == 0) {
document.getElementById("div_n_extChannel").style.visibility = "visible";
document.getElementById("div_n_extChannel").style.display = style_display_on();
document.wireless_basic.sExtChannel.disabled = false;
}
}
else if (PhyMode == 11) {
document.wireless_basic.wirelessmode.options.selectedIndex = 8;
if (wdth == 0) {
document.getElementById("div_n_extChannel").style.visibility = "visible";
document.getElementById("div_n_extChannel").style.display = style_display_on();
document.wireless_basic.sExtChannel.disabled = false;
}
}
document.getElementById("div_11a_channel").style.visibility = "visible";
document.getElementById("div_11a_channel").style.display = style_display_on();
document.wireless_basic.sz11aChannel.disabled = false;
}

for (i=1;i<4;i++)
{
var ssid = eval("document.wireless_basic.mssid_"+i+".disabled");
var div = eval("document.getElementById(\"div_hssid"+i+"\").style");

div.visibility = "hidden";
div.display = "none";
ssid = true;
document.wireless_basic.hssid[i].disabled = true;
}
if (mssidb == "1")
{
for (i=1;i<4;i++)
{
var ssid = eval("document.wireless_basic.mssid_"+i+".disabled");
var div = eval("document.getElementById(\"div_hssid"+i+"\").style");

div.visibility = "visible";
div.display = style_display_on();
ssid = false;
document.wireless_basic.hssid[i].disabled = false;
}
}

var HiddenSSIDArray = HiddenSSID.split(";");
for (i=0;i<4;i++)
{
if (HiddenSSIDArray[i] == "1")
document.wireless_basic.hssid[i].checked = true;
else
document.wireless_basic.hssid[i].checked = false;
}

var APIsolatedArray = APIsolated.split(";");
for (i=0;i<4;i++)
{
if (APIsolatedArray[i] == "1")
document.wireless_basic.isolated_ssid[i].checked = true;
else
document.wireless_basic.isolated_ssid[i].checked = false;
}

// wireless mac clone
if (MacCloneEnabled1 == "1")
document.wireless_basic.mac_clone_enabled.checked = true;
else
document.wireless_basic.mac_clone_enabled.checked = false;

opmode = 1*opmode;
ap800_mode = 1*ap800_mode;

if (opmode == 0) {
switch (ap800_mode) {
case 0:
document.getElementById("wds_config").style.display = "none";
break;
case 1:
document.getElementById("ssid_vlan").style.display = "none";
document.getElementById("wds_full").style.display = "none";
break;
case 2:
document.getElementById("ssid_vlan").style.display = "none";
document.getElementById("wds_one").style.display = "none";
break;
case 3:
document.getElementById("wds_one").style.display = "none";
break;
default:
break;
}
} else if (opmode == 3)
document.getElementById("wds_config").style.display = "none";

initWDS();

channel_index = 1*channel_index;

if ((PhyMode == 0) || (PhyMode == 4) || (PhyMode == 9) || (PhyMode == 6) || (PhyMode == 7))
{
document.wireless_basic.sz11gChannel.options.selectedIndex = channel_index;

current_channel_length = document.wireless_basic.sz11gChannel.options.length;

if ((channel_index + 1) > current_channel_length)
document.wireless_basic.sz11gChannel.options.selectedIndex = 0;
}
else if (PhyMode == 1)
{
document.wireless_basic.sz11bChannel.options.selectedIndex = channel_index;

current_channel_length = document.wireless_basic.sz11bChannel.options.length;

if ((channel_index + 1) > current_channel_length)
document.wireless_basic.sz11bChannel.options.selectedIndex = 0;
}
else if ((PhyMode == 2) || (PhyMode == 8) || (PhyMode == 11))
{
if (countrycode == 'NONE')
{
if (channel_index <= 64)
{
channel_11a_index = channel_index;
channel_11a_index = channel_11a_index / 4;
if (channel_11a_index != 0)
channel_11a_index = channel_11a_index - 8;
}
else if ((channel_index >= 100) && (channel_index <= 140))
{
channel_11a_index = channel_index;
channel_11a_index = channel_11a_index / 4;
channel_11a_index = channel_11a_index - 16;
}
else if (channel_index >= 149)
{
channel_11a_index = channel_index - 1;
channel_11a_index = channel_11a_index / 4;
channel_11a_index = channel_11a_index - 17;
}
else
{
channel_11a_index = 0;
}
}
else if ((countrycode == 'US') || (countrycode == 'HK') || (countrycode == 'FR') || (countrycode == 'IE'))
{
if (channel_index <= 64)
{
channel_11a_index = channel_index;
channel_11a_index = channel_11a_index / 4;
if (channel_11a_index != 0)
channel_11a_index = channel_11a_index - 8;
}
else if (channel_index >= 149)
{
channel_11a_index = channel_index - 1;
channel_11a_index = channel_11a_index / 4;
channel_11a_index = channel_11a_index - 28;
}
else
{
channel_11a_index = 0;
}
}
else if (countrycode == 'JP')
{
if (channel_index <= 48)
{
channel_11a_index = channel_index;
channel_11a_index = channel_11a_index / 4;
if (channel_11a_index != 0)
channel_11a_index = channel_11a_index - 8;
}
else
{
channel_11a_index = 0;
}
}
else if (countrycode == 'TW')
{
if (channel_index <= 64)
{
channel_11a_index = channel_index;
channel_11a_index = channel_11a_index / 4;
if (channel_11a_index != 0)
channel_11a_index = channel_11a_index - 12;
}
else if (channel_index >= 149)
{
channel_11a_index = channel_index - 1;
channel_11a_index = channel_11a_index / 4;
channel_11a_index = channel_11a_index - 32;
}
else
{
channel_11a_index = 0;
}
}
else if (countrycode == 'CN')
{
if (channel_index >= 149)
{
channel_11a_index = channel_index - 1;
channel_11a_index = channel_11a_index / 4;
channel_11a_index = channel_11a_index - 36;
}
else
{
channel_11a_index = 0;
}
}
else
{
channel_11a_index = 0;
}

Check5GBandChannelException();

if (channel_index > 0)
document.wireless_basic.sz11aChannel.options.selectedIndex = channel_11a_index;
else
document.wireless_basic.sz11aChannel.options.selectedIndex = channel_index;
}

//ABG Rate
if ((PhyMode == 0) || (PhyMode == 2) || (PhyMode == 4))
{
ht_mcs = 1*ht_mcs;
document.wireless_basic.abg_rate.options.length = 0;
document.wireless_basic.abg_rate.options[0] = new Option("Auto", "0");
document.wireless_basic.abg_rate.options[1] = new Option("1 Mbps", "1");
document.wireless_basic.abg_rate.options[2] = new Option("2 Mbps", "2");
document.wireless_basic.abg_rate.options[3] = new Option("5.5 Mbps", "5");
document.wireless_basic.abg_rate.options[4] = new Option("6 Mbps", "6");
document.wireless_basic.abg_rate.options[5] = new Option("9 Mbps", "9");
document.wireless_basic.abg_rate.options[6] = new Option("11 Mbps", "11");
document.wireless_basic.abg_rate.options[7] = new Option("12 Mbps", "12");
document.wireless_basic.abg_rate.options[8] = new Option("18 Mbps", "18");
document.wireless_basic.abg_rate.options[9] = new Option("24 Mbps", "24");
document.wireless_basic.abg_rate.options[10] = new Option("36 Mbps", "36");
document.wireless_basic.abg_rate.options[11] = new Option("48 Mbps", "48");
document.wireless_basic.abg_rate.options[12] = new Option("54 Mbps", "54");
if (fxtxmode == "CCK" || fxtxmode == "cck") {
if (ht_mcs == 0)
document.wireless_basic.abg_rate.options.selectedIndex = 1;
else if (ht_mcs == 1)
document.wireless_basic.abg_rate.options.selectedIndex = 2;
else if (ht_mcs == 2)
document.wireless_basic.abg_rate.options.selectedIndex = 3;
else if (ht_mcs == 3)
document.wireless_basic.abg_rate.options.selectedIndex = 6;
else
document.wireless_basic.abg_rate.options.selectedIndex = 0;
}
else {
if (ht_mcs == 0)
document.wireless_basic.abg_rate.options.selectedIndex = 4;
else if (ht_mcs == 1)
document.wireless_basic.abg_rate.options.selectedIndex = 5;
else if (ht_mcs == 2)
document.wireless_basic.abg_rate.options.selectedIndex = 7;
else if (ht_mcs == 3)
document.wireless_basic.abg_rate.options.selectedIndex = 8;
else if (ht_mcs == 4)
document.wireless_basic.abg_rate.options.selectedIndex = 9;
else if (ht_mcs == 5)
document.wireless_basic.abg_rate.options.selectedIndex = 10;
else if (ht_mcs == 6)
document.wireless_basic.abg_rate.options.selectedIndex = 11;
else if (ht_mcs == 7)
document.wireless_basic.abg_rate.options.selectedIndex = 12;
else
document.wireless_basic.abg_rate.options.selectedIndex = 0;
}
}
else if (PhyMode == 1)
{
ht_mcs = 1*ht_mcs;
document.wireless_basic.abg_rate.options.length = 0;
document.wireless_basic.abg_rate.options[0] = new Option("Auto", "0");
document.wireless_basic.abg_rate.options[1] = new Option("1 Mbps", "1");
document.wireless_basic.abg_rate.options[2] = new Option("2 Mbps", "2");
document.wireless_basic.abg_rate.options[3] = new Option("5.5 Mbps", "5");
document.wireless_basic.abg_rate.options[4] = new Option("11 Mbps", "11");
if (ht_mcs == 0)
document.wireless_basic.abg_rate.options.selectedIndex = 1;
else if (ht_mcs == 1)
document.wireless_basic.abg_rate.options.selectedIndex = 2;
else if (ht_mcs == 2)
document.wireless_basic.abg_rate.options.selectedIndex = 3;
else if (ht_mcs == 3)
document.wireless_basic.abg_rate.options.selectedIndex = 4;
else
document.wireless_basic.abg_rate.options.selectedIndex = 0;
}
else
{
document.getElementById("div_abg_rate").style.visibility = "hidden";
document.getElementById("div_abg_rate").style.display = "none";
document.wireless_basic.abg_rate.disabled = true;
}
if (radio_off == 1)
document.wireless_basic.radioButton.checked = false;
else
document.wireless_basic.radioButton.checked = true;

client_limit_enable = 1*client_limit_enable;
if (client_limit_enable == 1)
document.wireless_basic.client_limit_enable.checked = true;
else
document.wireless_basic.client_limit_enable.checked = false;

if (!client_limit){
document.wireless_basic.client_limit.value = "64";
} else {
document.wireless_basic.client_limit.value = client_limit;
}
txBurst = 1*txBurst;
if (txBurst == 1)
document.wireless_basic.tx_burst.checked = true;
else
document.wireless_basic.tx_burst.checked = false;

macCloneSwitch();

//	if (wmmCapable.indexOf("1") >= 0){
//		document.wireless_basic.wmm_capable[0].checked = true;
//		document.wireless_basic.wmm_capable[1].checked = false;
//	}else{
//		document.wireless_basic.wmm_capable[0].checked = false;
//		document.wireless_basic.wmm_capable[1].checked = true;
//	}

if (vlan_enable == "1") {
document.wireless_basic.vlan_enable.checked = true;
setVle2Elmt(document.wireless_basic.ssid_vlan1, ssid_vlan1);
setVle2Elmt(document.wireless_basic.ssid_vlan2, ssid_vlan2);
setVle2Elmt(document.wireless_basic.ssid_vlan3, ssid_vlan3);
setVle2Elmt(document.wireless_basic.ssid_vlan4, ssid_vlan4);
} else {
document.wireless_basic.vlan_enable.checked = false;
}
enableVLAN();
initExtChannel();
onChg11bChannel();
onChg11aChannel();

var sExt_select = eval("document.getElementById('sExtChannel')");
setVle2Elmt(sExt_select, sExtChannel);

document.getElementById('TRStream').value = TRStream;
document.getElementById('tx_power').value = tx_power;
onChgAntenna();

if (WLIsolate == "") WLIsolate = "0;0;0;0";
if (WLVlanId == "") WLVlanId = "0;0;0;0";
var isolated_lans = WLIsolate.split(";");
var vlans_id = WLVlanId.split(";");

for (var i=0;i<4;i++) {
if (isolated_lans[i] == 0)
document.wireless_basic.isolated_lan[i].checked = false;
else
document.wireless_basic.isolated_lan[i].checked = true;
eval("document.wireless_basic.vlan_id"+i).value = vlans_id[i];
onClkIsoLan(i);
}
}

function wirelessModeChange()
{
var wmode, chn_wth;

document.getElementById("div_11a_channel").style.visibility = "hidden";
document.getElementById("div_11a_channel").style.display = "none";
document.wireless_basic.sz11aChannel.disabled = true;
document.getElementById("div_11b_channel").style.visibility = "hidden";
document.getElementById("div_11b_channel").style.display = "none";
document.wireless_basic.sz11bChannel.disabled = true;
document.getElementById("div_11g_channel").style.visibility = "hidden";
document.getElementById("div_11g_channel").style.display = "none";
document.wireless_basic.sz11gChannel.disabled = true;
document.getElementById("div_abg_rate").style.visibility = "hidden";
document.getElementById("div_abg_rate").style.display = "none";
document.wireless_basic.abg_rate.disabled = true;
document.getElementById("div_n_extChannel").style.visibility = "hidden";
document.getElementById("div_n_extChannel").style.display = "none";
document.wireless_basic.sExtChannel.disabled = true;

wmode = document.wireless_basic.wirelessmode.options.selectedIndex;
if (document.wireless_basic.chn_wth[0].checked)
chn_wth = 0;
else
chn_wth = 1;


wmode = 1*wmode;
if (wmode == 0)
{
document.getElementById("div_11b_channel").style.visibility = "visible";
document.getElementById("div_11b_channel").style.display = style_display_on();
document.wireless_basic.sz11bChannel.disabled = false;
}
else if (wmode == 1)
{
document.getElementById("div_11g_channel").style.visibility = "visible";
document.getElementById("div_11g_channel").style.display = style_display_on();
document.wireless_basic.sz11gChannel.disabled = false;
}
else if (wmode == 2)
{
document.wireless_basic.wirelessmode.options.selectedIndex = 2;
document.getElementById("div_11g_channel").style.visibility = "visible";
document.getElementById("div_11g_channel").style.display = style_display_on();
document.wireless_basic.sz11gChannel.disabled = false;
if (chn_wth == 0) {
document.getElementById("div_n_extChannel").style.visibility = "visible";
document.getElementById("div_n_extChannel").style.display = style_display_on();
document.wireless_basic.sExtChannel.disabled = false;
}
}
else if ((wmode == 3) || (wmode == 4) || (wmode == 5))
{
if ((wmode == 4) || (wmode == 5)) {
if (wmode == 4)
document.wireless_basic.wirelessmode.options.selectedIndex = 4;
else
document.wireless_basic.wirelessmode.options.selectedIndex = 5;
if (chn_wth == 0) {
document.getElementById("div_n_extChannel").style.visibility = "visible";
document.getElementById("div_n_extChannel").style.display = style_display_on();
document.wireless_basic.sExtChannel.disabled = false;
}
}
else
document.wireless_basic.wirelessmode.options.selectedIndex = 3;
document.getElementById("div_11g_channel").style.visibility = "visible";
document.getElementById("div_11g_channel").style.display = style_display_on();
document.wireless_basic.sz11gChannel.disabled = false;
}
else if (wmode == 6)
{
document.wireless_basic.wirelessmode.options.selectedIndex = 6;
document.getElementById("div_11a_channel").style.visibility = "visible";
document.getElementById("div_11a_channel").style.display = style_display_on();
document.wireless_basic.sz11aChannel.disabled = false;

Check5GBandChannelException();
}
else if ((wmode == 7) || (wmode == 8))
{
if (wmode == 7)
document.wireless_basic.wirelessmode.options.selectedIndex = 7;
else
document.wireless_basic.wirelessmode.options.selectedIndex = 8;
document.getElementById("div_11a_channel").style.visibility = "visible";
document.getElementById("div_11a_channel").style.display = style_display_on();
document.wireless_basic.sz11aChannel.disabled = false;
if (chn_wth == 0) {
document.getElementById("div_n_extChannel").style.visibility = "visible";
document.getElementById("div_n_extChannel").style.display = style_display_on();
document.wireless_basic.sExtChannel.disabled = false;
}

Check5GBandChannelException();
}

//ABG Rate
if ((wmode == 1) || (wmode == 3) || (wmode == 6))
{
ht_mcs = 1*ht_mcs;
document.wireless_basic.abg_rate.options.length = 0;
document.wireless_basic.abg_rate.options[0] = new Option("Auto", "0");
document.wireless_basic.abg_rate.options[1] = new Option("1 Mbps", "1");
document.wireless_basic.abg_rate.options[2] = new Option("2 Mbps", "2");
document.wireless_basic.abg_rate.options[3] = new Option("5.5 Mbps", "5");
document.wireless_basic.abg_rate.options[4] = new Option("6 Mbps", "6");
document.wireless_basic.abg_rate.options[5] = new Option("9 Mbps", "9");
document.wireless_basic.abg_rate.options[6] = new Option("11 Mbps", "11");
document.wireless_basic.abg_rate.options[7] = new Option("12 Mbps", "12");
document.wireless_basic.abg_rate.options[8] = new Option("18 Mbps", "18");
document.wireless_basic.abg_rate.options[9] = new Option("24 Mbps", "24");
document.wireless_basic.abg_rate.options[10] = new Option("36 Mbps", "36");
document.wireless_basic.abg_rate.options[11] = new Option("48 Mbps", "48");
document.wireless_basic.abg_rate.options[12] = new Option("54 Mbps", "54");
if (fxtxmode == "CCK" || fxtxmode == "cck") {
if (ht_mcs == 0)
document.wireless_basic.abg_rate.options.selectedIndex = 1;
else if (ht_mcs == 1)
document.wireless_basic.abg_rate.options.selectedIndex = 2;
else if (ht_mcs == 2)
document.wireless_basic.abg_rate.options.selectedIndex = 3;
else if (ht_mcs == 3)
document.wireless_basic.abg_rate.options.selectedIndex = 6;
else
document.wireless_basic.abg_rate.options.selectedIndex = 0;
}
else {
if (ht_mcs == 0)
document.wireless_basic.abg_rate.options.selectedIndex = 4;
else if (ht_mcs == 1)
document.wireless_basic.abg_rate.options.selectedIndex = 5;
else if (ht_mcs == 2)
document.wireless_basic.abg_rate.options.selectedIndex = 7;
else if (ht_mcs == 3)
document.wireless_basic.abg_rate.options.selectedIndex = 8;
else if (ht_mcs == 4)
document.wireless_basic.abg_rate.options.selectedIndex = 9;
else if (ht_mcs == 5)
document.wireless_basic.abg_rate.options.selectedIndex = 10;
else if (ht_mcs == 6)
document.wireless_basic.abg_rate.options.selectedIndex = 11;
else if (ht_mcs == 7)
document.wireless_basic.abg_rate.options.selectedIndex = 12;
else
document.wireless_basic.abg_rate.options.selectedIndex = 0;
}

document.getElementById("div_abg_rate").style.visibility = "visible";
document.getElementById("div_abg_rate").style.display = style_display_on();
document.wireless_basic.abg_rate.disabled = false;
}
else if (wmode == 0)
{
ht_mcs = 1*ht_mcs;
document.wireless_basic.abg_rate.options.length = 0;
document.wireless_basic.abg_rate.options[0] = new Option("Auto", "0");
document.wireless_basic.abg_rate.options[1] = new Option("1 Mbps", "1");
document.wireless_basic.abg_rate.options[2] = new Option("2 Mbps", "2");
document.wireless_basic.abg_rate.options[3] = new Option("5.5 Mbps", "5");
document.wireless_basic.abg_rate.options[4] = new Option("11 Mbps", "11");
if (ht_mcs == 0)
document.wireless_basic.abg_rate.options.selectedIndex = 1;
else if (ht_mcs == 1)
document.wireless_basic.abg_rate.options.selectedIndex = 2;
else if (ht_mcs == 2)
document.wireless_basic.abg_rate.options.selectedIndex = 3;
else if (ht_mcs == 3)
document.wireless_basic.abg_rate.options.selectedIndex = 4;
else
document.wireless_basic.abg_rate.options.selectedIndex = 0;

document.getElementById("div_abg_rate").style.visibility = "visible";
document.getElementById("div_abg_rate").style.display = style_display_on();
document.wireless_basic.abg_rate.disabled = false;
}
}

function onChg11gChannel()
{
initExtChannel();
}
function onChg11bChannel()
{
var mChannel = parseInt(document.wireless_basic.sz11bChannel.value);
var e = document.getElementById("sz11bChText");
e.innerHTML = "";

if(mChannel==0)
e.innerHTML = " (Best Channel: "+sChannelAuto+")";
}
function onChg11aChannel()
{
var mChannel = parseInt(document.wireless_basic.sz11aChannel.value);
var e = document.getElementById("sz11aChText");
e.innerHTML = "";

if(mChannel==0)
e.innerHTML = " (Best Channel: "+sChannelAuto+")";
}

function onChgAntenna()
{
if (document.getElementById('TRStream').value == '1')
document.getElementById('atnArea').style.display = 'inline';
else
document.getElementById('atnArea').style.display = 'none';
}

function onClkIsoLan(idx)
{
var f = document.wireless_basic;
if (f.isolated_lan[idx].checked) {
eval("f.vlan_id"+idx).disabled = true;
} else {
eval("f.vlan_id"+idx).disabled = false;
}
}

function CheckValue()
{
var submit_ssid_num;
var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
var re2 = /.[ACEace02468]:..:..:..:..:.[08]/;	// the eighth bit is the multicast bit, must not be 1, and the last byte must be a multiple of 8

if (document.wireless_basic.ssid.value == "")
{
alert("Please enter SSID!");
document.wireless_basic.ssid.focus();
document.wireless_basic.ssid.select();
return false;
}
if (document.wireless_basic.mac_clone_enabled.checked) {
if (document.wireless_basic.mac_clone_mac1.value.length == 0) {
alert("MAC Address should not be empty!");
document.wireless_basic.mac_clone_mac1.focus();
return false;
}
if (!re.test(document.wireless_basic.mac_clone_mac1.value)) {
alert("Please fill the MAC Address in correct format! (XX:XX:XX:XX:XX:XX)");
document.wireless_basic.mac_clone_mac1.focus();
return false;
}
if (document.wireless_basic.mac_clone_mac1.value == "00:00:00:00:00:00" ||
!re2.test(document.wireless_basic.mac_clone_mac1.value)) {
alert("MAC Clone Address should not be Multicast or Invalid MAC Address!");
document.wireless_basic.mac_clone_mac1.focus();
return false;
}
}
submit_ssid_num = 1;

if (document.wireless_basic.mssid_2.value != "" && document.wireless_basic.mssid_1.value == "") {
alert("SSID2 can't be empty!");
document.wireless_basic.mssid_1.focus();
document.wireless_basic.mssid_1.select();
return false;
}

if (document.wireless_basic.mssid_3.value != "" && (document.wireless_basic.mssid_1.value == "" || document.wireless_basic.mssid_2.value == "")) {
alert("SSID2 or SSID3 can't be empty!");
if (document.wireless_basic.mssid_1.value == "") {
document.wireless_basic.mssid_1.focus();
document.wireless_basic.mssid_1.select();
} else if (document.wireless_basic.mssid_2.value == "") {
document.wireless_basic.mssid_2.focus();
document.wireless_basic.mssid_2.select();
}
return false;
}

var re = /^[\w|\-|\s|\.]+$/;
var ssid_val = "";
for (i = 0; i < 4; i++){
if(i==0)
ssid_val = document.wireless_basic.ssid.value;
else
ssid_val = eval("document.wireless_basic.mssid_"+i).value;
if(ssid_val != "")	{
if (!re.test(ssid_val)) {
alert("The value of SSID is invalid, SSID only support 'A-Z,a-z,0-9,_,- and space', please re-enter!");
return false;
}
}
if (i>0 && eval("document.wireless_basic.mssid_"+i).value != "") {
submit_ssid_num++;
}
}

document.wireless_basic.bssid_num.value = submit_ssid_num;

var submit_isolated_lan = "";
if (document.wireless_basic.isolated_lan[0].checked)
submit_isolated_lan += "1";
else
submit_isolated_lan += "0";
for (var i=1; i<4;i++) {
if (document.wireless_basic.isolated_lan[i].checked)
submit_isolated_lan += ";1";
else
submit_isolated_lan += ";0";
}
document.wireless_basic.submit_isolated_lan.value = submit_isolated_lan;

for (var i=0; i<4;i++) {
if (!document.wireless_basic.isolated_lan[i].checked) {
var vid = eval("document.wireless_basic.vlan_id"+i).value;
if (vid == 0) continue;
if (!isAllNum(vid) || vid < 0 || vid > 4095) {
alert(_("basic vlan id error"));
eval("document.wireless_basic.vlan_id"+i).focus();
return false;
}
}
}

var f = document.wireless_basic;
if (vlan_info.length <= 1)
vlan_info = "0;0;0";
var vlan = vlan_info.split(";");
var vlanstatus=0;
var lan_num = 0;
if(f.radioButton.checked && vlan[0]!="0"){
if(f.vlan_enable.checked){
for (var i=0; i<4;i++) {
vid = eval("document.wireless_basic.vlan_id"+i).value;
lan_num = eval("document.wireless_basic.ssid_vlan"+(i+1)).value;
if(lan_num=="1" && vid==vlan[1] && vid!="0") {
vlanstatus=1;
break;
}
}
for (var i=0; i<4;i++) {
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
for (var i=0; i<4;i++) {
vid = eval("document.wireless_basic.vlan_id"+i).value;
if(vid==vlan[1]){
alert("Error\r\nManagement VLAN ID conficts with Wireless VLAN ID");
return false;
}
}
}
}
if (!CheckWDSValue())
return false;

var client_limit_num = document.wireless_basic.client_limit.value;
if (!isAllNum(client_limit_num)){
alert(_("Client limitation attribute error"));
return false;
} else if (client_limit_num < 3 || client_limit_num > 64){
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

<form method="post" name="wireless_basic" action="/goform/wirelessBasic" onSubmit="return CheckValue()">

<div>
<h2 id="basicWirelessNet" class="title">General Setting ( IEEE 802.11 )</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td>
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td colspan="2">
<input type="checkbox" name="radioButton" />
<span id="basicWirelessEnable">Enable Wireless LAN</span>
</td>
</tr>
</table>
<table width="600" cellspacing="0" cellpadding="2" border="0" align="center">
<tr class="client_limit_clomn" style="display:none">
<td colspan="2">
<input type="checkbox" name="client_limit_enable" /> Enable Limit Client (3-64)
<input type="text" name="client_limit" value="" maxlength="2" size="4" /> (default: 64)
</td>
</tr>
<tr class="client_limit_clomn" style="display:none"><td colspan="2"><hr size="1"/></td></tr>
<tr>
<td class="head" id="basicNetMode">Mode :</td>
<td>
<select name="wirelessmode" id="wirelessmode" size="1" onChange="wirelessModeChange()">
<option value=1>11b Only</option>
<option value=4>11g Only</option>
<option value=6>11n Only</option>
<option value=0>Mixed(11b+11g)</option>
<option value=7>Mixed(11g+11n)</option>
<option value=9>Mixed(11b+11g+11n)</option>
</select>
</td>
</tr>
<tr><td colspan="2"><hr size="1"/></td></tr>
</table>
<input type="hidden" name="bssid_num" value="1">
<div id="ssid_vlan">
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td colspan="6">
<input type="checkbox" name="vlan_enable" onclick="enableVLAN()"> Enable 2 Subnet (Simulate 2 APs)
</td></tr>
<tr>
<td width="4%" height="25"></td>
<td width="7%" align="center" id="basicHideSSID">Hide SSID</td>
<td width="28%" align="center" id="basicSSID">SSID</td>
<td width="14%" align="center" id="basicSubnet">Subnet</td>
<td width="7%" align="center" id="basicIsolatedLAN">Isolate LAN</td>
<td width="7%" align="center" id="basicIsolatedSSID">Isolate Member</td>
<td width="8%" align="center" id="basicVLANID">VLAN ID (0:Untagged)</td>
<td width="29%" align="center" colspan="2" id="inetMacClone">MAC Clone</td>
</tr>
<tr>
<td height="25" align="center">1</td>
<td align="center"><input type="checkbox" name="hssid" value="0" /></td>
<td align="center">
<input type="text" name="ssid" size="20" maxlength="32" value="<% getCfgGeneral(1, "SSID1"); %>" />
</td>
<td align="center">
<select id="ssid_vlan1" name="ssid_vlan1" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
</td>
<td align="center" id="isolated_lan0"><input type="checkbox" name="isolated_lan" value="0" onclick="onClkIsoLan(0)" /></td>
<td align="center"><input type="checkbox" name="isolated_ssid" value="0" /></td>
<td align="center"><input type="text" name="vlan_id0" size="4" /></td>
<td align="left"><input type="checkbox" name="mac_clone_enabled" value="0" onclick="macCloneSwitch()" /></td>
<td align="center"><input name="mac_clone_mac1" id="mac_clone_mac1" maxlength=17 value="<% getCfgGeneral(1, "wiMacCloneMac1"); %>" /></td>
</tr>
<tr id="div_hssid1">
<td height="25" align="center">2</td>
<td align="center"><input type="checkbox" name="hssid" value="1" /></td>
<td align="center">
<input type="text" name="mssid_1" size="20" maxlength="32" value="<% getCfgGeneral(1, "SSID2"); %>" />
</td>
<td align="center">
<select id="ssid_vlan2" name="ssid_vlan2" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
</td>
<td align="center" id="isolated_lan1"><input type="checkbox" name="isolated_lan" value="1" onclick="onClkIsoLan(1)" /></td>
<td align="center"><input type="checkbox" name="isolated_ssid" value="1" /></td>
<td align="center"><input type="text" name="vlan_id1" size="4" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr id="div_hssid2">
<td height="25" align="center">3</td>
<td align="center"><input type="checkbox" name="hssid" value="2" /></td>
<td align="center">
<input type="text" name="mssid_2" size="20" maxlength="32" value="<% getCfgGeneral(1, "SSID3"); %>" />
</td>
<td align="center">
<select id="ssid_vlan3" name="ssid_vlan3" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
</td>
<td align="center" id="isolated_lan2"><input type="checkbox" name="isolated_lan" value="2" onclick="onClkIsoLan(2)" /></td>
<td align="center"><input type="checkbox" name="isolated_ssid" value="2" /></td>
<td align="center"><input type="text" name="vlan_id2" size="4" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr id="div_hssid3">
<td height="25" align="center">4</td>
<td align="center"><input type="checkbox" name="hssid" value="3" /></td>
<td align="center">
<input type="text" name="mssid_3" size="20" maxlength="32" value="<% getCfgGeneral(1, "SSID4"); %>" />
</td>
<td align="center">
<select id="ssid_vlan4" name="ssid_vlan4" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
</td>
<td align="center" id="isolated_lan3"><input type="checkbox" name="isolated_lan" value="3" onclick="onClkIsoLan(3)" /></td>
<td align="center"><input type="checkbox" name="isolated_ssid" value="3" /></td>
<td align="center"><input type="text" name="vlan_id3" size="4" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
<br />
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr>
<td class="title" width="120"><span id="basicHssidTitle">Hide SSID</span>:</td>
<td><span id="basicHssidIntro">Prevent SSID from being scanned.</span></td>
</tr>
<tr id="basicIsolatedLAN0">
<td class="title" valign="top"><span id="basicIsolatedLAN1">Isolate LAN</span>:</td>
<td><span id="basicIsolateLanIntro">Wireless clients (stations) with the same SSID cannot access wired PCs on LAN.</span></td>
</tr>
<tr>
<td class="title" valign="top"><span id="basicIsolateTitle">Isolate Member</span>:</td>
<td><span id="basicIsolateIntro">Wireless clients (stations) with the same SSID cannot access for each other.</span></td>
</tr>
<tr>
<td class="title" valign="top">MAC Clone:</td>
<td>Set the MAC address of SSID 1. The MAC addresses of other SSIDs and the Wireless client will also change based on this MAC address.
Please notice that the last byte of this MAC address must be a multiple of 8.</td>
</tr>
<!--	  <tr>
<td class="title"><span id="basicSSID4Title">SSID4</span>:</td>
<td><span id="basicSSID4Intro">Reserved for Universal Repeater mode so it's not listed</span>.</td>
</tr>-->
<tr><td colspan="2"><hr size="1"/></td></tr>
</table>
</div>
<table width="600" cellspacing="1" cellpadding="2" border="0" align="center">
<tr id="div_11a_channel" name="div_11a_channel">
<td class="head"><font id="basicFreqA">Channel :</font></td>
<td>
<select id="sz11aChannel" name="sz11aChannel" size="1" onchange="onChg11aChannel()">
<option value=0 id="basicFreqAAuto">AutoSelect</option>
<% getWlan11aChannels(); %>
</select>
<span id="sz11aChText">(best channel:)</span>
</td>
</tr>
<tr id="div_11b_channel" name="div_11b_channel">
<td class="head"><font id="basicFreqB">Channel :</font></td>
<td>
<select id="sz11bChannel" name="sz11bChannel" size="1" onchange="onChg11bChannel()">
<option value=0 id="basicFreqBAuto">AutoSelect</option>
<% getWlan11bChannels(); %>
</select>
<span id="sz11bChText">(best channel:)</span>
</td>
</tr>
<tr id="div_11g_channel" name="div_11g_channel">
<td class="head"><font id="basicFreqG">Channel :</font></td>
<td>
<select id="sz11gChannel" name="sz11gChannel" size="1" onchange="onChg11gChannel()">
<option value=0 id="basicFreqGAuto">AutoSelect</option>
<% getWlan11gChannels(); %>
</select>
<span id="sz11gChText">(best channel:)</span>
</td>
</tr>
<tr id="div_abg_rate">
<td class="head"><font id="basicRate">Rate :</font></td>
<td><select name="abg_rate" size="1"></select></td>
</tr>
<tr id="div_n_extChannel" name="div_n_extChannel">
<td class="head"><font id="basicExtChn">Extension Channel :</font></td>
<td><select id="sExtChannel" name="sExtChannel" size="1"></select>
</td>
</tr>
<tr><td colspan="2"><hr size="1" /></td></tr>
</table>

<div id="wds_config">
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr valign="top">
<td class="title" height="25">Note :</td>
<td>
Enter the configuration of APs which AP 800 want to connect.<br />
<span id="note_wdsfull" style="display: none">
Remote AP should always set LAN-A MAC address to connect AP800 WDS.
</span>
</td>
</tr>
</table>
<table width="600" cellspacing="0" cellpadding="2" class="config" id="wds_one" align="center">
<tr>
<td width="50%" id="wdsPhyMode" class="title">Phy Mode&nbsp;:&nbsp;HTMIX</td>
<td width="50%"><input type="hidden" id="wds_1_phy_mode" name="wds_1_phy_mode" value="HTMIX;HTMIX;HTMIX;HTMIX"></td>
</tr>
<tr><td colspan="2"><hr size="1" /></td></tr>
<tr>
<td valign="top">
<table width="296" cellspacing="0" cellpadding="2">
<tr><td colspan="2" class="title" id="wdsSecurity">Security:</td></tr>
<tr>
<td style="text-indent: 10px;" colspan="2">
<input type="radio" name="wds_1_encryp_type0" value="NONE" onclick="WdsSecurityOnChange(-1)" />Disabled&nbsp;
<input type="radio" name="wds_1_encryp_type0" value="WEP" onclick="WdsSecurityOnChange(-1)" />WEP&nbsp;
<input type="radio" name="wds_1_encryp_type0" value="TKIP" onclick="WdsSecurityOnChange(-1)" />TKIP&nbsp;
<input type="radio" name="wds_1_encryp_type0" value="AES" onclick="WdsSecurityOnChange(-1)" />AES&nbsp;
</td>
</tr>
<tr>
<td style="text-indent: 15px;" colspan="2">
Key&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="password" maxlength="64" size="28" name="wds_1_encryp_key0" />
</td>
</tr>
<tr><td colspan="2" class="title">Peer Mac Address:</td></tr>
<tr>
<td style="text-indent: 5px;" colspan="2">&nbsp;
<input type="text" maxlength="2" name="wds_1_peer1MAC1" onkeypress="onTxtMac(0, 0)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="wds_1_peer1MAC2" onkeypress="onTxtMac(0, 1)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="wds_1_peer1MAC3" onkeypress="onTxtMac(0, 2)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="wds_1_peer1MAC4" onkeypress="onTxtMac(0, 3)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="wds_1_peer1MAC5" onkeypress="onTxtMac(0, 4)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="wds_1_peer1MAC6" onkeypress="onTxtMac(0, 5)" class="hex" size="2"/>
</td>
</tr>
</table>
</td>
<td valign="top"></td>
</tr>
</table>

<table width="600" cellspacing="0" cellpadding="2" class="config" id="wds_full" align="center">
<tr>
<td width="50%" id="wdsPhyMode" class="title">Phy Mode&nbsp;:&nbsp;HTMIX</td>
<td width="50%"><input type="hidden" id="wds_phy_mode" name="wds_phy_mode" value="HTMIX;HTMIX;HTMIX;HTMIX"></td>
</tr>
<tr><td colspan="2"><hr size="1" /></td></tr>
<tr>
<td valign="top" style="border-right: 1px solid #808080;">
<table width="295" cellspacing="0" cellpadding="2">
<tr>
<td colspan="2" class="title">1.&nbsp;
<span id="wdssubnet0">Subnet</span>
<select id="wds_vlan0" name="wds_vlan0" size="1" style="margin-right: 5px">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
<span id="wdsSecurity">Security:</span>
</td>
</tr>
<tr>
<td style="text-indent: 10px;" colspan="2">
<input type="radio" name="wds_encryp_type0" value="NONE" onclick="WdsSecurityOnChange(0)" />Disabled&nbsp;
<input type="radio" name="wds_encryp_type0" value="WEP" onclick="WdsSecurityOnChange(0)" />WEP&nbsp;
<input type="radio" name="wds_encryp_type0" value="TKIP" onclick="WdsSecurityOnChange(0)" />TKIP&nbsp;
<input type="radio" name="wds_encryp_type0" value="AES" onclick="WdsSecurityOnChange(0)" />AES&nbsp;
</td>
</tr>
<tr>
<td style="text-indent: 15px;" colspan="2">
Key&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="password" maxlength="64" size="28" name="wds_encryp_key0" />
</td>
</tr>
<tr><td colspan="2" class="title">Peer Mac Address:</td></tr>
<tr>
<td style="text-indent: 5px;" colspan="2">&nbsp;
<input type="text" maxlength="2" name="peer1MAC1" onkeypress="onTxtMac(1, 0)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer1MAC2" onkeypress="onTxtMac(1, 1)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer1MAC3" onkeypress="onTxtMac(1, 2)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer1MAC4" onkeypress="onTxtMac(1, 3)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer1MAC5" onkeypress="onTxtMac(1, 4)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer1MAC6" onkeypress="onTxtMac(1, 5)" class="hex" size="2"/>
</td>
</tr>
<tr><td colspan="2"><hr size="1" /></td></tr>
<tr>
<td colspan="2" class="title">2.&nbsp;
<span id="wdssubnet1">Subnet</span>
<select id="wds_vlan1" name="wds_vlan1" size="1" style="margin-right: 5px">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
<span id="wdsSecurity">Security:</span>
</td>
</tr>
<tr>
<td style="text-indent: 10px;" colspan="2">
<input type="radio" name="wds_encryp_type1" value="NONE" onclick="WdsSecurityOnChange(1)" />Disabled&nbsp;
<input type="radio" name="wds_encryp_type1" value="WEP" onclick="WdsSecurityOnChange(1)"  />WEP&nbsp;
<input type="radio" name="wds_encryp_type1" value="TKIP" onclick="WdsSecurityOnChange(1)"  />TKIP&nbsp;
<input type="radio" name="wds_encryp_type1" value="AES" onclick="WdsSecurityOnChange(1)"  />AES&nbsp;
</td>
</tr>
<tr>
<td style="text-indent: 15px;" colspan="2">
Key&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="password" maxlength="64" size="28" name="wds_encryp_key1" />
</td>
</tr>
<tr><td colspan="2" class="title">Peer Mac Address:</td></tr>
<tr>
<td style="text-indent: 5px;" colspan="2">&nbsp;
<input type="text" maxlength="2" name="peer2MAC1" onkeypress="onTxtMac(2, 0)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer2MAC2" onkeypress="onTxtMac(2, 1)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer2MAC3" onkeypress="onTxtMac(2, 2)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer2MAC4" onkeypress="onTxtMac(2, 3)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer2MAC5" onkeypress="onTxtMac(2, 4)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer2MAC6" onkeypress="onTxtMac(2, 5)" class="hex" size="2"/>
</td>
</tr>
</table>
</td>

<td valign="top">
<table width="296" cellspacing="0" cellpadding="2">
<tr>
<td colspan="2" class="title">3.&nbsp;
<span id="wdssubnet2">Subnet</span>
<select id="wds_vlan2" name="wds_vlan2" size="1" style="margin-right: 5px">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
<span id="wdsSecurity">Security:</span>
</td>
</tr>
<tr>
<td style="text-indent: 10px;" colspan="2">
<input type="radio" name="wds_encryp_type2" value="NONE" onclick="WdsSecurityOnChange(2)"  />Disabled&nbsp;
<input type="radio" name="wds_encryp_type2" value="WEP" onclick="WdsSecurityOnChange(2)"  />WEP&nbsp;
<input type="radio" name="wds_encryp_type2" value="TKIP" onclick="WdsSecurityOnChange(2)"  />TKIP&nbsp;
<input type="radio" name="wds_encryp_type2" value="AES" onclick="WdsSecurityOnChange(2)"  />AES&nbsp;
</td>
</tr>
<tr>
<td style="text-indent: 15px;" colspan="2">
Key&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="password" maxlength="64" size="28" name="wds_encryp_key2" />
</td>
</tr>
<tr><td colspan="2" class="title">Peer Mac Address:</td></tr>
<tr>
<td style="text-indent: 5px;" colspan="2">&nbsp;
<input type="text" maxlength="2" name="peer3MAC1" onkeypress="onTxtMac(3, 0)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer3MAC2" onkeypress="onTxtMac(3, 1)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer3MAC3" onkeypress="onTxtMac(3, 2)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer3MAC4" onkeypress="onTxtMac(3, 3)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer3MAC5" onkeypress="onTxtMac(3, 4)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer3MAC6" onkeypress="onTxtMac(3, 5)" class="hex" size="2"/>
</td>
</tr>
<tr><td colspan="2"><hr size="1" /></td></tr>
<tr>
<td colspan="2" class="title">4.&nbsp;
<span id="wdssubnet3">Subnet</span>
<select id="wds_vlan3" name="wds_vlan3" size="1" style="margin-right: 5px">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option>
</select>
<span id="wdsSecurity">Security:</span>
</td>
</tr>
<tr>
<td style="text-indent: 10px;" colspan="2">
<input type="radio" name="wds_encryp_type3" value="NONE" onclick="WdsSecurityOnChange(3)"  />Disabled&nbsp;
<input type="radio" name="wds_encryp_type3" value="WEP" onclick="WdsSecurityOnChange(3)"  />WEP&nbsp;
<input type="radio" name="wds_encryp_type3" value="TKIP" onclick="WdsSecurityOnChange(3)"  />TKIP&nbsp;
<input type="radio" name="wds_encryp_type3" value="AES" onclick="WdsSecurityOnChange(3)"  />AES&nbsp;
</td>
</tr>
<tr>
<td style="text-indent: 15px;" colspan="2">
Key&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input type="password" maxlength="64" size="28" name="wds_encryp_key3" />
</td>
</tr>
<tr><td colspan="2" class="title">Peer Mac Address:</td></tr>
<tr>
<td style="text-indent: 5px;" colspan="2">&nbsp;
<input type="text" maxlength="2" name="peer4MAC1" onkeypress="onTxtMac(4, 0)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer4MAC2" onkeypress="onTxtMac(4, 1)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer4MAC3" onkeypress="onTxtMac(4, 2)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer4MAC4" onkeypress="onTxtMac(4, 3)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer4MAC5" onkeypress="onTxtMac(4, 4)" class="hex" size="2"/>&nbsp;:
<input type="text" maxlength="2" name="peer4MAC6" onkeypress="onTxtMac(4, 5)" class="hex" size="2"/>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr>
<td><hr size="1" /></td>
</tr>
</table>
</div>

<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td>
<table width="600" cellspacing="0" cellpadding="0" border="0">
<tr><td height="25" id="basicPkt">Packet-OVERDRIVE</td></tr>
<tr><td height="25">
<input type="checkbox" name="tx_burst"/><span id="basicPktTxBurst">Tx Burst</span></td>
</tr>
<tr><td height="25" class="title" id="basicPktNote">Note :</td></tr>
<tr>
<td height="25" id="basicPktStr1">1.Tx Burst only supports 11g mode.</td>
</tr>
<tr>
<td height="25" id="basicPktStr2">2.The same technology must also be supported in clients to boost WLAN performance.</td>
</tr>
</table>
</td></tr>
</table>
<!--
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td>
<table width="600" cellspacing="0" cellpadding="0" border="0">
<tr><td colspan="2"><hr size="1" /></td></tr>
<tr><td class="head" id="wmmCapable">WMM Capable</td>
<td><input type="radio" name="wmm_capable" value="1"><span id="wmmEnable">Enable</span>&nbsp;
<input type="radio" name="wmm_capable" value="0"><span id="wmmDisable">Disable</span>
</td>
</tr>
</table>
</td></tr>
</table>-->

<table width="600" cellspacing="1" cellpadding="2" border="0" align="center">
<tr><td colspan="2"><hr size="1" /></td></tr>
<tr valign="top">
<td class="head" id="bscAntenna">Antenna :</td>
<td>
<select id="TRStream" name="TRStream" onChange="onChgAntenna()" style="width:64px">
<option value=2>2T2R</option>
<option value=1>1T1R</option>
</select></td>
<td>
<span id="atnArea"><table><tr><td><span id="basicNote">Note: </span>&nbsp;</td><td><span id="TRNote">In 1T1R mode, only the antenna on the right side is used.</span></td></tr></table></span>
</td>
</tr>
<tr>
<td class="head" id="bscTxPower" style="width:64px">Tx Power :</td>
<td>
<select id="tx_power" name="tx_power">
<option value=100>100%</option>
<option value=80>80%</option>
<option value=60>60%</option>
<option value=30>30%</option>
<option value=20>20%</option>
<option value=10>10%</option>
</select>
</td>
</tr>
<tr>
<td class="head" id="bscChnWth" style="width:64px">Channel Width :</td>
<td colspan="2"><input type="radio" id="chn_wth" name="chn_wth" value=0 onclick="wirelessModeChange()">
<span id="chn_wth_auto">Auto 20/40MHZ</span>&nbsp;
<input type="radio" id="chn_wth" name="chn_wth" value=1 onclick="wirelessModeChange()">
<span id="chn_wth_20">20MHZ</span>
</td>
</tr>
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
<input type="hidden" name="wds_list">
<input type="hidden" name="submit_isolated_lan">
<input type=submit class="btnw" value="OK" id="basicApply"> &nbsp; &nbsp;
<input type=reset  class="btnw" value="Cancel" id="basicCancel" onClick="window.location.reload()">
</td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>
