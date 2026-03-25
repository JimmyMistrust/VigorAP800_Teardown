<html>
<head>
<title>Wireless Security Settings</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/dhtml.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var ssid1 = '<% getCfgGeneral(1, "SSID1"); %>';
var ssid2 = '<% getCfgGeneral(1, "SSID2"); %>';
var ssid3 = '<% getCfgGeneral(1, "SSID3"); %>';
var ssid4 = '<% getCfgGeneral(1, "SSID4"); %>';
var BssidNum = 0;
var SSID = new Array();
var PreAuth = new Array();
var AuthMode = new Array();
var EncrypType = new Array();
var DefaultKeyID = new Array();
var Key1Type = new Array();
var Key1Str = new Array();
var Key2Type = new Array();
var Key2Str = new Array();
var Key3Type = new Array();
var Key3Str = new Array();
var Key4Type = new Array();
var Key4Str = new Array();
var WPAPSK = new Array();
var RekeyMethod = new Array();
var RekeyInterval = new Array();
var PMKCachePeriod = new Array();
var IEEE8021X = new Array();
var RADIUS_Server = new Array();
var RADIUS_Port = new Array();
var RADIUS_Key = new Array();
var session_timeout_interval = new Array();
var RADIUS_SSID = 0;
var flag = 0;

function checkIpAddr(field)
{
if(field.value == "")
return false;

if ( isAllNum(field.value) == 0)
return false;

if( (!checkRange(field.value,1,0,255)) ||
(!checkRange(field.value,2,0,255)) ||
(!checkRange(field.value,3,0,255)) ||
(!checkRange(field.value,4,1,254)) ){
return false;
}
return true;
}

function checkHex(str)
{
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

function checkInjection(str)
{
var len = str.length;
for (var i=0; i<str.length; i++) {
if ( str.charAt(i) == '\r' || str.charAt(i) == '\n'){
return false;
}else
continue;
}
return true;
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

function radiusSetup(MBSSID)
{
RADIUS_SSID = MBSSID;

var security_mode = eval("document.getElementById('security_mode_"+MBSSID+"')").value;

if (security_mode != "WPA" && security_mode != "WPA2"
&& security_mode != "WPA1WPA2" && security_mode != "IEEE8021X") {
alert("[SSID"+(parseInt(MBSSID)+1)+"]802.1x isn't enabled");
return false;
} else {
window.open('./radius.asp', 'radius', 'toolbars=no,width=800,height=300px,top=150px,left='+(screen.width/2-230)+'px,status=no,menubar=no');
return true;
}
}

var http_request = false;
function makeRequest(url, content, handler) {
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
http_request.onreadystatechange = handler;
http_request.open('POST', url, true);
http_request.send(content);
}

function securityHandler()
{
if (http_request.readyState == 4) {
if (http_request.status == 200) {
parseAllData(http_request.responseText);
LoadFields(0);
LoadFields(1);
LoadFields(2);
LoadFields(3);
} else {
alert('There was a problem with the request.');
}
}
}

function parseAllData(str)
{
var all_str = new Array();
all_str = str.split("\n");

BssidNum = parseInt(all_str[0]);

for (var i = 0; i < all_str.length-2; i++) {
var fields_str = new Array();
fields_str = all_str[i+1].split("\r");

SSID[i] = fields_str[0];
PreAuth[i] = fields_str[1];
AuthMode[i] = fields_str[2];
EncrypType[i] = fields_str[3];
DefaultKeyID[i] = fields_str[4];
Key1Type[i] = fields_str[5];
Key1Str[i] = fields_str[6];
Key2Type[i] = fields_str[7];
Key2Str[i] = fields_str[8];
Key3Type[i] = fields_str[9];
Key3Str[i] = fields_str[10];
Key4Type[i] = fields_str[11];
Key4Str[i] = fields_str[12];
WPAPSK[i] = fields_str[13];
RekeyMethod[i] = fields_str[14];
RekeyInterval[i] = fields_str[15];
PMKCachePeriod[i] = fields_str[16];
IEEE8021X[i] = fields_str[17];
RADIUS_Server[i] = fields_str[18];
RADIUS_Port[i] = fields_str[19];
RADIUS_Key[i] = fields_str[20];
session_timeout_interval[i] = fields_str[21];

/* !!!! IMPORTANT !!!!*/
if (IEEE8021X[i] == "1")
AuthMode[i] = "IEEE8021X";

if (AuthMode[i] == "OPEN" && EncrypType[i] == "NONE" && IEEE8021X[i] == "0")
AuthMode[i] = "Disable";
}
}

function checkData(MBSSID)
{
var securitymode;

securitymode = eval("document.security_form.security_mode_"+MBSSID).value;
if (AuthMode[MBSSID] != securitymode)
flag = 1;
if (securitymode == "OPEN" || securitymode == "SHARED" ||securitymode == "WEPAUTO")
{
if (!check_Wep(securitymode, MBSSID))
return false;
}
// WPA/WPA2/(WPA+WPA2) PSK
else if (securitymode == "WPAPSK" || securitymode == "WPA2PSK" || securitymode == "WPAPSKWPA2PSK" /* || security_mode == 5 */)
{
var keyvalue = eval("document.security_form.passphrase_"+MBSSID).value;

if (keyvalue.length == 0) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input wpapsk key!");
eval("document.security_form.passphrase_"+MBSSID).select();
eval("document.security_form.passphrase_"+MBSSID).focus();
return false;
}

if (keyvalue.length < 8) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input at least 8 character of wpapsk key!");
eval("document.security_form.passphrase_"+MBSSID).select();
eval("document.security_form.passphrase_"+MBSSID).focus();
return false;
}

if (checkInjection(eval("document.security_form.passphrase_"+MBSSID).value) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Invalid characters in Pass Phrase.");
eval("document.security_form.passphrase_"+MBSSID).select();
eval("document.security_form.passphrase_"+MBSSID).focus();
return false;
}

if (check_wpa(MBSSID) == false)
return false;
}
//802.1x
else if (securitymode == "IEEE8021X")
{
if (eval("document.security_form.ieee8021x_wep_"+MBSSID)[0].checked == false &&
eval("document.security_form.ieee8021x_wep_"+MBSSID)[1].checked == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please choose the 802.1x WEP option.");
return false;
}
if (check_radius(MBSSID) == false)
return false;
}
else if (securitymode == "WPA" || securitymode == "WPA1WPA2")	// WPA or WPA1WP2 mixed mode
{
if (check_wpa(MBSSID) == false)
return false;
if (check_radius(MBSSID) == false)
return false;
}
else if (securitymode == "WPA2")								// WPA2
{
if (check_wpa(MBSSID) == false)
return false;
if (check_radius(MBSSID) == false)
return false;
}

return true;
}

function check_wpa(MBSSID)
{
if (eval("document.security_form.cipher_"+MBSSID)[0].checked != true &&
eval("document.security_form.cipher_"+MBSSID)[1].checked != true &&
eval("document.security_form.cipher_"+MBSSID)[2].checked != true) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please choose a WPA Algorithms.");
return false;
}

if (isAllNum(eval("document.security_form.keyRenewalInterval_"+MBSSID).value) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input a valid key renewal interval");
eval("document.security_form.keyRenewalInterval_"+MBSSID).select();
eval("document.security_form.keyRenewalInterval_"+MBSSID).focus();
return false;
}

if(eval("document.security_form.keyRenewalInterval_"+MBSSID).value < 60) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Warning: A short key renewal interval.");
//return false;
}

return true;
}

function check_radius(MBSSID)
{
if (!eval("document.security_form.RadiusServerIP_"+MBSSID).value.length
|| !eval("document.security_form.RadiusServerPort_"+MBSSID).value.length
|| !eval("document.security_form.RadiusServerSecret_"+MBSSID).value.length) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please Setup RADIUS Server.");
return false;
}

if (checkIpAddr(eval("document.security_form.RadiusServerIP_"+MBSSID)) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please Setup RADIUS Server.");
return false;
}

return true;
}

function securityMode(MBSSID)
{
var security_mode;

eval("document.security_form.cipher_"+MBSSID)[0].disabled = true;
eval("document.security_form.cipher_"+MBSSID)[1].disabled = true;
eval("document.security_form.cipher_"+MBSSID)[2].disabled = true;
eval("document.getElementById('passphrase_"+MBSSID+"')").disabled = true;
eval("document.getElementById('keyRenewalInterval_"+MBSSID+"')").disabled = true;
eval("document.getElementById('PMKCachePeriod_"+MBSSID+"')").disabled = true;
eval("document.security_form.PreAuthentication_"+MBSSID)[0].disabled = true;
eval("document.security_form.PreAuthentication_"+MBSSID)[1].disabled = true;
eval("document.security_form.wep_default_key_"+MBSSID)[0].disabled = true;
eval("document.security_form.wep_default_key_"+MBSSID)[1].disabled = true;
eval("document.security_form.wep_default_key_"+MBSSID)[2].disabled = true;
eval("document.security_form.wep_default_key_"+MBSSID)[3].disabled = true;
eval("document.getElementById('WEP1_"+MBSSID+"')").disabled = true;
eval("document.getElementById('WEP2_"+MBSSID+"')").disabled = true;
eval("document.getElementById('WEP3_"+MBSSID+"')").disabled = true;
eval("document.getElementById('WEP4_"+MBSSID+"')").disabled = true;
eval("document.security_form.WEP1Select_"+MBSSID).disabled = true;
eval("document.security_form.WEP2Select_"+MBSSID).disabled = true;
eval("document.security_form.WEP3Select_"+MBSSID).disabled = true;
eval("document.security_form.WEP4Select_"+MBSSID).disabled = true;
eval("document.security_form.ieee8021x_wep_"+MBSSID)[0].disabled = true;
eval("document.security_form.ieee8021x_wep_"+MBSSID)[1].disabled = true;
eval("document.getElementById('div_8021x_wep_"+MBSSID+"')").style.display = "none";
eval("document.getElementById('RadiusServerIP_"+MBSSID+"')").disabled = true;
eval("document.getElementById('RadiusServerPort_"+MBSSID+"')").disabled = true;
eval("document.getElementById('RadiusServerSecret_"+MBSSID+"')").disabled = true;
eval("document.getElementById('RadiusServerSessionTimeout_"+MBSSID+"')").disabled = true;

//if (MBSSID == "0")
eval("document.getElementById('div_8021x_wep_"+MBSSID+"')").style.display = "";

security_mode = eval("document.security_form.security_mode_"+MBSSID).value;

if (security_mode == "OPEN" || security_mode == "SHARED" ||security_mode == "WEPAUTO") {
if (security_mode == "SHARED") {
eval("document.getElementById('div_security_shared_mode_'"+MBSSID+")").style.visibility = "visible";
eval("document.getElementById('div_security_shared_mode_'"+MBSSID+")").style.display = style_display_on();
}

eval("document.security_form.wep_default_key_"+MBSSID)[0].disabled = false;
eval("document.security_form.wep_default_key_"+MBSSID)[1].disabled = false;
eval("document.security_form.wep_default_key_"+MBSSID)[2].disabled = false;
eval("document.security_form.wep_default_key_"+MBSSID)[3].disabled = false;
eval("document.getElementById('WEP1_"+MBSSID+"')").disabled = false;
eval("document.getElementById('WEP2_"+MBSSID+"')").disabled = false;
eval("document.getElementById('WEP3_"+MBSSID+"')").disabled = false;
eval("document.getElementById('WEP4_"+MBSSID+"')").disabled = false;
eval("document.security_form.WEP1Select_"+MBSSID).disabled = false;
eval("document.security_form.WEP2Select_"+MBSSID).disabled = false;
eval("document.security_form.WEP3Select_"+MBSSID).disabled = false;
eval("document.security_form.WEP4Select_"+MBSSID).disabled = false;
} else if (security_mode == "WPAPSK" || security_mode == "WPA2PSK" || security_mode == "WPAPSKWPA2PSK") {
eval("document.security_form.cipher_"+MBSSID)[0].disabled = false;
eval("document.security_form.cipher_"+MBSSID)[1].disabled = false;
// deal with TKIP-AES mixed mode
if(security_mode == "WPAPSK" || security_mode == "WPA2PSK" || security_mode == "WPAPSKWPA2PSK")
eval("document.security_form.cipher_"+MBSSID)[2].disabled = false;

eval("document.security_form.passphrase_"+MBSSID).disabled = false;
eval("document.security_form.keyRenewalInterval_"+MBSSID).disabled = false;
} else if (security_mode == "WPA" || security_mode == "WPA2" || security_mode == "WPA1WPA2") {
eval("document.security_form.cipher_"+MBSSID)[0].disabled = false;
eval("document.security_form.cipher_"+MBSSID)[1].disabled = false;
eval("document.security_form.keyRenewalInterval_"+MBSSID).disabled = false;

if (security_mode == "WPA")
eval("document.security_form.cipher_"+MBSSID)[2].disabled = false;

if (security_mode == "WPA2") {
eval("document.security_form.cipher_"+MBSSID)[2].disabled = false;
eval("document.security_form.PMKCachePeriod_"+MBSSID).disabled = false;
eval("document.security_form.PreAuthentication_"+MBSSID)[0].disabled = false;
eval("document.security_form.PreAuthentication_"+MBSSID)[1].disabled = false;
}

if (security_mode == "WPA1WPA2")
eval("document.security_form.cipher_"+MBSSID)[2].disabled = false;

eval("document.getElementById('RadiusServerIP_"+MBSSID+"')").disabled = false;
eval("document.getElementById('RadiusServerPort_"+MBSSID+"')").disabled = false;
eval("document.getElementById('RadiusServerSecret_"+MBSSID+"')").disabled = false;
eval("document.getElementById('RadiusServerSessionTimeout_"+MBSSID+"')").disabled = false;
} else if (security_mode == "IEEE8021X") {
eval("document.security_form.ieee8021x_wep_"+MBSSID)[0].disabled = false;
eval("document.security_form.ieee8021x_wep_"+MBSSID)[1].disabled = false;

eval("document.getElementById('RadiusServerIP_"+MBSSID+"')").disabled = false;
eval("document.getElementById('RadiusServerPort_"+MBSSID+"')").disabled = false;
eval("document.getElementById('RadiusServerSecret_"+MBSSID+"')").disabled = false;
eval("document.getElementById('RadiusServerSessionTimeout_"+MBSSID+"')").disabled = false;
}
}

function check_Wep(securitymode, MBSSID)
{
var defaultid = 0;
var key_input;

for (var i = 0; i < 4; i++) {
if (eval("document.security_form.wep_default_key_"+MBSSID)[i].checked)
defaultid = i+1;
}

if (defaultid == 0) {
alert("[SSID"+MBSSID+1+"]Please select a WEP key as default key!");
return false;
}

if (defaultid == 1)
var keyvalue = eval("document.security_form.wep_key_1_"+MBSSID).value;
else if (defaultid == 2)
var keyvalue = eval("document.security_form.wep_key_2_"+MBSSID).value;
else if (defaultid == 3)
var keyvalue = eval("document.security_form.wep_key_3_"+MBSSID).value;
else if (defaultid == 4)
var keyvalue = eval("document.security_form.wep_key_4_"+MBSSID).value;

if (keyvalue.length == 0 && (securitymode == "SHARED" || securitymode == "OPEN" || securitymode == "WEPAUTO")) { // shared wep  || md5
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input wep key"+defaultid+" !");
eval("document.security_form.wep_key_"+defaultid+"_"+MBSSID).select();
eval("document.security_form.wep_key_"+defaultid+"_"+MBSSID).focus();
return false;
}

for (i = 1; i <= 4; i++) {
var keylength = eval("document.security_form.wep_key_"+i+"_"+MBSSID).value.length;
if (keylength != 0) {
if (eval("document.security_form.WEP"+i+"Select_"+MBSSID).options.selectedIndex == 0) {
if (keylength != 5 && keylength != 13) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input 5 or 13 characters of wep key"+i+" !");
eval("document.security_form.wep_key_"+i+"_"+MBSSID).select();
eval("document.security_form.wep_key_"+i+"_"+MBSSID).focus();
return false;
}
if (checkInjection(eval("document.security_form.wep_key_"+i+"_"+MBSSID).value) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Wep key"+i+" contains invalid characters.");
eval("document.security_form.wep_key_"+i+"_"+MBSSID).select();
eval("document.security_form.wep_key_"+i+"_"+MBSSID).focus();
return false;
}
}
if (eval("document.security_form.WEP"+i+"Select_"+MBSSID).options.selectedIndex == 1) {
if (keylength != 10 && keylength != 26) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input 10 or 26 characters of wep key"+i+" !");
eval("document.security_form.wep_key_"+i+"_"+MBSSID).select();
eval("document.security_form.wep_key_"+i+"_"+MBSSID).focus();
return false;
}
if (checkHex(eval("document.security_form.wep_key_"+i+"_"+MBSSID).value) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Invalid Wep key"+i+" format !");
eval("document.security_form.wep_key_"+i+"_"+MBSSID).select();
eval("document.security_form.wep_key_"+i+"_"+MBSSID).focus();
return false;
}
}
}
}
return true;
}

function submit_apply()
{
if (checkData(0) && checkData(1) && checkData(2) && checkData(3) && confirm(_("msg lan connection lost"))) {
if (flag == 1)
alert("To allow the maximum 802.11n rates, ensure that your router and Wi-Fi station are configured to use WPA2-AES or, alternatively, no password.");

document.security_form.submit();
return true;
}
return false;
}

function setVle2Elmt(_elmt, _vle)
{
// for IE 4 that we have to do it
var elmt = _elmt;
var vle = _vle;

for (var i=0; i < elmt.options.length; i++) {
if (elmt.options[i].value == vle) {
elmt.selectedIndex = i;
elmt.options[i].selected = true;
return;
}
}
elmt.selectedIndex  = 0;

return;
}

function LoadFields(MBSSID)
{
var result;
// Security Mode
var sp_select = eval("document.getElementById('security_mode_"+MBSSID+"')");

sp_select.options.length = 0;

sp_select.options[sp_select.length] = new Option("Disable",	"Disable",	false, AuthMode[MBSSID] == "Disable");
//sp_select.options[sp_select.length] = new Option("OPEN",	"OPEN",		false, AuthMode[MBSSID] == "OPEN");
//sp_select.options[sp_select.length] = new Option("SHARED",	"SHARED", 	false, AuthMode[MBSSID] == "SHARED");
sp_select.options[sp_select.length] = new Option("WEP", "WEPAUTO",	false, AuthMode[MBSSID] == "WEPAUTO");
sp_select.options[sp_select.length] = new Option("WPA/PSK", "WPAPSK",	false, AuthMode[MBSSID] == "WPAPSK");
sp_select.options[sp_select.length] = new Option("WPA2/PSK","WPA2PSK",	false, AuthMode[MBSSID] == "WPA2PSK");
sp_select.options[sp_select.length] = new Option("Mixed(WPA+WPA2)/PSK","WPAPSKWPA2PSK",	false, AuthMode[MBSSID] == "WPAPSKWPA2PSK");

/* until now we only support 8021X WEP for MBSSID[0]*/
//if(MBSSID == 0)
sp_select.options[sp_select.length] = new Option("WEP/802.1x",	"IEEE8021X",false, AuthMode[MBSSID] == "IEEE8021X");
sp_select.options[sp_select.length] = new Option("WPA/802.1x",		"WPA",		false, AuthMode[MBSSID] == "WPA");
sp_select.options[sp_select.length] = new Option("WPA2/802.1x",	"WPA2",		false, AuthMode[MBSSID] == "WPA2");
sp_select.options[sp_select.length] = new Option("Mixed(WPA+WPA2)/802.1x","WPA1WPA2",	false, AuthMode[MBSSID] == "WPA1WPA2");

setVle2Elmt(sp_select, AuthMode[MBSSID]);

// WEP
eval("document.getElementById('WEP1_"+MBSSID+"')").value = Key1Str[MBSSID];
eval("document.getElementById('WEP2_"+MBSSID+"')").value = Key2Str[MBSSID];
eval("document.getElementById('WEP3_"+MBSSID+"')").value = Key3Str[MBSSID];
eval("document.getElementById('WEP4_"+MBSSID+"')").value = Key4Str[MBSSID];

eval("document.getElementById('WEP1Select_"+MBSSID+"')").selectedIndex = (Key1Type[MBSSID] == "0" ? 1 : 0);
eval("document.getElementById('WEP2Select_"+MBSSID+"')").selectedIndex = (Key2Type[MBSSID] == "0" ? 1 : 0);
eval("document.getElementById('WEP3Select_"+MBSSID+"')").selectedIndex = (Key3Type[MBSSID] == "0" ? 1 : 0);
eval("document.getElementById('WEP4Select_"+MBSSID+"')").selectedIndex = (Key4Type[MBSSID] == "0" ? 1 : 0);

if (DefaultKeyID[MBSSID] != "")
eval("document.security_form.wep_default_key_"+MBSSID)[parseInt(DefaultKeyID[MBSSID])-1].checked = true;

// SHARED && NONE
if(AuthMode[MBSSID] == "SHARED" && EncrypType[MBSSID] == "NONE")
eval("document.getElementById('security_shared_mode_"+MBSSID+"')").selectedIndex = 1;
else
eval("document.getElementById('security_shared_mode_"+MBSSID+"')").selectedIndex = 0;

// WPA
if(EncrypType[MBSSID] == "TKIP")
eval("document.security_form.cipher_"+MBSSID)[0].checked = true;
else if(EncrypType[MBSSID] == "AES")
eval("document.security_form.cipher_"+MBSSID)[1].checked = true;
else if(EncrypType[MBSSID] == "TKIPAES")
eval("document.security_form.cipher_"+MBSSID)[2].checked = true;

eval("document.getElementById('passphrase_"+MBSSID+"')").value = WPAPSK[MBSSID];
eval("document.getElementById('keyRenewalInterval_"+MBSSID+"')").value = RekeyInterval[MBSSID];
eval("document.getElementById('PMKCachePeriod_"+MBSSID+"')").value = PMKCachePeriod[MBSSID];

if (PreAuth[MBSSID] == "0")
eval("document.security_form.PreAuthentication_"+MBSSID)[0].checked = true;
else
eval("document.security_form.PreAuthentication_"+MBSSID)[1].checked = true;

//802.1x wep
if (IEEE8021X[MBSSID] == "1") {
if (EncrypType[MBSSID] == "WEP")
eval("document.security_form.ieee8021x_wep_"+MBSSID)[1].checked = true;
else
eval("document.security_form.ieee8021x_wep_"+MBSSID)[0].checked = true;
}

eval("document.getElementById('RadiusServerIP_"+MBSSID+"')").value = RADIUS_Server[MBSSID];
eval("document.getElementById('RadiusServerPort_"+MBSSID+"')").value = RADIUS_Port[MBSSID];
eval("document.getElementById('RadiusServerSecret_"+MBSSID+"')").value = RADIUS_Key[MBSSID];
eval("document.getElementById('RadiusServerSessionTimeout_"+MBSSID+"')").value = session_timeout_interval[MBSSID];

securityMode(MBSSID);
}

function initTranslation()
{
var e = document.getElementById("securityTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("secure title");
document.getElementById("bSsidStr0").innerHTML = ssid1;
document.getElementById("bSsidStr1").innerHTML = ssid2;
document.getElementById("bSsidStr2").innerHTML = ssid3;
document.getElementById("bSsidStr3").innerHTML = ssid4;
for (var i = 0; i < 4; i++) {
e = document.getElementById("bSsid"+i);
e.innerHTML = _("wireless ssid");
e = eval("document.getElementById('secureSecureMode_"+i+"')");
e.innerHTML = _("secure mode");
e = eval("document.getElementById('secureEncrypType_"+i+"')");
e.innerHTML = _("secure encryp type");
e = eval("document.getElementById('secureEncrypTypeNone_"+i+"')");
e.innerHTML = _("wireless none");
e = eval("document.getElementById('secureWEP_"+i+"')");
e.innerHTML = _("secure wep");
e = eval("document.getElementById('secureWEPKey1_"+i+"')");
e.innerHTML = _("wireless wepkey");
e = eval("document.getElementById('secureWEPKey2_"+i+"')");
e.innerHTML = _("wireless wepkey");
e = eval("document.getElementById('secureWEPKey3_"+i+"')");
e.innerHTML = _("wireless wepkey");
e = eval("document.getElementById('secureWEPKey4_"+i+"')");
e.innerHTML = _("wireless wepkey");

e = eval("document.getElementById('secreWPA_"+i+"')");
e.innerHTML = _("secure wpa");
e = eval("document.getElementById('secureWPAAlgorithm_"+i+"')");
e.innerHTML = _("secure wpa algorithm");
e = eval("document.getElementById('secureWPAPassPhrase_"+i+"')");
e.innerHTML = _("secure wpa pass phrase");
e = eval("document.getElementById('secureWPAKeyRenewInterval_"+i+"')");
e.innerHTML = _("secure wpa key renew interval");
e = eval("document.getElementById('secureWPAPMKCachePeriod_"+i+"')");
e.innerHTML = _("secure wpa pmk cache period");
e = eval("document.getElementById('secureWPAPreAuth_"+i+"')");
e.innerHTML = _("secure wpa preauth");
e = eval("document.getElementById('secureWPAPreAuthDisable_"+i+"')");
e.innerHTML = _("wireless disable");
e = eval("document.getElementById('secureWPAPreAuthEnable_"+i+"')");
e.innerHTML = _("wireless enable");

e = eval("document.getElementById('secure8021XWEP_"+i+"')");
e.innerHTML = _("secure 8021x wep");
e = eval("document.getElementById('secure1XWEPDisable_"+i+"')");
e.innerHTML = _("wireless disable");
e = eval("document.getElementById('secure1XWEPEnable_"+i+"')");
e.innerHTML = _("wireless enable");
}

e = document.getElementById("secureApply");
e.value = _("wireless apply");
e = document.getElementById("secureCancel");
e.value = _("wireless cancel");
}

function initAll()
{
initTranslation();

dhtml.cycleTab("tab1");
makeRequest("/goform/wirelessGetSecurity", "n/a", securityHandler);
}
</script>
</head>

<body onload="initAll()">
<table class="body">
<tr><td>
<h1 id="securityTitle">Security Settings</h1>
<hr size="1" />
<br />

<form method="post" name="security_form" action="/goform/wirelessSecurity">
<!-- ---------------------  MBSSID Selection  --------------------- -->
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center" id="m-ssid">
<tr>
<td id="tab1" class="ontab" onclick="dhtml.cycleTab(this.id);">SSID 1</td>
<td id="tab2" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 2</td>
<td id="tab3" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 3</td>
<td id="tab4" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 4</td>
<td width="40%" class="tabpadding"></td>
</tr>
</table>

<div class="pagetext" id="page1" style="visibility: visible; display: block;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>
<table width="600" cellspacing="2" cellpadding="2" border="0" align="center">
<tr>
<td width="5%"></td>
<td id="bSsid0">SSID</td>
<td td id="bSsidStr0" colspan="4"></td>
<td></td>
</tr>
<tr id="div_security_infra_mode_0" name="div_security_infra_mode_0">
<td width="5%"></td>
<td id="secureSecureMode_0">Mode:</td>
<td>
<select id="security_mode_0" name="security_mode_0" onchange="securityMode(0)" >
</select>
</td>
<td></td>
</tr>
<tr id="div_security_shared_mode_0" name="div_security_shared_mode_0" style="visibility: hidden;">
<td width="5%"></td>
<td id="secureEncrypType_0">Encrypt Type:</td>
<td>
<select name="security_shared_mode_0" id="security_shared_mode_0" size="1" onchange="securityMode(0)">
<option value="WEP">WEP</option>
<option value="None" id="secureEncrypTypeNone_0">None</option>
</select>
</td>
<td></td>
</tr>

<!-- ---------------------  RADIUS Link  --------------------- -->
<tr>
<td></td>
<td colspan="3">
Set up&nbsp;<a href="#" onclick="radiusSetup(0);">RADIUS Server</a>&nbsp;if 802.1x is enabled.<b/>
</td>
</tr>

<!-- ---------------------  WPA Setup  --------------------- -->
<tr>
<td colspan="4" class="title" id="secreWPA_0">WPA:</td>
</tr>
<tr id="div_wpa_algorithms_0" name="div_wpa_algorithms_0">
<td width="5%"></td>
<td id="secureWPAAlgorithm_0">WPA Algorithms:</td>
<td>
<input name="cipher_0" value="0" type="radio">TKIP &nbsp;
<input name="cipher_0" value="1" type="radio">AES &nbsp;
<input name="cipher_0" value="2" type="radio">TKIP/AES &nbsp;
</td>
<td></td>
</tr>
<tr id="wpa_passphrase_0" name="wpa_passphrase_0">
<td width="5%"></td>
<td id="secureWPAPassPhrase_0">Pass Phrase:</td>
<td><input type="password" name="passphrase_0" id="passphrase_0" size="28" maxlength="64"></td>
<td></td>
</tr>
<tr id="wpa_key_renewal_interval_0" name="wpa_key_renewal_interval_0">
<td width="5%"></td>
<td id="secureWPAKeyRenewInterval_0">Key Renewal Interval:</td>
<td><input name="keyRenewalInterval_0" id="keyRenewalInterval_0" size="4" maxlength="4" value="3600"> seconds</td>
<td></td>
</tr>
<tr id="wpa_PMK_Cache_Period_0" name="wpa_PMK_Cache_Period_0" style="visibility: hidden; display: none;">
<td width="5%"></td>
<td id="secureWPAPMKCachePeriod_0">PMK Cache Period:</td>
<td><input name="PMKCachePeriod_0" id="PMKCachePeriod_0" size="4" maxlength="4"> minutes</td>
<td></td>
</tr>
<tr id="wpa_preAuthentication_0" name="wpa_preAuthentication_0" style="visibility: hidden; display: none;">
<td width="5%"></td>
<td id="secureWPAPreAuth_0">Pre-Authentication:</td>
<td>
<input name="PreAuthentication_0" value="0" type="radio"><span id="secureWPAPreAuthDisable_0">Disable &nbsp;</span>
<input name="PreAuthentication_0"  value="1" type="radio"><span id="secureWPAPreAuthEnable_0">Enable &nbsp;</span>
</td>
<td></td>
</tr>

<!-- ---------------------  WEP Setup  --------------------- -->
<tr>
<td colspan="4" class="title" id="secureWEP_0">WEP:</td>
</tr>

<tr>
<td width="5%"></td>
<td>
<input type="radio" value="1" name="wep_default_key_0"/>
<span id="secureWEPKey1_0">Key</span>&nbsp;1 :
</td>
<td><input type="password" name="wep_key_1_0" id="WEP1_0" maxlength="26" /></td>
<td>
<select id="WEP1Select_0" name="WEP1Select_0">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="2" name="wep_default_key_0"/>
<span id="secureWEPKey2_0">Key</span>&nbsp;2 :
</td>
<td><input type="password" name="wep_key_2_0" id="WEP2_0" maxlength="26"/></td>
<td>
<select id="WEP2Select_0" name="WEP2Select_0">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="3" name="wep_default_key_0"/>
<span id="secureWEPKey3_0">Key</span>&nbsp;3 :
</td>
<td><input type="password" name="wep_key_3_0" id="WEP3_0" maxlength="26" /></td>
<td>
<select id="WEP3Select_0" name="WEP3Select_0">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="4" name="wep_default_key_0"/>
<span id="secureWEPKey4_0">Key</span>&nbsp;4 :
</td>
<td><input type="password" name="wep_key_4_0" id="WEP4_0" maxlength="26" /></td>
<td>
<select id="WEP4Select_0" name="WEP4Select_0">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr id="div_8021x_wep_0">
<td width="5%"></td>
<td id="secure8021XWEP_0">802.1x WEP:</td>
<td>
<input name="ieee8021x_wep_0" value="0" type="radio"><span id="secure1XWEPDisable_0">Disable</span> &nbsp;
<input name="ieee8021x_wep_0" value="1" type="radio"><span id="secure1XWEPEnable_0">Enable</span>
</td>
<td></td>
</tr>
</table>
</td></tr>
</table>
</div>

<div class="pagetext" id="page2" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>
<table width="600" cellspacing="2" cellpadding="2" border="0" align="center">
<tr>
<td width="5%"></td>
<td id="bSsid1">SSID</td>
<td td id="bSsidStr1" colspan="4"></td>
<td></td>
</tr>
<tr id="div_security_infra_mode_1" name="div_security_infra_mode_1">
<td width="5%"></td>
<td id="secureSecureMode_1">Mode:</td>
<td>
<select id="security_mode_1" name="security_mode_1" onchange="securityMode(1)" >
</select>
</td>
<td></td>
</tr>
<tr id="div_security_shared_mode_1" name="div_security_shared_mode_1" style="visibility: hidden;">
<td width="5%"></td>
<td id="secureEncrypType_1">Encrypt Type:</td>
<td>
<select name="security_shared_mode_1" id="security_shared_mode_1" size="1" onchange="securityMode(1)">
<option value="WEP">WEP</option>
<option value="None" id="secureEncrypTypeNone_1">None</option>
</select>
</td>
<td></td>
</tr>

<!-- ---------------------  RADIUS Link  --------------------- -->
<tr>
<td></td>
<td colspan="3">
Set up&nbsp;<a href="#" onclick="radiusSetup(1);">RADIUS Server</a>&nbsp;if 802.1x is enabled.<b/>
</td>
</tr>

<!-- ---------------------  WPA Setup  --------------------- -->
<tr>
<td colspan="4" class="title" id="secreWPA_1">WPA:</td>
</tr>
<tr id="div_wpa_algorithms_1" name="div_wpa_algorithms_1">
<td width="5%"></td>
<td id="secureWPAAlgorithm_1">WPA Algorithms:</td>
<td>
<input name="cipher_1" value="0" type="radio">TKIP &nbsp;
<input name="cipher_1" value="1" type="radio">AES &nbsp;
<input name="cipher_1" value="2" type="radio">TKIP/AES &nbsp;
</td>
<td></td>
</tr>
<tr id="wpa_passphrase_1" name="wpa_passphrase_1">
<td width="5%"></td>
<td id="secureWPAPassPhrase_1">Pass Phrase:</td>
<td><input type="password" name="passphrase_1" id="passphrase_1" size="28" maxlength="64"></td>
<td></td>
</tr>
<tr id="wpa_key_renewal_interval_1" name="wpa_key_renewal_interval_1">
<td width="5%"></td>
<td id="secureWPAKeyRenewInterval_1">Key Renewal Interval:</td>
<td><input name="keyRenewalInterval_1" id="keyRenewalInterval_1" size="4" maxlength="4" value="3600"> seconds</td>
<td></td>
</tr>
<tr id="wpa_PMK_Cache_Period_1" name="wpa_PMK_Cache_Period_1" style="visibility: hidden; display: none;">
<td width="5%"></td>
<td id="secureWPAPMKCachePeriod_1">PMK Cache Period:</td>
<td><input name="PMKCachePeriod_1" id="PMKCachePeriod_1" size="4" maxlength="4"> minutes</td>
<td></td>
</tr>
<tr id="wpa_preAuthentication_1" name="wpa_preAuthentication_1" style="visibility: hidden; display: none;">
<td width="5%"></td>
<td id="secureWPAPreAuth_1">Pre-Authentication:</td>
<td>
<input name="PreAuthentication_1" value="0" type="radio"><span id="secureWPAPreAuthDisable_1">Disable &nbsp;</span>
<input name="PreAuthentication_1"  value="1" type="radio"><span id="secureWPAPreAuthEnable_1">Enable &nbsp;</span>
</td>
<td></td>
</tr>

<!-- ---------------------  WEP Setup  --------------------- -->
<tr>
<td colspan="4" class="title" id="secureWEP_1">WEP:</td>
</tr>

<tr>
<td width="5%"></td>
<td>
<input type="radio" value="1" name="wep_default_key_1"/>
<span id="secureWEPKey1_1">Key</span>&nbsp;1 :
</td>
<td><input type="password" name="wep_key_1_1" id="WEP1_1" maxlength="26" /></td>
<td>
<select id="WEP1Select_1" name="WEP1Select_1">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="2" name="wep_default_key_1"/>
<span id="secureWEPKey2_1">Key</span>&nbsp;2 :
</td>
<td><input type="password" name="wep_key_2_1" id="WEP2_1" maxlength="26"/></td>
<td>
<select id="WEP2Select_1" name="WEP2Select_1">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="3" name="wep_default_key_1"/>
<span id="secureWEPKey3_1">Key</span>&nbsp;3 :
</td>
<td><input type="password" name="wep_key_3_1" id="WEP3_1" maxlength="26" /></td>
<td>
<select id="WEP3Select_1" name="WEP3Select_1">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="4" name="wep_default_key_1"/>
<span id="secureWEPKey4_1">Key</span>&nbsp;4 :
</td>
<td><input type="password" name="wep_key_4_1" id="WEP4_1" maxlength="26" /></td>
<td>
<select id="WEP4Select_1" name="WEP4Select_1">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr id="div_8021x_wep_1">
<td width="5%"></td>
<td id="secure8021XWEP_1">802.1x WEP:</td>
<td>
<input name="ieee8021x_wep_1" value="0" type="radio"><span id="secure1XWEPDisable_1">Disable</span> &nbsp;
<input name="ieee8021x_wep_1" value="1" type="radio"><span id="secure1XWEPEnable_1">Enable</span>
</td>
<td></td>
</tr>
</table>
</td></tr>
</table>
</div>

<div class="pagetext" id="page3" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>
<table width="600" cellspacing="2" cellpadding="2" border="0" align="center">
<tr>
<td width="5%"></td>
<td id="bSsid2">SSID</td>
<td td id="bSsidStr2" colspan="4"></td>
<td></td>
</tr>
<tr id="div_security_infra_mode_2" name="div_security_infra_mode_2">
<td width="5%"></td>
<td id="secureSecureMode_2">Mode:</td>
<td><select id="security_mode_2" name="security_mode_2" onchange="securityMode(2)" ></select>
</td>
<td></td>
</tr>
<tr id="div_security_shared_mode_2" name="div_security_shared_mode_2" style="visibility: hidden;">
<td width="5%"></td>
<td id="secureEncrypType_2">Encrypt Type:</td>
<td><select name="security_shared_mode_2" id="security_shared_mode_2" size="1" onchange="securityMode(2)">
<option value="WEP">WEP</option>
<option value="None" id="secureEncrypTypeNone_2">None</option></select>
</td>
<td></td>
</tr>

<!-- ---------------------  RADIUS Link  --------------------- -->
<tr>
<td></td>
<td colspan="3">
Set up&nbsp;<a href="#" onclick="radiusSetup(2);">RADIUS Server</a>&nbsp;if 802.1x is enabled.<b/>
</td>
</tr>

<!-- ---------------------  WPA Setup  --------------------- -->
<tr>
<td colspan="4" class="title" id="secreWPA_2">WPA:</td>
</tr>
<tr id="div_wpa_algorithms_2" name="div_wpa_algorithms_2">
<td width="5%"></td>
<td id="secureWPAAlgorithm_2">WPA Algorithms:</td>
<td>
<input name="cipher_2" value="0" type="radio">TKIP &nbsp;
<input name="cipher_2" value="1" type="radio">AES &nbsp;
<input name="cipher_2" value="2" type="radio">TKIP/AES &nbsp;
</td>
<td></td>
</tr>
<tr id="wpa_passphrase_2" name="wpa_passphrase_2">
<td width="5%"></td>
<td id="secureWPAPassPhrase_2">Pass Phrase:</td>
<td><input type="password" name="passphrase_2" id="passphrase_2" size="28" maxlength="64"></td>
<td></td>
</tr>
<tr id="wpa_key_renewal_interval_2" name="wpa_key_renewal_interval_2">
<td width="5%"></td>
<td id="secureWPAKeyRenewInterval_2">Key Renewal Interval:</td>
<td><input name="keyRenewalInterval_2" id="keyRenewalInterval_2" size="4" maxlength="4" value="3600"> seconds</td>
<td></td>
</tr>
<tr id="wpa_PMK_Cache_Period_2" name="wpa_PMK_Cache_Period_2" style="visibility: hidden; display: none;">
<td width="5%"></td>
<td id="secureWPAPMKCachePeriod_2">PMK Cache Period:</td>
<td><input name="PMKCachePeriod_2" id="PMKCachePeriod_2" size="4" maxlength="4"> minutes</td>
<td></td>
</tr>
<tr id="wpa_preAuthentication_2" name="wpa_preAuthentication_2" style="visibility: hidden; display: none;">
<td width="5%"></td>
<td id="secureWPAPreAuth_2">Pre-Authentication:</td>
<td>
<input name="PreAuthentication_2" value="0" type="radio"><span id="secureWPAPreAuthDisable_2">Disable &nbsp;</span>
<input name="PreAuthentication_2"  value="1" type="radio"><span id="secureWPAPreAuthEnable_2">Enable &nbsp;</span>
</td>
<td></td>
</tr>

<!-- ---------------------  WEP Setup  --------------------- -->
<tr>
<td colspan="4" class="title" id="secureWEP_2">WEP:</td>
</tr>

<tr>
<td width="5%"></td>
<td>
<input type="radio" value="1" name="wep_default_key_2"/>
<span id="secureWEPKey1_2">Key</span>&nbsp;1 :
</td>
<td><input type="password" name="wep_key_1_2" id="WEP1_2" maxlength="26" /></td>
<td>
<select id="WEP1Select_2" name="WEP1Select_2">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="2" name="wep_default_key_2"/>
<span id="secureWEPKey2_2">Key</span>&nbsp;2 :
</td>
<td><input type="password" name="wep_key_2_2" id="WEP2_2" maxlength="26"/></td>
<td>
<select id="WEP2Select_2" name="WEP2Select_2">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="3" name="wep_default_key_2"/>
<span id="secureWEPKey3_2">Key</span>&nbsp;3 :
</td>
<td><input type="password" name="wep_key_3_2" id="WEP3_2" maxlength="26" /></td>
<td>
<select id="WEP3Select_2" name="WEP3Select_2">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="4" name="wep_default_key_2"/>
<span id="secureWEPKey4_2">Key</span>&nbsp;4 :
</td>
<td><input type="password" name="wep_key_4_2" id="WEP4_2" maxlength="26" /></td>
<td>
<select id="WEP4Select_2" name="WEP4Select_2">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr id="div_8021x_wep_2">
<td width="5%"></td>
<td id="secure8021XWEP_2">802.1x WEP:</td>
<td>
<input name="ieee8021x_wep_2" value="0" type="radio"><span id="secure1XWEPDisable_2">Disable</span> &nbsp;
<input name="ieee8021x_wep_2" value="1" type="radio"><span id="secure1XWEPEnable_2">Enable</span>
</td>
<td></td>
</tr>
</table>
</td></tr>
</table>
</div>

<div class="pagetext" id="page4" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>
<table width="600" cellspacing="2" cellpadding="2" border="0" align="center">
<tr>
<td width="5%"></td>
<td id="bSsid3">SSID</td>
<td td id="bSsidStr3" colspan="4"></td>
<td></td>
</tr>
<tr id="div_security_infra_mode_3" name="div_security_infra_mode_3">
<td width="5%"></td>
<td id="secureSecureMode_3">Mode:</td>
<td><select id="security_mode_3" name="security_mode_3" onchange="securityMode(3)" ></select>
</td>
<td></td>
</tr>
<tr id="div_security_shared_mode_3" name="div_security_shared_mode_3" style="visibility: hidden;">
<td width="5%"></td>
<td id="secureEncrypType_3">Encrypt Type:</td>
<td><select name="security_shared_mode_3" id="security_shared_mode_3" size="1" onchange="securityMode(3)">
<option value="WEP">WEP</option>
<option value="None" id="secureEncrypTypeNone_3">None</option></select>
</td>
<td></td>
</tr>

<!-- ---------------------  RADIUS Link  --------------------- -->
<tr>
<td></td>
<td colspan="3">
Set up&nbsp;<a href="#" onclick="radiusSetup(3);">RADIUS Server</a>&nbsp;if 802.1x is enabled.<b/>
</td>
</tr>

<!-- ---------------------  WPA Setup  --------------------- -->
<tr>
<td colspan="4" class="title" id="secreWPA_3">WPA:</td>
</tr>
<tr id="div_wpa_algorithms_3" name="div_wpa_algorithms_3">
<td width="5%"></td>
<td id="secureWPAAlgorithm_3">WPA Algorithms:</td>
<td>
<input name="cipher_3" value="0" type="radio">TKIP &nbsp;
<input name="cipher_3" value="1" type="radio">AES &nbsp;
<input name="cipher_3" value="2" type="radio">TKIP/AES &nbsp;
</td>
<td></td>
</tr>
<tr id="wpa_passphrase_3" name="wpa_passphrase_3">
<td width="5%"></td>
<td id="secureWPAPassPhrase_3">Pass Phrase:</td>
<td><input type="password" name="passphrase_3" id="passphrase_3" size="28" maxlength="64"></td>
<td></td>
</tr>
<tr id="wpa_key_renewal_interval_3" name="wpa_key_renewal_interval_3">
<td width="5%"></td>
<td id="secureWPAKeyRenewInterval_3">Key Renewal Interval:</td>
<td><input name="keyRenewalInterval_3" id="keyRenewalInterval_3" size="4" maxlength="4" value="3600"> seconds</td>
<td></td>
</tr>
<tr id="wpa_PMK_Cache_Period_3" name="wpa_PMK_Cache_Period_3" style="visibility: hidden; display: none;">
<td width="5%"></td>
<td id="secureWPAPMKCachePeriod_3">PMK Cache Period:</td>
<td><input name="PMKCachePeriod_3" id="PMKCachePeriod_3" size="4" maxlength="4"> minutes</td>
<td></td>
</tr>
<tr id="wpa_preAuthentication_3" name="wpa_preAuthentication_3" style="visibility: hidden; display: none;">
<td width="5%"></td>
<td id="secureWPAPreAuth_3">Pre-Authentication:</td>
<td>
<input name="PreAuthentication_3" value="0" type="radio"><span id="secureWPAPreAuthDisable_3">Disable &nbsp;</span>
<input name="PreAuthentication_3"  value="1" type="radio"><span id="secureWPAPreAuthEnable_3">Enable &nbsp;</span>
</td>
<td></td>
</tr>

<!-- ---------------------  WEP Setup  --------------------- -->
<tr>
<td colspan="4" class="title" id="secureWEP_3">WEP:</td>
</tr>

<tr>
<td width="5%"></td>
<td>
<input type="radio" value="1" name="wep_default_key_3"/>
<span id="secureWEPKey1_3">Key</span>&nbsp;1 :
</td>
<td><input type="password" name="wep_key_1_3" id="WEP1_3" maxlength="26" /></td>
<td>
<select id="WEP1Select_3" name="WEP1Select_3">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="2" name="wep_default_key_3"/>
<span id="secureWEPKey2_3">Key</span>&nbsp;2 :
</td>
<td><input type="password" name="wep_key_2_3" id="WEP2_3" maxlength="26"/></td>
<td>
<select id="WEP2Select_3" name="WEP2Select_3">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="3" name="wep_default_key_3"/>
<span id="secureWEPKey3_3">Key</span>&nbsp;3 :
</td>
<td><input type="password" name="wep_key_3_3" id="WEP3_3" maxlength="26" /></td>
<td>
<select id="WEP3Select_3" name="WEP3Select_3">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr>
<td width="5%"></td>
<td>
<input type="radio" value="4" name="wep_default_key_3"/>
<span id="secureWEPKey4_3">Key</span>&nbsp;4 :
</td>
<td><input type="password" name="wep_key_4_3" id="WEP4_3" maxlength="26" /></td>
<td>
<select id="WEP4Select_3" name="WEP4Select_3">
<option value="1">ASCII</option>
<option value="0">Hex</option>
</select>
</td>
</tr>
<tr id="div_8021x_wep_3">
<td width="5%"></td>
<td id="secure8021XWEP_3">802.1x WEP:</td>
<td>
<input name="ieee8021x_wep_3" value="0" type="radio"><span id="secure1XWEPDisable_3">Disable</span> &nbsp;
<input name="ieee8021x_wep_3" value="1" type="radio"><span id="secure1XWEPEnable_3">Enable</span>
</td>
<td></td>
</tr>
</table>
</td></tr>
</table>
</div>

<br />
<table cellpadding="2" cellspacing="1" width="100%">
<tr align="center"><td>
<input type="hidden" name="RadiusServerIP_0" id="RadiusServerIP_0">
<input type="hidden" name="RadiusServerPort_0" id="RadiusServerPort_0">
<input type="hidden" name="RadiusServerSecret_0" id="RadiusServerSecret_0">
<input type="hidden" name="RadiusServerSessionTimeout_0" id="RadiusServerSessionTimeout_0">
<input type="hidden" name="RadiusServerIdleTimeout_0" id="RadiusServerIdleTimeout_0">
<input type="hidden" name="RadiusServerIP_1" id="RadiusServerIP_1">
<input type="hidden" name="RadiusServerPort_1" id="RadiusServerPort_1">
<input type="hidden" name="RadiusServerSecret_1" id="RadiusServerSecret_1">
<input type="hidden" name="RadiusServerSessionTimeout_1" id="RadiusServerSessionTimeout_1">
<input type="hidden" name="RadiusServerIdleTimeout_1" id="RadiusServerIdleTimeout_1">
<input type="hidden" name="RadiusServerIP_2" id="RadiusServerIP_2">
<input type="hidden" name="RadiusServerPort_2" id="RadiusServerPort_2">
<input type="hidden" name="RadiusServerSecret_2" id="RadiusServerSecret_2">
<input type="hidden" name="RadiusServerSessionTimeout_2" id="RadiusServerSessionTimeout_2">
<input type="hidden" name="RadiusServerIdleTimeout_2" id="RadiusServerIdleTimeout_2">
<input type="hidden" name="RadiusServerIP_3" id="RadiusServerIP_3">
<input type="hidden" name="RadiusServerPort_3" id="RadiusServerPort_3">
<input type="hidden" name="RadiusServerSecret_3" id="RadiusServerSecret_3">
<input type="hidden" name="RadiusServerSessionTimeout_3" id="RadiusServerSessionTimeout_3">
<input class="btnw" value="OK" id="secureApply" onclick="submit_apply()" type="button"> &nbsp; &nbsp;
<input class="btnw" value="Cancel" id="secureCancel" type="reset" onClick="window.location.reload()" >
</td></tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>