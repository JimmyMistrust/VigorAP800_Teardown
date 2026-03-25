<html>
<head>
<title>Wireless AP WDS Status</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/dtree/ajax.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

function countTime()
{
setTimeout("window.location.reload();", 1000*4);
}

function initTranslation()
{
var e = document.getElementById("wdssTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("wds status title");

e = document.getElementById("wdsStatus");
e.innerHTML = _("wds status list");

e = document.getElementById("wdssAID");
e.innerHTML = _("wds status aid");
e = document.getElementById("wdssSSID");
e.innerHTML = _("wds status ssid");
e = document.getElementById("wdssPhyMode");
e.innerHTML = _("wds status phy mode");
e = document.getElementById("wdssPowerSave");
e.innerHTML = _("wds status power save");
e = document.getElementById("wdssBandwidth");
e.innerHTML = _("wds status bandwidth");
}

function PageInit()
{
initTranslation();
ClkScan();
}

function addRow(index, frag, values)
{
//Aid, MAC Address, Phy Mode, Power Save, Bandwidth

var tr = CreateStyledElement("tr", index % 2 ? "config_even" : "config_odd");
tr.title = values[0];
addTextCell(tr, values[0], "cl");
addTextCell(tr, values[1], "cl");
addTextCell(tr, values[2], "cl");
addTextCell(tr, values[3], "cl");
addTextCell(tr, values[4], "cl");

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
var tbody = document.getElementById('APWDSList');
clearChildNodes(tbody);
if (!tbody.appendChild(frag)) { // Add Frag to table body
alert(TR("This browser doesn't support dynamic tables."));
}
}
document.wds_status.scanRescan.disabled = false;
}

function ClkScan()
{
document.wds_status.scanRescan.disabled = true;
loadXMLDoc("/goform/getApWDSList", processUpdate);
}
</script>
</head>


<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="wdssTitle">AP WDS Status</h1>
<hr size="1" />
<br />

<form method=post name="wds_status">
<div>
<h2 id="wdsStatus" class="title">WDS Status</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="title" id="wdssAID">AID</td>
<td class="title" id="wdssSSID">MAC Address</td>
<td class="title" id="wdssPhyMode">802.11 Physical Mode</td>
<td class="title" id="wdssPowerSave">PowerSave</td>
<td class="title" id="wdssBandwidth">Bandwidth</td>
</tr>
<tbody id="APWDSList"></tbody>
</table>

<br />
<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center"><td>
<input type=button class="btnw" value="Refresh" id="scanRescan" onClick="ClkScan();">&nbsp;
</td></tr>
</table>
</div>
</form>

</td></tr>
</table>

</body>
</html>