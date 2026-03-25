<html>
<head>
<title>Speed Test</title>
<link rel="stylesheet" href="style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/dtree/ajax.js"></script>
</head>

<body onLoad="pageInit()">
<table class="body">
<tr><td>
<h1 id="iTitle">Speed Test</h1>
<hr size="1" />
<br />

<h2 id="speedtitle" class="title">Speed Test</h2>

<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td align=left>Welcome to VigorAP800 Speed Test.<br /><br />
This test allows you to find out the best place for VigorAP800. You can execute the speed test at different places of the building and select the best location for it. The performance test result is only for your reference.<br />
</td></tr>
<tr><td align=center><input type="button" class="btnw" value="Start" name="Export" id="cfgBackupBtn" onclick="onClkBackup()">
<input type="hidden" name="realtime" value="1"></td>
</tr>
<tr><td id="download" align=center style="display:none">
Download......        <img src="/graphics/wait.gif">
</td></tr>
<tr><td id="upload" align=center style="display:none">
Upload......        <img src="/graphics/wait.gif">
</td></tr>
</table>

<table width="100%" cellpadding="2" cellspacing="1" border="0" align=center>
<tr><td><b>Note</b> : Speed test could not work with chrome browser.</td>
</tr>
</table>

</td></tr>
</table>

<form method="post" name="CfgBackup" action="/cgi-bin/upload_speed.cgi" onclick="getcurtime()">
<input type=hidden name=filename value="">
</form>
</body>
</html>
<script>
Butterlate.setTextDomain("admin");
var time;
var starttime, endtime;
var unit = "Kbps";

function processUpdate(req, ref)
{
var val = req.responseText.split("|");

len = val[0].length/1024;//kbps
rate = len*8/val[1];//kps/s

if (parseInt(rate/1024) > 1) {
unit = "Mbps";
rate = Math.round((rate/1024)*100)/100;
}
document.CfgBackup.filename.value = val[0];

parent.filelen = len;
parent.drate = rate;
parent.dunit = unit;

setTimeout("getcurtime();", 1000);
}

function onClkBackup()
{
document.getElementById("download").style.display = "";
loadXMLDoc("/goform/speedtest", processUpdate);
}

function getcurtime()
{
time          = new Date();
parent.uStarttime  = time.getTime();

document.getElementById("upload").style.display = "";
document.getElementById("download").style.display = "none";
document.CfgBackup.submit();
}

function initTranslation()
{
var e = document.getElementById("iTitle");
e.innerHTML = _("parent diagonostics")+" >> "+_("speed test");

e = document.getElementById("speedtitle");
e.innerHTML = _("speed test");
//	e = document.getElementById("uploadFW");
//	e.innerHTML = _("upload firmware");
//	e = document.getElementById("uploadFWLocation");
//	e.innerHTML = _("upload firmware location");
//	e = document.getElementById("uploadFWTip");
//	e.innerHTML = _("upload firmware tip");
//	e = document.getElementById("uploadFWStatus");
//	e.innerHTML = _("upload firmware status");
//
//	e = document.getElementById("uploadFWApply");
//	e.value = _("upload button");
}

function pageInit() {
initTranslation();
}
</script>