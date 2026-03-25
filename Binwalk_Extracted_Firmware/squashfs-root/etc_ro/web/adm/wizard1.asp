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
var w = parent.wizard;
var opmode = '<% getCfgZero(1, "OperationMode"); %>';
var ap800_mode = '<% getCfgZero(1, "800_ap_mode"); %>';
var PhyMode  = '<% getCfgZero(1, "WirelessMode"); %>';
var vlan_enable = '<% getCfgGeneral(1, "WL_VLAN"); %>';
var ssid_vlan1 = '<% getCfgZero(1, "SSID_VLAN1"); %>';
var sExtChannel = '<% getCfgZero(1, "HT_EXTCHA"); %>';
var countrycode = '<% getCfgGeneral(1, "CountryCode"); %>';
var channel_index  = '<% getWlanChannel(); %>';
var mssidb = "<% getMBSSIDBuilt(); %>";

var ChannelList_24G = ["2412MHz (Channel 1)", "2417MHz (Channel 2)", "2422MHz (Channel 3)",
"2427MHz (Channel 4)", "2432MHz (Channel 5)", "2437MHz (Channel 6)",
"2442MHz (Channel 7)", "2447MHz (Channel 8)", "2452MHz (Channel 9)",
"2457MHz (Channel 10)", "2462MHz (Channel 11)", "2467MHz (Channel 12)",
"2472MHz (Channel 13)", "2484MHz (Channel 14)"];

var vl_enable;//for opener
var opmode_slt; //for opener
var ap_dis_slt_ssid="";
var ap_dis_slt_mac="";
var ap_dis_slt_auth="";
var ap_dis_slt_encryp="";
//////////////


function onChgOPMode()
{
var op_val = getVleFromElmt(f.opmode, 0);

hideElmtById(document, "oAPNote");
hideElmtById(document, "oStationNote");
hideElmtById(document, "oAPBriP2PNote");
hideElmtById(document, "oAPBriP2MPNote");
hideElmtById(document, "oAPBriWDSNot");
hideElmtById(document, "chgline");
hideElmtById(document, "oAPBriWDSNote");
hideElmtById(document, "oURNote");
hideElmtById(document, "ssid_tbl");
hideElmtById(document, "chn_tbl");
hideElmtById(document, "station_tbl");
hideElmtById(document, "apdiscovery_tbl");
document.getElementById("ApDisTitle").innerHTML = "AP Discovery : ";

switch(parseInt(op_val))
{
case 0:
showElmtById(document, "oAPNote");
showElmtById(document, "ssid_tbl");
showElmtById(document, "chn_tbl");
showElmtById(document, "station_tbl");
break;
case 2:
showElmtById(document, "oStationNote");
showElmtById(document, "apdiscovery_tbl");
document.getElementById("ApDisTitle").innerHTML = "Site Survey : ";
break;
case 3:
showElmtById(document, "ssid_tbl");
showElmtById(document, "oURNote");
showElmtById(document, "chn_tbl");
showElmtById(document, "station_tbl");
showElmtById(document, "apdiscovery_tbl");
break;
case 4:
showElmtById(document, "oAPBriP2PNote");
showElmtById(document, "chn_tbl");
showElmtById(document, "apdiscovery_tbl");
break;
case 5:
showElmtById(document, "oAPBriP2MPNote");
showElmtById(document, "chn_tbl");
showElmtById(document, "apdiscovery_tbl");
break;
case 6:
showElmtById(document, "oAPBriWDSNot");
//			showElmtById(document, "chgline");
showElmtById(document, "oAPBriWDSNote");
showElmtById(document, "ssid_tbl");
showElmtById(document, "chn_tbl");
showElmtById(document, "station_tbl");
showElmtById(document, "apdiscovery_tbl");
break;
}
}

function wirelessModeChange()
{
var wmode = getVleFromElmt(f.wirelessmode, 0);

hideElmtById(document, "sz11bChannel");
f.sz11bChannel.disabled = true;
hideElmtById(document, "sz11gChannel");
f.sz11gChannel.disabled = true;
hideElmtById(document, "n_extChannel");
f.sExtChannel.disabled = true;

if (wmode == 1) {
showElmtById(document, "sz11bChannel");
f.sz11bChannel.disabled = false;
} else if (wmode == 4) {
showElmtById(document, "sz11gChannel");
f.sz11gChannel.disabled = false;
} else if (wmode == 6 || wmode == 7) {
showElmtById(document, "sz11gChannel");
showElmtById(document, "n_extChannel");
f.sz11gChannel.disabled = false;
f.sExtChannel.disabled = false;
} else if ((wmode == 0) || (wmode == 9)) {
if (wmode == 9) {
showElmtById(document, "n_extChannel");
f.sExtChannel.disabled = false;
}
showElmtById(document, "sz11gChannel");
f.sz11gChannel.disabled = false;
}

}

function initExtChannel()
{
var mChannel = 1*getVleFromElmt(f.sz11gChannel, 0);

switch(mChannel) {
case 0:
f.sExtChannel.options.length = 0;
f.sExtChannel.options[0] = new Option("AutoSelect", "0");
break;
case 1:
case 2:
case 3:
case 4:
f.sExtChannel.options.length = 0;
f.sExtChannel.options[0] = new Option(ChannelList_24G[mChannel+3], mChannel+4);
break;
case 5:
case 6:
case 7:
case 8:
case 9:
f.sExtChannel.options.length = 0;
f.sExtChannel.options[0] = new Option(ChannelList_24G[mChannel-5], "0");
f.sExtChannel.options[1] = new Option(ChannelList_24G[mChannel+3], "1");
break;
case 10:
f.sExtChannel.options.length = 0;
f.sExtChannel.options[0] = new Option(ChannelList_24G[5], "0");
if (countrycode != "FR") {
f.sExtChannel.options[1] = new Option(ChannelList_24G[13], "1");
}
break;
case 11:
case 12:
case 13:
case 14:
f.sExtChannel.options.length = 0;
f.sExtChannel.options[0] = new Option(ChannelList_24G[mChannel-5], "0");
break;
}
}

function onChg11gChannel()
{
initExtChannel();
}

function enableVLAN()
{
var vlan_enable = getVleFromElmt(f.vlan_enable, 0);

if (vlan_enable == 1) {
f.ssid_vlan1.disabled = false;
} else {
f.ssid_vlan1.disabled = true;
setVle2Elmt(f.ssid_vlan1, 1, 0);
}
}


function onClkMSSID()
{
vl_enable = getVleFromElmt(f.vlan_enable, 0);
window.open("wl_mssid.asp","ssidWindow","toolbars=no,width=600px,height=400px,status=no,scrollbars=yes,resize=yes,menubar=no");
}

function onClkStatList()
{
window.open("../wireless/stainfo.asp","ssidWindow","toolbars=no,width=800px,height=400px,status=no,scrollbars=yes,resize=yes,menubar=no");
}

function onClkApdis()
{
ap_dis_slt_ssid = "";
ap_dis_slt_mac = "";
ap_dis_slt_auth = "";
ap_dis_slt_encryp = "";
opmode_slt = getVleFromElmt(f.opmode, 0);
window.open("../adm/wizard_ap.asp","apWindow","toolbars=no,width=800px,height=400px,status=no,scrollbars=yes,resize=yes,menubar=no");
}

function initAll()
{
initTranslation();

f = document.frm;
if (countrycode == '') countrycode = 'NONE';
var idx;

if (opmode == 0) {
if (ap800_mode == 0) idx = 1*ap800_mode;
else idx = 1*ap800_mode + 3;
} else {
idx = 1*opmode;
}
//	alert(idx);
if (w.wOpmode != "") idx = w.wOpmode;
setVle2Elmt(f.opmode, idx, 0);
onChgOPMode();

if (w.wWirelessmode != "") PhyMode = w.wWirelessmode;
setVle2Elmt(f.wirelessmode, PhyMode, 0);
if (w.wSsid_vlan1 != "") ssid_vlan1 = w.wSsid_vlan1;
setVle2Elmt(f.ssid_vlan1, ssid_vlan1, 0);
channel_index = 1*channel_index;
if (w.wChannel != "") channel_index = w.wChannel;
if ((PhyMode == 0) || (PhyMode == 4) || (PhyMode == 9) || (PhyMode == 6) || (PhyMode == 7)) {
if (PhyMode == 9 || PhyMode == 6 || PhyMode == 7) {
showElmtById(document, "n_extChannel");
f.sExtChannel.disabled = false;
}
showElmtById(document, "sz11gChannel");
f.sz11gChannel.disabled = false;
setVle2Elmt(f.sz11gChannel, channel_index, 0);
} else if (PhyMode == 1) {
showElmtById(document, "sz11bChannel");
f.sz11bChannel.disabled = false;
setVle2Elmt(f.sz11bChannel, channel_index, 0);
}
if (w.wSsid1 == "")
w.wSsid1 = "<% getCfgGeneral(1, "SSID1"); %>";
setVle2Elmt(f.ssid, w.wSsid1);
if (w.wSsid2 == "")
w.wSsid2 = "<% getCfgGeneral(1, "SSID2"); %>";
if (w.wSsid3 == "")
w.wSsid3 = "<% getCfgGeneral(1, "SSID3"); %>";
if (w.wSsid4 == "")
w.wSsid4 = "<% getCfgGeneral(1, "SSID4"); %>";
if (w.wSsidSubEn != "") vlan_enable = w.wSsidSubEn;
setVle2Elmt(f.vlan_enable, vlan_enable);
enableVLAN();
initExtChannel();
if (w.wChnExt != "") sExtChannel = w.wChnExt;
setVle2Elmt(f.sExtChannel, sExtChannel);
if (mssidb != "1") f.mssid.disabled = true;
}

function initTranslation()
{
var e = document.getElementById("wizTitle");
e.innerHTML = _("wiz title") + " >> " + _("wiz 2.4g wireless");

e = document.getElementById("OPMode");
e.innerHTML = _("wiz operation mode");
e = document.getElementById("oAP");
e.innerHTML = _("wiz mode ap");
e = document.getElementById("oAPNote");
e.innerHTML = _("opmode mode ap intro");
e = document.getElementById("oStation");
e.innerHTML = _("wiz mode sta");
e = document.getElementById("oStationNote");
e.innerHTML = _("opmode mode sta intro");
e = document.getElementById("oAPBriP2P");
e.innerHTML = _("wiz mode apbp2p");
e = document.getElementById("oAPBriP2PNote");
e.innerHTML = _("opmode mode apbp2p intro");
e = document.getElementById("oAPBriP2MP");
e.innerHTML = _("wiz mode apbp2mp");
e = document.getElementById("oAPBriP2MPNote");
e.innerHTML = _("opmode mode apbp2mp intro");
e = document.getElementById("oAPBriWDS");
e.innerHTML = _("wiz mode apbwds");
e = document.getElementById("oAPBriWDSNot");
e.innerHTML = _("opmode mode apbwds intro");
e = document.getElementById("oAPBriWDSNote");
e.innerHTML = _("opmode mode apbwds intro1");
e = document.getElementById("oUR");
e.innerHTML = _("wiz mode ur");
e = document.getElementById("oURNote");
e.innerHTML = _("opmode mode ur intro");
e = document.getElementById("WLMode");
e.innerHTML = _("wiz wireless mode");
e = document.getElementById("bOnly");
e.innerHTML = _("wiz wireless 11b only");
e = document.getElementById("gOnly");
e.innerHTML = _("wiz wireless 11g only");
e = document.getElementById("nOnly");
e.innerHTML = _("wiz wireless 11n only");
e = document.getElementById("bgMix");
e.innerHTML = _("wiz wireless bg mix");
e = document.getElementById("bgnMix");
e.innerHTML = _("wiz wireless bgn mix");
e = document.getElementById("SsidTitle");
e.innerHTML = _("wiz wireless ssid title");
e = document.getElementById("En2ndSub");
e.innerHTML = _("wiz wireless ssid 2nd subnet enable");
e = document.getElementById("ChnTitle");
e.innerHTML = _("wiz wireless channel");
e = document.getElementById("extChn");
e.innerHTML = _("wiz wireless extension channel");
e = document.getElementById("StatTitle");
e.innerHTML = _("wiz wireless station list");
e = document.getElementById("Wless24g");
e.innerHTML = _("status wlan 24g");
e = document.getElementById("Wless5g");
e.innerHTML = _("status wlan 5g");
e = document.getElementById("Secu24g");
e.innerHTML = _("status security 24g");
e = document.getElementById("Secu5g");
e.innerHTML = _("status security 5g");

e = document.getElementById("mssid");
e.value = _("wiz wireless multi ssid");
e = document.getElementById("statlsbtnw");
e.value = _("wiz wireless display btnw");
e = document.getElementById("apdisbtnw");
e.value = _("wiz wireless display btnw");
e = document.getElementById("lNext");
e.value = _("wiz next");
e = document.getElementById("lCancel");
e.value = _("admin cancel");
}

function onClkNxt()
{
w.wOpmode = getVleFromElmt(f.opmode, 0);
w.wWirelessmode = getVleFromElmt(f.wirelessmode, 0);
w.wSsid1 = getVleFromElmt(f.ssid, 0);
w.wSsid_vlan1 = getVleFromElmt(f.ssid_vlan1, 0);
w.wSsidSubEn = getVleFromElmt(f.vlan_enable, 0);
if (w.wWirelessmode == 1)
w.wChannel = getVleFromElmt(f.sz11bChannel, 0);
else
w.wChannel = getVleFromElmt(f.sz11gChannel, 0);
w.wChnExt = getVleFromElmt(f.sExtChannel, 0);

if (w.wOpmode == 2)
document.location.href = "wizard2_approf.asp?ssid="+ap_dis_slt_ssid+"&auth="+ap_dis_slt_auth+"&encryp="+ap_dis_slt_encryp;
else if (w.wOpmode == 4 || w.wOpmode == 5 || w.wOpmode == 6)
document.location.href = "wizard2_wds.asp";
else if (w.wOpmode == 3)
document.location.href = "wizard2_ssid.asp?ssid="+ap_dis_slt_ssid+"&mac="+ap_dis_slt_mac;
else
//		document.location.href = "wizard3.asp";
document.location.href = "wizard4_security.asp";

}

function onClkBtnCcl()
{
if(confirm(_("wiz cancel confirm"))) {
parent.location = "/home.asp";
}
}
</script>
</head>

<body onload="initAll()">
<table class="body">
<tr><td>
<h1 id="wizTitle">2.4G Wireless</h1>
<hr size="1" />
<br />

<form name="frm">
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
<tr><td width="140" id="OPMode" class="title">Operation Mode:</td>
<td><select name="opmode" onchange="onChgOPMode()"><option value="0" id="oAP">AP</option>
<option value="2" id="oStation">Station-Infrastructure</option>
<option value="4" id="oAPBriP2P">AP Bridge-Point to Point</option>
<option value="5" id="oAPBriP2MP">AP Bridge-Point to Multi-Point</option>
<option value="6" id="oAPBriWDS">AP Bridge-WDS Mode</option>
<option value="3" id="oUR">Universal Repeater</option>
</select></td>
</tr>
<tr><td></td>
<td><span id="oAPNote" style="display:none">AP 800 acts as a bridge between wireless devices and wired Ethernet network, and exchanges data between them.</span>
<span id="oStationNote" style="display:none">Enable the Ethernet device as a wireless station and join a wireless network through an AP.</span>
<span id="oAPBriP2PNote" style="display:none">AP 800 will connect to another AP 800 which uses the same mode, and all wired Ethernet clients of both AP 800s will be connected together.</span>
<span id="oAPBriP2MPNote" style="display:none">AP 800 will connect to up to four AP 800s which uses the same mode, and all wired Ethernet clients of every AP 800s will be connected together.</span>
<span id="oAPBriWDSNot" style="display:none">AP 800 will connect to up to four AP 800s which uses the same mode, and all wired Ethernet clients of every AP 800s will be connected together.</span>
<span id="chgline" style="display:none"><br /></span>
<span id="oAPBriWDSNote" style="display:none">This mode is still able to accept wireless clients.</span>
<span id="oURNote" style="display:none">AP 800 can act as a wireless repeater; it can be Station and AP at the same time.</span>
</td>
</tr>
<tr><td id="WLMode" class="title">Wireless Mode : </td>
<td><select name="wirelessmode" id="wirelessmode" size="1" onChange="wirelessModeChange()">
<option value=1 id="bOnly">11b Only</option>
<option value=4 id="gOnly">11g Only</option>
<option value=6 id="nOnly">11n Only</option>
<option value=0 id="bgMix">Mixed(11b+11g)</option>
<option value=7>Mixed(11g+11n)</option>
<option value=9 id="bgnMix">Mixed(11b+11g+11n)</option>
</select></td>
</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center" id="ssid_tbl" style="display:none">
<tr><td width="140" id="SsidTitle" class="title">Main SSID : </td>
<td><input type="text" name="ssid" size="25" maxlength="32" value="<% getCfgGeneral(1, "SSID1"); %>">
<select id="ssid_vlan1" name="ssid_vlan1" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
<input type="checkbox" name="vlan_enable" onclick="enableVLAN()"> <span id="En2ndSub">Enable 2 Subnet (Simulate 2 APs)</span>
</td>
</tr>
<tr><td></td>
<td><input type="button" class="btnw1" id="mssid" name="mssid" value="Multiple SSID" onclick="onClkMSSID()"></td>
</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center" id="chn_tbl" style="display:none">
<tr><td width="140" id="ChnTitle" class="title">Channel : </td>
<td><select id="sz11bChannel" name="sz11bChannel" size="1" style="display:none">
<option value=0 id="basicFreqBAuto">AutoSelect</option>
<% getWlan11bChannels(); %></select>
<select id="sz11gChannel" name="sz11gChannel" size="1" onchange="onChg11gChannel()" style="display:none">
<option value=0 id="basicFreqGAuto">AutoSelect</option>
<% getWlan11gChannels(); %></select>
</td>
</tr>
<tr id="n_extChannel" style="display:none"><td id="extChn" class="title">Extension Channel : </td>
<td><select id="sExtChannel" name="sExtChannel" size="1"></select></td>
</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center" id="station_tbl" style="display:none">
<tr><td width="140" id="StatTitle" class="title">Station List : </td>
<td><input type="button" class="btnw" id="statlsbtnw" value="Display" onclick="onClkStatList()"></td>
</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center" id="apdiscovery_tbl" style="display:none">
<tr><td width="140" id="ApDisTitle" class="title">AP Discovery : </td>
<td><input type="button" class="btnw" id="apdisbtnw" value="Display" onclick="onClkApdis()"></td>
</tr>
</table>


<br /><br />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td width=25% style='background-color:#4682B4; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#e5e5e5; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#e5e5e5; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#e5e5e5; height:8px;font-size:5px;'>&nbsp;</td>
</tr>
<tr>
<td align=right id="Wless24g">Wireless(2.4GHz)</td>
<td align=right id="Secu24g">Security(2.4GHz)</td>
<td align=right id="Wless5g">Wireless(5GHz)</td>
<td align=right id="Secu5g">Security(5GHz)</td>
</tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="right">
<td>
<input type=button class="btnw" value="Next" id="lNext" onClick="onClkNxt()">&nbsp;&nbsp;
<input type=button class="btnw" value="Cancel" id="lCancel" onClick="onClkBtnCcl()">
</td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>