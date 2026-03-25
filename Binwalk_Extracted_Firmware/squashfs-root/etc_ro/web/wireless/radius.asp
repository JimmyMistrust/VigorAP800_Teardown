<html>
<head>
<title>RADIUS Server Setup</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

function check_radius()
{
var MBSSID = parseInt(window.opener.RADIUS_SSID);
var use = document.getElementById("useInterRS").checked;

if (!use && !document.security_form.RadiusServerIP.value.length) {
alert("Please input the radius server ip address.");
return false;
}
if (!document.security_form.RadiusServerPort.value.length) {
alert("Please input the radius server port number.");
return false;
}
if (!use && !document.security_form.RadiusServerSecret.value.length) {
alert("Please input the radius server shared secret.");
return false;
}

if (!use && checkIpAddr(document.security_form.RadiusServerIP) == false) {
alert("Please input a valid radius server ip address.");
return false;
}
if ((checkRange(document.security_form.RadiusServerPort.value, 1, 1, 65535) == false)
|| (isAllNum(document.security_form.RadiusServerPort.value) == false)) {
alert("Please input a valid radius server port number.");
return false;
}
if (!use && checkStrictInjection(document.security_form.RadiusServerSecret.value) == false) {
alert("The shared secret contains invalid characters.");
return false;
}

if (document.security_form.RadiusServerSessionTimeout.value.length) {
if (isAllNum(document.security_form.RadiusServerSessionTimeout.value) == false) {
alert("Please input a valid session timeout number or u may left it empty.");
return false;
}
}

eval("window.opener.document.getElementById('RadiusServerIP_"+MBSSID+"')").value = use ? '127.0.0.1' : document.security_form.RadiusServerIP.value;
eval("window.opener.document.getElementById('RadiusServerPort_"+MBSSID+"')").value = document.security_form.RadiusServerPort.value;
eval("window.opener.document.getElementById('RadiusServerSecret_"+MBSSID+"')").value = use ? 'ap800' : document.security_form.RadiusServerSecret.value;
eval("window.opener.document.getElementById('RadiusServerSessionTimeout_"+MBSSID+"')").value = document.security_form.RadiusServerSessionTimeout.value;

setTimeout("window.close()",2000);
//window.close();

return true;
}

function initTranslation()
{
var e = document.getElementById("secureRadius");
e.innerHTML = _("secure radius");

e = document.getElementById("secureUseInterRS");
e.innerHTML = _("secure radius use internal radius server");
e = document.getElementById("secureRadiusIPAddr");
e.innerHTML = _("secure radius ipaddr");
e = document.getElementById("secureRadiusPort");
e.innerHTML = _("secure radius port");
e = document.getElementById("secureRadiusSharedSecret");
e.innerHTML = _("secure radius shared secret");
e = document.getElementById("secureRadiusSessionTimeout");
e.innerHTML = _("secure radius session timeout");

e = document.getElementById("secureApply");
e.value = _("wireless apply");
}

var ipaddr, secret;

function initValue()
{
initTranslation();

var MBSSID = parseInt(window.opener.RADIUS_SSID);

ipaddr = eval("window.opener.document.getElementById('RadiusServerIP_"+MBSSID+"')").value;
secret = eval("window.opener.document.getElementById('RadiusServerSecret_"+MBSSID+"')").value;
document.getElementById("RadiusServerPort").value = eval("window.opener.document.getElementById('RadiusServerPort_"+MBSSID+"')").value;
document.getElementById("RadiusServerSessionTimeout").value = eval("window.opener.document.getElementById('RadiusServerSessionTimeout_"+MBSSID+"')").value;

document.getElementById("useInterRS").checked = ipaddr == '127.0.0.1' && secret == 'ap800';
chUseInterRS(0);
}

function chUseInterRS(clk)
{
var use = document.getElementById("useInterRS").checked;
var hipaddr = document.getElementById("RadiusServerIP");
var hsecret = document.getElementById("RadiusServerSecret");
if (use) {
if (clk) {
ipaddr = hipaddr.value;
secret = hsecret.value;
}
hipaddr.value = '';
hsecret.value = '';

hipaddr.disabled = hsecret.disabled = true;
} else {
hipaddr.value = ipaddr;
hsecret.value = secret;

hipaddr.disabled = hsecret.disabled = false;
}
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>

<form name="security_form">
<h2 id="secureRadius">Radius Server</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td><input type="checkbox" name="useInterRS" id="useInterRS" onClick="chUseInterRS(1)"><label for="useInterRS" id="secureUseInterRS">Use internal RADIUS Server</label></td>
</tr>
<tr>
<td class="head" id="secureRadiusIPAddr">IP Address</td>
<td><input name="RadiusServerIP" id="RadiusServerIP" size="16" maxlength="32"></td>
</tr>
<tr>
<td class="head" id="secureRadiusPort">Port</td>
<td><input name="RadiusServerPort" id="RadiusServerPort" size="5" maxlength="5"></td>
</tr>
<tr>
<td class="head" id="secureRadiusSharedSecret">Shared Secret</td>
<td><input name="RadiusServerSecret" id="RadiusServerSecret" size="16" maxlength="64"></td>
</tr>
<tr>
<td class="head" id="secureRadiusSessionTimeout">Session Timeout</td>
<td><input name="RadiusServerSessionTimeout" id="RadiusServerSessionTimeout" size="3" maxlength="4"></td>
</tr>
</table>

<br />
<table cellpadding="2" cellspacing="1" width="100%">
<tr align="center"><td>
<input class="btnw" value="OK" id="secureApply" onclick="check_radius()" type="button">
</td></tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>