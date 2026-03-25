<html>
<head>
<title>Administration Password</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

function AdmFormCheck()
{
var admuser = document.Adm.admuser;
var admpass = document.Adm.admpass;
var admcnfrmpass = document.Adm.admcnfrmpass;
var re = /[^a-zA-Z0-9,\.;<>\+=\\\|\?@#~`$%&/\_\-\*\[\]\{\}'\^!\(\)]/;

if (admuser.value.match(re)) {
alert("Illegal character in administrator account, please check!");
admuser.focus();
admuser.select();
return false;
}
if (admpass.value.match(re)) {
alert("Illegal character in password, please check!");
admpass.focus();
admpass.select();
return false;
}
if (admpass.value.length>23) {
alert(_("msg password too long"));
admpass.focus();
admpass.select();
return false;
}
if (admuser.value == "") {
alert("Please specify the administrator account.");
admuser.focus();
admuser.select();
return false;
}
if(admuser.value.indexOf(" ")!=-1) {
alert("Administrator account can not contain spaces.");
admuser.focus();
admuser.select();
return false;
}
if (admpass.value == "") {
alert("Please specify the administrator password.");
admpass.focus();
admpass.select();
return false;
}
if(admpass.value.indexOf(" ")!=-1) {
alert("Administrator password can not contain spaces.");
admpass.focus();
admpass.select();
return false;
}
if(admpass.value != admcnfrmpass.value)
{
alert(_("msg unmatched password"));
admpass.focus();
admpass.select();
return false;
}
return true;
}

function initTranslation()
{
var e = document.getElementById("manAdmTitle");
e.innerHTML = _("parent system maintenance")+" >> "+_("adm title");

e = document.getElementById("manAdmSet");
e.innerHTML = _("admin setting");
e = document.getElementById("manAdmAccount");
e.innerHTML = _("admin account");
e = document.getElementById("manAdmPasswd");
e.innerHTML = _("admin passwd");
e = document.getElementById("manAdmCnfrmPasswd");
e.innerHTML = _("admin confirm passwd");
e = document.getElementById("manAdmApply");
e.value = _("admin apply");
e = document.getElementById("manAdmCancel");
e.value = _("admin cancel");
}
function CharMode(iN){
if (iN>=48 && iN <=57) //num
return 1;
if (iN>=65 && iN <=90) //A-Z
return 2;
if (iN>=97 && iN <=122) //a-z
return 4;
else
return 8;
}
function checkStrong(sPW){
Modes=0;

for (i=0;i<sPW.length;i++){
Modes|=CharMode(sPW.charCodeAt(i));
}
return bitTotal(Modes);
}
function bitTotal(num){
modes=0;
for (i=0;i<4;i++){
if (num & 1) modes++;
num>>>=1;
}
return modes;
}
function pwStrength(pwname,pwd){
O_color="#dddddd";
L_color="#ff3100";
M_color="#ff7400";
H_color="#89cd02";
if (pwd==null||pwd==''){
Lcolor=Mcolor=Hcolor=O_color;
}
else{
S_level=checkStrong(pwd);
Lcolor=Mcolor=Hcolor=O_color;
switch(S_level) {
case 0:  break;
case 1:  Lcolor=L_color;  break;
case 2:  Mcolor=M_color;  break;
default: Hcolor=H_color;
}
}
document.getElementById("wk_"+pwname).style.background=Lcolor;
document.getElementById("md_"+pwname).style.background=Mcolor;
document.getElementById("st_"+pwname).style.background=Hcolor;
return;
}
function initValue()
{
initTranslation();
}
</script>

</head>
<body onload="initValue()">
<table class="body">
<tr><td>
<h1 id="manAdmTitle">Administration Password</h1>
<hr size="1" />
<br />

<!-- ================= Adm Settings ================= -->
<form method="post" name="Adm" action="/goform/setSysAdm">
<div>
<h2 id="manAdmSet" class="title">Adminstrator Settings</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" id="manAdmAccount">Account</td>
<td><input type="text" name="admuser" size="20" maxlength="16" value="<% getCfgGeneral(1, "Login"); %>"></td>
</tr>
<tr>
<td class="head" id="manAdmPasswd">Password</td>
<td><input type="password" name="admpass" size="20" value="<% getCfgGeneral(1, "Password"); %>" onKeyUp=pwStrength(this.name,this.value) onBlur=pwStrength(this.name,this.value)></td>
</tr>
<tr>
<td class="head" id="manAdmCnfrmPasswd">Confirm Password</td>
<td><input type="password" name="admcnfrmpass" size="20" ></td>
</tr>
<tr><td width=250>Password Strength:</td>
<td><table style="height:20px;line-height:20px;border:0;" cellspacing=0 cellspadding=0><tr align=center>
<td style="background:#ddd;color:#fff;" width=63 id=wk_admpass>Weak</td><td width=1></td>
<td style="background:#ddd;color:#fff;" width=63 id=md_admpass>Medium</td><td width=1></td>
<td style="background:#ddd;color:#fff;" width=63 id=st_admpass>Strong</td></tr></table>
</td></tr>
<tr><td colspan=2>Strong password requirements:
<br>1. Have at least one upper-case letter and one lower-case letter.
<br>2. Including non-alphanumeric characters is a plus.
</td></tr>
</table>

<br />
<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="center">
<td class="title" valign="top">Note:</td>
<td id="scanStr">Authorization can contain only a-z A-Z 0-9 , ~ ` ! @ # $ % ^ & * () _ + = {} [] | \ ; ' < > . ? /</td>
</tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type="submit" class="btnw" value="OK" id="manAdmApply" onClick="return AdmFormCheck()"> &nbsp; &nbsp;
<input type="reset"  class="btnw" value="Cancel" id="manAdmCancel" onClick="window.location.reload()">
</td>
</tr>
</table>
</div>
</form>

</td></tr>
</table>

</body>
</html>