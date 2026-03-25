<html>
<head>
<title>Reboot System</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<style type="text/css">
<!--
#loading {
width: 100%;
height: 80px;
background-color: #d43039;
text-align: center;
color: #FFFFFF;
}
-->
</style>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

var timerID;
var currentReq;

/* Initial an XMLHttpRquest object */
function initXMLHTTP() {
var req = false;

if (window.XMLHttpRequest) { // Mozilla, Safari,...
try {
req = new XMLHttpRequest();
} catch (e) {
req = false;
}
} else if (window.ActiveXObject) { // IE
try {
req = new ActiveXObject("Msxml2.XMLHTTP");
} catch(e) {
try {
req = new ActiveXObject("Microsoft.XMLHTTP");
} catch(e) {
req = false;
}
}
}

return req;
}

function makeRequest(url, content)
{
var req = initXMLHTTP();

if (!req) {
alert("Cannot create an XMLHTTP instance");
return false;
}

req.onreadystatechange = function () {
try {
if (req.readyState == 4) {
if (req.status && req.status == 200) {
startReboot("Rebooting system...", 20 * 1000);
} else {
var status;
try {
status = req.statusText;
}
catch(e) {
status = "Unknown error";
}
updateStatus(status);
}
}
}
catch(e) {
updateStatus("Request timed out");
}
}
req.open('POST', url, true);
req.send(content);
}

function makeReboot(url, content)
{
var req = initXMLHTTP();

if (!req) {
alert("Cannot create an XMLHTTP instance");
return false;
}

req.onreadystatechange = function () {
//clearTimeout(timerID);
try {
if (req.readyState == 4) {
if (req.status && req.status == 200) {
doCompleted();
} else {
var status;
try {
status = req.statusText;
}
catch(e) {
status = "Unknown error";
}
//doRetry(status);
currentReq.abort();
pollTimeout(status);
}
}
}
catch(e) {
//doRetry("Request timed out");
currentReq.abort();
pollTimeout("Request timed out");
}
}
currentReq = req;
req.open('POST', url, true);
req.send(content);
//timerID = setTimeout('pollTimeout()', 2 * 1000);
}

function updateStatus(message)
{
var loading = document.getElementById("loading");

loading.innerHTML = "<br><br>"+message+"<br><br>";
}

function getCompleted()
{
top.location.href = top.location.href;
}

function pollTimeout(msg)
{
//currentReq.abort();
doRetry("Rebooting system...");
}

function doRetry(mesg)
{
startReboot(mesg, 20 * 1000);
}

function doCompleted()
{
updateStatus("Completed!");
timerID = setTimeout('getCompleted()', 2 * 1000);
}

function startReboot(message, when)
{
updateStatus(message);
timerID = setTimeout('makeReboot("/adm/sys.asp", "n/a")', when);
}

function reboot()
{
var sReboot, frm;

if (document.getElementsByName("sReboot")[0].checked == true)
sReboot = 0;
else if (document.getElementsByName("sReboot")[1].checked == true)
sReboot = 1;
else
return;

switch(sReboot) {
case 0:
if (true == confirm(currentMsg)) {
//document.getElementById("loading").style.display="";
document.getElementsByName("sReboot")[0].disabled = true;
document.getElementsByName("sReboot")[1].disabled = true;
document.getElementById("rebootApply").disabled = true;
parent.menu.setUnderFirmwareUpload(1);
frm = document.frmsubmit;
frm.action = "/goform/RebootSystem";
frm.submit();
//makeRequest("/goform/RebootSystem", "n/a");
}
break;
case 1:
if (true == confirm(defaultMsg)) {
//document.getElementById("loading").style.display="";
document.getElementsByName("sReboot")[0].disabled = true;
document.getElementsByName("sReboot")[1].disabled = true;
document.getElementById("rebootApply").disabled = true;
parent.menu.setUnderFirmwareUpload(1);
frm = document.frmsubmit;
frm.action = "/goform/LoadDefaultSettings";
frm.submit();
//makeRequest("/goform/LoadDefaultSettings", "n/a");
}
break;
default:
break;
}

return;
}

function initTranslation()
{
var e = document.getElementById("rebootTitle");
e.innerHTML = _("parent system maintenance")+" >> "+_("reboot title");

e = document.getElementById("rebootSystem");
e.innerHTML = _("reboot system");
e = document.getElementById("rebootConfirm");
e.innerHTML = _("reboot confirm");
e = document.getElementById("rebootCurrent");
e.innerHTML = _("reboot current");
e = document.getElementById("rebootDefault");
e.innerHTML = _("reboot default");

e = document.getElementById("rebootApply");
e.value = _("admin apply");

currentMsg = _("reboot current confirm");
defaultMsg = _("reboot default confirm");
}

function pageInit()
{
initTranslation();
document.getElementById("loading").style.display="none";
}
</script>
</head>

<body onload="pageInit()">
<table class="body">
<tr><td>
<h1 id="rebootTitle">Reboot System</h1>
<hr size="1" />
<br />

<form name="frmsubmit" method="post">
<div>
<h2 id="rebootSystem" class="title">Reboot System</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td>
<table align="center" border="0" cellspacing="0" width="380" cellpadding="8">
<tr><td>
<br><h2 id="rebootConfirm">Do You want to reboot your AP ?</h2><br>
<input type="radio" value="Current" name="sReboot" checked>
<span id="rebootCurrent"> Using current configuration</span><br>
<input type="radio" value="Default" name="sReboot">
<span id="rebootDefault"> Using factory default configuration</span><br><br>
</td></tr>
</table>
</td></tr>
</table>
</div>

<br />
<table width="100%" cellspacing="1" cellpadding="2" border="0">
<tr align="center"><td>
<input type="hidden" value="1" name="rebootflag">
<input type="button" class="btnw" value="OK" id="rebootApply" onclick="reboot();">
</td></tr>
</table>
</form>

<br />
<div id="loading" style="display: none;">
<br><br>Waiting, please stand by...<br><br>
</div>

</td></tr>
</table>

</body>
</html>
