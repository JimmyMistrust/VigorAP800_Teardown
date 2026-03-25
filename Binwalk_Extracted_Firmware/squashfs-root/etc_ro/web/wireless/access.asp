<html>
<head>
<title>Wireless Access Control</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/dtree/dhtml.js"></script>
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var ssid1 = '<% getCfgGeneral(1, "SSID1"); %>';
var ssid2 = '<% getCfgGeneral(1, "SSID2"); %>';
var ssid3 = '<% getCfgGeneral(1, "SSID3"); %>';
var ssid4 = '<% getCfgGeneral(1, "SSID4"); %>';
var MBSSID_MAX = 4;
var ACCESSPOLICYLIST_MAX = 256;
var AccessPolicy = [ <% getCfgZero(1, "AccessPolicy0"); %>,
<% getCfgZero(1, "AccessPolicy1"); %>,
<% getCfgZero(1, "AccessPolicy2"); %>,
<% getCfgZero(1, "AccessPolicy3"); %> ];
var AccessControlList = [ "<% getAccessPolicy(0); %>",
"<% getAccessPolicy(1); %>",
"<% getAccessPolicy(2); %>",
"<% getAccessPolicy(3); %>" ];
var AcsCtrlListAry_0 = AccessControlList[0].split(";");
var AcsCtrlListAry_1 = AccessControlList[1].split(";");
var AcsCtrlListAry_2 = AccessControlList[2].split(";");
var AcsCtrlListAry_3 = AccessControlList[3].split(";");
var aryMacaddress_0 = new Array();
var aryMacaddress_1 = new Array();
var aryMacaddress_2 = new Array();
var aryMacaddress_3 = new Array();

function getIdxOfForm( _elmt )
{
var elmt = _elmt;
if ( elmt.type )
{
for ( var i=0; i<elmt.form.length; i++ )
{
if(elmt.name!="" && elmt.form[i].name!=""){
if( elmt.name == elmt.form[i].name) return i;
}else{
if( elmt == elmt.form[i]) return i;
}
}
}
return false;
}

// Adjust MAC Address
function adjHex(_elmt, _vle)
{
var elmt = _elmt;
var vle = _vle;
if (elmt != null && elmt.value != null) {
if (!isNaN( parseInt(elmt.value, 16))) {
if ((elmt.value.indexOf( "0" ) == 0 && elmt.value.length == 2 &&
parseInt(elmt.value, 16) > 0 ) || elmt.value == "00" ) {
elmt.value = "0"+parseInt(elmt.value, 16).toString(16).toUpperCase();
} else {
elmt.value = parseInt(elmt.value, 16).toString(16).toUpperCase();
}
if ((vle != 1) && (elmt.value.length == 2)) {
elmt.form[getIdxOfForm( elmt )+1].focus();
elmt.form[getIdxOfForm( elmt )+1].select();
}
} else {
elmt.value = "";
}
}
}

function onTxtMac(i, idx)
{
if(idx==0)setTimeout( "adjHex(document.access_form.txt"+i+"Mac1)", 10 );
if(idx==1)setTimeout( "adjHex(document.access_form.txt"+i+"Mac2)", 10 );
if(idx==2)setTimeout( "adjHex(document.access_form.txt"+i+"Mac3)", 10 );
if(idx==3)setTimeout( "adjHex(document.access_form.txt"+i+"Mac4)", 10 );
if(idx==4)setTimeout( "adjHex(document.access_form.txt"+i+"Mac5)", 10 );
if(idx==5)setTimeout( "adjHex(document.access_form.txt"+i+"Mac6, 1)", 10 );
}

// Show MAC Address when selected
function showMac(idx)
{
var i = eval("document.access_form.sltShowMac"+idx).selectedIndex;
if (i < 0)
return;

var j;
var mac = eval("aryMacaddress_"+idx)[i];
var macArray = mac.split(":");

for (j = 1; j <= macArray.length; j++)
eval("document.access_form.txt"+idx+"Mac"+j).value = macArray[j-1];
}

// Check if MAC Address is filled completely
function checkMac(idx)
{
var j;
var mac_address = "";

for (j = 1; j <= 6; j++) {
if (eval("document.access_form.txt"+idx+"Mac"+j).value == "") {
alert("Please fill MAC Address!");
eval("document.access_form.txt"+idx+"Mac"+j).focus();
eval("document.access_form.txt"+idx+"Mac"+j).select();
return false;
} else {
mac_address += eval("document.access_form.txt"+idx+"Mac"+j).value;
if (j != 6)
mac_address += ":";
}
}

return mac_address;
}

// Show MAC Addresses in select box
function showOnSltMacList(idx)
{
var i;
var space = "\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0";
var space1 = "\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0";
var space2 = "\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0";

for (i = 0; i < eval("document.access_form.sltShowMac"+idx).options.length; i++)
eval("document.access_form.sltShowMac"+idx).options[i] = null;

if (eval("aryMacaddress_"+idx) == null)
return;

for (i = 0; i < eval("aryMacaddress_"+idx).length; i++) {
if((i+1) < 10)
var index = space + (i+1);
else if ((i+1) >=10 && (i+1) < 100)
var index = space1 + (i+1);
else
var index = space2 + (i+1);
eval("document.access_form.sltShowMac"+idx).options[i] = new Option(
index + space + space + space + eval("aryMacaddress_"+idx)[i]);
}
}

function onLoadInit()
{
var i, j;

for (i = 0; i < MBSSID_MAX; i++) {
document.getElementById("apselect_"+i).selectedIndex = AccessPolicy[i];

for (j = 0; j < eval("AcsCtrlListAry_"+i).length; j++) {
if (eval("AcsCtrlListAry_"+i)[j] != "") {
eval("aryMacaddress_"+i)[j] = eval("AcsCtrlListAry_"+i)[j];
//alert(eval("aryMacaddress_"+i)[j]);
}
}

showOnSltMacList(i);
}
}

function onClkBtnAdd(idx)
{
var len = 0;
var mac, i;

for (i = 0; i < MBSSID_MAX; i++) {
len += eval("aryMacaddress_"+i).length;
}

//alert(len);
if (len >= ACCESSPOLICYLIST_MAX){
alert("Setting full! Already set 256 MAC Address Filters!");
return false;
}

if ((mac = checkMac(idx)) == false)
return false;

len = eval("aryMacaddress_"+idx).length;
for (i = 0; i < len; i++) {
if (eval("aryMacaddress_"+idx)[i] == mac) {
alert("The MAC Address already exists!")
return false;
}
}
eval("aryMacaddress_"+idx)[len] = mac;

onClkBtnCcl(idx);
showOnSltMacList(idx);
}

function onClkBtnEdt(idx)
{
var mac, j;
var i = eval("document.access_form.sltShowMac"+idx).selectedIndex;
var len = eval("aryMacaddress_"+idx).length;

if (i < 0)
return false;

if ((mac = checkMac(idx)) == false)
return false;

if (eval("aryMacaddress_"+idx)[i] == mac)
return false;

for (j = 0; j < len; j++) {
if (eval("aryMacaddress_"+idx)[j] == mac) {
alert("The MAC Address already exists!")
return false;
}
}
eval("aryMacaddress_"+idx)[i] = mac;

onClkBtnCcl(idx);
eval("document.access_form.sltShowMac"+idx).selectedIndex = -1;
showOnSltMacList(idx);
}

function onClkBtnRmv(idx)
{
var j;
var i = eval("document.access_form.sltShowMac"+idx).selectedIndex ;

if ( i != -1 ) {
for (i = 0, j = 0; i < eval("document.access_form.sltShowMac"+idx).options.length; i++, j++) {
if (eval("document.access_form.sltShowMac"+idx).options[i].selected == true) {
eval("aryMacaddress_"+ idx + "= (aryMacaddress_" + idx + ").slice(0, j).concat((aryMacaddress_" + idx + ").slice(j+1))");
j--;
}
}
showOnSltMacList(idx);
}
onClkBtnCcl(idx);
}

function onClkBtnCcl(idx)
{
var j;

for (j = 1; j <= 6; j++)
eval("document.access_form.txt"+idx+"Mac"+j).value = "";
}

function submit_apply()
{
var frmSubmit = document.frmSubmit;
var i;

frmSubmit.method = "post";
frmSubmit.action = "/goform/wirelessAccessPolicy";

frmSubmit[0].name = "acs_policy_0";
frmSubmit[0].value = document.getElementById("apselect_0").value;

frmSubmit[1].name = "acs_policy_1";
frmSubmit[1].value = document.getElementById("apselect_1").value;

frmSubmit[2].name = "acs_policy_2";
frmSubmit[2].value = document.getElementById("apselect_2").value;

frmSubmit[3].name = "acs_policy_3";
frmSubmit[3].value = document.getElementById("apselect_3").value;

frmSubmit[4].name = "acs_list_0";
frmSubmit[4].value = "";
for (i = 0; i < aryMacaddress_0.length; i++) {
if (aryMacaddress_0[i] != "") {
if (i != aryMacaddress_0.length - 1)
frmSubmit[4].value += aryMacaddress_0[i] + ";";
else
frmSubmit[4].value += aryMacaddress_0[i];
}
}

frmSubmit[5].name = "acs_list_1";
frmSubmit[5].value = "";
for (i = 0; i < aryMacaddress_1.length; i++) {
if (aryMacaddress_1[i] != "") {
if (i != aryMacaddress_1.length - 1)
frmSubmit[5].value += aryMacaddress_1[i] + ";";
else
frmSubmit[5].value += aryMacaddress_1[i];
}
}

frmSubmit[6].name = "acs_list_2";
frmSubmit[6].value = "";
for (i = 0; i < aryMacaddress_2.length; i++) {
if (aryMacaddress_2[i] != "") {
if (i != aryMacaddress_2.length - 1)
frmSubmit[6].value += aryMacaddress_2[i] + ";";
else
frmSubmit[6].value += aryMacaddress_2[i];
}
}

frmSubmit[7].name = "acs_list_3";
frmSubmit[7].value = "";
for (i = 0; i < aryMacaddress_3.length; i++) {
if (aryMacaddress_3[i] != "") {
if (i != aryMacaddress_3.length - 1)
frmSubmit[7].value += aryMacaddress_3[i] + ";";
else
frmSubmit[7].value += aryMacaddress_3[i];
}
}

frmSubmit.submit();
}

function onClkBackup()
{
var now = new Date();
var yy, mm, dd, date;
yy = now.getFullYear().toString();
mm = (now.getMonth() + 1).toString();
dd = now.getDate().toString();
if(mm.length == 1)mm = "0" + mm;
if(dd.length == 1)dd = "0" + dd;
date = yy + mm + dd;
document.CfgBackup.realtime.value = date;

document.CfgBackup.submit();
}

function restoreCheck()
{
var scfgNameLeading = "AP800_";
if (document.CfgRestoration.filename.value == "") {
return false;
}
var cfg = document.CfgRestoration.filename.value;
cfg = cfg.replace(/\s+$/, "");

var tmp = scfgNameLeading + "acl_" + "\\w*\\.cfg$";
var reg = new RegExp(tmp, "i");
var result = cfg.search(reg);
if (result < 0) {
alert("Warning: Config filename mismatch!");
return false;
}

return true;
}

function initTranslation()
{
var e = document.getElementById("acsTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("access title");
document.getElementById("bSsidStr0").innerHTML = ssid1;
document.getElementById("bSsidStr1").innerHTML = ssid2;
document.getElementById("bSsidStr2").innerHTML = ssid3;
document.getElementById("bSsidStr3").innerHTML = ssid4;
for (var i = 0; i < MBSSID_MAX; i++) {
e = document.getElementById("bSsid"+i);
e.innerHTML = _("wireless ssid1");
e = eval("document.getElementById('acs_policy"+i+"')");
e.innerHTML = _("access policy");
e = eval("document.getElementById('acs_disable"+i+"')");
e.innerHTML = _("access disable");
e = eval("document.getElementById('acs_active"+i+"')");
e.innerHTML = _("access active");
e = eval("document.getElementById('acs_block"+i+"')");
e.innerHTML = _("access block");
e = eval("document.getElementById('acs_macfilter"+i+"')");
e.innerHTML = _("access macfilter");
e = eval("document.getElementById('acs_index"+i+"')");
e.innerHTML = _("access index");
e = eval("document.getElementById('acs_macaddress"+i+"')");
e.innerHTML = _("access macaddress");
e = eval("document.getElementById('acs_climac"+i+"')");
e.innerHTML = _("access climac");
e = eval("document.getElementById('acs_limitentry"+i+"')");
e.innerHTML = _("access limitentry");
e = eval("document.getElementById('btnAdd"+i+"')");
e.value = _("wireless add");
e = eval("document.getElementById('btnRmv"+i+"')");
e.value = _("wireless del");
e = eval("document.getElementById('btnEdt"+i+"')");
e.value = _("wireless edit");
e = eval("document.getElementById('btnCcl"+i+"')");
e.value = _("wireless cancel");
}
e = document.getElementById("acsApply");
e.value = _("wireless apply");
var e = document.getElementById("acsCancel");
e.value = _("wireless cancel");
}

function initAll()
{
initTranslation();

dhtml.cycleTab("tab1");
onLoadInit();
}
</script>
</head>

<body onload="initAll()">
<table class="body">
<tr><td>
<h1 id="acsTitle">Access Control</h1>
<hr size="1" />
<br />

<form name="access_form">
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
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td>
<table width="300" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td id="bSsid0">SSID:</td>
<td id="bSsidStr0"></td>
</tr>
<tr>
<td id="acs_policy0">Policy:</td>
<td><select size="1" id="apselect_0" name="apselect_0">
<option value="0" id="acs_disable0">Disable</option>
<option value="1" id="acs_active0">Activate MAC address filter</option>
<option value="2" id="acs_block0">Blocked MAC address filter</option></select>
</td>
</tr>
</table>
<hr size="1"/>
<table width="450" cellspacing="0" cellpadding="2" border="0" align="center">
<tr align="center">
<td colspan="2" class="title" id="acs_macfilter0">MAC Address Filter</td>
</tr>
<tr align="center">
<td width="30%" id="acs_index0">Index</td>
<td id="acs_macaddress0">MAC Address</td>
</tr>
<tr align="center">
<td colspan="2">
<select name="sltShowMac0" style="width: 450px; height: 150px; font-family: Courier New;" size="7" onchange="showMac(0)">
</select>
</td>
</tr>
<tr align="center">
<td colspan="2">
<span id="acs_climac0">Client's MAC Address</span>&nbsp;:
<input type="text" maxlength="2" name="txt0Mac1" onkeypress="onTxtMac(0, 0)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac2" onkeypress="onTxtMac(0, 1)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac3" onkeypress="onTxtMac(0, 2)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac4" onkeypress="onTxtMac(0, 3)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac5" onkeypress="onTxtMac(0, 4)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac6" onkeypress="onTxtMac(0, 5)" class="hex" size="2"/>
</td>
</tr>
<tr align="center">
<td colspan="2">
<input type="button" name="btnAdd1" id="btnAdd0" value="Add" class="btnw" onclick="onClkBtnAdd(0)"/>&nbsp;
<input type="button" name="btnRmv1" id="btnRmv0" value="Delete" class="btnw" onclick="onClkBtnRmv(0)"/>&nbsp;
<input type="button" name="btnEdt1" id="btnEdt0" value="Edit" class="btnw" onclick="onClkBtnEdt(0)"/>&nbsp;
<input type="button" name="btnCcl1" id="btnCcl0" value="Cancel" class="btnw" onclick="onClkBtnCcl(0)"/>&nbsp;<span id="acs_limitentry0">Limit:256 entries</span>
</td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</div>

<div class="pagetext" id="page2" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td>
<table width="300" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td id="bSsid1" >SSID:</td>
<td id="bSsidStr1"></td>
</tr>
<tr>
<td id="acs_policy1">Policy:</td>
<td><select size="1" id="apselect_1" name="apselect_1">
<option value="0" id="acs_disable1">Disable</option>
<option value="1" id="acs_active1">Activate MAC address filter</option>
<option value="2" id="acs_block1">Blocked MAC address filter</option></select>
</td>
</tr>
</table>
<hr size="1"/>
<table width="450" cellspacing="0" cellpadding="2" border="0" align="center">
<tr align="center">
<td colspan="2" class="title" id="acs_macfilter1">MAC Address Filter</td>
</tr>
<tr align="center">
<td width="30%" id="acs_index1">Index</td>
<td id="acs_macaddress1">MAC Address</td>
</tr>
<tr align="center">
<td colspan="2">
<select name="sltShowMac1" style="width: 450px; height: 150px; font-family: Courier New;" size="7" onchange="showMac(1)">
</select>
</td>
</tr>
<tr align="center">
<td colspan="2">
<span id="acs_climac1">Client's MAC Address</span>&nbsp;:
<input type="text" maxlength="2" name="txt1Mac1" onkeypress="onTxtMac(1, 0)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt1Mac2" onkeypress="onTxtMac(1, 1)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt1Mac3" onkeypress="onTxtMac(1, 2)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt1Mac4" onkeypress="onTxtMac(1, 3)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt1Mac5" onkeypress="onTxtMac(1, 4)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt1Mac6" onkeypress="onTxtMac(1, 5)" class="hex" size="2"/>
</td>
</tr>
<tr align="center">
<td colspan="2">
<input type="button" name="btnAdd1" id="btnAdd1" value="Add" class="btnw" onclick="onClkBtnAdd(1)"/>&nbsp;
<input type="button" name="btnRmv1" id="btnRmv1" value="Delete" class="btnw" onclick="onClkBtnRmv(1)"/>&nbsp;
<input type="button" name="btnEdt1" id="btnEdt1" value="Edit" class="btnw" onclick="onClkBtnEdt(1)"/>&nbsp;
<input type="button" name="btnCcl1" id="btnCcl1" value="Cancel" class="btnw" onclick="onClkBtnCcl(1)"/>&nbsp;<span id="acs_limitentry1">Limit:256 entries</span>
</td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</div>

<div class="pagetext" id="page3" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td>
<table width="300" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td id="bSsid2" >SSID:</td>
<td id="bSsidStr2"></td>
</tr>
<tr>
<td id="acs_policy2">Policy:</td>
<td><select size="1" id="apselect_2" name="apselect_2">
<option value="0" id="acs_disable2">Disable</option>
<option value="1" id="acs_active2">Activate MAC address filter</option>
<option value="2" id="acs_block2">Blocked MAC address filter</option></select>
</td>
</tr>
</table>
<hr size="1"/>
<table width="450" cellspacing="0" cellpadding="2" border="0" align="center">
<tr align="center">
<td colspan="2" class="title" id="acs_macfilter2">MAC Address Filter</td>
</tr>
<tr align="center">
<td width="30%" id="acs_index2">Index</td>
<td id="acs_macaddress2">MAC Address</td>
</tr>
<tr align="center">
<td colspan="2">
<select name="sltShowMac2" style="width: 450px; height: 150px; font-family: Courier New;" size="7" onchange="showMac(2)">
</select>
</td>
</tr>
<tr align="center">
<td colspan="2">
<span id="acs_climac2">Client's MAC Address</span>&nbsp;:
<input type="text" maxlength="2" name="txt2Mac1" onkeypress="onTxtMac(2, 0)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt2Mac2" onkeypress="onTxtMac(2, 1)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt2Mac3" onkeypress="onTxtMac(2, 2)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt2Mac4" onkeypress="onTxtMac(2, 3)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt2Mac5" onkeypress="onTxtMac(2, 4)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt2Mac6" onkeypress="onTxtMac(2, 5)" class="hex" size="2"/>
</td>
</tr>
<tr align="center">
<td colspan="2">
<input type="button" name="btnAdd1" id="btnAdd2" value="Add" class="btnw" onclick="onClkBtnAdd(2)"/>&nbsp;
<input type="button" name="btnRmv1" id="btnRmv2" value="Delete" class="btnw" onclick="onClkBtnRmv(2)"/>&nbsp;
<input type="button" name="btnEdt1" id="btnEdt2" value="Edit" class="btnw" onclick="onClkBtnEdt(2)"/>&nbsp;
<input type="button" name="btnCcl1" id="btnCcl2" value="Cancel" class="btnw" onclick="onClkBtnCcl(2)"/>&nbsp;<span id="acs_limitentry2">Limit:256 entries</span>
</td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</div>

<div class="pagetext" id="page4" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td>
<table width="300" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td id="bSsid3">SSID:</td>
<td id="bSsidStr3"></td>
</tr>
<tr>
<td id="acs_policy3">Policy:</td>
<td><select size="1" id="apselect_3" name="apselect_3">
<option value="0" id="acs_disable3">Disable</option>
<option value="1" id="acs_active3">Activate MAC address filter</option>
<option value="2" id="acs_block3">Blocked MAC address filter</option></select>
</td>
</tr>
</table>
<hr size="1"/>
<table width="450" cellspacing="0" cellpadding="2" border="0" align="center">
<tr align="center">
<td colspan="2" class="title" id="acs_macfilter3">MAC Address Filter</td>
</tr>
<tr align="center">
<td width="30%" id="acs_index3">Index</td>
<td id="acs_macaddress3">MAC Address</td>
</tr>
<tr align="center">
<td colspan="2">
<select name="sltShowMac3" style="width: 450px; height: 150px; font-family: Courier New;" size="7" onchange="showMac(3)">
</select>
</td>
</tr>
<tr align="center">
<td colspan="2">
<span id="acs_climac3">Client's MAC Address</span>&nbsp;:
<input type="text" maxlength="2" name="txt3Mac1" onkeypress="onTxtMac(3, 0)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt3Mac2" onkeypress="onTxtMac(3, 1)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt3Mac3" onkeypress="onTxtMac(3, 2)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt3Mac4" onkeypress="onTxtMac(3, 3)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt3Mac5" onkeypress="onTxtMac(3, 4)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt3Mac6" onkeypress="onTxtMac(3, 5)" class="hex" size="2"/>
</td>
</tr>
<tr align="center">
<td colspan="2">
<input type="button" name="btnAdd1" id="btnAdd3" value="Add" class="btnw" onclick="onClkBtnAdd(3)"/>&nbsp;
<input type="button" name="btnRmv1" id="btnRmv3" value="Delete" class="btnw" onclick="onClkBtnRmv(3)"/>&nbsp;
<input type="button" name="btnEdt1" id="btnEdt3" value="Edit" class="btnw" onclick="onClkBtnEdt(3)"/>&nbsp;
<input type="button" name="btnCcl1" id="btnCcl3" value="Cancel" class="btnw" onclick="onClkBtnCcl(3)"/>&nbsp;<span id="acs_limitentry3">Limit:256 entries</span>
</td>
</tr>
</table>
</td></tr>
</table>
</td></tr>
</table>
</div>

<br />
<table cellpadding="2" cellspacing="1" width="100%">
<tr align="center"><td>
<input type="button" value="OK" class="btnw" id="acsApply" onclick="submit_apply()" /> &nbsp; &nbsp;
<input type="reset" id="acsCancel" onclick="window.location.reload()" value="Cancel" class="btnw" />
</td></tr>
</table>
</form>

<form name="frmSubmit">
<input type="hidden" name="acs_policy_0" />
<input type="hidden" name="acs_policy_1" />
<input type="hidden" name="acs_policy_2" />
<input type="hidden" name="acs_policy_3" />
<input type="hidden" name="acs_list_0" />
<input type="hidden" name="acs_list_1" />
<input type="hidden" name="acs_list_2" />
<input type="hidden" name="acs_list_3" />
</form>

<br />
<table width="100%" cellpadding="2" cellspacing="0" border=1>
<tr><td>

<form method="post" name="CfgBackup" action="/goform/ExportSettings">
<table width="100%">
<tr><td>Backup ACL Cfg :
<input type="button" class="btnw" value="Backup" name="Export" id="cfgBackupBtn" onclick="onClkBackup()">
<input type="hidden" name="realtime" value="">
<input type="hidden" name="backuptype" value="acl">
</td>
</tr>
</table>
</form>
</td>

<td>
<form method="post" name="CfgRestoration" action="/cgi-bin/upload_cfg.cgi" enctype="multipart/form-data">
<table width="100%">
<tr><td>Upload From File:
<input type="file" name="filename" size="30" maxlength="256">
<input type=submit class="btnw" value="Restore" id="cfgRestoreBtn" onclick="return restoreCheck()">
</td>
</tr>
</table>
</form>

</td></tr>
</table>

</td></tr>
</table>

</body>
</html>
