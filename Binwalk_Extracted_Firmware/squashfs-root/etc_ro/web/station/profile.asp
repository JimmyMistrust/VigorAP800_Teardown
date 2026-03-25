<html>
<head>
<title>Wireless LAN Profile</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

function open_profile_page() {
window.open("add_profile_page.asp","profile_page","toolbar=no, location=yes, scrollbars=yes, resizable=no, width=660, height=600");
}

function edit_profile_page(){
document.sta_profile.hiddenButton.value = 'edit';
document.sta_profile.submit();
window.open("edit_profile_page.asp","profile_page","toolbar=no, location=yes, scrollbars=yes, resizable=no, width=660, height=600");
}

function selectedProfileChange()
{
document.sta_profile.deleteProfileButton.disabled=false;
document.sta_profile.editProfileButton.disabled=false;
document.sta_profile.activateProfileButton.disabled=false;
}

function submit_apply(parm)
{
document.sta_profile.hiddenButton.value = parm;
document.sta_profile.submit();
}

function initTranslation()
{
var e = document.getElementById("profTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("prof title");

e = document.getElementById("profList");
e.innerHTML = _("prof list");
e = document.getElementById("profSelect");
e.innerHTML = _("station select");
e = document.getElementById("profProfile");
e.innerHTML = _("prof profile");
e = document.getElementById("profSSID");
e.innerHTML = _("station ssid");
e = document.getElementById("profChannel");
e.innerHTML = _("station channel");
e = document.getElementById("profAuth");
e.innerHTML = _("station auth");
e = document.getElementById("staproEncryp");
e.innerHTML = _("station encryp");
e = document.getElementById("profAdd");
e.value = _("station add");
e = document.getElementById("profDel");
e.value = _("station del");
e = document.getElementById("profEdit");
e.value = _("station edit");
e = document.getElementById("profActive");
e.value = _("station active");
}

function PageInit()
{
initTranslation();
}
</script>
</head>

<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="profTitle">Profile</h1>
<hr size="1" />
<br />

<form method="post" name="sta_profile" action="/goform/setStaProfile">
<div>
<h2 id="profList" class="title">Pofile List</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="title" width=50px id="profSelect">&nbsp;</td>
<td class="title" id="profProfile">Profile</td>
<td class="title" id="profSSID">SSID</td>
<td class="title" id="profChannel">Channel</td>
<td class="title" id="profAuth">Authentication</td>
<td class="title" id="staproEncryp">Encryption</td>
</tr>
<% getStaProfile(); %>
</table>

<br />
<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type="button" name="addProfileButton" id="profAdd" class="btnw" value="Add" onClick="open_profile_page()"> &nbsp; &nbsp;
<input type="button" name="deleteProfileButton" id="profDel" class="btnw" value="Delete" disabled onClick="submit_apply('delete')"> &nbsp; &nbsp;
<input type="button" name="editProfileButton" id="profEdit" class="btnw" value="Edit" disabled onClick="edit_profile_page()"> &nbsp; &nbsp;
<input type="button" name="activateProfileButton" id="profActive" class="btnw" value="Activate" disabled onClick="submit_apply('activate')">
</td>
</tr>
</table>
<input type=hidden name=hiddenButton value="">
</div>
</form>

</td></tr>
</table>

</body>
</html>
