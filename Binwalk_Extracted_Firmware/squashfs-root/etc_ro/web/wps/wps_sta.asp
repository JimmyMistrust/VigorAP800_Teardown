<html>
<head>
<title>WPS STA</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/wps/wps_timer.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var http_request = false;
function makeRequest(url, content, sync) {
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
alert('Cannot create an XMLHTTP instance');
return false;
}
http_request.onreadystatechange = alertContents;

http_request.open('POST', url, (sync == 1) ? false : true);
http_request.send(content);
}

function isSafeForShell(str){

for(i=0; i < str.length; i++){
if(str.charAt(i) == ',' ) return false;
if(str.charAt(i) == '\\') return false;
if(str.charAt(i) == ';' ) return false;
if(str.charAt(i) == '\'') return false;
if(str.charAt(i) == '\n') return false;
if(str.charAt(i) == '`' ) return false;
if(str.charAt(i) == '\"') return false;
}
return true;
}

function alertContents() {
if (http_request.readyState == 4) {
if (http_request.status == 200) {
WPSStaUpdateStatus( http_request.responseText);
} else {
}
}
}

function updateWPSStaStatus(){
makeRequest("/goform/updateWPSStaStatus", "n/a");
}

function WPSStaUpdateStatus(str)
{
if (str == "" || str =="Not used") str = "Idle";
document.getElementById("WPSInfo").innerHTML = str;
}

var WPSAPListStr = "<% getStaWPSBSSIDListASP(0); %>";
var WPSAPList = new Array();
WPSAPList = WPSAPListStr.split("\n\n");


var need_submit_registrar_setting_flag = 0;
var PINCode =  "<% getWPSSTAPINCodeASP(); %>";
var RegistrarSSID = "<% getWPSSTARegSSIDASP(); %>";
var RegistrarAuth = "<% getWPSSTARegAuthASP(); %>";
var RegistrarEncry = "<% getWPSSTARegEncryASP(); %>";
var RegistrarKeyType =  "<% getWPSSTARegKeyTypeASP(); %>";
var RegistrarKeyIndex = "<% getWPSSTARegKeyIndexASP(); %>";
var RegistrarKey =  "<% getWPSSTARegKeyASP(); %>";

function InitRegistrarSetting()
{
enableSubmitButton(false);

//SSID
document.getElementById("SSID").value = RegistrarSSID;

if(RegistrarAuth == ""){
RegistrarAuth = "WPAPSK";
RegistrarEncry = "TKIP";
RegistrarKeyType = "1";
RegistrarKeyIndex = "1";
RegistrarKey = "12345678";
need_submit_registrar_setting_flag = 1;
enableSubmitButton(true);
}

//Auth
if(RegistrarAuth == "OPEN"){
document.getElementById("Authenication").options.selectedIndex = 0;
AuthChange();
if(RegistrarEncry == "NONE"){
document.getElementById("EncryptTypeSelect").options.selectedIndex = 0;
}else if(RegistrarEncry == "WEP"){
document.getElementById("EncryptTypeSelect").options.selectedIndex = 1;

// wep key type
if(RegistrarKeyType == "0")
document.getElementById("KeyTypeSelect").options.selectedIndex = 0;
else if(RegistrarKeyType == "1")
document.getElementById("KeyTypeSelect").options.selectedIndex = 1;
else
return;

// wep key index
if(RegistrarKeyIndex == "1")
document.getElementById("KeyIndexSelect").options.selectedIndex = 0;
else if(RegistrarKeyIndex == "2")
document.getElementById("KeyIndexSelect").options.selectedIndex = 1;
else if(RegistrarKeyIndex == "3")
document.getElementById("KeyIndexSelect").options.selectedIndex = 2;
else if(RegistrarKeyIndex == "4")
document.getElementById("KeyIndexSelect").options.selectedIndex = 3;

document.getElementById("Key").value = RegistrarKey;
}else{
alert("internal error 1");
return;
}
}else if(RegistrarAuth == "WPAPSK"){
document.getElementById("Authenication").options.selectedIndex = 1;
AuthChange();
if(RegistrarEncry == "TKIP"){
document.getElementById("EncryptTypeSelect").options.selectedIndex = 0;
}else if(RegistrarEncry == "AES"){
document.getElementById("EncryptTypeSelect").options.selectedIndex = 1;
}else{
alert("internal error 2");
return;
}
document.getElementById("Key").value = RegistrarKey;
}else if(RegistrarAuth == "WPA2PSK"){
document.getElementById("Authenication").options.selectedIndex = 2;
AuthChange();
if(RegistrarEncry == "TKIP"){
document.getElementById("EncryptTypeSelect").options.selectedIndex = 0;
}else if(RegistrarEncry == "AES"){
document.getElementById("EncryptTypeSelect").options.selectedIndex = 1;
}else{
alert("internal error 2");
return;
}
document.getElementById("Key").value = RegistrarKey;
}else{
alert("internal error 3;");
return;
}

EncryChange();
}

function GTLTConvert(str){
var i;
var result = "";
for(i=0; i < str.length; i++){
if(str.charAt(i) == '>')
result = result + "&gt;";
else if(str.charAt(i) == '<')
result = result + "&lt;";
else
result = result + str.charAt(i);
}
return result;
}

function VersionTranslate(num)
{
if(num == 16)
return "1.0";
else if(num == 17)
return "1.1";
else
return "?";
}

function StateTranslate(num)
{
if(num == 1)
return "Unconf.";
else if(num ==2)
return "Conf.";
else
return "?";
}


function initTranslation()
{
var e = document.getElementById("stawpsTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("stawps title");

e = document.getElementById("stawpsAPScan");
e.innerHTML = _("stawps scan");
e = document.getElementById("stawpsRefresh");
e.value = _("stawps refresh");
e = document.getElementById("stawpsPINStart");
e.value = _("stawps pin start");
e = document.getElementById("stawpsPBCStart");
e.value = _("stawps pbc start");
e = document.getElementById("stawpsCancel");
e.value = _("wireless cancel");
e = document.getElementById("gen_new_pin");
e.value = _("stawps renew pin");

e = document.getElementById("stawpsRegistrarSet");
e.innerHTML = _("stawps registrar set");
e = document.getElementById("stawpsSSID");
e.innerHTML = _("station ssid");
e = document.getElementById("stawpsAuth");
e.innerHTML = _("station auth");
e = document.getElementById("stawpsEncrypType");
e.innerHTML = _("secure encryp type");
e = document.getElementById("stawpsWEPKeyType");
e.innerHTML = _("stawps wep key type");
e = document.getElementById("stawpsWEPKeyIndex");
e.innerHTML = _("stawps wep key index");
e = document.getElementById("stawpsKey");
e.innerHTML = _("stawps key");
e = document.getElementById("submitButton");
e.value = _("stawps submit");

e = document.getElementById("stawpsStatus");
e.innerHTML = _("wps status");
}

var STAMode = <% getWPSSTAModeASP(); %>;
function Init()
{
initTranslation();

STATimerFlag = 1;
InitializeTimer(3);

InitRegistrarSetting();

}



function getSelectedSSID()
{
var i;
for(i=0; i< document.wpssta_form.WPSAPSelect.length ; i++){
if(document.wpssta_form.WPSAPSelect[i].checked == true)
break;
}

if(i == document.wpssta_form.WPSAPSelect.length){
alert("Please select a WPS AP to process.");
return;
}

var WPSAP;
WPSAP = new Array();
WPSAP = WPSAPList[i].split("\n");
return WPSAP[0];
}


function PINStart()
{
if(STAMode == 0){ // enrollee
makeRequest("/goform/WPSSTAPINEnr", getSelectedSSID());
}else if(STAMode == 1){	// Registrar

if(!checkPIN(document.getElementById("PIN").value)){
return;
}

if(need_submit_registrar_setting_flag){
alert("This is the first time you running WPS registrar mode and \n the registrar settings need to be submitted.");
return;
}

if(document.getElementById("submitButton").disabled == false){
ret = confirm("You have changed the registrar settings but did NOT submit them.\nDo you really want running WPS without these settings?");
if(!ret)
return;
}

makeRequest("/goform/WPSSTAPINReg", document.getElementById("PIN").value + " " + getSelectedSSID());
}
}

function PBCStart()
{
if(STAMode == 0){ // enrollee
makeRequest("/goform/WPSSTAPBCEnr", "n/a1");
}else if(STAMode == 1){	// Registrar
makeRequest("/goform/WPSSTAPBCReg", "n/a2");
}
}

function CancelSelected()
{
makeRequest("/goform/WPSSTAStop", "n/a3");
}

function genNewPin()
{
makeRequest("/goform/WPSSTAGenNewPIN", "n/a4", 1);
//update PIN
PINCode = http_request.responseText;
document.getElementById("PIN").value = PINCode;
}

function checkPIN(wsc_pin_code)
{
if(wsc_pin_code == ""){
alert("Please input the enrollee's PIN number");
return false;
}
accum = 0;
accum += 3 * (parseInt(wsc_pin_code / 10000000) % 10);
accum += 1 * (parseInt(wsc_pin_code / 1000000) % 10);
accum += 3 * (parseInt(wsc_pin_code / 100000) % 10);
accum += 1 * (parseInt(wsc_pin_code / 10000) % 10);
accum += 3 * (parseInt(wsc_pin_code / 1000) % 10);
accum += 1 * (parseInt(wsc_pin_code / 100) % 10);
accum += 3 * (parseInt(wsc_pin_code / 10) % 10);
accum += 1 * (parseInt(wsc_pin_code / 1) % 10);

if ((accum % 10) != 0){
alert('ValidateChecksum failed, please try again !!');
return false;
}
return true;
}

function checkHex(str){
var len = str.length;

for (var i=0; i<str.length; i++) {
if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
(str.charAt(i) >= 'A' && str.charAt(i) <= 'F') ){
continue;
}else
return false;
}
return true;
}

function RegistrarSettingSubmit()
{
var ret;
if(!isSafeForShell(document.getElementById("SSID").value)){
alert("The SSID contains dangerous characters\n");
return false;
}

if(!isSafeForShell(document.getElementById("Key").value)){
alert("The Key contains dangerous characters\n");
return false;
}

if(document.getElementById("Authenication").value == "OPEN"){
if(document.getElementById("EncryptTypeSelect").value == "NONE"){
ret = confirm("No any security settings are selected. Are you sure?");
if(!ret)
return false;
}else if(document.getElementById("EncryptTypeSelect").value == "WEP"){
if(document.getElementById("KeyTypeSelect").value == "1"){
if(	document.getElementById("Key").value.length != 5 &&
document.getElementById("Key").value.length != 13){
alert("WEP key invalid.");
return false;
}
}else if(document.getElementById("KeyTypeSelect").value == "0"){
if(	document.getElementById("Key").value.length != 10 &&
document.getElementById("Key").value.length != 26){
alert("WEP key invalid.");
return false;
}
if( !checkHex(document.getElementById("Key").value)){
alert("WEP key format invalid.");
return false;
}
}
}
}else if(document.getElementById("Authenication").value == "WPAPSK" || document.getElementById("Authenication").value == "WPA2PSK" ){
if(	document.getElementById("Key").value.length < 8 ||
document.getElementById("Key").value.length > 64){
alert("Key length invalid.");
return false;
}
}else{
return false;
}

enableSubmitButton(false);
need_submit_registrar_setting_flag = 0;
document.getElementById("hiddenPIN").value = document.getElementById("PIN").value;

makeRequest("/goform/WPSSTARegistrarSetupSSID", document.getElementById("SSID").value);
makeRequest("/goform/WPSSTARegistrarSetupRest",	document.getElementById("Authenication").value + " " +
document.getElementById("EncryptTypeSelect").value + " " +
document.getElementById("KeyTypeSelect").value + " " +
document.getElementById("KeyIndexSelect").value);
makeRequest("/goform/WPSSTARegistrarSetupKey", document.getElementById("Key").value);
return true;
}

function enableSubmitButton(enable)
{
document.getElementById("submitButton").disabled = (!enable);
}

function style_display_on()
{
if (window.ActiveXObject) { // IE
return "block";
}
else if (window.XMLHttpRequest) { // Mozilla, Safari,...
return "table-row";
}
}


function hideKeyRow()
{
document.getElementById("KeyRow").style.visibility = "hidden";
document.getElementById("KeyRow").style.display = "none";
}

function showKeyRow()
{
document.getElementById("KeyRow").style.visibility = "visible";
document.getElementById("KeyRow").style.display = style_display_on();
}

function hideWEP()
{
document.getElementById("keytype").style.visibility = "hidden";
document.getElementById("keytype").style.display = "none";
document.getElementById("keyindex").style.visibility = "hidden";
document.getElementById("keyindex").style.display = "none";
}

function showWEP()
{
document.getElementById("keytype").style.visibility = "visible";
document.getElementById("keytype").style.display = style_display_on();
document.getElementById("keyindex").style.visibility = "visible";
document.getElementById("keyindex").style.display = style_display_on();
}

function AuthChange()
{
encry_select = document.getElementById("EncryptTypeSelect");
auth = document.getElementById("Authenication").value;

hideKeyRow();
hideWEP();

if(auth == "OPEN"){
encry_select.options.length = 0;
encry_select.options[encry_select.length] = new Option("NONE", "NONE",	false, false);
encry_select.options[encry_select.length] = new Option("WEP", "WEP", false, false);
}else if(auth == "WPAPSK" || auth == "WPA2PSK"){
encry_select.options.length = 0;
encry_select.options[encry_select.length] = new Option("TKIP", "TKIP",	false, false);
encry_select.options[encry_select.length] = new Option("AES", "AES", false, false);
}else{
return;
}
EncryChange();
}

function EncryChange()
{
encry_select = document.getElementById("EncryptTypeSelect");
auth = document.getElementById("Authenication").value;
if(auth == "OPEN" && encry_select.value == "NONE" ){
hideKeyRow();
hideWEP();
}else if(auth == "OPEN" && encry_select.value == "WEP" ){
showKeyRow();
showWEP();
}else{
showKeyRow();
hideWEP();
}
}

function RefreshClick()
{
makeRequest("/goform/WPSSTABSSIDListReset", "n/a", 1);
location.href=location.href;
}

</script>
</head>
<body onload="Init()">
<table class="body">
<tbody>
<tr><td>
<h1 id="stawpsTitle">Wi-Fi Protected Setup (STA)</h1>
<hr size="1" />
<br />

<form method="post" name="wpssta_form">
<div>
<h2 id="stawpsAPScan" class="title">WPS AP site survey</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tbody>
<script type="text/javascript">
document.write("<tr><td>No.</td><td>SSID</td><td>BSSID</td><td>RSSI</td><td>Ch.</td><td>Auth.</td><td>Encrypt</td><td>Ver.</td><td>Status</td></tr>");

var i;
for(i=0; i < WPSAPList.length -1; i++){
var WPSAP;
WPSAP = new Array();
WPSAP = WPSAPList[i].split("\n");

document.write("<tr>");

//Radio
document.write("<td>");
document.write("<input type=radio name=WPSAPSelect value=");
document.write(i);
if(i==0)
document.write(" checked ");
document.write("></td>");

// SSID
document.write("<td>");
document.write( GTLTConvert(  WPSAP[0] )  );
document.write("</td>");

//BSSID
document.write("<td>");
document.write(WPSAP[1]);
document.write("</td>");

//RSSI
document.write("<td>");
document.write(WPSAP[2]);
document.write("%</td>");

// Channel
document.write("<td>");
document.write(WPSAP[3]);
document.write("</td>");

//Auth
document.write("<td>");
document.write(WPSAP[4]);
document.write("</td>");

//Encry
document.write("<td>");
document.write(WPSAP[5]);
document.write("</td>");

//Version
document.write("<td>");
document.write( VersionTranslate (WPSAP[6] ) );
document.write("</td>");

//wsc_state
document.write("<td>");
document.write( StateTranslate ( WPSAP[7] ) );
document.write("</td>");

document.write("</tr>");
}
</script>
</tbody>
</table>
</div>
</form>

<br>
<input value="Refresh" id="stawpsRefresh" onclick="RefreshClick();" type="button"><br /><br />
<h2 id="device_conf">Device Configure<h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td class="title" id="config_button">Configure via Push Button</td>
<td><input value=" Start PBC" id="stawpsPBCStart" onclick="PBCStart();" type="button"></td>
</tr>
<tr><td class="title" id="config_pincode">Configure via Client PinCode</td>
<td><input value="" name="PIN" id="PIN" size="8" maxlength="16" type="text">&nbsp;
<input value=" Start PIN" id="stawpsPINStart" onclick="PINStart();" type="button">&nbsp;
<input name="gen_new_pin" id="gen_new_pin" value="Renew PIN" onclick="genNewPin();" type="button">
</td>
</tr>
<tr><td></td>
<td><input value="Cancel" id="stawpsCancel" onclick="CancelSelected();" type="button"></td>
</tr>
</table>
<!-- =================  WPS Status  ================== -->
<div style="color: #75a8f1">
<span id="stawpsStatus">Status:</span>
<span id="WPSInfo">Idle</span>
</div>

<div id="registrarSettingTable" style="display:none">
<form method="post" name="registrar_form" action="/goform/WPSSTARegistrar">
<h2 id="stawpsRegistrarSet">Registrar Settings</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td id="stawpsSSID" class="head">SSID</td>
<td><input value="" name="SSID" id="SSID" size="20" maxlength="32" type="text" onKeyUp="enableSubmitButton(true);"></td>
</tr>

<tr>
<td id="stawpsAuth" class="head">Authenication</td>
<td>
<select name="Authenication" id="Authenication" size="1" onChange="AuthChange();enableSubmitButton(true);">
<option value=OPEN>OPEN</option>
<option value=WPAPSK>WPA-PSK</option>
<option value=WPA2PSK>WPA2-PSK</option>
</select>
</td>
</tr>

<tr id="encrypttype">
<td id="stawpsEncrypType" class="head">Encrypt Type</td>
<td>
<select name="EncryptType" id="EncryptTypeSelect" size="1" onChange="EncryChange();enableSubmitButton(true);">
<!-- Javascript would update this -->
</select>
</td>
</tr>

<tr id="keytype">
<td id="stawpsWEPKeyType" class="head">WEP Key Type</td>
<td>
<select name="KeyType" id="KeyTypeSelect" size="1" onChange="enableSubmitButton(true);">
<option value="0">Hex</option>
<option value="1">ASCII</option>
</select>
</td>
</tr>

<tr id="keyindex">
<td id="stawpsWEPKeyIndex" class="head">WEP Key Index</td>
<td>
<select name="KeyIndex" id="KeyIndexSelect" size="1" onChange="enableSubmitButton(true);">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
</select>
</td>
</tr>

<tr id="KeyRow">
<td id="stawpsKey" class="head">Key</td>
<td><input value="" name="Key" id="Key" size="32" maxlength="64" type="text" onKeyUp="enableSubmitButton(true);"></td>
</tr>
</table>

<br>
<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type="hidden" name="hiddenPIN" id="hiddenPIN" value="">
<input name="submitButton"  id="submitButton" value=" Submit " onclick="RegistrarSettingSubmit();" type="button">
</td>
</tr>
</table>
</form>
</div>

</td></tr>
</tbody>
</table>

</body>
</html>