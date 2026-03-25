<html>
<head>
<title>Administration Password</title>
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">

<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
var f;

function periodic_inform_check()
{
if( f.periodic_inform_enable.checked ){
cpntCtrl(true, f, f.periodic_inform_interval, 1);
} else {
cpntCtrl(false, f, f.periodic_inform_interval, 1);
}
}

function stun_check()
{
if(parseInt(getVleFromElmt(f.stun_enable[0], 0)) == 1){
cpntCtrl(true, f, f.stun_server_addr, 4);
} else {
cpntCtrl(false, f, f.stun_server_addr, 4);
}
}

function AdmFormCheck()
{
if(HttpCheck(f.acs_url.value) == false && HttpsCheck(f.acs_url.value) == false){
alert("ACS server URL is wrong!");
return;
}

if( isStrNum(f.cpe_port.value) == false || parseInt(f.cpe_port.value)==0 || parseInt(f.cpe_port.value)>65535 ){
alert("Wrong CPE port!");
return;
}


if(f.periodic_inform_enable.checked && isStrNum(f.periodic_inform_interval.value) == false){
alert("Invalid Periodic Inform Interval value!");
return;
}

var stun_server_port = f.stun_server_port.value;
if( isStrNum(stun_server_port) == false || parseInt(stun_server_port)==0 || parseInt(stun_server_port)>65535 ){
alert("Wrong STUN Server Port!");
return;
}

var stun_min_period = f.stun_min_period.value;
if( isStrNum(stun_min_period) == false || parseInt(stun_min_period)==0 || parseInt(stun_min_period)>65535 ){
alert("Wrong Minimum Keep Alive Period!");
return;
}

var stun_max_period = f.stun_max_period.value;
if(stun_max_period == -1){
//right!
}else if( isStrNum(stun_max_period) == false || parseInt(stun_max_period)==0 || parseInt(stun_max_period)>65535 ){
alert("Wrong Maximum Keep Alive Period!");
return;
}
var sec_dns = f.sec_dns.value;
var pri_dns = f.pri_dns.value;
if (pri_dns != "" && !isStrIp(pri_dns)) {
alert(_("valid IP address"));
f.pri_dns.focus();
return false;
}
if (sec_dns != "" && !isStrIp(sec_dns)) {
alert(_("valid IP address"));
f.sec_dns.focus();
return false;
}

cpntCtrl(true, f, f.acs_url, 19);
f.submit();
}

function initTranslation()
{
var e = document.getElementById("manTR069Title");
e.innerHTML = _("parent system maintenance")+" >> "+_("man tr069 title");

e = document.getElementById("manTr069AcsSet");
e.innerHTML = _("man acs setting");
e = document.getElementById("manTR069ACSURL");
e.innerHTML = _("man acs url");
e = document.getElementById("manTR069ACSUsername");
e.innerHTML = _("man acs username");
e = document.getElementById("manTR069ACSPassword");
e.innerHTML = _("man acs password");

e = document.getElementById("manTr069CpeSet");
e.innerHTML = _("man cpe setting");
e = document.getElementById("manTR069CPEEnable");
e.innerHTML = _("man cpe enable");
e = document.getElementById("manTR069CPEURL");
e.innerHTML = _("man cpe url");
e = document.getElementById("manTR069CPEPort");
e.innerHTML = _("man cpe port");
e = document.getElementById("manTR069CPEUsername");
e.innerHTML = _("man cpe username");
e = document.getElementById("manTR069CPEPassword");
e.innerHTML = _("man cpe password");
e = document.getElementById("manTR069CPENote");
e.innerHTML = _("man cpe note");
e = document.getElementById("manTR069CPENoteInfo");
e.innerHTML = _("man cpe note info");
e = document.getElementById("manTR069CPEDnsTitle");
e.innerHTML = _("man cpe dns title");
e = document.getElementById("manTR069CPE1stDns");
e.innerHTML = _("man cpe 1st dns");
e = document.getElementById("manTR069CPE2ndDns");
e.innerHTML = _("man cpe 2nd dns");

e = document.getElementById("manTr069InformSet");
e.innerHTML = _("man inform setting");
e = document.getElementById("manTR069PerInformEnable");
e.innerHTML = _("man inform enable");
e = document.getElementById("manTR069PerInformInterval");
e.innerHTML = _("man inform interval");
e = document.getElementById("manTR069PerInformIntervalSeconds");
e.innerHTML = _("man inform interval seconds");

e = document.getElementById("manTr069StunSet");
e.innerHTML = _("man stun setting");
e = document.getElementById("manTR069StunDisable");
e.innerHTML = _("man stun disable");
e = document.getElementById("manTR069StunEnable");
e.innerHTML = _("man stun enable");
e = document.getElementById("manTR069StunSrvAddr");
e.innerHTML = _("man stun server address");
e = document.getElementById("manTR069StunSrvPrt");
e.innerHTML = _("man stun server port");
e = document.getElementById("manTR069StunMinKAP");
e.innerHTML = _("man stun min keep alive period");
e = document.getElementById("manTR069StunMaxKAP");
e.innerHTML = _("man stun max keep alive period");
e = document.getElementById("manTR069StunSec");
e.innerHTML = _("man stun seconds");


E = document.getElementById("manTr069Apply");
e.value = _("man tr069 apply");
e = document.getElementById("manTr069Cancel");
e.value = _("man tr069 cancel");

}



function initLAN()
{
var acs_server_on_num = 1;
var opmode = "<% getCfgGeneral(1, "OperationMode"); %>";
var ap800_mode = "<% getCfgGeneral(1, "800_ap_mode"); %>";

var acs_server_on = "<% getCfgGeneral(1, "TR069ACSServerOn"); %>";
var cpe_port = "<% getCfgZero(1, "TR069CPEPort"); %>";
var lan_ip = "";

if (opmode == "0") {
switch (ap800_mode) {
case "0":
acs_server_on_num = 2;
break;
case "1":
acs_server_on_num = 1;
break;
case "2":
acs_server_on_num = 1;
break;
case "3":
acs_server_on_num = 2;
break;
default:
break;
}
} else if (opmode == "2")
acs_server_on_num = 1;
else if (opmode == "3")
acs_server_on_num = 2;

if(acs_server_on_num == 2){
f.acs_server_on.options[0] = new Option("LAN-A", "1");
if ('<% getCfgGeneral(1, "WL_VLAN"); %>' == '1')
f.acs_server_on.options[1] = new Option("LAN-B", "2");
setVle2Elmt(f.acs_server_on, acs_server_on);
if(parseInt(acs_server_on) == 1){
lan_ip = "<% getLanIp(); %>";
} else if(parseInt(acs_server_on) == 2){
lan_ip = "<% getCfgGeneral(1, "lan2_ipaddr"); %>";
}
} else {
f.acs_server_on.options[0] = new Option("LAN-A", "1");
lan_ip = "<% getLanIp(); %>";
}


if(cpe_port == "0" || cpe_port == "80"){
var cpe_url = "http://"+lan_ip+"/cwm/CRN.html";
} else {
var cpe_url = "http://"+lan_ip+":"+cpe_port+"/cwm/CRN.html";
}

f.cpe_url.value = cpe_url;
}

function initValue()
{
f = document.tr069;
var acs_password = "<% getCfgGeneral(1, "TR069ACSPassword"); %>";
var cpe_enable = "<% getCfgZero(1, "TR069CPEEnable"); %>";


var cpe_password = "<% getCfgGeneral(1, "TR069CPEPassword"); %>";
var periodic_inform_enable = "<% getCfgZero(1, "TR069PeriodicInformEnable"); %>";

initLAN();

if(acs_password != "")
f.acs_password.value = "********";

if (cpe_enable == "1")
f.cpe_enable.checked = true;
else
f.cpe_enable.checked = false;

if(cpe_password != "")
f.cpe_password.value = "********";

if (periodic_inform_enable == "1")
f.periodic_inform_enable.checked = true;
else
f.periodic_inform_enable.checked = false;

var stun_enable = "<% getCfgGeneral(1, "TR069STUNEnable"); %>";
setVle2Elmt(f.stun_enable[0], parseInt(stun_enable));

initTranslation();

}
</script>

</head>
<body onload="initValue()">
<table class="body">
<tr><td>
<h1 id="manTR069Title">TR-069 Settings</h1>
<hr size="1" />
<br />

<form name="tr069" method="POST" action="/goform/tr069">

<h2 id="manTr069AcsSet" class="title">ACS Settings</h2>

<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" id="manTR069ACSURL">URL</td>
<td><input type=text size=50 name=acs_url id=acs_url value="<% getCfgGeneral(1, "TR069ACSURL"); %>"></td>
</tr>
<tr>
<td class="head" id="manTR069ACSUsername">Username</td>
<td><input type=text size=20 name=acs_username id=acs_username maxlength=31 value="<% getCfgGeneral(1, "TR069ACSUsername"); %>"></td>
</tr>
<tr>
<td class="head" id="manTR069ACSPassword">Password</td>
<td><input type=password size=20 name=acs_password id=acs_password maxlength=31></td>
</tr>
</table>
<br>
<h2 id="manTr069CpeSet" class="title">CPE Settings</h2>

<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" id="manTR069CPEEnable">Enable</td>
<td><input type="checkbox" name="cpe_enable" id="cpe_enable"></td>
</tr>
<tr>
<td class="head">On</td>
<td>
<select name=acs_server_on id=acs_server_on>
</select>
</td>
</tr>
<tr>
<td class="head" id="manTR069CPEURL">URL</td>
<td><input type=text size=50 maxlength=255 name=cpe_url  id="cpe_url" disabled></td>
</tr>
<tr>
<td class="head" id="manTR069CPEPort">Port</td>
<td><input type=text size=10 maxlength=5 name=cpe_port  id="cpe_port" value="<% getCfgGeneral(1, "TR069CPEPort"); %>"></td>
</tr>
<tr>
<td class="head" id="manTR069CPEUsername">Username</td>
<td><input type=text size=32 name=cpe_username id="cpe_username" maxlength=255 value="<% getCfgGeneral(1, "TR069CPEUsername"); %>"></td>
</tr>
<tr>
<td class="head" id="manTR069CPEPassword">Password</td>
<td><input type=password size=32 name=cpe_password id="cpe_password" maxlength=255></td>
</tr>
<tr>
<td colspan="2" class="title" id="manTR069CPEDnsTitle">DNS Server IP Address</td>
</tr>
<tr>
<td class="head" id="manTR069CPE1stDns">Primary IP Address</td>
<td><input type=text size=32 name=pri_dns id="pri_dns" maxlength=15 value="<% getCfgGeneral(1, "wan_primary_dns"); %>"></td>
</tr>
<tr>
<td class="head" id="manTR069CPE2ndDns">Secondary IP Address</td>
<td><input type=text size=32 name=sec_dns id="sec_dns" maxlength=15 value="<% getCfgGeneral(1, "wan_secondary_dns"); %>"></td>
</tr>
</table>
<table width="100%" cellpadding="2" cellspacing="1" align="center">
<tr valign="top">
<td class="title" height="25" width="8%" id="manTR069CPENote">Note :</td>
<td id="manTR069CPENoteInfo">
Please set default gateway, no matter choose LAN-A or LAN-B.
</td>
</tr>
</table>

<br>
<h2 id="manTr069InformSet" class="title">Periodic Inform Settings</h2>

<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" id="manTR069PerInformEnable">Enable</td>
<td><input type=checkbox name=periodic_inform_enable id="periodic_inform_enable" onclick="periodic_inform_check()"></td>
</tr>
<tr>
<td class="head" id="manTR069PerInformInterval">Interval Time</td>
<td><input type=text size=10 name=periodic_inform_interval id="periodic_inform_interval" value="<% getCfgGeneral(1, "TR069PeriodicInformInterval"); %>"> <span id="manTR069PerInformIntervalSeconds">second(s)</span></td>
</tr>
</table>
<br>
<h2 id="manTr069StunSet" class="title">STUN Settings</h2>

<table width="100%" cellspacing="1" cellpadding="2" class="config">
<tr>
<td colspan=2>
<input type=radio name=stun_enable value=1 onclick="stun_check()"><span id="manTR069StunEnable">Enable</span>
<input type=radio name=stun_enable value=0 checked onclick="stun_check()"><span id="manTR069StunDisable">Disable</span>
</td>
</tr>
<tr>
<td class="head" id="manTR069StunSrvAddr">Server Address</td>
<td><input type=text size=32 maxlength=255 name=stun_server_addr value='<% getCfgGeneral(1, "TR069STUNServerAddress"); %>'></td>
</tr>
<tr>
<td class="head" id="manTR069StunSrvPrt">Server Port</td>
<td><input type=text size=6 maxlength=5 name=stun_server_port value='<% getCfgGeneral(1, "TR069STUNServerPort"); %>'></td>
</tr>
<tr>
<td class="head" id="manTR069StunMinKAP">Minimum Keep Alive Period</td>
<td><input type=text size=10 name=stun_min_period value='<% getCfgGeneral(1, "TR069STUNMinKeepAlivePeriod"); %>'> <span id="manTR069StunSec">second(s)</span></td>
</tr>
<tr>
<td class="head" id="manTR069StunMaxKAP">Maximum Keep Alive Period</td>
<td><input type=text size=10 name=stun_max_period value='<% getCfgGeneral(1, "TR069STUNMaxKeepAlivePeriod"); %>'> <span id="manTR069StunSec">second(s)</span></td>
</tr>
</table>
<br>
<table align=center>
<tr>
<td>
<input class="btnw" type="button" value="OK" id="manTr069Apply" onClick="return AdmFormCheck()">
<input type="reset"  class="btnw" value="Cancel" id="manTr069Cancel" onClick="window.location.reload()">
</td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>