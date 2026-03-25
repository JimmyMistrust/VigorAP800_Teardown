<html>
<head>
<title>CAM General Setup</title>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="lTitle"></h1>
<hr size="1" /><br />
<form method=post name="camCfg" action="/goform/setcamset" onSubmit="return CheckValue()">

<h2 id="cSetup" class="title">Vigor AP Management</h2>
<table width="700" cellpadding="2" cellspacing="0" border="1">
<tr><td>
<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr><td colspan="2" style="text-indent: 10px">
<input id="lApmcEn" type="checkbox" name="lanApmcEn" value="1" onchange="onChgApmEn()"> <span>Enable AP Management</span></td>
</tr>
<tr>
<td colspan="2" style="text-indent: 10px">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="lanApmcAutoProvEn" value="1">
<span id="lApmcAutoProvEn">Enable Auto Provision</span></td>
</tr>
</table>
</td></tr>
</table>

<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type=submit class="btnw" value="OK" id="lApply">&nbsp;&nbsp;
<input type=reset  class="btnw" value="Cancel" id="lCancel" onClick="window.location.reload()">
<input type=hidden name=hidden value=1>
</td>
</tr>
</table>
</form>
</td></tr>
</table>
</body>
</html>
<script language="JavaScript" type="text/javascript">
var f = document.camCfg;
Butterlate.setTextDomain("internet");

function initTranslation()
{
var e = document.getElementById("lTitle");
e.innerHTML = _("parent cam")+" >> "+_("lan title");

e = document.getElementById("cSetup");
e.innerHTML = _("cam setup");
e = document.getElementById("lApmcEn");
e.innerHTML = _("lan apmc enable");
e = document.getElementById("lApmcAutoProvEn");
e.innerHTML = _("lan apmc autoprov enable");

e = document.getElementById("lApply");
e.value = _("inet apply");
e = document.getElementById("lCancel");
e.value = _("inet cancel");
}

function initValue()
{
var apmc_en = <% getCfgZero(1, "apmc_en"); %>;
if (apmc_en == 1)
f.lanApmcEn.checked = true;
else
f.lanApmcEn.checked = false;
var apmc_autoprov_en = "<% getCfgGeneral(1, "apmc_auto_provision_en"); %>";
if (apmc_autoprov_en == "0")
f.lanApmcAutoProvEn.checked = false;
else
f.lanApmcAutoProvEn.checked = true;
onChgApmEn();
initTranslation();
}

function onChgApmEn(){
if(f.lanApmcEn.checked == true){
f.lanApmcAutoProvEn.disabled = false;
}else{
f.lanApmcAutoProvEn.disabled = true;
}
}

function CheckValue()
{
f.lanApmcAutoProvEn.disabled = false;
return true;
}
</script>
