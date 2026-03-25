<html>
<head>
<title>WPS (Wi-Fi Protected Setup)</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/wps/wps_timer.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var http_request = false;
var radio_off    = '<% getCfgZero(1, "RadioOff"); %>';
var authmode     = '<% getCfgGeneral(1, "AuthMode"); %>';
var ssid1_auth   = authmode.split(";")[0];
var wpa_wpa2_psk = 1;

function makeRequest(url, content)
{
http_request = false;
if (window.XMLHttpRequest) { // Mozilla, Safari,...
http_request = new XMLHttpRequest();
if (http_request.overrideMimeType) {
http_request.overrideMimeType('text/xml');
}
} else if (window.ActiveXObject) { // IE
try {
http_request = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
try {
http_request = new ActiveXObject("Microsoft.XMLHTTP");
} catch (e) {}
}
}
if (!http_request) {
alert('Giving up :( Cannot create an XMLHTTP instance');
return false;
}
http_request.onreadystatechange = alertContents;
http_request.open('POST', url, true);
http_request.send(content);
}

function alertContents()
{
if (http_request.readyState == 4) {
if (http_request.status == 200) {
WPSUpdateHTML( http_request.responseText);
} else {
alert('There was a problem with the request.');
}
}
}

function WPSUpdateHTML(str)
{
var all_str = new Array();
all_str = str.split("\n");

wpsconfigured = document.getElementById("WPSConfigured");
if(all_str[0] == "1" || all_str[0] == "0")
wpsconfigured.innerHTML = "No";
else if(all_str[0] == "2")
wpsconfigured.innerHTML = "Yes";
else
wpsconfigured.innerHTML = "Unknown";

wpsssid = document.getElementById("WPSSSID");
wpsssid.innerHTML = all_str[1];

wpsauthmode = document.getElementById("WPSAuthMode");
wpsauthmode.innerHTML = all_str[2];

wpsencryptype = document.getElementById("WPSEncryptype");
wpsencryptype.innerHTML = all_str[3];

wpsstatus = document.getElementById("WPSCurrentStatus");
wpsstatus.innerHTML = all_str[6];

if (all_str[7] == "-1") {
if (radio_off == 1)
document.getElementById("WPSInfo").innerHTML = "Wireless LAN is NOT enabled!!";
else if (wpa_wpa2_psk == 0)
document.getElementById("WPSInfo").innerHTML = "The Authentication Mode is NOT WPA/WPA2 PSK!!";
else
document.getElementById("WPSInfo").innerHTML = "Failed";

if (document.getElementById("WPSEnable").checked)
document.getElementById('ajax-WPS').innerHTML = '<img src="/graphics/wps1.gif">';
} else if (all_str[7] == "0") {
if (radio_off == 1)
document.getElementById("WPSInfo").innerHTML = "Wireless LAN is NOT enabled!!";
else if (wpa_wpa2_psk == 0)
document.getElementById("WPSInfo").innerHTML = "The Authentication Mode is NOT WPA/WPA2 PSK!!";
else
document.getElementById("WPSInfo").innerHTML = all_str[6];

if (document.getElementById("WPSEnable").checked) {
if (all_str[6] == "Not used" || all_str[6] == "Idle"
|| all_str[6] == "WSC Fail(Ignore this if Intel/Marvell registrar used)")
document.getElementById('ajax-WPS').innerHTML = '<img src="/graphics/wps1.gif">';
else
document.getElementById('ajax-WPS').innerHTML = '<img src="/graphics/wps2.gif">';
}
} else if (all_str[7] == "1") {
if (radio_off == 1)
document.getElementById("WPSInfo").innerHTML = "Wireless LAN is NOT enabled!!";
else if (wpa_wpa2_psk == 0)
document.getElementById("WPSInfo").innerHTML = "The Authentication Mode is NOT WPA/WPA2 PSK!!";
else
document.getElementById("WPSInfo").innerHTML = "Success";

if (document.getElementById("WPSEnable").checked)
document.getElementById('ajax-WPS').innerHTML = '<img src="/graphics/wps1.gif">';
}
}

function updateWPS()
{
makeRequest("/goform/updateWPS", "something");
}

function ValidateChecksum(PIN)
{
var accum = 0;

accum += 3 * (parseInt(PIN / 10000000) % 10);
accum += 1 * (parseInt(PIN / 1000000) % 10);
accum += 3 * (parseInt(PIN / 100000) % 10);
accum += 1 * (parseInt(PIN / 10000) % 10);
accum += 3 * (parseInt(PIN / 1000) % 10);
accum += 1 * (parseInt(PIN / 100) % 10);
accum += 3 * (parseInt(PIN / 10) % 10);
accum += 1 * (parseInt(PIN / 1) % 10);

return ((accum % 10) == 0);
}

function PINPBCFormCheck()
{
if (document.getElementById("PIN").value != "") {
// Driver 1.9 supports 4 digit PIN code.
if (document.getElementById("PIN").value.length == 4)
return true;

if (!ValidateChecksum(document.getElementById("PIN").value)) {
alert("PIN number validation failed.");
document.getElementById("PIN").focus();
document.getElementById("PIN").select();
return false;
}
return true;
} else {
alert("Please input the PIN code of wireless client you want to connect.");
document.getElementById("PIN").focus();
return false;
}
}

function onchxWps()
{
document.getElementById('ajax-WPS').innerHTML = '<img src="/graphics/wps.gif">';
if (document.getElementById("WPSEnable").checked)
nextWPS(1);
else
nextWPS(0);
}

function onClkBtnPBC()
{
document.getElementById('ajax-WPS').innerHTML = '<img src="/graphics/wps2.gif">';
alert("The AP will wait for WPS requests from your client for 2 minutes.");
nextWPS(3);
}

function onClkBtnPIN()
{
if (PINPBCFormCheck()) {
document.getElementById('ajax-WPS').innerHTML = '<img src="/graphics/wps2.gif">';
alert("The AP will wait for WPS requests from your client for 2 minutes.");
nextWPS(2);
}
}

function makeHttpRequest(url, mode)
{
var httprequest = false;

if (window.XMLHttpRequest) { // Mozilla, Safari,...
httprequest = new XMLHttpRequest();
if (httprequest.overrideMimeType) {
httprequest.overrideMimeType('text/xml');
}

} else if (window.ActiveXObject) { // IE
try {
httprequest = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
try {
httprequest = new ActiveXObject("Microsoft.XMLHTTP");
} catch (e) {}
}
}

if (!httprequest) {
alert('Unfortunatelly you browser doesn\'t support this feature.');
return false;
}

httprequest.onreadystatechange = function(){
if (httprequest.readyState == 4) {
if (httprequest.status == 200) {
loadWPS(mode, httprequest.responseText);
} else {
//alert('There was a problem with the request.(Code: ' + http_request.status + ')');
}
}
};
httprequest.open('GET', url, true);
httprequest.send(null);
}

function nextWPS(mode)
{
// mode: 0:Disable  1:Enable  2:Trigger PBC  3:Trigger PIN 4:Get WPS status
var url = [ "/goform/WPSSetup?WPSEnable=0",
"/goform/WPSSetup?WPSEnable=1",
"/goform/WPS?PINPBCRadio=1&PIN=",
"/goform/WPS?PINPBCRadio=2" ];

if (mode == 2)
makeHttpRequest(url[mode]+document.getElementById("PIN").value, mode);
else
makeHttpRequest(url[mode], mode);
}

function ajaxWPS()
{
if (document.getElementById("WPSEnable").checked)
document.getElementById("ajax-WPS").innerHTML = '<img src="/graphics/wps1.gif">';
}

function loadWPS(mode, result)
{
if (mode == 0 || mode == 1) {	// Enable or Disable
if (result == "1") {
// enable WPS
document.getElementById("WPSEnable").checked = 1;
document.getElementById("ajax-WPS").innerHTML = '<img src="/graphics/wps1.gif">';
if (radio_off == 0 && wpa_wpa2_psk == 1) {
document.getElementById("wpsStartPBC_text").disabled = false;
document.getElementById("PIN").disabled = false;
document.getElementById("wpsStartPIN_text").disabled = false;
}
} else if (result == "0") {
// disable WPS
document.getElementById("WPSEnable").checked = 0;
document.getElementById("ajax-WPS").innerHTML = '<img src="/graphics/wps0.gif">';
document.getElementById("wpsStartPBC_text").disabled = true;
document.getElementById("PIN").disabled = true;
document.getElementById("wpsStartPIN_text").disabled = true;
}
}

if (mode == 2 || mode == 3)	// Start PBC or PIN
setTimeout("ajaxWPS()", 120000);
}

function initTranslation()
{
var e = document.getElementById("wpsTitle_text");
e.innerHTML = _("parent wireless lan")+" >> "+_("wps title");

e = document.getElementById("wpsEnableTxt");
e.innerHTML = _("wps enable");

e = document.getElementById("wpsInfo_text");
e.innerHTML = _("wps information");
e = document.getElementById("wpsCurrentStatus_text");
e.innerHTML = _("wps current status");
e = document.getElementById("wpsConfigured_text");
e.innerHTML = _("wps configured");
e = document.getElementById("wpsSSID_text");
e.innerHTML = _("wps ssid");
e = document.getElementById("wpsAuthMode_text");
e.innerHTML = _("wps auth mode");
e = document.getElementById("wpsEncrypType_text");
e.innerHTML = _("wps encryp type");
e = document.getElementById("wpsAPPIN_text");
e.innerHTML = _("wps ap pin");
e = document.getElementById("wpsGenPIN");
e.value = _("wps pin generate");

e = document.getElementById("wpsProgress_text");
e.innerHTML = _("wps progress");
e = document.getElementById("wpsPBCMode_text");
e.innerHTML = _("wps pbc mode");
e = document.getElementById("wpsPINMode_text");
e.innerHTML = _("wps pin mode");
e = document.getElementById("wpsStartPBC_text");
e.value = _("wps start pbc");
e = document.getElementById("wpsStartPIN_text");
e.value = _("wps start pin");

e = document.getElementById("wpsStatus_text");
e.innerHTML = _("wps status");

e = document.getElementById("wpsNote_text");
e.innerHTML = _("wps note");
e = document.getElementById("wpsDisable_text");
e.innerHTML = _("wps note disable");
e = document.getElementById("wpsEnable_text");
e.innerHTML = _("wps note enable");
e = document.getElementById("wpsWait_text");
e.innerHTML = _("wps note wait");
}

function pageInit()
{
initTranslation();

var wpsenable  = <% getWPSModeASP(); %>;

if (ssid1_auth != "WPAPSK" && ssid1_auth != "WPA2PSK" && ssid1_auth != "WPAPSKWPA2PSK") {
wpa_wpa2_psk = 0;
alert("WPS only supports in WPA/WPA2-PSK Mode.");
}

if (! wpsenable) {
// disable WPS
document.getElementById("WPSEnable").checked = 0;
document.getElementById("ajax-WPS").innerHTML = '<img src="/graphics/wps0.gif">';
document.getElementById("wpsStartPBC_text").disabled = true;
document.getElementById("PIN").disabled = true;
document.getElementById("wpsStartPIN_text").disabled = true;
} else {
// enable WPS
document.getElementById("WPSEnable").checked = 1;
document.getElementById("ajax-WPS").innerHTML = '<img src="/graphics/wps1.gif">';
if (radio_off == 0 && wpa_wpa2_psk == 1) {
document.getElementById("wpsStartPBC_text").disabled = false;
document.getElementById("PIN").disabled = false;
document.getElementById("wpsStartPIN_text").disabled = false;
}
}

updateWPS();

InitializeTimer(3);
}
</script>

</head>
<body onload="pageInit()">
<table class="body">
<tr><td>
<h1 id="wpsTitle_text">WPS (Wi-Fi Protected Setup)</h1>
<hr size="1" />
<br />

<!-- ==================  WPS Setup  ================== -->
<div>
<table width="100%" cellspacing="0" cellpadding="2" border="0">
<tr>
<td>
<input type="checkbox" id="WPSEnable" name="WPSEnable" onclick="onchxWps()" />
<span id="wpsEnableTxt">Enable WPS</span>
<span id="ajax-WPS"></span>
</td>
</tr>
</table>
</div>

<!-- =================  WPS Information ============== -->
<div>
<h2 id="wpsInfo_text">Wi-Fi Protected Setup Information</h2>
<table width="100%" cellspacing="1" cellpadding="2" class="config">
<tr style="display:none">
<td class="title" width="40%" id="wpsCurrentStatus_text">WPS Current Status</td>
<td><span id="WPSCurrentStatus"></span> </td>
</tr>
<tr>
<td class="title" id="wpsConfigured_text">WPS Configured</td>
<td><span id="WPSConfigured"></span></td>
</tr>
<tr>
<td class="title" id="wpsSSID_text">WPS SSID</td>
<td><span id="WPSSSID"></span></td>
</tr>
<tr>
<td class="title" id="wpsAuthMode_text">WPS Auth Mode</td>
<td><span id="WPSAuthMode"></span></td>
</tr>
<tr>
<td class="title" id="wpsEncrypType_text">WPS Encryp Type</td>
<td><span id="WPSEncryptype"></span></td>
</tr>
<form method="post" name="SubmitGenPIN" action="/goform/GenPIN">
<tr style="display:none">
<td class="title" id="wpsAPPIN_text">AP PIN
</td>
<td><% getPINASP(); %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" value="11" name="test"><input type=submit value="Generate" id="wpsGenPIN"></td>
</tr>
</form>
</table>
<br />
</div>

<!-- ================== Device Configure =============== -->
<div>
<h2 id="wpsProgress_text">Device Configure</h2>
<table width="100%" cellspacing="1" cellpadding="2" class="config">
<tr>
<td class="title" width="40%" id="wpsPBCMode_text">Configure via Push Button</td>
<td>
<input type="button" name="btnPBC" id="wpsStartPBC_text" value="Start PBC" onclick="onClkBtnPBC()" disabled />
</td>
</tr>
<tr>
<td class="title" id="wpsPINMode_text">Configure via Client PinCode</td>
<td>
<input type="text" maxlength="8" id="PIN" name="PIN" disabled />
<input type="button" name="btnPin" id="wpsStartPIN_text" value="Start PIN" onclick="onClkBtnPIN()" disabled />
</td>
</tr>
</table>
<!-- =================  WPS Status  ================== -->
<div style="color: #75a8f1">
<span id="wpsStatus_text">Status:</span>
<span id="WPSInfo"></span>
</div>
</div>

<br />
<div>
<table width="100%" cellspacing="0" cellpadding="2" border="0">
<tr valign="top">
<td class="title" width="30">Note:</td>
<td id="wpsNote_text">WPS can help your wireless client automatically connect to the Access point.</td>
</tr>
<tr>
<td colspan="2">
<img src="/graphics/wps0.gif" />: <span id="wpsDisable_text">WPS is Disabled.</span><br />
<img src="/graphics/wps1.gif" />: <span id="wpsEnable_text">WPS is Enabled.</span><br />
<img src="/graphics/wps2.gif" />: <span id="wpsWait_text">Waiting for WPS requests from wireless clients.</span>
</td>
</tr>
</table>
</div>

</td></tr>
</table>

</body>
</html>