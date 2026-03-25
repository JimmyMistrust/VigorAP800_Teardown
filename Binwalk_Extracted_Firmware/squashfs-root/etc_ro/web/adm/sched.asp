<html>
<head>
<title>Schedule</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" Content="No-cach">
<meta http-equiv="Expires" Content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" language="JavaScript">
Butterlate.setTextDomain("admin");
Butterlate.setTextDomain("main");
var total_num = <% getCfgZero(1, "schedule_pnum"); %>;

function initTranslation()
{
var e = document.getElementById("wTitle");
e.innerHTML = _("parent application")+" >> "+_("treeapp schedule");
e = document.getElementById("wSchedule");
e.innerHTML = _("treeapp schedule");
e = document.getElementById("wScheduleEn");
e.innerHTML = _("schedule enable");
e = document.getElementById("wScheduleList");
e.innerHTML = _("schedule list");
e = document.getElementById("wSchedListIdx");
e.innerHTML = _("schedule idx");
e = document.getElementById("wSchedListSet");
e.innerHTML = _("schedule setting");
e = document.getElementById("wSchedListSta");
e.innerHTML = _("schedule status");

e = document.getElementById("wApply");
e.value = _("admin apply");
e = document.getElementById("wAdd");
e.value = _("admin add");
e = document.getElementById("wDel");
e.value = _("admin delete");
}

function initValue()
{
var schedule_en = <% getCfgZero(1, "schedule-enable"); %>;

initTranslation();

if (schedule_en == 1)
document.schedule.ScheduleEn.checked = true;
else
document.schedule.ScheduleEn.checked = false;

onClkEn();
}

function onClkEn()
{
if (total_num >= 5)
document.schedule_del.add.disabled = true;
else if (total_num <= 0)
document.schedule_del.del.disabled = true;
}

function deleteClick()
{
for (var i = 0; i < total_num; i++) {
var tmp = eval("document.schedule_del.delSched"+i);
if (tmp.checked == true)
return true;
}
alert(_("msg sched del"));
return false;
}
</script>

</head>
<body onload="initValue()">
<table class="body">
<tr><td>
<h1 id="wTitle">Schedule</h1>
<hr size="1" />
<br />

<div>
<form method="post" name="schedule" action="/goform/schedule_list">
<h2 id="wSchedule" class="title">Schedule</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td width=25><input type=checkbox name="ScheduleEn" value=1 onclick="onClkEn()"></td>
<td align=left><span id="wScheduleEn">Enable Schedule</span></td>
</tr>
</table><br />

<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type=submit class="btnw" value="OK" id="wApply">&nbsp;&nbsp;
</td>
</tr>
</table>
</form>

<form method="post" name="schedule_del" action="/goform/schedule_delete">
<h2 id="wScheduleList" class="title">Schedule Configuration</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td align=center class="title" id="wSchedListIdx">Index.</td>
<td align=center class="title" id="wSchedListSet">Setting</td>
<td align=center class="title" id="wSchedListSta">Status</td>
</tr>
<% getScheduleList(); %>
</table><br />

<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type=button class="btnw" name="add" value="Add" id="wAdd" onClick="document.location='sched_edit.asp';">&nbsp;&nbsp;
<input type="submit" class="btnw" name="del" value="Delete" id="wDel" onClick="return deleteClick()">
</td>
</tr>
</table>
</form>
</div>

</td></tr>
</table>

</body>
</html>
