<html>
<head>
<title>Radius Server Settings</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<style type="text/css">
.indent {margin:0 20px 30px}
.box {border:1px solid #808080}
.box table {text-align:center}
.box p {margin:5px}
table.content {margin-top:20px}
input.add {width:64px}
input.del {width:120px}
#sub {float:right; padding-right:20px}
</style>
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript">
Butterlate.setTextDomain("wireless");

function initValue()
{
initTranslation();

document.getElementById("radius_en").checked = <% getCfgZero(1, "IN_RADIUS_EN"); %>;
addUsers('<% getCfgGeneral(1, "IN_RADIUS_USER"); %>');
addClients('<% getCfgGeneral(1, "IN_RADIUS_CLIENT"); %>');
chradiusen();
}

function chradiusen()
{
var dis = !document.getElementById("radius_en").checked;
var elms = document.getElementById("main").getElementsByTagName("input");
for(var e in elms)
elms[e].disabled = dis;
}

function addUsers(users_str)
{
var u = document.getElementById("usersTb");
if(users_str.length) {
var users = users_str.split(";");
var base = u.getElementsByTagName("tr").length;
var tr, user, td1, td2, td3, i, inp1, inp2;
for (i=0; i<users.length; i++) {
tr = document.createElement("tr");

user = users[i].split(',');

td1 = document.createElement("td");
td1.innerHTML = base + i;
tr.appendChild(td1);
td2 = document.createElement("td");
td2.innerHTML = user[0];
tr.appendChild(td2);
td3 = document.createElement("td");
tr.appendChild(td3);
inp1 = document.createElement("input");
inp1.type = "checkbox";
inp2 = document.createElement("input");
inp2.type = "hidden";
inp2.value = user[1];
td3.appendChild(inp1);
td3.appendChild(inp2);

u.appendChild(tr);
}
}
}

function addClients(clients_str)
{
var c = document.getElementById("clientsTb");
if(clients_str.length) {
var clients = clients_str.split(";");
var base = c.getElementsByTagName("tr").length;
var tr, client, td1, td2, td3, i, inp1, inp2;
for (i=0; i<clients.length; i++) {
tr = document.createElement("tr");

client = clients[i].split(',');

td1 = document.createElement("td");
td1.innerHTML = base + i;
tr.appendChild(td1);
td2 = document.createElement("td");
td2.innerHTML = client[0];
tr.appendChild(td2);
td3 = document.createElement("td");
tr.appendChild(td3);
inp1 = document.createElement("input");
inp1.type = "checkbox";
inp2 = document.createElement("input");
inp2.type = "hidden";
inp2.value = client[1];
td3.appendChild(inp1);
td3.appendChild(inp2);

c.appendChild(tr);
}
}
}

function addUser()
{
var husr = document.getElementById("addusr")
var hpwd = document.getElementById("addpwd");
var hpwdcfm = document.getElementById("addpwdcfm");
if (husr.value=="") {
alert("please input Username.");
husr.focus();
return false;
}
if (hpwd.value != hpwdcfm.value) {
alert("Please confirm your password!");
hpwdcfm.select();
return false;
} else {
addUsers(husr.value + ',' + hpwd.value);
husr.value = '';
hpwd.value = '';
hpwdcfm.value = '';
}
}

function cancelUser()
{
document.getElementById("addusr").value = '';
document.getElementById("addpwd").value = '';
document.getElementById("addpwdcfm").value = '';
}

function addClient()
{
var hclt = document.getElementById("addclt")
var hkey = document.getElementById("addkey");
var hkeycfm = document.getElementById("addkeycfm");
if (hclt.value=="") {
alert("Please input Client IP.");
hclt.focus();
return false;
}
if (hkey.value != hkeycfm.value) {
alert("Please confirm your secret key!");
hkeycfm.select();
return false;
} else {
addClients(hclt.value + ',' + hkey.value);
hclt.value = '';
hkey.value = '';
hkeycfm.value = '';
}
}

function cancelClient()
{
document.getElementById("addclt").value = '';
document.getElementById("addkey").value = '';
document.getElementById("addkeycfm").value = '';
}

function delSelUser()
{
var u = document.getElementById("usersTb");
var usrNodes = u.getElementsByTagName("tr");
var new_usr_str = '', i;

for (i=1; i<usrNodes.length; i++) {
var inps = usrNodes[i].getElementsByTagName("input");
if (!inps[0].checked)
new_usr_str += ';' + usrNodes[i].getElementsByTagName("td")[1].innerHTML + ',' + inps[1].value;
}

for (i = usrNodes.length; i > 1; i--)
u.removeChild(u.lastChild);
addUsers(new_usr_str.substr(1));
}

function delAllUser()
{
var u = document.getElementById("usersTb");
for (var i = u.getElementsByTagName("tr").length; i > 1; i--)
u.removeChild(u.lastChild);
}

function delSelClient()
{
var c = document.getElementById("clientsTb");
var cltNodes = c.getElementsByTagName("tr");
var new_clt_str = '', i;

for (i=1; i<cltNodes.length; i++) {
var inps = cltNodes[i].getElementsByTagName("input");
if (!inps[0].checked)
new_clt_str += ';' + cltNodes[i].getElementsByTagName("td")[1].innerHTML + ',' + inps[1].value;
}

for (i = cltNodes.length; i > 1; i--)
c.removeChild(c.lastChild);
addClients(new_clt_str.substr(1));
}

function delAllClient()
{
var c = document.getElementById("clientsTb");
for (var i = c.getElementsByTagName("tr").length; i > 1; i--)
c.removeChild(c.lastChild);
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

function restoreCheck()
{
var scfgNameLeading = "AP800_";
if (document.CfgRestoration.filename.value == "") {
return false;
}
var cfg = document.CfgRestoration.filename.value;
cfg = cfg.replace(/\s+$/, "");

var tmp = scfgNameLeading + "radius_" + "\\w*\\.cfg$";
var reg = new RegExp(tmp, "i");
var result = cfg.search(reg);
if (result < 0) {
alert("Warning: Config filename mismatch!");
return false;
}

return true;
}

function initTranslation()
{
var e = document.getElementById("radiusTitle");
e.innerHTML = _("radius title");

e = document.getElementById("enRadiusServ");
e.innerHTML = _("radius enable");

e = document.getElementById("usersProfile");
e.innerHTML = _("radius users profile");
e = document.getElementById("userName");
e.innerHTML = _("radius username");
e = document.getElementById("passwd");
e.innerHTML = _("radius password");
e = document.getElementById("confirmPasswd");
e.innerHTML = _("radius confirm password");
e = document.getElementById("configure");
e.innerHTML = _("radius configure");
e = document.getElementById("btnAddUser");
e.value = _("radius add");
e = document.getElementById("btnCancelUser");
e.value = _("radius cancel");
e = document.getElementById("userNo");
e.innerHTML = _("radius no");
e = document.getElementById("userNames");
e.innerHTML = _("radius username");
e = document.getElementById("userSelect");
e.innerHTML = _("radius select");
e = document.getElementById("btnDelSelUser");
e.value = _("radius delete selected");
e = document.getElementById("btnDelAllUser");
e.value = _("radius delete all");

e = document.getElementById("authClient");
e.innerHTML = _("radius authentication client");
e = document.getElementById("clientIP");
e.innerHTML = _("radius client IP");
e = document.getElementById("SecretKey");
e.innerHTML = _("radius secret key");
e = document.getElementById("confirmSecretKey");
e.innerHTML = _("radius confirm secret key");
e = document.getElementById("cConfigure");
e.innerHTML = _("radius configure");
e = document.getElementById("btnAddClient");
e.value = _("radius add");
e = document.getElementById("btnCancelClient");
e.value = _("radius cancel");
e = document.getElementById("clientNo");
e.innerHTML = _("radius no");
e = document.getElementById("clientIPs");
e.innerHTML = _("radius client IP");
e = document.getElementById("clientSelect");
e.innerHTML = _("radius select");
e = document.getElementById("btnDelSelClient");
e.value = _("radius delete selected");
e = document.getElementById("btnDelAllClient");
e.value = _("radius delete all");

e = document.getElementById("radiusApply");
e.value = _("wireless apply");
e = document.getElementById("radiusCancel");
e.value = _("wireless cancel");
}

function restructValue()
{
var inps, i;

var u = document.getElementById("usersTb");
var usrNodes = u.getElementsByTagName("tr");
var new_usr_str = '';
for (i=1; i<usrNodes.length; i++) {
inps = usrNodes[i].getElementsByTagName("input");
new_usr_str += ';' + usrNodes[i].getElementsByTagName("td")[1].innerHTML + ',' + inps[1].value;
}

var c = document.getElementById("clientsTb");
var cltNodes = c.getElementsByTagName("tr");
var new_clt_str = '';
for (i=1; i<cltNodes.length; i++) {
inps = cltNodes[i].getElementsByTagName("input");
new_clt_str += ';' + cltNodes[i].getElementsByTagName("td")[1].innerHTML + ',' + inps[1].value;
}

document.radius_serv.radius_user.value = new_usr_str.substr(1);
document.radius_serv.radius_client.value = new_clt_str.substr(1);
}
</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr>
<td><h1 id="radiusTitle">Wireless LAN >> RADIUS Server</h1>
<hr size="1" />
<br />
<form method="post" name="radius_serv" action="/goform/wirelessRadius" onSubmit="restructValue()">
<div>
<input type="checkbox" id="radius_en" name="radius_en" onClick="chradiusen()" />
<span id="enRadiusServ">Enable RADIUS Server</span> </div>
<div id="main">
<div class="indent">
<h2 id="usersProfile">Users Profile (up to 96 users)</h2>
<div class="box">
<table width="652" cellspacing="1" cellpadding="2">
<tr>
<th id="userName">Username</th>
<th id="passwd">Password</th>
<th id="confirmPasswd">Confirm Password</th>
<th id="configure">Configure</th>
</tr>
<tr>
<td><input type="text" id="addusr"></td>
<td><input type="password" id="addpwd"></td>
<td><input type="password" id="addpwdcfm"></td>
<td><input type="button" id="btnAddUser" value="Add" class="add" onClick="addUser()">
<input type="button" id="btnCancelUser" value="Cancel" class="add" onClick="cancelUser()"></td>
</tr>
</table>
<table width="652" cellspacing="1" cellpadding="2" class="content">
<tbody id="usersTb">
<tr>
<th id="userNo">NO.</th>
<th id="userNames">Username</th>
<th id="userSelect">Select</th>
</tr>
</tbody>
</table>
<p>
<input type="button" id="btnDelSelUser" value="Delete Selected" class="del" onClick="delSelUser()">
<input type="button" id="btnDelAllUser" value="Delete All" class="del" onClick="delAllUser()">
</p>
</div>
</div>
<div class="indent">
<h2 id="authClient">Authentication Client (up to 16 clients)</h2>
<div class="box">
<table width="652" cellspacing="1" cellpadding="2">
<tr>
<th id="clientIP">Client IP</th>
<th id="SecretKey">Secret Key</th>
<th id="confirmSecretKey">Confirm Secret Key</th>
<th id="cConfigure">Configure</th>
</tr>
<tr>
<td><input type="text" id="addclt"></td>
<td><input type="password" id="addkey"></td>
<td><input type="password" id="addkeycfm"></td>
<td><input type="button" id="btnAddClient" value="Add" class="add" onClick="addClient()">
<input type="button" id="btnCancelClient" value="Cancel" class="add" onClick="cancelClient()"></td>
</tr>
</table>
<table width="652" cellspacing="1" cellpadding="2" class="content">
<tbody id="clientsTb">
<tr>
<th id="clientNo">NO.</th>
<th id="clientIPs">Client IP</th>
<th id="clientSelect">Select</th>
</tr>
</tbody>
</table>
<p>
<input type="button" id="btnDelSelClient" value="Delete Selected" class="del" onClick="delSelClient()">
<input type="button" id="btnDelAllClient" value="Delete All" class="del" onClick="delAllClient()">
</p>
</div>
</div>
</div>
<div id="sub">
<input type="hidden" name="radius_user">
<input type="hidden" name="radius_client">
<input type="submit" id="radiusApply" class="btnw" value="OK">
<input type="reset" id="radiusCancel" class="btnw" value="Cancel">
</div>
</form></td>
</tr>
</table>

<br />
<table width="700" cellpadding="2" cellspacing="0" align=center border=1>
<tr><td>

<form method="post" name="CfgBackup" action="/goform/ExportSettings">
<table width="100%">
<tr><td>Backup Radius Cfg :
<input type="button" class="btnw" value="Backup" name="Export" id="cfgBackupBtn" onclick="onClkBackup()">
<input type="hidden" name="realtime" value="">
<input type="hidden" name="backuptype" value="radius">
</td>
</tr>
</table>
</form>
</td>

<td>
<form method="post" name="CfgRestoration" action="/cgi-bin/upload_cfg.cgi" enctype="multipart/form-data">
<table width="100%">
<tr><td>Upload From File:
<input type="file" name="filename" size="30" maxlength="256">
<input type=submit class="btnw" value="Restore" id="cfgRestoreBtn" onclick="return restoreCheck()">
</td>
</tr>
</table>
</form>

</td></tr>
</table>
</body>
</html>
