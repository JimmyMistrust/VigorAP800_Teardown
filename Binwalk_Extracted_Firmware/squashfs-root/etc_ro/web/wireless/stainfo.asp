<html>
<head>
<title>Station List</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var MBSSID_MAX = 4;
var ACCESSPOLICYLIST_MAX = 64;
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

var SSIDIdx;
var StationList = "<% getWlanStaInfo(); %>";
var aryStationList = StationList.split(";");
var aryStationMac = new Array();
var aryStationSSIDIdx = new Array();
var aryStationSSID = new Array();
var aryStationSSIDfull = new Array();
var aryStationAuthMode = new Array();
var aryStationEncrypt = new Array();
var aryStationTxRate = new Array();
var aryStationRxRate = new Array();

function onTxtMac(i, idx)
{
if(idx==0)setTimeout( "adjHex(document.station_list.txt0Mac1)", 10 );
if(idx==1)setTimeout( "adjHex(document.station_list.txt0Mac2)", 10 );
if(idx==2)setTimeout( "adjHex(document.station_list.txt0Mac3)", 10 );
if(idx==3)setTimeout( "adjHex(document.station_list.txt0Mac4)", 10 );
if(idx==4)setTimeout( "adjHex(document.station_list.txt0Mac5)", 10 );
if(idx==5)setTimeout( "adjHex(document.station_list.txt0Mac6, 1)", 10 );
}

// Show MAC Address when selected
function showMac()
{
var i = document.station_list.sltShowMac.selectedIndex;
if (i < 0)
return;

var j;
var mac = aryStationMac[i];
var macArray = mac.split(":");

for (j = 1; j <= macArray.length; j++)
eval("document.station_list.txt0Mac"+j).value = macArray[j-1];

SSIDIdx = aryStationSSIDIdx[i];
}

// Check if MAC Address is filled completely
function checkMac()
{
var j;
var mac_address = "";

for (j = 1; j <= 6; j++) {
if (eval("document.station_list.txt0Mac"+j).value == "") {
alert("Please fill MAC Address!");
eval("document.station_list.txt0Mac"+j).focus();
eval("document.station_list.txt0Mac"+j).select();
return false;
} else {
mac_address += eval("document.station_list.txt0Mac"+j).value;
if (j != 6)
mac_address += ":";
}
}

return mac_address;
}

function strTypeFormat(str, len, type)
{
var i, left, right;
var left_str = "";

str = str.toString();
var l = checkLength(str);
if (type == 0) {
for (i=l; i<len; i++)
str += "\u00a0";
} else if (type == 1) {
left = parseInt((len-l)/2);
right = len - l - left;
for(i=0; i<left; i++)
left_str += "\u00a0";
str = left_str + str;
for(i=left+l; i<len; i++)
str += "\u00a0";
}

return str;
}

// Show MAC Addresses in select box
function showOnSltMacList()
{
var i;
var space = "\u00a0\u00a0\u00a0\u00a0\u00a0";

for (i = 0; i < document.station_list.sltShowMac.options.length; i++)
document.station_list.sltShowMac.options[i] = null;

for (i = 0; i < aryStationMac.length; i++){
if(aryStationSSID[i].length > 10){
aryStationSSIDfull[i] = aryStationSSID[i];
aryStationSSID[i] = aryStationSSID[i].substring(0,10) + "...";
}
document.station_list.sltShowMac.options[i] = new Option(strTypeFormat(aryStationMac[i], 18, 0) +
strTypeFormat(aryStationSSID[i], 17, 1) +
strTypeFormat(aryStationAuthMode[i], 15, 1) +
strTypeFormat(aryStationEncrypt[i], 15, 1) +
strTypeFormat(aryStationTxRate[i], 15, 0) +
strTypeFormat(aryStationRxRate[i], 15, 0));
document.station_list.sltShowMac.options[i].title = aryStationSSIDfull[i];
}
}

// Add station's mac address to access list
function addSTA()
{

var len0 = aryMacaddress_0.length;
var len1 = aryMacaddress_1.length;
var len2 = aryMacaddress_2.length;
var len3 = aryMacaddress_3.length;
var mac, i, j;

if ((mac = checkMac()) == false)
return false;

// verify if this mac address has been added to access list
for (i = 0; i < MBSSID_MAX; i++) {
for (j = 0; j < eval("len"+i); j++) {
if (eval("aryMacaddress_"+i)[j] == mac)
break;
}
if (j == eval("len"+i) && eval("len"+i) < ACCESSPOLICYLIST_MAX)
eval("aryMacaddress_"+i)[j] = mac;
}

var frmSubmit = document.frmSubmit;

frmSubmit.method = "post";
frmSubmit.action = "/goform/wirelessStaionToAccess";

for (i = 0; i < MBSSID_MAX; i++) {
frmSubmit[i].name = "acs_list_"+i;
frmSubmit[i].value = "";

for (j = 0; j < eval("aryMacaddress_"+i).length; j++) {
if (eval("aryMacaddress_"+i)[j] != "") {
if (j != eval("aryMacaddress_"+i).length - 1)
frmSubmit[i].value += eval("aryMacaddress_"+i)[j] + ";";
else
frmSubmit[i].value += eval("aryMacaddress_"+i)[j];
}
}
}

frmSubmit.submit();
}

function initTranslation()
{
var e = document.getElementById("stalistTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("stalist title");

e = document.getElementById("stalistWirelessNet");
e.innerHTML = _("stalist title");
e = document.getElementById("stalistMacAddr");
e.innerHTML = _("stalist macaddr");
e = document.getElementById("stalistSSID");
e.innerHTML = _("stalist ssid");
e = document.getElementById("stalistAuth");
e.innerHTML = _("stalist auth");
e = document.getElementById("stalistEncrypt");
e.innerHTML = _("stalist encrypt");
e = document.getElementById("stalistRefresh");
e.value = _("stalist refresh");
e = document.getElementById("stalistStr1");
e.innerHTML = _("stalist str1");
e = document.getElementById("stalistStr2");
e.innerHTML = _("stalist str2");
e = document.getElementById("stalistStr3");
e.innerHTML = _("stalist str3");
e = document.getElementById("stalistAdd");
e.value = _("stalist add");
e = document.getElementById("lClose");
e.value = _("wireless close");
}

function PageInit()
{
if (!window.opener) {
showElmtByClass(document, "tr", "nowiz");
} else {
showElmtByClass(document, "tr", "wiz");
}
var i;

for (i = 0; i < MBSSID_MAX; i++) {
for (j = 0; j < eval("AcsCtrlListAry_"+i).length; j++) {
if (eval("AcsCtrlListAry_"+i)[j] != "") {
eval("aryMacaddress_"+i)[j] = eval("AcsCtrlListAry_"+i)[j];
//alert(eval("aryMacaddress_"+i)[j]);
}
}
}

for (i = 0; i < aryStationList.length; i++) {
if (aryStationList[i] != "") {
aryStationMac[i] = aryStationList[i].split("|")[0];
//alert(aryStationMac[i]);
aryStationSSIDIdx[i] = aryStationList[i].split("|")[1];
aryStationSSID[i] = aryStationList[i].split("|")[2];
aryStationAuthMode[i] = aryStationList[i].split("|")[3];
aryStationEncrypt[i] = aryStationList[i].split("|")[4];
aryStationRxRate[i] = aryStationList[i].split("|")[5];	//G48975: Tx of AP = Rx of station    -- Sleer Huang
aryStationTxRate[i] = aryStationList[i].split("|")[6];	//G48975: Rx of AP = Tx of station    -- Sleer Huang
}
}

showOnSltMacList();

initTranslation();
}
</script>
</head>

<body onLoad="PageInit()">
<table class="body">
<tr><td>
<h1 id="stalistTitle">Station List</h1>
<hr size="1" />
<br />

<h2 id="stalistWirelessNet" class="title">Station List</h2>
<form name="station_list">
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td>
<table width="650" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td width="130" id="stalistMacAddr">MAC Address</td>
<td align="center" width="120" id="stalistSSID">SSID</td>
<td align="center" width="100" id="stalistAuth">Auth</td>
<td align="center" width="100" id="stalistEncrypt">Encrypt</td>
<td align="left" width="100" id="txRate">Tx Rate(Kbps)</td>
<td align="left" width="100" id="rxRate">Rx Rate(Kbps)</td>
</tr>
<tr>
<td colspan="6">
<select name="sltShowMac" style="width: 650px; height: 150px; font-family: Courier New;" size="7" onchange="showMac()">
</select>
</td>
</tr>
<tr align="center"><td colspan="6"><input type="button" id="stalistRefresh" value="Refresh" onclick="window.location.reload()" /></td></tr>
<tr class="nowiz" style="display:none"><td colspan="6"><hr size="1" /></td></tr>
<tr class="nowiz" style="display:none">
<td colspan="6" class="title">
<span id="stalistStr1">Add to</span>&nbsp;
<a href="/wireless/access.asp" id="stalistStr2">Access Control</a> :<br /><br /></td>
</tr>
<tr class="nowiz" style="display:none">
<td colspan="6">
<span id="stalistStr3">Client's MAC Address</span>&nbsp;:&nbsp;
<input type="text" maxlength="2" name="txt0Mac1" onkeypress="onTxtMac(0, 0)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac2" onkeypress="onTxtMac(0, 1)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac3" onkeypress="onTxtMac(0, 2)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac4" onkeypress="onTxtMac(0, 3)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac5" onkeypress="onTxtMac(0, 4)" class="hex" size="2"/>&nbsp; :
<input type="text" maxlength="2" name="txt0Mac6" onkeypress="onTxtMac(0, 5)" class="hex" size="2"/>
</td>
</tr>
</table>
</td></tr>
</table>

<br />
<table cellpadding="2" cellspacing="1" width="100%">
<tr align="center" class="nowiz" style="display:none">
<td><input type="hidden" name="addToAccess" value="0" />
<input type="button" id="stalistAdd" value="Add" class="btnw" onclick="return addSTA()" /></td>
</tr>
<tr align="center" class="wiz" style="display:none">
<td><input type="button" id="lClose" value="Close" class="btnw" onclick="window.close();" /></td>
</tr>
</table>
</form>

<form name="frmSubmit">
<input type="hidden" name="acs_list_0" />
<input type="hidden" name="acs_list_1" />
<input type="hidden" name="acs_list_2" />
<input type="hidden" name="acs_list_3" />
</form>

</td></tr>
</table>

</body>
</html>