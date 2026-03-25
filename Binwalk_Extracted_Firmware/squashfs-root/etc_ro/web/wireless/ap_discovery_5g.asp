<html>
<head>
<title>Wireless AP Discovery</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/dtree/ajax.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var opmode = '<% getCfgZero(1, "OperationMode"); %>';
var apmode = '<% getCfgZero(1, "800_ap_mode"); %>';
var wl_5g = '<% get5GExist(); %>';
var radio_off = '<% getCfgZero(1, "RadioOff_3572"); %>';

function initTranslation()
{
var e = document.getElementById("scanTitle");
e.innerHTML = _("parent wireless lan 5g")+" >> "+_("scan ap title");

e = document.getElementById("scanApDiscovery");
e.innerHTML = _("scan ap discovery");
e = document.getElementById("scanSSID");
e.innerHTML = _("station ssid");
e = document.getElementById("scanBSSID");
e.innerHTML = _("scan bssid");
e = document.getElementById("scanRSSI");
e.innerHTML = _("scan rssi");
e = document.getElementById("scanChannel");
e.innerHTML = _("station channel");
e = document.getElementById("scanEncryp");
e.innerHTML = _("station encryp");
e = document.getElementById("scanAuth");
e.innerHTML = _("station auth");
e = document.getElementById("scanRescan");
e.value = _("scan rescan");

e = document.getElementById("scanStr");
e.innerHTML = _("san str");
}

function PageInit()
{
if (wl_5g == "0") {
showElmtById(document, "warning");
document.ap_discovery.scanRescan.disabled = true;
} else {
document.ap_discovery.scanRescan.disabled = false;
}
initTranslation();
if (radio_off == 1)
document.getElementById("scanRescan").disabled = true;
else
document.getElementById("scanRescan").disabled = false;
}

function addRow(index, frag, values)
{
var tr = CreateStyledElement("tr", index % 2 ? "display_even" : "display_odd");

// The symbol of '$' will be replaced by spaces.
var ssid = values[1].replace(/\$/g, ' ');
tr.title = ssid;

if (ssid.length > 10) var ssidtmp = ssid.substring(0,10) + "...";
else var ssidtmp = ssid;
addTextCell(tr, ssidtmp, "cl");
addTextCell(tr, values[2], "cl");
addTextCell(tr, values[3]+"%", "cl");
addTextCell(tr, values[4], "cl");
addTextCell(tr, values[5], "cl");
addTextCell(tr, values[6], "cl");

frag.appendChild(tr);       // Add row to fragment
}

function processUpdate(req, ref)
{
if (req.responseText) {
var values = req.responseText.replace(/\s/g,"");
var frag = document.createDocumentFragment();
values = values.split("|");
for (var i=0; i<values.length; i++) {
if (values[i].length > 0){
var pval = values[i].split(",");
addRow(i, frag, pval);
}
}
var tbody = document.getElementById('ApBSSIDList');
clearChildNodes(tbody);
if (!tbody.appendChild(frag)) { // Add Frag to table body
alert(TR("This browser doesn't support dynamic tables."));
}
}
document.ap_discovery.scanRescan.value = "Scan";
document.ap_discovery.scanRescan.disabled = false;
}

function ClkScan()
{
document.ap_discovery.scanRescan.value = "Scanning";
document.ap_discovery.scanRescan.disabled = true;
loadXMLDoc("/goform/getApBSSIDList_5g", processUpdate);
}
</script>
</head>


<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="scanTitle">Access Point Discovery</h1>
<hr size="1" />
<br />

<form method=post name="ap_discovery" action="/goform/wirelessApDiscovery">
<div>
<h2 id="scanApDiscovery" class="title">Access Point List</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="title" id="scanSSID">SSID</td>
<td class="title" id="scanBSSID">BSSID</td>
<td class="title" id="scanRSSI">RSSI</td>
<td class="title" id="scanChannel">Channel</td>
<td class="title" id="scanEncryp">Encryption</td>
<td class="title" id="scanAuth">Authentication</td>
</tr>
<tbody id="ApBSSIDList"></tbody>
</table><br>

<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td colspan="2"><input type=button class="btnw" value="Scan" id="scanRescan" name="scanRescan" onClick="ClkScan();"></td>
</tr>
<tr>
<td class="title" valign="top">Note:</td>
<td id="scanStr">During the scanning process (about 5 seconds), no station is allowed to connect with the AP.</td>
</tr>
</table>

</div>
</form>

<div class="alert" id="warning" style="display:none">
No attached 5G wireless dongle was detected. Please attach a dongle and reload this page.
</div>
</td></tr>
</table>

</body>
</html>
