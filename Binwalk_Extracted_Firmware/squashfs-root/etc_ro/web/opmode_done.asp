<html>
<head>
<title>Operation Mode Setup Done</title>
<link rel="stylesheet" href="style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("main");

function initTranslation()
{

}

function initValue()
{
var opmode = "<% getCfgGeneral(1, "OperationMode"); %>";

initTranslation();

if (opmode == "0") {
document.getElementById("wl_basic").innerHTML = "Wireless LAN >> General Setup";
document.getElementById("wl_basic").href = "wireless/basic.asp";
} else if (opmode == "2") {
document.getElementById("wl_basic").innerHTML = "Wireless LAN >> Site Survey";
document.getElementById("wl_basic").href = "station/site_survey.asp";
} else if (opmode == "3") {
document.getElementById("wl_basic").innerHTML = "Wireless LAN >> General Setup";
document.getElementById("wl_basic").href = "wireless/basic.asp";
document.getElementById("wl_repeater").style.display = "";
}
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<br /><br />

<table width = "100%" class="config" cellpadding = "2" cellspacing = "1">
<tr><td>
<table width="600" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td><br /></td></tr>
<tr><td class="title">Note :</td></tr>
<tr>
<td style="text-indent: 15px; ">After Modifying the operation mode, go to other web to configure detailed settings.</td>
</tr>
<tr><td><br /><br /></td></tr>
<tr>
<td class="title"> &gt;&gt; <a id="wl_basic" href="wireless/basic.asp">Wireless LAN >> General Setup</a></td>
</td>
</tr>
<tr id="wl_repeater" style="display: none">
<td class="title"> &gt;&gt; <a id="" href="wireless/apcli.asp">Wireless LAN >> Universal Repeater</a></td>
</td>
</tr>
<tr><td><br /></td></tr>
</table>
</td></tr>
</table>

</td></tr>
</table>
</body>
</html>
