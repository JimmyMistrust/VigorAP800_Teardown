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
Butterlate.setTextDomain("wireless");
Butterlate.setTextDomain("admin");
var f;
var w = parent.wizard;

var sExtChannel = '<% getCfgZero(1, "HT_EXTCHA_3572"); %>';
var PhyMode  = '<% getCfgZero(1, "WirelessMode_3572"); %>';
var ssid_vlan1 = '<% getCfgZero(1, "SSID_VLAN5"); %>';
var channel  = '<% getWlanChannel_5g(); %>';
var CountryRegion = '<% getCfgZero(1, "CountryRegionABand_3572"); %>';


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
//////////////


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
var e = document.getElementById("wizTitle");
e.innerHTML = _("wiz title") + " >> " + _("wiz 5g wireless");

e = document.getElementById("WLMode");
e.innerHTML = _("wiz wireless mode");
e = document.getElementById("aOnly");
e.innerHTML = _("wiz wireless 11a only");
e = document.getElementById("nOnly");
e.innerHTML = _("wiz wireless 11n 5g only");
e = document.getElementById("anMix");
e.innerHTML = _("wiz wireless an mix");
e = document.getElementById("SsidTitle");
e.innerHTML = _("wiz wireless ssid title");
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
e = document.getElementById("lBack");
e.value = _("wiz back");
e = document.getElementById("lNext");
e.value = _("wiz next");
e = document.getElementById("lCancel");
e.value = _("admin cancel");
}


function onChg11aChannel()
{
initExtChannel();
}

function onClkMSSID()
{
window.open("wl_mssid_5g.asp","ssidWindow","toolbars=no,width=600px,height=400px,status=no,scrollbars=yes,resize=yes,menubar=no");
}

function onClkStatList()
{
window.open("../wireless/stainfo_5g.asp","ssidWindow","toolbars=no,width=800px,height=400px,status=no,scrollbars=yes,resize=yes,menubar=no");
}

function initAll()
{
initTranslation();

f = document.frm;

if (w.wWirelessmode_5g != "") PhyMode = w.wWirelessmode_5g;
setVle2Elmt(f.wirelessmode, PhyMode, 0);

channel = 1*channel;
if (w.wChannel_5g != "") channel = w.wChannel_5g;
if (w.wChnExt_5g != "") sExtChannel = w.wChnExt_5g;
if (w.wSsid1_5g == "")
w.wSsid1_5g = "<% getCfgGeneral(1, "SSID1_3572"); %>";
if (w.wSsid2_5g == "")
w.wSsid2_5g = "<% getCfgGeneral(1, "SSID2_3572"); %>";
if (w.wSsid3_5g == "")
w.wSsid3_5g = "<% getCfgGeneral(1, "SSID3_3572"); %>";
if (w.wSsid_vlan1_5g != "")	setVle2Elmt(f.ssid_vlan1, w.wSsid_vlan1_5g, 0);
else setVle2Elmt(f.ssid_vlan1, ssid_vlan1, 0);
if (w.wSsidSubEn != "1") {
f.ssid_vlan1.disabled = true;
setVle2Elmt(f.ssid_vlan1, 1, 0);
}

wirelessModeChange(0);
setVle2Elmt(f.sz11aChannel, channel, 0);
initExtChannel();
setVle2Elmt(f.sExtChannel, sExtChannel);
}

function wirelessModeChange(init)
{
var wmode = getVleFromElmt(f.wirelessmode, 0);

if (wmode == 2) {
hideElmtById(document, "n_extChannel");
} else {
showElmtById(document, "n_extChannel");
}
Check5GBandChannelException();
if (init == 1) initExtChannel();
}


function onClkNxt()
{
var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
var re2 = /.[ACEace02468]:..:..:..:..:../;	// the eighth bit is the multicast bit, must not be 1

if (f.ssid.value == "") {
alert("Please enter SSID!");
f.ssid.focus();
f.ssid.select();
return false;
}

//	submit_ssid_num = 1;
//	for (i = 1; i < 3; i++) {
//		if (eval("f.mssid_"+i).value != "") {
//			submit_ssid_num++;
//		}
//	}
//	f.bssid_num.value = submit_ssid_num;

w.wWirelessmode_5g = getVleFromElmt(f.wirelessmode, 0);
w.wSsid1_5g = getVleFromElmt(f.ssid, 0);
w.wSsid_vlan1_5g = getVleFromElmt(f.ssid_vlan1, 0);
w.wChannel_5g = getVleFromElmt(f.sz11aChannel, 0);
w.wChnExt_5g = getVleFromElmt(f.sExtChannel, 0);
//	document.location.href = "wizard_save.asp";
document.location.href = "wizard4_security_5g.asp";
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
<h1 id="wizTitle">5G Wireless</h1>
<hr size="1" />
<br />

<form name="frm">
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
<tr><td width="20%" id="WLMode" class="title">Wireless Mode : </td>
<td><select name="wirelessmode" id="wirelessmode" size="1" onChange="wirelessModeChange(1)">
<option value=2 id="aOnly">11a Only</option>
<option value=11 id="nOnly">11n Only (5G)</option>
<option value=8 id="anMix">Mixed (11a+11n)</option>
</select></td>
</tr>
<tr><td id="SsidTitle" class="title">Main SSID : </td>
<td><input type="text" name="ssid" size="25" maxlength="32" value="<% getCfgGeneral(1, "SSID1_3572"); %>">
<select id="ssid_vlan1" name="ssid_vlan1" size="1">
<option value="1">LAN-A</option>
<option value="2">LAN-B</option></select>
</td>
</tr>
<tr><td></td>
<td><input type="button" class="btnw1" id="mssid" name="mssid" value="Multiple SSID" onclick="onClkMSSID()"></td>
</tr>
<tr><td id="ChnTitle" class="title">Channel : </td>
<td><select id="sz11aChannel" name="sz11aChannel" size="1" onchange="onChg11aChannel()">
<option value=0 id="basicFreqAAuto">AutoSelect</option>
</select>
</td>
</tr>
<tr id="n_extChannel"><td id="extChn" class="title">Extension Channel : </td>
<td><select id="sExtChannel" name="sExtChannel" size="1"></select></td>
</tr>
<tr><td width="20%" id="StatTitle" class="title">Station List : </td>
<td><input type="button" class="btnw" id="statlsbtnw" value="Display" onclick="onClkStatList()"></td>
</tr>
</table>

<br />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td width=25% style='background-color:#4682B4; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#4682B4; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#4682B4; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#e5e5e5; height:8px;font-size:5px;'>&nbsp;</td>
</tr>
<tr>
<td align=right id="Wless24g">Wireless(2.4GHz)</td>
<td align=right id="Secu24g">Security(2.4GHz)</td>
<td align=right id="Wless5g">Wireless(5GHz)</td>
<td align=right id="Secu5g">Security(5GHz)</td>
</tr>
</table>
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="right">
<td><input type=button class="btnw" value="Back" id="lBack" onClick="JavaScript:history.back();">&nbsp;&nbsp;
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