<html>
<head>
<title>DHCP Table</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("internet");

var opmode = "<% getCfgGeneral(1, "OperationMode"); %>";
var ap800_mode = "<% getCfgGeneral(1, "800_ap_mode"); %>";
var vlan_enable = '<% getCfgGeneral(1, "WL_VLAN"); %>';
var dhcp = <% getCfgZero(1, "dhcpEnabled"); %>;
var dhcp2 = <% getCfgZero(1, "dhcp2Enabled"); %>;
var vlan_exit = 0;
if (opmode == "0") {
if (ap800_mode == "0" || ap800_mode == "3")
vlan_exit = 1;
else
vlan_exit = 0;
} else if (opmode == "3")
vlan_exit = 1;

function initValue()
{
var e = document.getElementById("dTitle");
e.innerHTML = _("parent diagonostics")+" >> "+_("dhcp title");


e = document.getElementById("lNetType");
if (vlan_exit == 1 && vlan_enable == "1")
e.innerHTML = _("lan1 type");
e = document.getElementById("l2NetType");
e.innerHTML = _("lan2 type");

e = document.getElementById("dClients");
e.innerHTML = _("dhcp table");
e = document.getElementById("dRefresh");
e.innerHTML = _("dhcp refresh");
e = document.getElementById("dHostname");
e.innerHTML = _("dhcp hostname");
e = document.getElementById("dIp");
e.innerHTML = _("inet ip");
e = document.getElementById("dMac");
e.innerHTML = _("inet mac");
e = document.getElementById("dExpr");
e.innerHTML = _("dhcp expire");
e = document.getElementById("d2Clients");
e.innerHTML = _("dhcp table");
e = document.getElementById("d2Hostname");
e.innerHTML = _("dhcp hostname");
e = document.getElementById("d2Ip");
e.innerHTML = _("inet ip");
e = document.getElementById("d2Mac");
e.innerHTML = _("inet mac");
e = document.getElementById("d2Expr");
e.innerHTML = _("dhcp expire");

if (dhcp == 1) {
document.getElementById("lan1").style.visibility = "";
document.getElementById("lan1").style.display = "";
}
if (vlan_exit == 1 && vlan_enable == "1" && dhcp2 == 1) {
document.getElementById("lan2").style.visibility = "";
document.getElementById("lan2").style.display = "";
}
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="dTitle">DHCP Table List</h1>
<hr size="1" />
<br />

<div id="lan1" style="display:none">
<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
<td><h2><span id=lNetType></span>&nbsp;<span id="dClients">DHCP Table</span></h2></td>
<td align="right" class="red">|&nbsp;&nbsp;<a href="./dhcpcliinfo.asp" id="dRefresh">Refresh</a>&nbsp;&nbsp;|</td>
</tr>
</table>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="title" id="dHostname">Host Name (optional)</td>
<td class="title" id="dIp">IP Address</td>
<td class="title" id="dMac">MAC Address</td>
<td class="title" id="dExpr">Expire Time</td>
</tr>
<% getDhcpCliList(); %>
</table>
</div>
<br />

<div id="lan2" style="display:none">
<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
<td><h2><span id=l2NetType></span>&nbsp;<span id="d2Clients">DHCP Table</span></h2></td>
</tr>
</table>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="title" id="d2Hostname">Host Name (optional)</td>
<td class="title" id="d2Ip">IP Address</td>
<td class="title" id="d2Mac">MAC Address</td>
<td class="title" id="d2Expr">Expire Time</td>
</tr>
<% getDhcp2CliList(); %>
</table>
</div>
</td></tr>
</table>

</body>
</html>
