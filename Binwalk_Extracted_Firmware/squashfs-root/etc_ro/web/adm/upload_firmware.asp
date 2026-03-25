<html>
<head>
<title>Firmware Upgrade</title>
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
/*position: absolute;*/
text-align: center;
color: #FFFFFF;
margin-top: 20px;
}
-->
</style>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

var _singleton = 0;
function uploadFirmwareCheck()
{
if(_singleton)
return false;
var fwname = document.UploadFirmware.filename.value
if(fwname == ""){
alert("Firmware Upgrade: Please specify a file.");
return false;
}
var fname = fwname.split("\\");
fname = fname[fname.length-1].toUpperCase();
if(fname.search(/^AP800_/) == -1 || fname.search(/.ALL$/) == -1) {
alert("Firmware File name is invalid, Please specify a file.");
return false;
}

//document.UploadFirmware.UploadFirmwareSubmit.disabled = true;
//document.UploadFirmware.filename.disabled = true;

document.getElementById("fw_loading").style.display = "";
document.getElementById("fw_upload").style.display = "none";
parent.menu.setUnderFirmwareUpload(1);
_singleton = 1;
document.UploadFirmware.submit();
document.UploadFirmware.UploadFirmwareSubmit.disabled = true;
document.UploadFirmware.filename.disabled = true;

return true;
}

function initTranslation()
{
var e = document.getElementById("uploadTitle");
e.innerHTML = _("parent system maintenance")+" >> "+_("upload title");

e = document.getElementById("uploadFW");
e.innerHTML = _("upload firmware");
e = document.getElementById("uploadFWLocation");
e.innerHTML = _("upload firmware location");
e = document.getElementById("uploadFWTip");
e.innerHTML = _("upload firmware tip");
e = document.getElementById("uploadFWStatus");
e.innerHTML = _("upload firmware status");

e = document.getElementById("uploadFWApply");
e.value = _("upload button");
}

function pageInit() {
initTranslation();

document.UploadFirmware.UploadFirmwareSubmit.disabled = false;
document.getElementById("fw_loading").style.display = "none";
document.getElementById("loading").style.display = "none";
}
</script>
</head>

<body onLoad="pageInit()">
<table class="body">
<tr><td>
<h1 id="uploadTitle">Firmware Upgrade</h1>
<hr size="1" />
<br />

<!-- ----------------- Upload firmware Settings ----------------- -->
<form method="post" name="UploadFirmware" action="/cgi-bin/upload.cgi" enctype="multipart/form-data">
<div>
<h2 id="uploadFW" class="title">Firmware Update</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr id="fw_upload">
<td>
<table width="620" cellpadding="2" cellspacing="1" border="0" align="center">
<tr>
<td id="uploadFWLocation">Select a firmware file.</td>
</tr>
<tr>
<td><input name="filename" size="60" maxlength="256" type="file"> </td>
</tr>
<tr>
<td><span id="uploadFWTip">Click Upgrade to upload the file.</span>&nbsp;
<input value="Upgrade" class="btnw" id="uploadFWApply" name="UploadFirmwareSubmit" type="button" onClick="return uploadFirmwareCheck();">
</td>
</tr>
</table>
</td>
</tr>
<tr id="fw_loading" style="display:none">
<td>
<table width="620" cellpadding="4" cellspacing="2" border="0" align="center">
<tr>
<td id="uploadFWStatus" align="center" class="red">Firmware Upgrade is in progress... It must NOT be interrupted!</td>
</tr>
<tr><td align="center"><img src="/graphics/wait.gif"></td></tr>
</table>
</td>
</tr>
</table>
</div>
</form>

<script type="text/javascript">
document.write('<div id="loading" style="display: none;"><br>Uploading firmware <br><br> Please be patient and don\'t remove usb device if it presented...</div>');
</script>
</td></tr>
</table>

</body>
</html>