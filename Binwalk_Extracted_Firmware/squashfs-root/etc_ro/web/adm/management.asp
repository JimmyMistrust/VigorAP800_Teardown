<html>
<head>
<title>Management</title>
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">

<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
var f;


function AdmFormCheck()
{
if(f.device_name.value =='') {
alert("Wrong Device name!");
return false;
}

if( isStrNum(f.http_port.value) == false || parseInt(f.http_port.value)==0 || parseInt(f.http_port.value)>65535 ){
alert("Wrong HTTP port!");
return false;
}

if( isStrNum(f.https_port.value) == false || parseInt(f.https_port.value)==0 || parseInt(f.https_port.value)>65535 ){
alert("Wrong HTTPS port!");
return false;
}

if('<% getCfgGeneral(1, "HTTP_ServerPort"); %>'!=f.http_port.value||'<% getCfgGeneral(1, "HTTPS_ServerPort"); %>'!=f.https_port.value){
if (!confirm(_("msg lan connection lost"))) {
return false;
}
}
f.submit();
return true;
}

function initTranslation()
{
var e = document.getElementById("MgtTitle");
e.innerHTML = _("parent system maintenance")+" >> "+_("Management");

e = document.getElementById("DeviceName");
e.innerHTML = _("Device Name");
e = document.getElementById("Name");
e.innerHTML = _("Name");

e = document.getElementById("manMgtPortSet");
e.innerHTML = _("Management Port Setup");
e = document.getElementById("HTTPPort");
e.innerHTML = _("HTTP port");
e = document.getElementById("HTTPSPort");
e.innerHTML = _("HTTPS port");
}

function initValue()
{
f = document.Mgt;
initTranslation();
}
</script>

</head>
<body onload="initValue()">
<table class="body">
<tr><td>
<h1 id="MgtTitle">Management</h1>
<hr size="1" />
<br />

<form name="Mgt" method="POST" action="/goform/setMgt">

<h2 id="DeviceName" class="title">Device Name</h2>

<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" id="Name">Name</td>
<td><input type=text size=16 maxlength=15 name=device_name  id="device_name" value="<% getCfgGeneral(1, "Device_Name"); %>"></td>
</tr>
</table>

<h2 id="manMgtPortSet" class="title">Management Port Setup</h2>

<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" id="HTTPPort">HTTP Port</td>
<td><input type=text size=10 maxlength=5 name=http_port  id="http_port" value="<% getCfgGeneral(1, "HTTP_ServerPort"); %>"></td>
</tr>
<tr>
<td class="head" id="HTTPSPort">HTTPS Port</td>
<td><input type=text size=10 maxlength=5 name=https_port  id="https_port" value="<% getCfgGeneral(1, "HTTPS_ServerPort"); %>"></td>
</tr>
</table>
<br />

<br>
<table align=center>
<tr>
<td>
<input class="btnw" type="button" value="OK" id="manMgtApply" onClick="return AdmFormCheck()">
<input type="reset"  class="btnw" value="Cancel" id="manMgtCancel" onClick="window.location.reload()">
</td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>
