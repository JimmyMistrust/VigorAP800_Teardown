<html>
<head>
<title>Wizard Wireless AP Discovery</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/dtree/ajax.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");
var f;
var opmode = '<% getCfgZero(1, "OperationMode"); %>';
var ap800_mode = "<% getCfgGeneral(1, "800_ap_mode"); %>";
var current_mode = 0;

function initTranslation()
{
var e;
if (window.opener.opmode_slt == 2) {
e = document.getElementById("scanTitle");
e.innerHTML = _("wiz title")+" >> "+_("scan title");
e = document.getElementById("scanSiteSurvey");
e.innerHTML = _("scan site survey");
} else {
e = document.getElementById("scanTitle");
e.innerHTML = _("wiz title")+" >> "+_("scan ap title");
e = document.getElementById("scanSiteSurvey");
e.innerHTML = _("scan ap discovery");
}
//e = document.getElementById("scanSelect");
//e.innerHTML = _("station select");
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
e = document.getElementById("lClose");
e.value = _("wireless close");
}

function PageInit()
{
f = document.frm;
initTranslation();

if (opmode == 0) {
if (ap800_mode == 0) current_mode = 1*ap800_mode;
else current_mode = 1*ap800_mode + 3;
} else {
current_mode = 1*opmode;
}
if (window.opener.opmode_slt == 2 || window.opener.opmode_slt == 3)
showElmtById(document, "slt_id");
}

function addRow(index, frag, values)
{
//tmpSSID, tmpBSSID, tmpRSSI, tmpChannel, tmpEncry, tmpAuth, connect
//tmpSSIDII, tmpBSSIDII, pBssid->InfrastructureMode, nChannel, strEncry, strAuth,
var tr = CreateStyledElement("tr", index % 2 ? "config_even" : "config_odd");
var ssid = values[0].replace(/\$/g, '');
tr.title = ssid;

var radio = addRadioCell(tr, 0, "c", "selectedSSID", "");
radio.onclick = function() {
if (window.opener.opmode_slt == 2) {
window.opener.ap_dis_slt_ssid = ssid;
window.opener.ap_dis_slt_auth = values[5];
window.opener.ap_dis_slt_encryp = values[4];
} else {
window.opener.ap_dis_slt_ssid = ssid;
window.opener.ap_dis_slt_mac = values[1];
setVle2Elmt(window.opener.document.frm.sz11gChannel, values[3], 0);
window.opener.initExtChannel();
}
}
if (window.opener.opmode_slt != 2 && window.opener.opmode_slt != 3)
radio.disabled = true;

if (ssid.length > 10) ssid.substring(0,10) + "...";

addTextCell(tr, ssid, "cl");
addTextCell(tr, values[1], "cl");
addTextCell(tr, values[2], "cl");
addTextCell(tr, values[3], "cl");
addTextCell(tr, values[4], "cl");
addTextCell(tr, values[5], "cl");

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
var tbody = document.getElementById('BSSIDList');
clearChildNodes(tbody);
if (!tbody.appendChild(frag)) { // Add Frag to table body
alert(TR("This browser doesn't support dynamic tables."));
}
}
f.scanRescan.value = _("scan rescan");
f.scanRescan.disabled = false;
}

function ClkScan()
{
f.scanRescan.value = _("scan scanning");
f.scanRescan.disabled = true;

loadXMLDoc("/goform/getWizBSSIDList?curr_mode="+current_mode+"&scan_mode="+window.opener.opmode_slt, processUpdate);
}
</script>
</head>


<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="scanTitle">Station Site Survey</h1>
<hr size="1" />
<br />

<form method=post name="frm">
<div>
<h2 id="scanSiteSurvey" class="title">Site Survey</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="title" width="15px" id="scanSelect">&nbsp;</td>
<td class="title" id="scanSSID">SSID</td>
<td class="title" id="scanBSSID">BSSID</td>
<td class="title" id="scanRSSI">RSSI</td>
<td class="title" id="scanChannel">Channel</td>
<td class="title" id="scanEncryp">Encryption</td>
<td class="title" id="scanAuth">Authentication</td>
</tr>
<tbody id="BSSIDList"></tbody>
</table><br>

<table width="100%" cellpadding="2" cellspacing="1" id="slt_id" style="display:none">
<tr>
<td class="title" width="20px">Note:</td>
<td>The related information of SSID selected will set to next page.</td>
</tr>
</table>

<br />
<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center"><td>
<input type=button class="btnw" value="Rescan" name="scanRescan" id="scanRescan" onClick="ClkScan();">&nbsp;
<input type=button class="btnw" name="lClose" value="Close" id="lClose" onClick="self.close();">
</td></tr>
</table>
</div>
</form>

</td></tr>
</table>

</body>
</html>