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
var wdsList  = '<% getCfgGeneral(1, "WdsList"); %>';
var radio_off = '<% getCfgZero(1, "RadioOff"); %>';


function initTranslation()
{
var e = document.getElementById("scanTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("scan ap title");

e = document.getElementById("scanApDiscovery");
e.innerHTML = _("scan ap discovery");
e = document.getElementById("scanSelect");
e.innerHTML = _("station select");
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

e = document.getElementById("scanStatistic");
e.innerHTML = _("san statistic");
e = document.getElementById("scanStr");
e.innerHTML = _("san str");
e = document.getElementById("scansort");
e.innerHTML = _("san str2");
e = document.getElementById("scancheck");
e.innerHTML = _("san check");
e = document.getElementById("apMacAddress");
e.innerHTML = _("scan ap mac");
e = document.getElementById("apSSID");
e.innerHTML = _("san ap ssid");
e = document.getElementById("strWDS");
e.innerHTML = _("scan wds");
e = document.getElementById("addWdsButton");
e.value = _("wireless add");
e = document.getElementById("strUR");
e.innerHTML = _("scan ur");
e = document.getElementById("addApcliButton");
e.value = _("station select");
}

function initValue()
{
opmode = 1*opmode;
if (opmode != 3) {
hideElmtById(document, "add_apcli_row");
}
apmode = 1*apmode;
document.ap_discovery.apdis_wds_mode.value=0;
if (opmode != 0) {
hideElmtById(document, "add_wds_row");
} else {
if (apmode == 0) {
hideElmtById(document, "mac_ssid_table");
hideElmtById(document, "add_wds_row");
} else if (apmode == 1 || apmode == 2) {
document.ap_discovery.apdis_wds_mode.value=2;
} else if (apmode == 3) {
document.ap_discovery.apdis_wds_mode.value=3;
}
}
if (opmode == 0 && apmode == 0){
hideElmtById(document, "scanSelect");
}
else {
document.getElementById("scanSelect").style.visibility = "";
document.getElementById("scanSelect").style.display = "";
}
document.ap_discovery.apdis_mac0.disabled=true;
document.ap_discovery.apdis_mac1.disabled=true;
document.ap_discovery.apdis_mac2.disabled=true;
document.ap_discovery.apdis_mac3.disabled=true;
document.ap_discovery.apdis_mac4.disabled=true;
document.ap_discovery.apdis_mac5.disabled=true;
document.ap_discovery.apdis_ssid.disabled=true;
if (document.ap_discovery.apdis_mac0.value == "") {
document.ap_discovery.addWdsButton.disabled=true;
document.ap_discovery.addApcliButton.disabled=true;
}
if (document.ap_discovery.apdis_ssid.value == "")
document.ap_discovery.addApcliButton.disabled=true;
if (radio_off == 1)
document.getElementById("scanRescan").disabled = true;
else
document.getElementById("scanRescan").disabled = false;
}

function PageInit()
{
initTranslation();
initValue();
}

function CheckValue()
{
var i, j, wds_num=0;
var list;
var newList = "";
if (document.ap_discovery.apdis_mac.value == "") {
alert("Ap's Mac Address is not specified.");
return false;
}
if (document.ap_discovery.apdis_act.value == 0 && apmode != 1) {
list = wdsList.split(";");
for(i=0;i<list.length;i++) {
if (list[i] != "") wds_num++;
}
if (wds_num >=4) {
alert("WDS List is full!");
return false;
}
if (list.length < 4) {
newList = document.ap_discovery.apdis_mac.value + ";;;;";
} else {
for (i = 0, j = -1; i < 4; i++) {
if (list[i] == "" && j == -1) {
newList += document.ap_discovery.apdis_mac.value;
j = i;
} else
newList += list[i];
newList += ";";
}
if (j == -1)
newList = list[1] + ";" + list[2] + ";" + list[3] + ";" + document.ap_discovery.apdis_mac.value + ";";
}
document.ap_discovery.apdis_mac.value=newList;
} else {
if (document.ap_discovery.apdis_ssid.value == "") {
alert("Ap's SSID is not specified.");
return false;
}
}
document.ap_discovery.apdis_ssid_2.value=document.ap_discovery.apdis_ssid.value;
return true;
}

function addToWds()
{
document.ap_discovery.apdis_act.value=0;
if (CheckValue())
document.ap_discovery.submit();
}

function addToApcli()
{
document.ap_discovery.apdis_act.value=1;
if (CheckValue())
document.ap_discovery.submit();
}

function addRow(index, frag, values)
{
var tr = CreateStyledElement("tr", index % 2 ? "display_even" : "display_odd");

// The symbol of '$' will be replaced by spaces.
var ssid = values[1].replace(/\$/g, ' ');

tr.title = ssid;

if (parseInt(values[0]) == 1) {   //Add this function when need this checkbox
var radio = addRadioCell(tr, 0, "c", "selectedSSID", "");
if (window.opener && opmode != 2 && opmode != 3)
radio.disabled = true;
radio.onclick = function() {
var macArray = values[2].split(":");

document.ap_discovery.apdis_mac.value = values[2];
document.ap_discovery.apdis_ssid.value = ssid;
document.ap_discovery.apdis_channel.value = values[4];
if (macArray.length == 6) {
document.ap_discovery.apdis_mac0.value = macArray[0];
document.ap_discovery.apdis_mac1.value = macArray[1];
document.ap_discovery.apdis_mac2.value = macArray[2];
document.ap_discovery.apdis_mac3.value = macArray[3];
document.ap_discovery.apdis_mac4.value = macArray[4];
document.ap_discovery.apdis_mac5.value = macArray[5];
document.ap_discovery.addWdsButton.disabled = false;
if (ssid == "")
document.ap_discovery.addApcliButton.disabled = true;
else
document.ap_discovery.addApcliButton.disabled = false;
} else {
document.ap_discovery.addWdsButton.disabled = true;
document.ap_discovery.addApcliButton.disabled = true;
}
}
} else {
document.getElementById("scanSelect").style.visibility = "hidden";
document.getElementById("scanSelect").style.display = "none";
}

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
if(document.getElementById("sort_enable").checked) {
var arysort = new Array();
for(var i=0; i<values.length; i++){
arysort[i] = values[i].split(",");
arysort.sort(function(a,b){return b[3]-a[3]});
}

for(var i=0; i<(arysort.length -1); i++){
if (arysort[i].length > 0){
addRow(i, frag, arysort[i]);
}
}
}else{
for (var i=0; i<values.length; i++) {
if (values[i].length > 0){
var pval = values[i].split(",");
addRow(i, frag, pval);
}
}
}
var tbody = document.getElementById('ApBSSIDList');
clearChildNodes(tbody);
if (!tbody.appendChild(frag)) { // Add Frag to table body
alert(TR("This browser doesn't support dynamic tables."));
}
}
document.ap_discovery.apdis_ssid.value = document.ap_discovery.apdis_mac0.value = document.ap_discovery.apdis_mac1.value =
document.ap_discovery.apdis_mac2.value = document.ap_discovery.apdis_mac3.value = document.ap_discovery.apdis_mac4.value =
document.ap_discovery.apdis_mac5.value = "";
document.ap_discovery.addWdsButton.disabled=true;
document.ap_discovery.addApcliButton.disabled=true;
document.ap_discovery.scanRescan.value = "Scan";
document.ap_discovery.scanRescan.disabled = false;
}

function ClkScan()
{
document.ap_discovery.scanRescan.value = "Scanning";
document.ap_discovery.scanRescan.disabled = true;
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
<h1 id="scanTitle">Access Point Discovery</h1>
<hr size="1" />
<br />

<form method=post name="ap_discovery" action="/goform/wirelessApDiscovery">
<div>
<h2 id="scanApDiscovery" class="title">Access Point List</h2>

<table width="100%" cellpadding="2" cellspacing="1">
<tr><td>
<input type="checkbox" id="sort_enable">&nbsp;<span id=scancheck>Show List in order of RSSI values from 100% to 0%</span>
</td></tr>
</table>

<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="title" width="15px" id="scanSelect" style="display:none">&nbsp;</td>
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
<td colspan="2">See&nbsp; <a href="ap_discovery_chart.asp" id="scanStatistic">Channel Statistics</a></td>
</tr>
<tr>
<td class="title" valign="top">Note:</td>
<td><span id="scanStr">1.During the scanning process (about 5 seconds), no station is allowed to connect with the router.</span><br>
<span id="scansort">2.If you select/disselect 'Show List in order of RSSI values from 100% to 0%',you should click Scan Button again to make this function run OK.</span><br>
</td>
</tr>
</table>


<table id="mac_ssid_table" width="100%" cellpadding="2" cellspacing="1">
<tr>
<td colspan="4"><hr size="1" /></td>
</tr>
<tr>
<td id="apMacAddress">AP's MAC Address</td>
<td class="title">
<input type="text" name="apdis_mac0" size="2" maxlength="2" /> :
<input type="text" name="apdis_mac1" size="2" maxlength="2" /> :
<input type="text" name="apdis_mac2" size="2" maxlength="2" /> :
<input type="text" name="apdis_mac3" size="2" maxlength="2" /> :
<input type="text" name="apdis_mac4" size="2" maxlength="2" /> :
<input type="text" name="apdis_mac5" size="2" maxlength="2" />
<input type="hidden" name="apdis_mac" />
</td>
<td id="apSSID">AP's SSID</td>
<td><input type="text" name="apdis_ssid" maxlength="32" />
<input type="hidden" name="apdis_ssid_2" /></td>
</tr>
</table>
<input type="hidden" name="apdis_act" />
<table>
<tr id="add_wds_row">
<td class="title">Add to <a href="basic.asp" id="strWDS">WDS Settings</a>:
<input type="hidden" name="apdis_wds_mode"></td>
<td><input type=button class="btnw" name="addWdsButton" value="Add" id="addWdsButton" onClick="addToWds()" /></td>
</tr>
<tr id="add_apcli_row">
<td class="title">Select as <a href="apcli.asp" id="strUR">Universal Repeater</a>: </td>
<td colspan="2"><input type=button class="btnw" name="addApcliButton" value="Select" id="addApcliButton" onClick="addToApcli()" />
<input type="hidden" name="apdis_channel">
</td>
</tr>
</table>

</div>
</form>

</td></tr>
</table>

</body>
</html>
