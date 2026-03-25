<html>
<head>
<title>Bandwidth Management</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/dtree/dhtml.js"></script>
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var ssid1 = '<% getCfgGeneral(1, "SSID1_3572"); %>';
var ssid2 = '<% getCfgGeneral(1, "SSID2_3572"); %>';
var ssid3 = '<% getCfgGeneral(1, "SSID3_3572"); %>';
var val = '<% getCfgGeneral(1, "BandwidthLimit_5g"); %>';

function enableChange()
{
var i;
for (i = 0; i < 3; i++) {
if (document.frm.enable_limit[i].checked) {
document.frm.auto[i].disabled = false;
} else {
document.frm.auto[i].disabled = true;
}
}
adjustChange();
}
function adjustChange()
{
var i;
for (i = 0; i < 3; i++) {
if (document.frm.auto[i].checked && document.frm.enable_limit[i].checked) {
showElmtById(document, "adj_u"+i);
showElmtById(document, "adj_d"+i);
} else {
hideElmtById(document, "adj_u"+i);
hideElmtById(document, "adj_d"+i);
}
}
}
function limitChange()
{
var i;
for (i = 0; i < 3; i++) {
if(getVleFromElmt(document.frm.u_limit[i], 0) == "custom") {
showElmtById(document, "u_limit_user"+i);
showElmtById(document, "bNoteUUnit"+i);
} else {
hideElmtById(document, "u_limit_user"+i);
hideElmtById(document, "bNoteUUnit"+i);
}
if(getVleFromElmt(document.frm.d_limit[i], 0) == "custom") {
showElmtById(document, "d_limit_user"+i);
showElmtById(document, "bNoteDUnit"+i);
} else {
hideElmtById(document, "d_limit_user"+i);
hideElmtById(document, "bNoteDUnit"+i);
}
if(getVleFromElmt(document.frm.adj_u_limit[i], 0) == "custom") {
showElmtById(document, "adj_u_limit_user"+i);
showElmtById(document, "adj_bNoteUUnit"+i);
} else {
hideElmtById(document, "adj_u_limit_user"+i);
hideElmtById(document, "adj_bNoteUUnit"+i);
}
if(getVleFromElmt(document.frm.adj_d_limit[i], 0) == "custom") {
showElmtById(document, "adj_d_limit_user"+i);
showElmtById(document, "adj_bNoteDUnit"+i);
} else {
hideElmtById(document, "adj_d_limit_user"+i);
hideElmtById(document, "adj_bNoteDUnit"+i);
}
}
}

function initTranslation()
{
var i;
var e = document.getElementById("bTitle");
e.innerHTML = _("parent wireless lan 5g")+" >> "+_("limit title");
for (i = 0; i < 3; i++) {
e = document.getElementById("bSubTitle"+i);
e.innerHTML = _("limit subtitle");
e = document.getElementById("bSsid"+i);
e.innerHTML = _("wireless ssid");
e = document.getElementById("bEnable"+i);
e.innerHTML = _("wireless enable");
e = document.getElementById("bUpload"+i);
e.innerHTML = _("limit upload");
e = document.getElementById("bDownload"+i);
e.innerHTML = _("limit download");
e = document.getElementById("bAuto"+i);
e.innerHTML = _("limit auto");
e = document.getElementById("bUUser"+i);
e.innerHTML = _("limit user");
e = document.getElementById("bDUser"+i);
e.innerHTML = _("limit user");
e = document.getElementById("bNoteUUnit"+i);
e.innerHTML = _("limit note unit");
e = document.getElementById("bNoteDUnit"+i);
e.innerHTML = _("limit note unit");
}

e = document.getElementById("bNote");
e.innerHTML = _("basic note");
e = document.getElementById("bNote1");
e.innerHTML = _("limit note1");
e = document.getElementById("bNote2");
e.innerHTML = _("limit note2");

e = document.getElementById("bApply");
e.value = _("wireless apply");
e = document.getElementById("bCancel");
e.value = _("wireless cancel");
}

function initValue()
{
var i;
initTranslation();
document.getElementById("bSsidStr0").innerHTML = ssid1;
document.getElementById("bSsidStr1").innerHTML = ssid2;
document.getElementById("bSsidStr2").innerHTML = ssid3;

var each = val.split(";");
if (each.length == 3) {
for (i = 0; i < 3; i++) {
var v = each[i].split(",");
if (v.length == 10) {
setVle2Elmt(document.frm.enable_limit[i], v[0], 0);
setVle2Elmt(document.frm.u_limit[i], v[1], 0);
setVle2Elmt(document.frm.u_limit_user[i], v[2], 0);
setVle2Elmt(document.frm.d_limit[i], v[3], 0);
setVle2Elmt(document.frm.d_limit_user[i], v[4], 0);
setVle2Elmt(document.frm.auto[i], v[5], 0);
setVle2Elmt(document.frm.adj_u_limit[i], v[6], 0);
setVle2Elmt(document.frm.adj_u_limit_user[i], v[7], 0);
setVle2Elmt(document.frm.adj_d_limit[i], v[8], 0);
setVle2Elmt(document.frm.adj_d_limit_user[i], v[9], 0);
}
}
}

limitChange();
dhtml.cycleTab("tab1");
enableChange();
}

function checkNum(str)
{
var end = str.charAt(str.length-1), base, num;

if (end >= '0' && end <= '9')
base = 1;
else if (end == 'k' || end == 'K') {
base = 1;
str = str.slice(0, -1)
} else if (end == 'm' || end == 'M') {
base = 1000;
str = str.slice(0, -1)
} else
return false;

num = parseInt(str, 10);
if (num.toString() != str)
return false;

num *= base;
if (num < 64 || num > 100000)
return false;

return num;
}

function CheckValue()
{
var i;
var str = "";
var temp, temp2, ulimit, dlimit, aulimit, adlimit;

for (i = 0; i < 3; i++) {
var enable = getVleFromElmt(document.frm.enable_limit[i], 0);
str += enable + ",";
temp = getVleFromElmt(document.frm.u_limit[i], 0);
temp2 =  getVleFromElmt(document.frm.u_limit_user[i], 0);
str += temp + ",";
if (temp ==  "custom") {
if (enable == "1") {
if ((ulimit = checkNum(temp2)) == false) {
alert(_("limit error"));
return false;
}
if (temp2.charAt(temp2.length-1) >= '0' && temp2.charAt(temp2.length-1) <= '9')
str += temp2 + "K,";
else
str += temp2 + ",";
} else
str += temp2 + ",";
} else {
ulimit = checkNum(temp);
str += "K,";
}
temp = getVleFromElmt(document.frm.d_limit[i], 0);
temp2 =  getVleFromElmt(document.frm.d_limit_user[i], 0);
str += temp + ",";
if (temp == "custom") {
if (enable == "1") {
if ((dlimit = checkNum(temp2)) == false) {
alert(_("limit error"));
return false;
}
if (temp2.charAt(temp2.length-1) >= '0' && temp2.charAt(temp2.length-1) <= '9')
str += temp2 + "K,";
else
str += temp2 + ",";
} else
str += temp2 + ",";
} else {
dlimit = checkNum(temp);
str += "K,";
}

enable = getVleFromElmt(document.frm.auto[i], 0);
str += enable + ",";
temp = getVleFromElmt(document.frm.adj_u_limit[i], 0);
temp2 =  getVleFromElmt(document.frm.adj_u_limit_user[i], 0);
str += temp + ",";
if (temp == "custom") {
if (enable == "1") {
if ((aulimit = checkNum(temp2)) == false) {
alert(_("limit error"));
return false;
}
if (temp2.charAt(temp2.length-1) >= '0' && temp2.charAt(temp2.length-1) <= '9')
str += temp2 + "K,";
else
str += temp2 + ",";
} else
str += temp2 + ",";
} else {
aulimit = checkNum(temp);
str += "K,";
}
temp = getVleFromElmt(document.frm.adj_d_limit[i], 0);
temp2 =  getVleFromElmt(document.frm.adj_d_limit_user[i], 0);
str += temp + ",";
if (temp == "custom") {
if (enable == "1") {
if ((adlimit = checkNum(temp2)) == false) {
alert(_("limit error"));
return false;
}
if (temp2.charAt(temp2.length-1) >= '0' && temp2.charAt(temp2.length-1) <= '9')
str += temp2 + "K";
else
str += temp2;
} else
str += temp2;
} else {
adlimit = checkNum(temp);
str += "K";
}
if (i < 2)
str += ";";
if ((enable == "1") && ulimit >= aulimit){
alert("In SSID"+(i+1)+", total upload bandwidth MUST larger than upload limit");
return false;
}
if ((enable == "1") && dlimit >= adlimit){
alert("In SSID"+(i+1)+", total download bandwidth MUST larger than download limit");
return false;
}
}

setVle2Elmt(document.frm.commit_value_5g, str, 0);
return true;
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="bTitle">Bandwidth Management</h1>
<hr size="1" />
<br />

<form method="post" name="frm" action="/goform/wirelessLimit_5g" onSubmit="return CheckValue()">

<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
<tr>
<td id="tab1" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 1</td>
<td id="tab2" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 2</td>
<td id="tab3" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 3</td>
<td width="40%" class="tabpadding"></td>
</tr>
</table>

<div class="pagetext" id="page1" style="visibility: visible; display: block;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="config">
<tr><td>

<table width="600" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td id="bSsid0" width="35%" style="text-indent: 10px">SSID</td>
<td id="bSsidStr0" width="65%" colspan="4">&nbsp;</td>
</tr>
<tr><td id="bSubTitle0" class="title" colspan="5">Per Station Bandwidth Limit</td>
</tr>
<tr><td id="bEnable0" style="text-indent:10px; font-weight:bold">Enable</td>
<td colspan="4"><input type="checkbox" name="enable_limit" value="0" onClick="enableChange()"></td>
</tr>
<tr><td id="bUpload0" style="text-indent: 10px">Upload Limit</td>
<td><select name="u_limit" size="1" onChange="limitChange()">
<option value="custom" id="bUUser0" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="u_limit_user" id="u_limit_user0" value="K" size="6" maxlength="8"></td>
<td>bps</td>
<td id="bNoteUUnit0">(Default unit : K)</td>
</tr>
<tr><td id="bDownload0" style="text-indent: 10px">Download Limit</td>
<td><select name="d_limit" size="1" onChange="limitChange()">
<option value="custom" id="bDUser0" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="d_limit_user" id="d_limit_user0" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="bNoteDUnit0">(Default unit : K)</td>
</tr>
<tr><td id="bAuto0" style="text-indent: 10px">Auto Adjustment</td>
<td colspan="2"><input type="checkbox" name="auto" value="0" onClick="adjustChange()" /></td>
</tr>
<tr id="adj_u0"><td id="adj_bUpload0" style="text-indent: 10px">Total Upload Bandwidth</td>
<td><select name="adj_u_limit" id="adj_u_limit0" size="1" onChange="limitChange()">
<option value="custom" id="adj_bUUser0" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="adj_u_limit_user" id="adj_u_limit_user0" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="adj_bNoteUUnit0">(Default unit : K)</td>
</tr>
<tr id="adj_d0"><td id="adj_bDownload0" style="text-indent: 10px">Total Download Bandwidth</td>
<td><select name="adj_d_limit" id="adj_d_limit0" size="1" onChange="limitChange()">
<option value="custom" id="adj_bDUser0" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="adj_d_limit_user" id="adj_d_limit_user0" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="adj_bNoteDUnit0">(Default unit : K)</td>
</tr>
</table>

</td></tr>
</table>
</div>

<div class="pagetext" id="page2" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>

<table width="600" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td id="bSsid1" width="35%" style="text-indent: 10px">SSID</td>
<td id="bSsidStr1" width="65%" colspan="4">&nbsp;</td>
</tr>
<tr><td id="bSubTitle1" class="title" colspan="5">Per Station Bandwidth Limit</td>
</tr>
<tr><td id="bEnable1" style="text-indent:10px; font-weight:bold">Enable</td>
<td colspan="4"><input type="checkbox" name="enable_limit" value="0" onClick="enableChange()"></td>
</tr>
<tr><td id="bUpload1" style="text-indent: 10px">Upload Limit</td>
<td><select name="u_limit" size="1" onChange="limitChange()">
<option value="custom" id="bUUser1" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="u_limit_user" id="u_limit_user1" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="bNoteUUnit1">(Default unit : K)</td>
</tr>
<tr><td id="bDownload1" style="text-indent: 10px">Download Limit</td>
<td><select name="d_limit" size="1" onChange="limitChange()">
<option value="custom" id="bDUser1" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="d_limit_user" id="d_limit_user1" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="bNoteDUnit1">(Default unit : K)</td>
</tr>
<tr><td id="bAuto1" style="text-indent: 10px">Auto Adjustment</td>
<td colspan="3"><input type="checkbox" name="auto" value="0" onClick="adjustChange()"/></td>
</tr>
<tr id="adj_u1"><td id="adj_bUpload1" style="text-indent: 10px">Total Upload Bandwidth</td>
<td><select name="adj_u_limit"  id="adj_u_limit1" size="1" onChange="limitChange()">
<option value="custom" id="adj_bUUser1" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="adj_u_limit_user" id="adj_u_limit_user1" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="adj_bNoteUUnit1">(Default unit : K)</td>
</tr>
<tr id="adj_d1"><td id="adj_bDownload1" style="text-indent: 10px">Total Download Bandwidth</td>
<td><select name="adj_d_limit" id="adj_d_limit1" size="1" onChange="limitChange()">
<option value="custom" id="adj_bDUser1" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="adj_d_limit_user" id="adj_d_limit_user1" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="adj_bNoteDUnit1">(Default unit : K)</td>
</tr>
</table>

</td></tr>
</table>
</div>

<div class="pagetext" id="page3" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>

<table width="600" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td id="bSsid2" width="35%" style="text-indent: 10px">SSID</td>
<td id="bSsidStr2" width="65%" colspan="4">&nbsp;</td>
</tr>
<tr><td id="bSubTitle2" class="title" colspan="5">Per Station Bandwidth Limit</td>
</tr>
<tr><td id="bEnable2" style="text-indent:10px; font-weight:bold">Enable</td>
<td colspan="4"><input type="checkbox" name="enable_limit" value="0" onClick="enableChange()"></td>
</tr>
<tr><td id="bUpload2" style="text-indent: 10px">Upload Limit</td>
<td><select name="u_limit" size="1" onChange="limitChange()">
<option value="custom" id="bUUser2" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="u_limit_user" id="u_limit_user2" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="bNoteUUnit2">(Default unit : K)</td>
</tr>
<tr><td id="bDownload2" style="text-indent: 10px">Download Limit</td>
<td><select name="d_limit" size="1" onChange="limitChange()">
<option value="custom" id="bDUser2" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="d_limit_user" id="d_limit_user2" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="bNoteDUnit2">(Default unit : K)</td>
</tr>
<tr><td id="bAuto2" style="text-indent: 10px">Auto Adjustment</td>
<td colspan="2"><input type="checkbox" name="auto" value="0" onClick="adjustChange()"/></td>
</tr>
<tr id="adj_u2"><td id="adj_bUpload2" style="text-indent: 10px">Total Upload Bandwidth</td>
<td><select name="adj_u_limit" id="adj_u_limit2" size="1" onChange="limitChange()">
<option value="custom" id="adj_bUUser2" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="adj_u_limit_user" id="adj_u_limit_user2" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="adj_bNoteUUnit2">(Default unit : K)</td>
</tr>
<tr id="adj_d2"><td id="adj_bDownload2" style="text-indent: 10px">Total Download Bandwidth</td>
<td><select name="adj_d_limit" id="adj_d_limit2" size="1" onChange="limitChange()">
<option value="custom" id="adj_bDUser2" selected="selected">User defined</option>
<option value="64k">64K</option>
<option value="128k">128K</option>
<option value="256k">256K</option>
<option value="512k">512K</option>
<option value="1M">1M</option>
<option value="2M">2M</option>
<option value="4M">4M</option>
<option value="8M">8M</option>
<option value="10M">10M</option>
<option value="20M">20M</option>
<option value="32M">32M</option>
<option value="50M">50M</option></select>
</td>
<td><input type="text" name="adj_d_limit_user" id="adj_d_limit_user2" value="K" size="6" maxlength="8" style="display:inline"></td>
<td>bps</td>
<td id="adj_bNoteDUnit2">(Default unit : K)</td>
</tr>
</table>

</td></tr>
</table>
</div>

<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td>
<table cellspacing="0" cellpadding="0" border="0">
<tr><td width="8%" class="title" id="bNote">Note :</td>
<td id="bNote1">1. Download : Traffic going to any station. Upload : Traffic being sent from a wireless station.</td>
</tr><tr><td>&nbsp;</td>
<td id="bNote2">2. Allow auto adjustment could make the best utilization of available bandwidth.</td>
</tr>
</table>
</td></tr>
</table>

<br />
<table cellpadding="2" cellspacing="1" width="100%">
<tr align="center"><td>
<input type="hidden" name="commit_value_5g">
<input type="submit" class="btnw" value="OK" id="bApply"> &nbsp; &nbsp;
<input type="reset" class="btnw" value="Cancel" id="bCancel" onClick="window.location.reload()">
</td></tr>
</table>

</form>

</td></tr>
</table>

</body>
</html>
