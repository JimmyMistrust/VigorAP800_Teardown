<html>
<head>
<title>Online Status</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="refresh" content="6; URL=./online.asp">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript">
Butterlate.setTextDomain("main");
Butterlate.setTextDomain("internet");
Butterlate.setTextDomain("wireless");
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

var printer_exit = "<% getPrinterExists(); %>";

function initTranslation()
{
var e = document.getElementById("olTitle");
e.innerHTML = _("online title");
e = document.getElementById("olSysTitle");
e.innerHTML = _("online system title");
e = document.getElementById("olSysUpTime");
e.innerHTML = _("online system uptime");

e = document.getElementById("olLanType");
if (vlan_exit == 1 && vlan_enable == "1")
e.innerHTML = _("lan1 type");
else
e.innerHTML = _("lan type");

e = document.getElementById("olLanStatus");
e.innerHTML = _("online si link extra info");
e = document.getElementById("olLanIPAddr");
e.innerHTML = _("online lan ipaddr");
e = document.getElementById("olLanTxPkts");
e.innerHTML = _("online tx pkts");
e = document.getElementById("olLanRxPkts");
e.innerHTML = _("online rx pkts");
e = document.getElementById("olLanTxBytes");
e.innerHTML = _("online tx bytes");
e = document.getElementById("olLanRxBytes");
e.innerHTML = _("online rx bytes");

e = document.getElementById("olLan2Type");
e.innerHTML = _("lan2 type");
e = document.getElementById("olLan2Status");
e.innerHTML = _("online si link extra info");
e = document.getElementById("olLan2IPAddr");
e.innerHTML = _("online lan ipaddr");
e = document.getElementById("olLan2TxPkts");
e.innerHTML = _("online tx pkts");
e = document.getElementById("olLan2RxPkts");
e.innerHTML = _("online rx pkts");
e = document.getElementById("olLan2TxBytes");
e.innerHTML = _("online tx bytes");
e = document.getElementById("olLan2RxBytes");
e.innerHTML = _("online rx bytes");

e = document.getElementById("SiLinkStatus");
e.innerHTML = _("online si link status");
e = document.getElementById("SiLinkSSIDIPAddr");
e.innerHTML = _("online lan ipaddr");
e = document.getElementById("SiLinkSSID");
e.innerHTML = _("online si link ssid");
e = document.getElementById("SiLinkStat");
e.innerHTML = _("online si link extra info");
e = document.getElementById("SiLinkChn");
e.innerHTML = _("online si link channel");
e = document.getElementById("SiLinkLinkSpeed");
e.innerHTML = _("online si link speed");
e = document.getElementById("SiLinkThroughput");
e.innerHTML = _("online si link throughput");
e = document.getElementById("SiLinkQua");
e.innerHTML = _("online si link quality");

e = document.getElementById("urTitle");
e.innerHTML = _("apcli title") + _("online si link extra info");
e = document.getElementById("olURIPAddr");
e.innerHTML = _("online wan ipaddr");
e = document.getElementById("olURGateway");
e.innerHTML = _("routing gateway");
e = document.getElementById("olURSSID");
e.innerHTML = _("wireless ssid");
e = document.getElementById("olURChannel");
e.innerHTML = _("station channel");
e = document.getElementById("olURMac");
e.innerHTML = _("online mac");
e = document.getElementById("olURSMode");
e.innerHTML = _("apcli mode");
e = document.getElementById("olURTxPkts");
e.innerHTML = _("online tx pkts");
e = document.getElementById("olURRxPkts");
e.innerHTML = _("online rx pkts");
}

function initValue()
{
if ('<% getURLink(); %>' == '') {  //red
colorBeginUR = "<font color=red>";
colorEndUR = "</font>";
} else {
colorBeginUR = "<font color=green>";
colorEndUR = "</font>";
}
document.getElementById("sURIP").innerHTML = "&nbsp;&nbsp;" + colorBeginUR + "<% getURIp(); %>" + colorEndUR;
document.getElementById("sURGW").innerHTML = colorBeginUR + "<% getURGateway(); %>" + colorEndUR;
document.getElementById("sURSsid").innerHTML = colorBeginUR + "<% getCfgGeneral(1, "ApCliSsid"); %>" + colorEndUR;
var channel = '<% getWlanChannel(); %>';
document.getElementById("sURChn").innerHTML = colorBeginUR + (channel == 0 ? 'Auto(<% getWlanChannel_AutoSelect();%>)' : channel) + colorEndUR;
document.getElementById("sURBSsid").innerHTML = "&nbsp;&nbsp;" + colorBeginUR + "<% getCfgGeneral(1, "ApCliBssid"); %>" + colorEndUR;
document.getElementById("sURAuthMode").innerHTML = colorBeginUR + "<% getCfgGeneral(1, "ApCliAuthMode"); %>" + colorEndUR;
document.getElementById("sURRxPkt").innerHTML = colorBeginUR + "<% getURRxPacketASP(); %>" + colorEndUR;
document.getElementById("sURTxPkt").innerHTML = colorBeginUR + "<% getURTxPacketASP(); %>" + colorEndUR;

if (opmode == '2')
showElmtById(document, "stationlink");
else if (opmode == '3')
showElmtById(document, "universalrepeater");

if (vlan_exit == 1 && vlan_enable == "1") {
document.getElementById("vlan2_tbl").style.visibility = "";
document.getElementById("vlan2_tbl").style.display = "";
}

if (printer_exit == "1")
document.getElementById("printer").style.visibility = "visible";
else
document.getElementById("printer").style.visibility = "hidden";

initTranslation();

var linkstat = "<% getStaExtraInfo(); %>";
var colorBegin, colorEnd;
if (linkstat == "EAP successd" || linkstat == "Link is Up") {
colorBegin = "<font color=green>";
colorEnd = "</font>";
} else {
colorBegin = "<font color=red>";
colorEnd = "</font>";
}
document.getElementById("sIP").innerHTML = colorBegin + "<% getStaIp(); %>" + colorEnd;
document.getElementById("sSSID").innerHTML = colorBegin + "<% getStaLinkStatus(); %>" + colorEnd;
document.getElementById("sLinkStatus").innerHTML = colorBegin + "<% getStaExtraInfo(); %>" + colorEnd;
document.getElementById("sLinkChannel").innerHTML = colorBegin + "<% getStaLinkChannel(); %>" + colorEnd;
document.getElementById("sLinkQuality").innerHTML = colorBegin + "<% getStaLinkQuality(); %>" + colorEnd;
document.getElementById("sLinkRate").innerHTML = colorBegin + <% getStaLinkTxRate(); %> + " / " + <% getStaLinkRxRate(); %> + colorEnd;
document.getElementById("sLinkThroughput").innerHTML = colorBegin + <% getStaTxThroughput(); %> + " / " + <% getStaRxThroughput(); %> + colorEnd;

}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="olTitle">Online Status</h1>
<hr size="1" />
<br />

<!-- ----------------- System Uptime ----------------- -->
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td class="title" id="olSysTitle">System Status</td>
<td>
<img id="printer" style="visibility: hidden;" alt="printer is connected" src="graphics/prt.gif" border="0"></img>
</td>
<td align="right" class="title"><span id="olSysUpTime">System Uptime</span>: <% getSysUptime(); %></td>
</tr>
</table>

<!-- ----------------- LAN Status ----------------- -->
<table width="100%" cellspacing="0" cellpadding="2" class="config" summary="LAN Status">
<tr>
<td colspan="6" class="title"><span id="olLanType">LAN</span> <span id="olLanStatus">Status</span></td>
</tr>
<tr>
<td width="20%" class="title" id="olLanIPAddr">IP Address</td>
<td width="20%" class="title" id="olLanTxPkts">TX Packets</td>
<td width="15%" class="title" id="olLanRxPkts">RX Packets</td>
<td width="15%" class="title" id="olLanTxBytes">TX Bytes</td>
<td width="15%" class="title" id="olLanRxBytes">RX Bytes</td>
<td width="15%"/>
</tr>
<tr>
<td class="green">&nbsp;&nbsp;<% getLanIp(); %></td>
<td class="green"><% getLANTxPacketASP(); %></td>
<td class="green"><% getLANRxPacketASP(); %></td>
<td class="green"><% getLANTxByteASP(); %></td>
<td class="green"><% getLANRxByteASP(); %></td>
<td class="green"/>
</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="2" class="config" id="vlan2_tbl" style="display:none">
<tr>
<td colspan="6" class="title"><span id="olLan2Type">LAN</span> <span id="olLan2Status">Status</span></td>
</tr>
<tr>
<td width="20%" class="title" id="olLan2IPAddr">IP Address</td>
<td width="20%" class="title" id="olLan2TxPkts">TX Packets</td>
<td width="15%" class="title" id="olLan2RxPkts">RX Packets</td>
<td width="15%" class="title" id="olLan2TxBytes">TX Bytes</td>
<td width="15%" class="title" id="olLan2RxBytes">RX Bytes</td>
<td width="15%"/>
</tr>
<tr>
<td class="green">&nbsp;&nbsp;<% getLan2Ip(); %></td>
<td class="green"><% getLAN2TxPacketASP(); %></td>
<td class="green"><% getLAN2RxPacketASP(); %></td>
<td class="green"><% getLAN2TxByteASP(); %></td>
<td class="green"><% getLAN2RxByteASP(); %></td>
<td class="green"/>
</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="2" class="config" summary="station link Status" id="stationlink" style="display:none">
<tr>
<td colspan="5" class="title" id="SiLinkStatus">Station Link Status</td>
</tr>
<tr>
<td width="20%" class="title" id="SiLinkSSIDIPAddr">IP Address</td>
<td width="20%" class="title" id="SiLinkSSID">SSID</td>
<td width="20%" class="title" id="SiLinkChn">Channel</td>
<td colspan="2" class="title" id="SiLinkStat">Status</td>
</tr>
<tr>
<td id="sIP"></td>
<td id="sSSID"></td>
<td id="sLinkChannel"></td>
<td colspan="2" id="sLinkStatus"></td>
</tr>
<tr>
<td class="title" id="SiLinkQua">Link Quality</td>
<td class="title" id="SiLinkLinkSpeed">Link Speed Tx/Rx(Mbps)</td>
<td class="title" id="SiLinkThroughput">Throughput Tx/Rx(Kbps)</td>
<td width="30%"></td>
</tr>
<tr>
<td id="sLinkQuality"></td>
<td id="sLinkRate"></td>
<td id="sLinkThroughput"></td>
<td width="30%"></td>
</tr>
</table>

<!-- ----------------- Universal Repeater Status ----------------- -->
<table width="100%" cellspacing="0" cellpadding="2" class="config" summary="Universal Repeater Status" id="universalrepeater" style="display:none">
<tr>
<td colspan="6" class="title" id="urTitle">Universal Repeater Status</td>
</tr>
<tr>
<td class="title" id="olURIPAddr">IP</td>
<td class="title" id="olURGateway">Gateway</td>
<td class="title" id="olURSSID">SSID</td>
<td class="title" id="olURChannel">Channel</td>
</tr>
<tr>
<td id="sURIP"></td>
<td id="sURGW"></td>
<td id="sURSsid"></td>
<td id="sURChn"></td>
</tr>
<tr>
<td class="title" id="olURMac">Mac</td>
<td class="title" id="olURSMode">Security Mode</td>
<td class="title" id="olURTxPkts">TX Packets</td>
<td class="title" id="olURRxPkts">RX Packets</td>
</tr>
<tr>
<td id="sURBSsid"></td>
<td id="sURAuthMode"></td>
<td id="sURRxPkt"></td>
<td id="sURTxPkt"></td>
</tr>
</table>
</td></tr>
</table>
</body>
</html>