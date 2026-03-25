<html>
<head>
<title>Wireless Station Site Survey</title>
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

var g_ssid;
var g_networktype;
var g_channel;
var g_auth;
var g_encry;
var g_bssid;

function countTime()
{
setTimeout("window.location.reload();", 1000*4);
}


function open_connection_page()
{
cwin = window.open("site_survey_connection.asp","sta_site_survey_connection","toolbar=no, location=yes, scrollbars=yes, resizable=no, width=660, height=600");
}

function open_profile_page()
{
pcwin = window.open("/wireless/add_profile_page.asp","add_profile_page","toolbar=no, location=yes, scrollbars=yes, resizable=no, width=660, height=600");
}

function showConnectionSsid()
{
cwin.document.forms["sta_site_survey_connection"].Ssid.value = g_ssid;
cwin.document.forms["sta_site_survey_connection"].bssid.value = g_bssid;

if (g_networktype == 1)
{
if (g_auth.indexOf("WPA2-PSK") >= 0)
cwin.document.forms["sta_site_survey_connection"].security_infra_mode.value = 7;
else if (g_auth.indexOf("WPA-PSK") >= 0)
cwin.document.forms["sta_site_survey_connection"].security_infra_mode.value = 4;
else if (g_auth.indexOf("WPA2") >= 0)
cwin.document.forms["sta_site_survey_connection"].security_infra_mode.value = 6;
else if (g_auth.indexOf("WPA") >= 0)
cwin.document.forms["sta_site_survey_connection"].security_infra_mode.value = 3;
else
cwin.document.forms["sta_site_survey_connection"].security_infra_mode.value = 0;
}
else
{
if ( g_auth.indexOf("WPA-NONE") >= 0 || g_auth.indexOf("WPA2-NONE") >= 0)
cwin.document.forms["sta_site_survey_connection"].security_adhoc_mode.value = 5;
else
cwin.document.forms["sta_site_survey_connection"].security_adhoc_mode.value = 0;
}

//encry
if (g_encry.indexOf("Not Use") >= 0)
cwin.document.forms["sta_site_survey_connection"].openmode.value = 1;
else if (g_encry.indexOf("AES") >= 0)
cwin.document.forms["sta_site_survey_connection"].cipher[1].checked = true;
else if (g_encry.indexOf("TKIP") >= 0)
cwin.document.forms["sta_site_survey_connection"].cipher[0].checked = true;
else
cwin.document.forms["sta_site_survey_connection"].openmode.value = 0;

cwin.document.forms["sta_site_survey_connection"].network_type.value = g_networktype;
}

function showProfileSsid()
{
pcwin.document.forms["profile_page"].Ssid.value = g_ssid;


if(g_networktype == 1 )
{
if (g_auth.indexOf("WPA2-PSK") >= 0)
pcwin.document.forms["profile_page"].security_infra_mode.value = 7;
else if (g_auth.indexOf("WPA-PSK") >= 0)
pcwin.document.forms["profile_page"].security_infra_mode.value = 4;
else if (g_auth.indexOf("WPA2") >= 0)
pcwin.document.forms["profile_page"].security_infra_mode.value = 6;
else if (g_auth.indexOf("WPA") >= 0)
pcwin.document.forms["profile_page"].security_infra_mode.value = 3;
else
pcwin.document.forms["profile_page"].security_infra_mode.value = 0;
}
else
{
if ( g_auth.indexOf("WPA-NONE") >= 0 || g_auth.indexOf("WPA2-NONE") >= 0)
pcwin.document.forms["profile_page"].security_adhoc_mode.value = 5;
else
pcwin.document.forms["profile_page"].security_adhoc_mode.value = 0;
}

//encry
if (g_encry.indexOf("TKIP") >= 0)
pcwin.document.forms["profile_page"].cipher[0].checked = true;
else if (g_encry.indexOf("AES") >= 0)
pcwin.document.forms["profile_page"].cipher[1].checked = true;

pcwin.document.forms["profile_page"].network_type.value = g_networktype;

pcwin.document.forms["profile_page"].channel.value = g_channel;
}

function initTranslation()
{
var e = document.getElementById("scanTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("scan title");

e = document.getElementById("scanSiteSurvey");
e.innerHTML = _("scan site survey");
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
e = document.getElementById("scanConnect");
e.value = _("scan connet");
e = document.getElementById("scanRescan");
e.value = _("scan rescan");
e = document.getElementById("scanAddProfile");
e.value = _("scan add profile");
}

function PageInit()
{
initTranslation();
}

function addRow(index, frag, values)
{
//radiocheck, tmpSSIDII, tmpBSSIDII, pBssid->InfrastructureMode, nChannel, strEncry, strAuth,
//tmpSSID, tmpBSSID, tmpRSSI, tmpChannel, tmpEncry, tmpAuth, connect
if (values[13] == 1)
var tr = CreateStyledElement("tr", index % 2 ? "config_even_blue" : "config_odd_blue");
else
var tr = CreateStyledElement("tr", index % 2 ? "config_even" : "config_odd");

var ssidii_temp = values[1].replace(/\$/g, ' ');
var ssid_temp = values[7].replace(/\$/g, ' ');

tr.title = ssid_temp;

var radio = addRadioCell(tr, parseInt(values[0]), "c", "selectedSSID", "");
radio.onclick = function() {
g_ssid = ssidii_temp;
g_bssid = values[2];
g_networktype = values[3];
g_channel = values[4];
g_encry = values[5];
g_auth = values[6];

document.sta_site_survey.connectionButton.disabled=false;
document.sta_site_survey.addProfileButton.disabled=false;
}

if (ssid_temp.length > 10) var ssid = ssid_temp.substring(0,10) + "...";
else var ssid = ssid_temp;
addTextCell(tr, ssid, "cl");
addTextCell(tr, values[8], "cl");
addTextCell(tr, values[9], "cl");
addTextCell(tr, values[10], "cl");
addTextCell(tr, values[11], "cl");
addTextCell(tr, values[12], "cl");

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
var tbody = document.getElementById('StaBSSIDList');
clearChildNodes(tbody);
if (!tbody.appendChild(frag)) { // Add Frag to table body
alert(TR("This browser doesn't support dynamic tables."));
}
}
document.sta_site_survey.scanRescan.value = "Rescan";
document.sta_site_survey.scanRescan.disabled = false;
}

function ClkScan()
{
document.sta_site_survey.scanRescan.value = "Scanning";
document.sta_site_survey.scanRescan.disabled = true;
if ( opmode == 2){
loadXMLDoc("/goform/getStaBSSIDList", processUpdate);
}
else{
loadXMLDoc("/goform/getApBSSIDList", processUpdate);
}
}
</script>
</head>


<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="scanTitle">Station Site Survey</h1>
<hr size="1" />
<br />

<form method=post name="sta_site_survey">
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
<tbody id="StaBSSIDList"></tbody>
</table>

<br />
<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center"><td>
<input type=button class="btnw" value="Rescan" id="scanRescan" onClick="ClkScan();">&nbsp;
<input type=button class="btnw" name="connectionButton" value="Connect" id="scanConnect" disabled onClick="open_connection_page()">&nbsp;
<input type=button class="btnw" name="addProfileButton" value="Add Profile" id="scanAddProfile" disabled onClick="open_profile_page()">
</td></tr>
</table>
</div>
</form>

</td></tr>
</table>

</body>
</html>