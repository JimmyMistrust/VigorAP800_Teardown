<html>
<head>
<title>System Status</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="refresh" content="6; URL=./sys.asp">
<style type="text/css">
<!--
table.config td {
font-family: Verdana,Arial,Helvetica;
}
-->
</style>
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
Butterlate.setTextDomain("internet");

var opmode = "<% getCfgGeneral(1, "OperationMode"); %>";
var curpwd = "<% getCfgGeneral(1, "Password"); %>";
var ap800_mode = "<% getCfgGeneral(1, "800_ap_mode"); %>";
var vlan_enable = '<% getCfgGeneral(1, "WL_VLAN"); %>';
var vlan_exit = 0;
if (opmode == "0") {
if (ap800_mode == "0" || ap800_mode == "3")
vlan_exit = 1;
else
vlan_exit = 0;
} else if (opmode == "3")
vlan_exit = 1;

function showOpMode()
{
if (opmode == "0") {
switch (ap800_mode) {
case "0":
document.write("AP");
break;
case "1":
document.write("AP Bridge-Point to Point");
break;
case "2":
document.write("AP Bridge-Point to Multi-Point");
break;
case "3":
document.write("AP Bridge-WDS");
break;
default:
document.write("Unknown");
break;
}
} else if (opmode == "2")
document.write("Station-Infrastructure");
else if (opmode == "3")
document.write("Universal Repeater");
else
document.write("Unknown");
}

function initTranslation()
{
var e = document.getElementById("statusTitle");
e.innerHTML = _("status title");

e = document.getElementById("statusModel");
e.innerHTML = _("status model");
e = document.getElementById("statusSDKVersion");
e.innerHTML = _("status sdk version");
e = document.getElementById("statusBuildDate");
e.innerHTML = _("status build date");
e = document.getElementById("statusSysDate");
e.innerHTML = _("status system date");
e = document.getElementById("statusSysUpTime");
e.innerHTML = _("status system up time");
e = document.getElementById("statusOPMode");
e.innerHTML = _("status operate mode");

e = document.getElementById("statusSystem");
e.innerHTML = _("status system");
e = document.getElementById("statisticMMTotal");
e.innerHTML = _("status memory total");
e = document.getElementById("statisticMMLeft");
e.innerHTML = _("status memory left");

e = document.getElementById("statusLocalNet");
if (vlan_exit == 1 && vlan_enable == "1")
e.innerHTML = _("lan1 type");
else
e.innerHTML = _("status local network");
e = document.getElementById("statusLANMAC");
e.innerHTML = _("status mac");
e = document.getElementById("statusLANIPAddr");
e.innerHTML = _("status ipaddr");
e = document.getElementById("statusLocalNetmask");
e.innerHTML = _("status netmask");

e = document.getElementById("statusLAN2");
e.innerHTML = _("lan2 type");
e = document.getElementById("statusLAN2MAC");
e.innerHTML = _("status mac");
e = document.getElementById("statusLAN2IPAddr");
e.innerHTML = _("status ipaddr");
e = document.getElementById("statusLAN2Netmask");
e.innerHTML = _("status netmask");

e = document.getElementById("statusWLan");
e.innerHTML = _("status wlan status");
e = document.getElementById("statusWLan5G");
e.innerHTML = _("status wlan status 5G");
e = document.getElementById("statusWLanMAC");
e.innerHTML = _("status mac");
e = document.getElementById("statusWLanMAC5G");
e.innerHTML = _("status mac");
/*
e = document.getElementById("statusWLanDevice");
e.innerHTML = _("status wlan device");
*/
e = document.getElementById("statusWLanSSID");
e.innerHTML = _("status wlan ssid");
e = document.getElementById("statusWLanSSID5G");
e.innerHTML = _("status wlan ssid");
e = document.getElementById("statusWLanChannel");
e.innerHTML = _("status wlan channel");
e = document.getElementById("statusWLanChannel5G");
e.innerHTML = _("status wlan channel");
if(curpwd=="admin")
document.getElementById("pwdmsg").innerHTML = _("warn default pwd1");//+"<br>"+_("warn default pwd2");//_("warn default pwd");

}

function PageInit()
{
if (typeof(parent.wizard.isRefresh) != "undefined" && parent.wizard.isRefresh == "1") {
parent.wizard.isRefresh = "0";
parent.location.reload();
}

var radioOff = "<% getCfgGeneral(1, "RadioOff"); %>";
var radioOff5G = "<% getCfgZero(1, "RadioOff_3572"); %>";

if (vlan_exit == 1 && vlan_enable == "1") {
document.getElementById("lan2").style.visibility = "";
document.getElementById("lan2").style.display = "";
}
var WLanChnVal = '<% getCfgGeneral(1, "Channel"); %>';
var WLan5GChnVal = '<% getWlanChannel_5g(); %>';
initTranslation();

if (opmode != "2") {
document.getElementById("stationMode0").style.display = "";
document.getElementById("stationMode1").style.display = "";
} else {
document.getElementById("stationMode0").style.display = "none";
document.getElementById("stationMode1").style.display = "none";
}
if (opmode != "2") {
document.getElementById("stationMode5G0").style.display = "";
document.getElementById("stationMode5G1").style.display = "";
} else {
document.getElementById("stationMode5G0").style.display = "none";
document.getElementById("stationMode5G1").style.display = "none";
}
// Wireless Info
if (radioOff == "0")
document.getElementById("wlaninfo").style.display = "";
else
document.getElementById("wlaninfo").style.display = "none";
if(radioOff5G == "0")
document.getElementById("wlaninfo5G").style.display = "";
else
document.getElementById("wlaninfo5G").style.display = "none";
if (WLanChnVal == "0")
document.getElementById("WLanChnVal").innerHTML = "Auto(<% getWlanChannel_AutoSelect();%>)";
else
document.getElementById("WLanChnVal").innerHTML = WLanChnVal;
if (WLan5GChnVal == "0")
document.getElementById("WLan5GChnVal").innerHTML = "Auto";
else
document.getElementById("WLan5GChnVal").innerHTML = WLan5GChnVal;
if (opmode == "0"){
if(ap800_mode == 1 || ap800_mode == 2){
document.getElementById("stationMode0").style.display = "none";
}
}
}
</script>
</head>

<body onload="PageInit()">
<table width="100%" cellspacing="0" cellpadding="0" border="0" align="left" style="padding-left: 20px;">
<tr><td>
<h1 id="statusTitle">System Status</h1>
<hr size="1" />
</td></tr>

<!-- ================= System Info ================= -->
<tr><td>
<table width="80%" border="0" cellpadding="0" cellspacing="0" align="left">
<tr>
<td width="30%" class="arial" id="statusModel">Model</td>
<td class="arial"> : VigorAP 800</td>
</tr>
<tr>
<td class="arial" id="statusDevice">Device Name</td>
<td class="arial"> : <% getCfgGeneral(1, "Device_Name"); %></td>
</tr>
<tr>
<td class="arial" id="statusSDKVersion">Firmware Version</td>
<td class="arial"> : <% getSdkVersion(); %></td>
</tr>
<tr>
<td class="arial" id="statusBuildDate">Build Date/Time</td>
<td class="arial"> : <% getSysRevision(); %> <% getSysBuildTime(); %></td>
</tr>
<tr style="display:none">
<td class="arial" id="statusSysDate">System Date</td>
<td class="arial"> : <% getSysDate(); %></td>
</tr>
<tr>
<td class="arial" id="statusSysUpTime">System Uptime</td>
<td class="arial"> : <% getSysUptime(); %></td>
</tr>
<tr>
<td class="arial" id="statusOPMode">Operation Mode</td>
<td class="arial"> : <script type="text/javascript">showOpMode();</script></td>
</tr>
</table>
</td></tr>

<tr><td>
<br />
<table cellspacing="2" cellpadding="2" border="0" align="left">
<tr valign="top">
<td width="50%">
<!-- ================= System ================= -->
<table cellspacing="0" cellpadding="0" border="0" align="left">
<tr valign="top"><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config" style="border-bottom: none">
<tr><td>
<table cellspacing="2" cellpadding="0" border="0" align="center">
<tr><td class="title" id="statusSystem">System</td></tr>
</table>
</td></tr>
</table>
</td></tr>
<tr><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config">
<tr><td>
<table width="80%" cellspacing="2" cellpadding="0" border="0" align="center">
<tr>
<td width="44%" id="statisticMMTotal" class="head">Memory total</td>
<td> : <% getMemTotalASP(); %></td>
</tr>
<tr>
<td id="statisticMMLeft">Memory left</td>
<td> : <% getMemLeftASP(); %></td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</td>

<td width="15"> </td>

<td>
<!-- ================= LAN Network ================= -->
<table cellspacing="0" cellpadding="0" border="0" align="left" style="clear: both">
<tr valign="top"><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config" style="border-bottom: none">
<tr><td>
<table cellspacing="2" cellpadding="0" border="0" align="center">
<tr><td class="title" id="statusLocalNet">LAN</td></tr>
</table>
</td></tr>
</table>
</td></tr>
<tr><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config">
<tr><td>
<table width="80%" cellspacing="2" cellpadding="0" border="0" align="center">
<tr>
<td width="44%" id="statusLANMAC" class="head">MAC Address</td>
<td> : <% getLanMac(); %></td>
</tr>
<tr>
<td id="statusLANIPAddr">IP Address</td>
<td> : <% getLanIp(); %></td>
</tr>
<tr>
<td id="statusLocalNetmask">IP Mask</td>
<td> : <% getLanNetmask(); %></td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</td>
</tr>

<tr>
<td width="50%">
<!-- ================= Wireless Information ================= -->
<table id="wlaninfo" cellspacing="0" cellpadding="0" border="0" align="left">
<tr valign="top"><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config" style="border-bottom: none">
<tr><td>
<table cellspacing="2" cellpadding="0" border="0" align="center">
<tr><td class="title" id="statusWLan">Wireless</td></tr>
</table>
</td></tr>
</table>
</td></tr>
<tr><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config">
<tr><td>
<table width="80%" cellspacing="2" cellpadding="0" border="0" align="center">
<tr>
<td width="44%" id="statusWLanMAC" class="head">MAC Address</td>
<td> : <% getWlanCurrentMac(); %></td>
</tr>
<!-----
<tr>
<td id="statusWLanDevice">Device Type</td>
<td> : rt3052</td>
</tr>
--->
<tr id="stationMode0" style="display:none">
<td id="statusWLanSSID">SSID</td>
<td> : <% getCfgGeneral(1, "SSID1"); %></td>
</tr>
<tr id="stationMode1" style="display:none">
<td id="statusWLanChannel">Channel</td>
<td> : <span id="WLanChnVal"></span></td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</td>

<td width="15"> </td>

<td id="lan2" style="display:none">
<table cellspacing="0" cellpadding="0" border="0" align="left" style="clear: both">
<tr valign="top"><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config" style="border-bottom: none">
<tr><td>
<table cellspacing="2" cellpadding="0" border="0" align="center">
<tr><td class="title" id="statusLAN2">LAN</td></tr>
</table>
</td></tr>
</table>
</td></tr>
<tr><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config">
<tr><td>
<table width="80%" cellspacing="2" cellpadding="0" border="0" align="center">
<tr>
<td width="44%" id="statusLAN2MAC" class="head">MAC Address</td>
<td> : <% getLan2Mac(); %></td>
</tr>
<tr>
<td id="statusLAN2IPAddr">IP Address</td>
<td> : <% getLan2Ip(); %></td>
</tr>
<tr>
<td id="statusLAN2Netmask">IP Mask</td>
<td> : <% getLan2Netmask(); %></td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</td>
</tr>

<tr>
<td width="50%">
<!-- ================= Wireless 5G ================= -->
<table id="wlaninfo5G" cellspacing="0" cellpadding="0" border="0" align="left">
<tr valign="top"><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config" style="border-bottom: none">
<tr><td>
<table cellspacing="2" cellpadding="0" border="0" align="center">
<tr><td class="title" id="statusWLan5G">Wireless LAN(5G)</td></tr>
</table>
</td></tr>
</table>
</td></tr>
<tr><td>
<table width="350" cellspacing="0" cellpadding="0" align="left" class="config">
<tr><td>
<table width="80%" cellspacing="2" cellpadding="0" border="0" align="center">
<tr>
<td width="44%" id="statusWLanMAC5G" class="head">MAC Address</td>
<td> : <% getWlanCurrentMac(); %></td>
</tr>
<tr id="stationMode5G0" style="display:none">
<td id="statusWLanSSID5G">SSID</td>
<td> : <% getCfgGeneral(1, "SSID1_3572"); %></td>
</tr>
<tr id="stationMode5G1" style="display:none">
<td id="statusWLanChannel5G">Channel</td>
<td> : <span id="WLan5GChnVal"></span></td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</td>

<td width="15"> </td><td></td>
</tr>

</table>
</td></tr>
<tr><td><div id="pwdmsg" style="color:#cc0000; margin-top:10px; font-weight:bold;"></div></td></tr>
</table>
</body>
</html>
