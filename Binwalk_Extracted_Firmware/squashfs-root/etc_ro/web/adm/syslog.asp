<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>System Log</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<style type="text/css">
body {text-align:left}
</style>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" Content="No-cach">
<meta http-equiv="Expires" Content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/dtree/ajax.js"></script>
<script type="text/javascript" language="JavaScript">
Butterlate.setTextDomain("admin");

function alertContents(req)
{
uploadLogField(req.responseText);
}

function uploadLogField(str)
{
if(str == "-1")
document.SubmitClearLog.syslog.value =
"Not support.\n(Busybox->\n  System Logging Utilitie ->\n    syslogd\n    Circular Buffer\n    logread";
else
document.SubmitClearLog.syslog.value = str;
}

function updateLog()
{
loadXMLDoc("/goform/syslog", alertContents);
}

function initTranslation()
{
var e = document.getElementById("syslogTitle");
e.innerHTML = _("parent diagonostics")+" >> "+_("syslog title");

e = document.getElementById("syslogSysLog");
e.innerHTML = _("syslog system log");
e = document.getElementById("syslogSysLogClear");
e.innerHTML = _("syslog clear");
e = document.getElementById("syslogSysLogRefresh");
e.innerHTML = _("syslog refresh");
e = document.getElementById("syslogLineWrap");
e.innerHTML = _("syslog line wrap");
}

function pageInit()
{
initTranslation();
updateLog();
}

function clearlogclick()
{
//	document.SubmitClearLog.syslog.value = "";
document.SubmitClearLog.submit();
return true;
}

function refreshlogclick()
{
updateLog();
return true;
}

function onLineWrap()
{
var hsyslog = document.getElementById("syslog");
if(document.getElementById("lineWrap").checked) {
hsyslog.setAttribute("wrap", "virtual");
hsyslog.style.overflowX = "hidden";
} else {
hsyslog.setAttribute("wrap", "off");
hsyslog.style.overflowX = "auto";
}
}
</script>
</head>

<body onLoad="pageInit()">
<table class="body">
<tr><td>
<h1 id="syslogTitle">System Log</h1>
<hr size="1" />
<br />

<!-- ================= System log ================= -->
<div>
<form method="post" name ="SubmitClearLog" action="/goform/clearlog">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td><h2 id="syslogSysLog">System Log Information</h2></td>
<td align="right" class="red">|&nbsp;&nbsp;
<a id="syslogSysLogClear" href="#" onClick="javascript:clearlogclick();return false;">Clear</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a id="syslogSysLogRefresh" href="#" onClick="javascript:refreshlogclick();return false;">Refresh</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<input type="checkbox" id="lineWrap" onClick="onLineWrap()"><label for="lineWrap">&nbsp;<span id="syslogLineWrap" style="font-family:Arial, Helvetica, sans-serif; font-weight:bold; color:#903">Line wrap</span></label>&nbsp;&nbsp;|
</td>
</tr>
</table>
<table width="100%" cellpadding="2" cellspacing="1">
<tr>
<td><textarea style="font-size:9pt;width:100%;" name="syslog" id="syslog" cols="84" rows="16" wrap="off" readonly="1"></textarea></td>
</tr>
</table>
</form>
</div>

</td></tr>
</table>

</body>
</html>
