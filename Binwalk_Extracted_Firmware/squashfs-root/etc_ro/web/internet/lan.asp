<html>
<head>
<title>LAN General Setup</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="lTitle"></h1>
<hr size="1" /><br />
<div id=lan_set_dispaly>
<form method=post name="lanCfg" action="/goform/setLan" onSubmit="return CheckValue()">

<h2 id="lSetup" class="title">Ethernet TCP / IP and DHCP Setup</h2>
<table width="100%" cellpadding="2" cellspacing="0" border="1">
<tr>
<td valign="top" style="border-right: 0px none;">
<table width="340" cellspacing="0" cellpadding="2">
<tr>
<td colspan="2" class="title"><span id="lNetType">LAN</span> <span id="lNetSetup">IP Network Configuration</span></td>
</tr>
<tr id="trApm"><td colspan="2"><b id="lApm" style="margin-left: 5px;">VigorAP Management</b></td></tr>
<tr id="trApmcEn">
<td colspan="2" style="text-indent: 10px"><input type="checkbox" name="lanApmcEn" value="1" onchange="onChgApmEn()">
<span id="lApmcEn">Enable AP Management</span></td>
</tr>
<tr id="trApmcDhcpEn">
<td colspan="2" style="text-indent: 10px"><input type="checkbox" name="lanADhcpcEn" value="1" onchange="onChgApmDhcpcEn(1)">
<span id="lApmcDhcpcEn">Enable DHCP Client</span></td>
</tr>
<tr id="trApmcAutoProvEn">
<td colspan="2" style="text-indent: 10px">&nbsp;&nbsp;<input type="checkbox" name="lanApmcAutoProvEn" value="1">
<span id="lApmcAutoProvEn">Enable Auto Provision</span></td>
</tr>
<tr id="trLanIp"><td colspan="2"><b style="margin-left: 5px;">Specify an IP address</b></td></tr>
<tr style="display:none">
<td colspan="2" id="lLan">For NAT Usage</td>
</tr>
<tr>
<td id="lIp" width="50%" style="text-indent: 10px">IP Address</td>
<td width="50%"><input name="lanIp" maxlength=15 value="<% getLanIp(); %>" onFocus="recIpCfg(0)" onBlur="modDhcpCfg(0)"></td>
</tr>
<tr>
<td id="lNetmask" style="text-indent: 10px">Subnet Mask</td>
<td><input name="lanNetmask" maxlength=15 value="<% getLanNetmask(); %>"></td>
</tr>
<tr id="langateway">
<td id="lNetGateway" style="text-indent: 10px">Gateway Address</td>
<td><input name="lanGateway" maxlength=15 value="<% getLanGateway(); %>"></td>
</tr>
<tr><td colspan="2"><hr size="1"></td></tr>
<tr>
<td colspan=2 style="text-indent: 10px"><input type=checkbox name="lanVlanEnable0" value=1 onclick="onClkVlanEn(0)" />
<span id="lVlanMngtEn_0">Enable Management VLAN</span>
</td>
</tr>
<tr>
<td id="lVlanMngtId_0" style="text-indent: 10px">VLAN ID</td>
<td><input name="lanVlanId0" maxlength=4></td>
</tr>
<tr id="pppoerelay">
<td id="lPppoer">PPPOE Passthrough</td>
<td><input type="checkbox" name="pppoeREnbl"/></td>
</tr>

</table>
</td>
<td valign="top">
<table width="340" cellspacing="0" cellpadding="2" border="0">
<tr><td colspan="2" class="title" id="lDHCPSetup">DHCP Server Configuration</td></tr>
<tr>
<td colspan="2">
<input type="radio" name="lanDhcpType" value="1" onclick="dhcpTypeSwitch()"/><span id="lDhcpTypeE">Enable Server</span>
<input type="radio" name="lanDhcpType" value="0" onclick="dhcpTypeSwitch()"/><span id="lDhcpTypeD">Disable Server</span>
</td>
</tr>
<tr>
<td colspan="2">
<input type="radio" name="lanDhcpType" value="2" onclick="dhcpTypeSwitch()"/><span id="lDhcpTypeR">Relay Agent</span>
</td>
</tr>
<tr>
<td id="lDhcpStart" width="50%" style="text-indent: 10px">Start IP Address</td>
<td width="50%"><input name="dhcpStart" maxlength=15 value="<% getCfgGeneral(1, "dhcpStart"); %>"></td>
</tr>
<tr>
<td id="lDhcpEnd" style="text-indent: 10px">End IP Address</td>
<td><input name="dhcpEnd" maxlength=15 value="<% getCfgGeneral(1, "dhcpEnd"); %>"></td>
</tr>
<tr>
<td id="lDhcpNetmask" style="text-indent: 10px">Subnet Mask</td>
<td><input name="dhcpMask" maxlength=15 value="<% getCfgGeneral(1, "dhcpMask"); %>"></td>
</tr>
<tr>
<td id="lDhcpGateway" style="text-indent: 10px">Default Gateway</td>
<td><input name="dhcpGateway" maxlength=15 value="<% getCfgGeneral(1, "dhcpGateway"); %>"></td>
</tr>
<tr>
<td id="lDhcpLease" style="text-indent: 10px">Lease Time</td>
<td><input name="dhcpLease" maxlength=8 value="<% getCfgGeneral(1, "dhcpLease"); %>"></td>
</tr>
<tr style="display:none">
<td colspan="2" id="lDhcpDns" class="title">DNS Server IP Address</td>
</tr>
<tr>
<td id="lDhcpRelay" style="text-indent: 10px">DHCP Server IP Address for Relay Agent</td>
<td><input name="dhcpRelayServerIP" maxlength=15 value="<% getCfgGeneral(1, "dhcpRelay"); %>"></td>
</tr>
<tr>
<td id="lDhcpPriDns" style="text-indent: 10px">Primary DNS Server</td>
<td><input name="dhcpPriDns" maxlength=15 value="<% getCfgGeneral(1, "dhcpPriDns"); %>"></td>
</tr>
<tr>
<td id="lDhcpSecDns" style="text-indent: 10px">Secondary DNS Server</td>
<td><input name="dhcpSecDns" maxlength=15 value="<% getCfgGeneral(1, "dhcpSecDns"); %>"></td>
</tr>
</table>
</td>
</tr>
<tr id="vlan2_tbl" style="display:none"><td valign="top" style="border-right: 0px none;">
<table width="340" cellspacing="0" cellpadding="2">
<tr>
<td colspan="2" class="title"><span id="l2NetType">LAN</span> <span id="l2NetSetup">IP Network Configuration</span></td>
</tr>
<tr style="display:none">
<td colspan="2" id="l2Lan">For NAT Usage</td>
</tr>
<tr id="trApmcDhcpEn1">
<td colspan="2" style="text-indent: 10px"><input type="checkbox" name="lanBDhcpcEn" value="1" onchange="onChgApmDhcpcEn(2)">
<span id="lApmcDhcpcEn1">Enable DHCP Client</span></td>
</tr>
<tr>
<td id="l2Ip" width="50%" style="text-indent: 10px">IP Address</td>
<td width="50%"><input name="lan2Ip" maxlength=15 value="<% getCfgGeneral(1, "lan2_ipaddr"); %>" onFocus="recIpCfg(1)" onBlur="modDhcpCfg(1)"></td>
</tr>
<tr>
<td id="l2Netmask" style="text-indent: 10px">Subnet Mask</td>
<td><input name="lan2Netmask" maxlength=15 value="<% getCfgGeneral(1, "lan2_netmask"); %>"></td>
</tr>
<tr><td colspan="2"><hr size="1"></td></tr>
<tr>
<td colspan=2 style="text-indent: 10px"><input type=checkbox name=lanVlanEnable1 value=1 onclick="onClkVlanEn(1)" />
<span id="lVlanMngtEn_1">Enable Management VLAN</span></td>
</tr>
<tr>
<td id="lVlanMngtId_1" style="text-indent: 10px">VLAN ID</td>
<td><input name="lanVlanId1" maxlength=4></td>
</tr>
<tr id="pppoe2relay">
<td id="l2Pppoer">PPPOE Passthrough</td>
<td><input type="checkbox" name="pppoe2REnbl"/></td>
</tr>
</div>
</table>
</td>
<td valign="top">
<table width="340" cellspacing="0" cellpadding="2">
<tr><td colspan="2" class="title" id="l2DHCPSetup">DHCP Server Configuration</td></tr>
<tr>
<td colspan="2">
<input type="radio" name="lan2DhcpType" value="1" onclick="dhcp2TypeSwitch()"/><span id="l2DhcpTypeE">Enable Server</span>
<input type="radio" name="lan2DhcpType" value="0" onclick="dhcp2TypeSwitch()"/><span id="l2DhcpTypeD">Disable Server</span>
</td>
</tr>
<tr>
<td colspan="2">
<input type="radio" name="lan2DhcpType" value="2" onclick="dhcp2TypeSwitch()"/><span id="l2DhcpTypeR">Relay Agent</span>
</td>
</tr>
<tr>
<td id="l2DhcpStart" width="50%" style="text-indent: 10px">Start IP Address</td>
<td width="50%"><input name="dhcp2Start" maxlength=15 value="<% getCfgGeneral(1, "dhcp2Start"); %>"></td>
</tr>
<tr>
<td id="l2DhcpEnd" style="text-indent: 10px">End IP Address</td>
<td><input name="dhcp2End" maxlength=15 value="<% getCfgGeneral(1, "dhcp2End"); %>"></td>
</tr>
<tr>
<td id="l2DhcpNetmask" style="text-indent: 10px">Subnet Mask</td>
<td><input name="dhcp2Mask" maxlength=15 value="<% getCfgGeneral(1, "dhcp2Mask"); %>"></td>
</tr>
<tr>
<td id="l2DhcpGateway" style="text-indent: 10px">Default Gateway</td>
<td><input name="dhcp2Gateway" maxlength=15 value="<% getCfgGeneral(1, "dhcp2Gateway"); %>"></td>
</tr>
<tr>
<td id="l2DhcpLease" style="text-indent: 10px">Lease Time</td>
<td><input name="dhcp2Lease" maxlength=8 value="<% getCfgGeneral(1, "dhcp2Lease"); %>"></td>
</tr>
<tr>
<td id="l2DhcpRelay" style="text-indent: 10px">DHCP Server IP Address for Relay Agent</td>
<td><input name="dhcp2RelayServerIP" maxlength=15 value="<% getCfgGeneral(1, "dhcp2Relay"); %>"></td>
</tr>
<tr>
<td id="l2DhcpPriDns" style="text-indent: 10px">Primary DNS Server</td>
<td><input name="dhcp2PriDns" maxlength=15 value="<% getCfgGeneral(1, "dhcp2PriDns"); %>"></td>
</tr>
<tr>
<td id="l2DhcpSecDns" style="text-indent: 10px">Secondary DNS Server</td>
<td><input name="dhcp2SecDns" maxlength=15 value="<% getCfgGeneral(1, "dhcp2SecDns"); %>"></td>
</tr>
</table>
</td>
</tr>

</table>
<b>Note:</b> Disable "DHCP Client" or "Auto Provision" for VigorAP Management only work with
Vigor2860 v3.7.3.1 and newer APM Server.
<br />
<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type=submit class="btnw" value="OK" id="lApply">&nbsp;&nbsp;
<input type=reset  class="btnw" value="Cancel" id="lCancel" onClick="window.location.reload()">
</td>
</tr>
</table>
</form>
</div><!--lan_set_dispaly-->
<div id=lan_finish_dispaly style="display:none">
<table width="100%" cellpadding="2" cellspacing="1" border=1>
<tr>
<td align=center>
<table width="60%" cellpadding="2" cellspacing="1" >
<tr align=center>
<td>Your configuration is saved!</td>
</tr>
<tr align=center>
<td align=left>
LAN IP has been changed.<br>
Don't reboot or power off the router during this period.<br>
It may take up to <b>10 seconds</b> before changes are applied.<br>
<b>1st <a id=rip1 href=""><span id=rlan1></span></a></b><br>
<b>2nd <a id=rip2 href=""><span id=rlan2></span></a></b>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div><!--lan_finish_dispaly-->
<div id=lan_apmc_dispaly style="display:none">
<table width="100%" cellpadding="2" cellspacing="1" border=1>
<tr>
<td align=center>
<table width="60%" cellpadding="2" cellspacing="1" >
<tr align=center>
<td>Your configuration is saved!</td>
</tr>
<tr align=center>
<td align=left>
VigorAP Management Client has been enabled.<br>
This VigorAP may automatically configure with new IP addresses
which are different from the current settings:<br>
<b>1st <a id=rip_1 href=""><span id=rlan_1></span></a></b><br>
<b>2nd <a id=rip_2 href=""><span id=rlan_2></span></a></b>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div><!--lan_apmc_dispaly-->
</td></tr>
</table>
</body>
</html>
<script language="JavaScript" type="text/javascript">
var f = document.lanCfg;
Butterlate.setTextDomain("internet");
var lan2 = '<% getCfgZero(1, "Lan2Enabled"); %>';
var vlan_enable = '<% getCfgGeneral(1, "WL_VLAN"); %>';
var opmode = '<% getCfgZero(1, "OperationMode"); %>';
var ap800_mode = '<% getCfgZero(1, "800_ap_mode"); %>';
var vlan_exit = 0;
if (opmode == "0") {
if (ap800_mode == "0" || ap800_mode == "3")
vlan_exit = 1;
else
vlan_exit = 0;
} else if (opmode == "3")
vlan_exit = 1;

var secs;
var timerID = null;
var timerRunning = false;
var aryLanOldIP = new Array(2);
var aryLanElmt = [[f.lanIp, f.lanNetmask, f.dhcpStart, f.dhcpEnd, f.dhcpMask,f.dhcpGateway],
[f.lan2Ip, f.lan2Netmask, f.dhcp2Start, f.dhcp2End, f.dhcp2Mask,f.dhcp2Gateway]];
var arySubnet = ['<% getCfgZero(1, "SSID_VLAN1"); %>','<% getCfgZero(1, "SSID_VLAN2"); %>','<% getCfgZero(1, "SSID_VLAN3"); %>','<% getCfgZero(1, "SSID_VLAN4"); %>'];
var arySSID = ['<% getCfgGeneral(1, "SSID1"); %>','<% getCfgGeneral(1, "SSID2"); %>','<% getCfgGeneral(1, "SSID3"); %>','<% getCfgGeneral(1, "SSID4"); %>'];
var WLVlanId = '<% getCfgGeneral(1, "WirelessVlan"); %>';
var WLVlanId_5g = '<% getCfgGeneral(1, "WirelessVlan5G"); %>';
var radio_off = '<% getCfgZero(1, "RadioOff"); %>';
var radio_off_5g = '<% getCfgZero(1, "RadioOff_3572"); %>';

function StartTheTimer()
{
if (secs==0) {
TimeoutReload(5);
//window.location.reload();
window.location.href=window.location.href;	//reload page
} else {
self.status = secs;
secs = secs - 1;
timerRunning = true;
timerID = self.setTimeout("StartTheTimer()", 1000);
}
}

function TimeoutReload(timeout)
{
secs = timeout;
if (timerRunning)
clearTimeout(timerID);
timerRunning = false;
StartTheTimer();
}

function dhcpTypeSwitch()
{
if (getVleFromElmt(f.lanDhcpType[0]) == 1) {
cpntCtrl(true, f, f.dhcpStart, 5);
} else {
cpntCtrl(false, f, f.dhcpStart, 5);
}

if (getVleFromElmt(f.lanDhcpType[2]) == 2)
f.dhcpRelayServerIP.disabled = false;
else
f.dhcpRelayServerIP.disabled = true;
}

function dhcp2TypeSwitch()
{
if (getVleFromElmt(f.lan2DhcpType[0]) == 1)
cpntCtrl(true, f, f.dhcp2Start, 5);
else
cpntCtrl(false, f, f.dhcp2Start, 5);

if (getVleFromElmt(f.lan2DhcpType[2]) == 2)
f.dhcp2RelayServerIP.disabled = false;
else
f.dhcp2RelayServerIP.disabled = true;
}

function initTranslation()
{
var e = document.getElementById("lTitle");
e.innerHTML = _("parent lan")+" >> "+_("lan title");

e = document.getElementById("lApm");
e.innerHTML = _("lan apm");
e = document.getElementById("lApmcEn");
e.innerHTML = _("lan apmc enable");
e = document.getElementById("lApmcDhcpcEn");
e.innerHTML = _("lan apmc dhcpc enable");
e = document.getElementById("lApmcDhcpcEn1");
e.innerHTML = _("lan apmc dhcpc enable");
e = document.getElementById("lApmcAutoProvEn");
e.innerHTML = _("lan apmc autoprov enable");
e = document.getElementById("lSetup");
e.innerHTML = _("lan setup");
e = document.getElementById("lNetType");
if (vlan_exit == 1 && vlan_enable == "1")
e.innerHTML = _("lan1 type");
else
e.innerHTML = _("lan type");

e = document.getElementById("l2NetType");
e.innerHTML = _("lan2 type");
e = document.getElementById("lNetSetup");
e.innerHTML = _("lan network setup");
e = document.getElementById("l2NetSetup");
e.innerHTML = _("lan network setup");
e = document.getElementById("lLan");
e.innerHTML = _("inet lan");
e = document.getElementById("l2Lan");
e.innerHTML = _("inet lan");
e = document.getElementById("lIp");
e.innerHTML = _("inet ip");
e = document.getElementById("l2Ip");
e.innerHTML = _("inet ip");
e = document.getElementById("lNetmask");
e.innerHTML = _("inet netmask");
e = document.getElementById("l2Netmask");
e.innerHTML = _("inet netmask");
e = document.getElementById("lNetGateway");
e.innerHTML = _("inet gateway");

e = document.getElementById("lDHCPSetup");
e.innerHTML = _("lan dhcp setup");
e = document.getElementById("l2DHCPSetup");
e.innerHTML = _("lan dhcp setup");
e = document.getElementById("lDhcpTypeE");
e.innerHTML = _("lan dhcp enable");
e = document.getElementById("l2DhcpTypeE");
e.innerHTML = _("lan dhcp enable");
e = document.getElementById("lDhcpTypeD");
e.innerHTML = _("lan dhcp disable");
e = document.getElementById("l2DhcpTypeD");
e.innerHTML = _("lan dhcp disable");
e = document.getElementById("lDhcpTypeR");
e.innerHTML = _("lan dhcp relay");
e = document.getElementById("l2DhcpTypeR");
e.innerHTML = _("lan dhcp relay");
e = document.getElementById("lDhcpStart");
e.innerHTML = _("lan dhcp start");
e = document.getElementById("l2DhcpStart");
e.innerHTML = _("lan dhcp start");
e = document.getElementById("lDhcpEnd");
e.innerHTML = _("lan dhcp end");
e = document.getElementById("l2DhcpEnd");
e.innerHTML = _("lan dhcp end");
e = document.getElementById("lDhcpNetmask");
e.innerHTML = _("inet netmask");
e = document.getElementById("l2DhcpNetmask");
e.innerHTML = _("inet netmask");
e = document.getElementById("lDhcpGateway");
e.innerHTML = _("inet gateway");
e = document.getElementById("l2DhcpGateway");
e.innerHTML = _("inet gateway");
e = document.getElementById("lDhcpLease");
e.innerHTML = _("lan dhcp lease");
e = document.getElementById("l2DhcpLease");
e.innerHTML = _("lan dhcp lease");
e = document.getElementById("lDhcpDns");
e.innerHTML = _("lan dns");
e = document.getElementById("lDhcpPriDns");
e.innerHTML = _("inet pri dns");
e = document.getElementById("l2DhcpPriDns");
e.innerHTML = _("inet pri dns");
e = document.getElementById("lDhcpSecDns");
e.innerHTML = _("inet sec dns");
e = document.getElementById("l2DhcpSecDns");
e.innerHTML = _("inet sec dns");
e = document.getElementById("lDhcpRelay");
e.innerHTML = _("lan dhcp relay server");
e = document.getElementById("l2DhcpRelay");
e.innerHTML = _("lan dhcp relay server");

e = document.getElementById("lPppoer");
e.innerHTML = _("lan pppoer");
e = document.getElementById("l2Pppoer");
e.innerHTML = _("lan pppoer");

for (i=0;i<2;i++) {
e = document.getElementById("lVlanMngtEn_"+i);
e.innerHTML = _("lan management vlan");
e = document.getElementById("lVlanMngtId_"+i);
e.innerHTML = _("lan management vlan id");

}
e = document.getElementById("lApply");
e.value = _("inet apply");
e = document.getElementById("lCancel");
e.value = _("inet cancel");
}

function initValue()
{
var dhcp = <% getCfgZero(1, "dhcpEnabled"); %>;
var dhcp2 = <% getCfgZero(1, "dhcp2Enabled"); %>;
var pppoe = <% getCfgZero(1, "pppoeREnabled"); %>;
var dhcpc_lanA_en = "<% getCfgGeneral(1, "dhcpc_lanA_en"); %>";
var dhcpc_lanB_en = "<% getCfgGeneral(1, "dhcpc_lanB_en"); %>";
var apmc_autoprov_en = "<% getCfgGeneral(1, "apmc_auto_provision_en"); %>";
var wan = "<% getCfgZero(1, "wanConnectionMode"); %>";
var pppoeb = "<% getPppoeRelayBuilt(); %>";
var apmcb = "<% getApmcBuilt(); %>";
var vlan_info = "<% getCfgZero(1, "ManagementVlan"); %>";

if(parent.dhcpEnabled != dhcp) {
window.parent.menu.location.reload();
}
parent.dhcpEnabled = dhcp;

initTranslation();

if (vlan_exit == 1 && vlan_enable == "1") {
document.getElementById("vlan2_tbl").style.visibility = "";
document.getElementById("vlan2_tbl").style.display = "";
}

if (dhcp == "1")
f.lanDhcpType[0].checked = true;
else if (dhcp == "2")
f.lanDhcpType[2].checked = true;
else
f.lanDhcpType[1].checked = true;
dhcpTypeSwitch();

setVle2Elmt(f.lan2DhcpType[0], parseInt(dhcp2), 0);
dhcp2TypeSwitch();

if (pppoe == 1)
f.pppoeREnbl.checked = true;
else
f.pppoeREnbl.checked = false;

if (pppoeb == "0") {
document.getElementById("pppoerelay").style.visibility = "hidden";
document.getElementById("pppoerelay").style.display = "none";
f.pppoeREnbl.checked = false;
}
document.getElementById("pppoe2relay").style.visibility = "hidden";
document.getElementById("pppoe2relay").style.display = "none";

if (dhcpc_lanA_en == "0")
f.lanADhcpcEn.checked = false;
else
f.lanADhcpcEn.checked = true;

if (dhcpc_lanB_en != "1")
f.lanBDhcpcEn.checked = false;
else
f.lanBDhcpcEn.checked = true;


if (apmcb == "0") {
document.getElementById("trApm").style.visibility = "hidden";
document.getElementById("trApm").style.display = "none";
document.getElementById("trApmcEn").style.visibility = "hidden";
document.getElementById("trApmcEn").style.display = "none";
document.getElementById("trApmcDhcpEn").style.visibility = "hidden";
document.getElementById("trApmcDhcpEn").style.display = "none";
document.getElementById("trApmcDhcpEn1").style.visibility = "hidden";
document.getElementById("trApmcDhcpEn1").style.display = "none";
document.getElementById("trApmcAutoProvEn").style.visibility = "hidden";
document.getElementById("trApmcAutoProvEn").style.display = "none";
document.getElementById("trLanIp").style.visibility = "hidden";
document.getElementById("trLanIp").style.display = "none";
f.lanApmcEn.checked = false;
}
if(1){
document.getElementById("trApm").style.visibility = "hidden";
document.getElementById("trApm").style.display = "none";
document.getElementById("trApmcEn").style.visibility = "hidden";
document.getElementById("trApmcEn").style.display = "none";
document.getElementById("trApmcAutoProvEn").style.visibility = "hidden";
document.getElementById("trApmcAutoProvEn").style.display = "none";
document.getElementById("trLanIp").style.visibility = "hidden";
document.getElementById("trLanIp").style.display = "none";
}

if (opmode == 0) {
document.getElementById("langateway").style.visibility = "visible";
document.getElementById("langateway").style.display = "";
} else {
document.getElementById("langateway").style.visibility = "hidden";
document.getElementById("langateway").style.display = "none";
}
if (vlan_info.length <= 1)
vlan_info = "0;0;0";
var vlan = vlan_info.split(";");
if (vlan[1] == "0" && vlan[2] == "0" && (vlan[0] != "0"))
vlan[0] = 0;
setVle2Elmt(f.lanVlanEnable0, vlan[0], 0);
setVle2Elmt(f.lanVlanEnable1, vlan[0], 0);
setVle2Elmt(f.lanVlanId0, vlan[1], 0);
setVle2Elmt(f.lanVlanId1, vlan[2], 0);
onClkVlanEn(0);
onChgApmDhcpcEn(0);
var lanGatewayIP = getVleFromElmt(f.lanGateway);
if ( lanGatewayIP == "") {
lanGatewayIP = "<% getCfgGeneral(1, "lan_gateway"); %>";
setVle2Elmt(f.lanGateway, lanGatewayIP, 0);
}
}

function CheckValue()
{
if (!checkIpAddr(f.lanIp, false))
return false;
if (!checkIpAddr(f.lanNetmask, true))
return false;

var lanGatewayIP = getVleFromElmt(f.lanGateway);
if ( lanGatewayIP != "") {
if (!checkIpAddr(f.lanGateway, false))
return false;
}

if (!checkIpAddr(f.lan2Ip, false))
return false;
if (!checkIpAddr(f.lan2Netmask, true))
return false;
if (f.lanDhcpType[0].checked == true) {
if (!checkIpAddr(f.dhcpStart, false))
return false;
if (!checkIpAddr(f.dhcpEnd, false))
return false;
if (!checkIpAddr(f.dhcpMask, true))
return false;
if (!checkIpAddr(f.dhcpGateway, false))
return false;
}
if (f.lan2DhcpType[0].checked == true) {
if (!checkIpAddr(f.dhcp2Start, false))
return false;
if (!checkIpAddr(f.dhcp2End, false))
return false;
if (!checkIpAddr(f.dhcp2Mask, true))
return false;
if (!checkIpAddr(f.dhcp2Gateway, false))
return false;
}
if (f.dhcpPriDns.value != "")
if (!checkIpAddr(f.dhcpPriDns, false))
return false;
if (f.dhcpSecDns.value != "")
if (!checkIpAddr(f.dhcpSecDns, false))
return false;
if (f.dhcp2PriDns.value != "")
if (!checkIpAddr(f.dhcp2PriDns, false))
return false;
if (f.dhcp2SecDns.value != "")
if (!checkIpAddr(f.dhcp2SecDns, false))
return false;

if (f.lanDhcpType[2].checked == true) {
if (!checkIpAddr(f.dhcpRelayServerIP, false))
return false;
}
if (f.lan2DhcpType[2].checked == true) {
if (!checkIpAddr(f.dhcp2RelayServerIP, false))
return false;
}

if (vlan_exit == 1 && vlan_enable == "1" && isEqualLan(f.lanIp.value, f.lanNetmask.value, f.lan2Ip.value)) {
alert("LAN-A and LAN-B should not be in the same domain!!");
return false;
}
if (isNaN(f.lanVlanId0.value) || (parseInt(f.lanVlanId0.value)>4095) ||  (parseInt(f.lanVlanId0.value)< 0)) {
alert("VLAN ID must be between 1 and 4095!");
return false;
}
if (isNaN(f.lanVlanId1.value) || (parseInt(f.lanVlanId1.value)>4095) ||  (parseInt(f.lanVlanId1.value)< 0)) {
alert("VLAN ID must be between 1 and 4095!");
return false;
}

if (f.lanVlanEnable0.checked){
var vlanstatus = 0;
if( radio_off != 1){
if (WLVlanId == "") WLVlanId = "0;0;0;0";
var vlans_id = WLVlanId.split(";");
for(var i=0; i<arySubnet.length;i++){
if(arySSID[i]!="" && arySubnet[i]=="1" && f.lanVlanId0.value==vlans_id[i] && vlans_id[i]!="0") {
vlanstatus = 1;
break;
}
}
}
if( radio_off_5g != 1){
if (WLVlanId_5g == "") WLVlanId_5g = "0;0;0;0";
var vlans_id = WLVlanId_5g.split(";");
for(var i=0; i<arySubnet.length;i++){
if(arySSID[i]!="" && arySubnet[i]=="1" && f.lanVlanId0.value==vlans_id[i] && vlans_id[i]!="0") {
vlanstatus = 1;
break;
}
}
}
if( radio_off != 1){
if (WLVlanId == "") WLVlanId = "0;0;0;0";
var vlans_id = WLVlanId.split(";");
if (vlan_exit == 1 && vlan_enable == "1") {
for(var i=0; i<arySubnet.length;i++){
if(arySSID[i]!="" && arySubnet[i]=="2" && f.lanVlanId1.value==vlans_id[i] && vlans_id[i]!="0") {
vlanstatus+=2;
break;
}
}
}
}
if( radio_off_5g != 1){
if (WLVlanId_5g == "") WLVlanId_5g = "0;0;0;0";
var vlans_id = WLVlanId_5g.split(";");
if (vlan_exit == 1 && vlan_enable == "1") {
for(var i=0; i<arySubnet.length;i++){
if(arySSID[i]!="" && arySubnet[i]=="2" && f.lanVlanId1.value==vlans_id[i] && vlans_id[i]!="0") {
vlanstatus+=2;
break;
}
}
}
}
if (vlan_exit == 1 && vlan_enable == "1") {
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
if(vlanstatus==1){
alert("Error\r\nManagement VLAN ID conficts with Wireless VLAN ID");
return false;
}
}
}

f.lanVlanId0.disabled = false;
f.lanVlanId1.disabled = false;

f.lanADhcpcEn.disabled = false;
f.lanBDhcpcEn.disabled = false;

f.lanIp.disabled = false;
f.lanNetmask.disabled = false;
f.lanGateway.disabled = false;
f.lan2Ip.disabled = false;
f.lan2Netmask.disabled = false;
if(0){
if (confirm(_("msg lan apmc en"))) {
document.getElementById("rip_1").href = "javascript:top.location='http://"+f.lanIp.value+"'";
document.getElementById("rip_2").href = "javascript:top.location='http://"+f.lan2Ip.value+"'";
document.getElementById("rlan_1").innerHTML = "http://"+f.lanIp.value;
document.getElementById("rlan_2").innerHTML = "http://"+f.lan2Ip.value;
hideElmtById(document, "lan_set_dispaly");
showElmtById(document, "lan_apmc_dispaly");
TimeoutReload(20);
return true;
} else {
return false;
}
} else if (confirm(_("msg lan connection lost"))) {
if(f.lanIp.value != "<% getLanIp(); %>" || f.lan2Ip.value != '<% getCfgGeneral(1, "lan2_ipaddr", 1); %>'){
document.getElementById("rip1").href = "javascript:top.location='http://"+f.lanIp.value+':<% getCfgGeneral(1, "HTTP_ServerPort"); %>'+"'";
document.getElementById("rip2").href = "javascript:top.location='http://"+f.lan2Ip.value+':<% getCfgGeneral(1, "HTTP_ServerPort"); %>'+"'";
document.getElementById("rlan1").innerHTML = "http://"+f.lanIp.value+':<% getCfgGeneral(1, "HTTP_ServerPort"); %>';
document.getElementById("rlan2").innerHTML = "http://"+f.lan2Ip.value+':<% getCfgGeneral(1, "HTTP_ServerPort"); %>';
hideElmtById(document,"lan_set_dispaly");
showElmtById(document, "lan_finish_dispaly");
}
TimeoutReload(20);
return true;
} else
return false;
}

function recIpCfg(idx)
{
aryLanOldIP[idx] = aryLanElmt[idx][0].value;
}

/*
* Try to modify dhcp server configurations:
*   dhcp start/end ip address to the same as new lan ip address
*/
function modDhcpCfg(idx)
{
var i, j;
var mask = aryLanElmt[idx][1].value;
var newNet = aryLanElmt[idx][0].value;

//support simple subnet mask only
if (mask == "255.255.255.0")
mask = 3;
else if (mask == "255.255.0.0")
mask = 2;
else if (mask == "255.0.0.0")
mask = 1;
else
return;

//get the old subnet
for (i=0, j=0; i<aryLanOldIP[idx].length; i++) {
if (aryLanOldIP[idx].charAt(i) == '.') {
j++;
if (j != mask)
continue;
aryLanOldIP[idx] = aryLanOldIP[idx].substring(0, i);
break;
}
}

//get the new subnet
for (i=0, j=0; i<newNet.length; i++) {
if (newNet.charAt(i) == '.') {
j++;
if (j != mask)
continue;
newNet = newNet.substring(0, i);
break;
}
}

aryLanElmt[idx][2].value = aryLanElmt[idx][2].value.replace(aryLanOldIP[idx], newNet);
aryLanElmt[idx][3].value = aryLanElmt[idx][3].value.replace(aryLanOldIP[idx], newNet);
aryLanElmt[idx][5].value = aryLanElmt[idx][5].value.replace(aryLanOldIP[idx], newNet);
}

function onClkVlanEn(idx)
{
if (idx ==0){
if (f.lanVlanEnable0.checked)
f.lanVlanEnable1.checked = true;
else
f.lanVlanEnable1.checked = false;

} else if (idx ==1) {
if (f.lanVlanEnable1.checked)
f.lanVlanEnable0.checked = true;
else
f.lanVlanEnable0.checked = false;
}
if (f.lanVlanEnable0.checked) {
f.lanVlanId0.disabled = false;
f.lanVlanId1.disabled = false;
} else {
f.lanVlanId0.disabled = true;
f.lanVlanId1.disabled = true;
}
}

function onChgApmDhcpcEn(idx)
{
if(idx == 1){
if (f.lanADhcpcEn.checked) {
f.lanIp.disabled = true;
f.lanNetmask.disabled = true;
f.lanGateway.disabled = true;
} else {
f.lanIp.disabled = false;
f.lanNetmask.disabled = false;
f.lanGateway.disabled = false;
}
} else if(idx == 2){
if (f.lanBDhcpcEn.checked) {
f.lan2Ip.disabled = true;
f.lan2Netmask.disabled = true;
} else {
f.lan2Ip.disabled = false;
f.lan2Netmask.disabled = false;
}
} else{
if (f.lanADhcpcEn.checked) {
f.lanIp.disabled = true;
f.lanNetmask.disabled = true;
f.lanGateway.disabled = true;
} else {
f.lanIp.disabled = false;
f.lanNetmask.disabled = false;
f.lanGateway.disabled = false;
}
if (f.lanBDhcpcEn.checked) {
f.lan2Ip.disabled = true;
f.lan2Netmask.disabled = true;
} else {
f.lan2Ip.disabled = false;
f.lan2Netmask.disabled = false;
}
}
}

</script>
