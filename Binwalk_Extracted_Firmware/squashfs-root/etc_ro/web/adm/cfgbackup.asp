<html>
<head>
<title>Configuration Backup</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

var scfgNameLeading = "AP800_";

function restoreCheck()
{
if (document.CfgRestoration.filename.value == "") {
return false;
}
var cfg = document.CfgRestoration.filename.value;
cfg = cfg.replace(/\s+$/, "");

var tmp = scfgNameLeading + "\\w*\\.cfg$";
var reg = new RegExp(tmp, "i");
var result = cfg.search(reg);
if (result < 0) {
if (!confirm("Warning: Config filename mismatch, restore anymore ?")) {
return false;
}
}

return true;
}

function initTranslation()
{
var e = document.getElementById("cfgTitle");
e.innerHTML = _("parent system maintenance")+" >> "+_("cfgbackup title");

e = document.getElementById("cfgSetTitle");
e.innerHTML = _("cfgbackup set title");

e = document.getElementById("cfgRestoreTitle");
e.innerHTML = _("cfgbackup restore title");
e = document.getElementById("cfgRestoreLocation");
e.innerHTML = _("cfgbackup restore location");
e = document.getElementById("cfgRestoreBtnLable");
e.innerHTML = _("cfgbackup restore buttonlable");
e = document.getElementById("cfgRestoreBtn");
e.value = _("cfgbackup restore button");

e = document.getElementById("cfgBackupTitle");
e.innerHTML = _("cfgbackup backup title");
e = document.getElementById("cfgBackupBtnLable");
e.innerHTML = _("cfgbackup backup buttonlable");
e = document.getElementById("cfgBackupBtn");
e.value = _("cfgbackup backup button");
}

function PageInit()
{
initTranslation();
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
</script>

</head>
<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="cfgTitle">Configuration Backup</h1>
<hr size="1" />
<br />

<h2 id="cfgSetTitle" class="title">Configuration Backup / Restoration</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td>

<!-- ================= Restoration ================= -->
<h2 id="cfgRestoreTitle">Restoration</h2>
<form method="post" name="CfgRestoration" action="/cgi-bin/upload_settings.cgi" enctype="multipart/form-data">
<table width="500" cellpadding="2" cellspacing="1" border="0" align="center">
<tr><td id="cfgRestoreLocation">Select a configuration file.</td></tr>
<tr>
<td><input type="file" name="filename" size="30" maxlength="256"></td>
</tr>
<tr><td id="cfgRestoreBtnLable">Click Restore to upload the file.</td></tr>
<tr>
<td><input type=submit class="btnw" value="Restore" id="cfgRestoreBtn" onclick="return restoreCheck()"></td>
</tr>
</table>
</form>
<hr size="1"/>
</td></tr>

<tr><td>

<!-- ================= Backup ================= -->
<h2 id="cfgBackupTitle">Backup</h2>
<form method="post" name="CfgBackup" action="/goform/ExportSettings">
<table width="500" cellpadding="2" cellspacing="1" border="0" align="center">
<tr><td id="cfgBackupBtnLable">Click Backup to download current running configurations as a file.</td></tr>
<tr>
<td><input type="button" class="btnw" value="Backup" name="Export" id="cfgBackupBtn" onclick="onClkBackup()">
<input type="hidden" name="realtime" value=""></td>
</tr>
</table>
</form>

</td></tr>

</table>

</td></tr>
</table>

</body>
</html>
