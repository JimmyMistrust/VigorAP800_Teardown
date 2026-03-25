<html>
<head>
<title>Schedule Edit</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" Content="No-cach">
<meta http-equiv="Expires" Content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" language="JavaScript">
Butterlate.setTextDomain("admin");
Butterlate.setTextDomain("main");

var pageArgs = searchArgs(window.location.search);
var selectedCfg = -1;
if(pageArgs['idx'])
selectedCfg = parseInt(pageArgs['idx']);

function initTranslation()
{
var e = document.getElementById("wTitle");
e.innerHTML = _("parent application")+" >> "+_("treeapp schedule");
if(selectedCfg == -1) {
e = document.getElementById("op");
e.innerHTML = _("admin add");
} else {
e = document.getElementById("op");
e.innerHTML = _("admin edit");
}
e = document.getElementById("wSchedule");
e.innerHTML = _("treeapp schedule");
e = document.getElementById("wScheduleEn");
e.innerHTML = _("admin enable");
e = document.getElementById("wScheduleStartDate");
e.innerHTML = _("schedule start date");
e = document.getElementById("wScheduleStartTime");
e.innerHTML = _("schedule start time");
e = document.getElementById("wSchStartDateDes");
e.innerHTML = _("schedule date desc");
e = document.getElementById("wSchStartTimeDes");
e.innerHTML = _("schedule time desc");

e = document.getElementById("wScheduleAction");
e.innerHTML = _("schedule action");
e = document.getElementById("wActionReboot");
e.innerHTML = _("schedule action reboot");
e = document.getElementById("wScheduleAct");
e.innerHTML = _("schedule act");
e = document.getElementById("wActOnce");
e.innerHTML = _("schedule act once");
e = document.getElementById("wActRoutine");
e.innerHTML = _("schedule act routine");
e = document.getElementById("wScheduleWeekday");
e.innerHTML = _("schedule weekday");
e = document.getElementById("wMonday");
e.innerHTML = _("schedule monday");
e = document.getElementById("wTuesday");
e.innerHTML = _("schedule tuesday");
e = document.getElementById("wWednesday");
e.innerHTML = _("schedule wednesday");
e = document.getElementById("wThursday");
e.innerHTML = _("schedule thursday");
e = document.getElementById("wFriday");
e.innerHTML = _("schedule friday");
e = document.getElementById("wSaturday");
e.innerHTML = _("schedule saturday");
e = document.getElementById("wSunday");
e.innerHTML = _("schedule sunday");

e = document.getElementById("wApply");
e.value = _("admin apply");
e = document.getElementById("wCancel");
e.value = _("admin cancel");
}

function initSltOption()
{
/* date */
for (i=0; i<50; i++) {
document.schedule.sltStartYear.options[i] = new Option (i+2000, i+2000);
}
for (i=0; i<12; i++) {
document.schedule.sltStartMonth.options[i] = new Option (i+1, i+1);
}
for (i=0; i<31; i++) {
document.schedule.sltStartDay.options[i] = new Option(i+1, i+1);
}
for ( i=0; i<24; i++ ) {
document.schedule.sltStartHour.options[i] = new Option(i, i);
}
for ( i=0; i<60; i++ ) {
document.schedule.sltStartMin.options[i] = new Option(i, i);
}

}

function processUpdate(req)
{
if (req.responseText) {
var values = req.responseText.split("|");

var f = document.schedule;
setVle2Elmt(f.ScheduleEn, values[0], 0);
setVle2Elmt(f.sltStartYear, values[1], 0);
setVle2Elmt(f.sltStartMonth, values[2], 0);
setVle2Elmt(f.sltStartDay, values[3], 0);
setVle2Elmt(f.sltStartHour, values[4], 0);
setVle2Elmt(f.sltStartMin, values[5], 0);
setVle2Elmt(f.sltAction, values[6], 0);
setVle2Elmt(f.sltAct, values[7], 0);
if (values[8].length > 0) {
var weekday = values[8].split(",");
for(var i=0; i<weekday.length; i++) {
var idx = getIdxbyName(f, "iWeekday"+weekday[i]);
setVle2Elmt(f[idx], 1, 0);
}
}
onClkSchedEn();
}
}

function requestUpdate()
{
document.schedule.idx.value = selectedCfg;
if(selectedCfg == -1) {
//        document.getElementById("delete").style.visibility = "hidden";
loadXMLDoc("GET", "/goform/getScheduleProfile", processUpdate, "n/a");
} else {
loadXMLDoc("GET", "/goform/getScheduleProfile?idx="+selectedCfg, processUpdate, "n/a");
}
}

function initValue()
{
initSltOption();
initTranslation();
requestUpdate();
}

function onClkSchedEn()
{
if (document.schedule.ScheduleEn.checked == true) {
cpntCtrl(true, document.schedule, document.schedule.sltStartYear, 14);
onChgAct();
} else
cpntCtrl(false, document.schedule, document.schedule.sltStartYear, 14);
}

function onChgAct()
{
var idx = document.schedule.sltAct.options.selectedIndex;
var sltAct = document.schedule.sltAct.options[idx].value;

if (sltAct == 1) {
cpntCtrl(true, document.schedule, document.schedule.iWeekday1, 7);
} else {
cpntCtrl(false, document.schedule, document.schedule.iWeekday1, 7);
}
}

function CheckValue()
{
var f = document.schedule;
var str = "";
var total = 0;
var week = 0;
var sltStartMin = getVleFromElmt(f.sltStartMin, 0);
if (sltStartMin.length == 1)
sltStartMin = "0" + sltStartMin;
var action=getVleFromElmt(f.sltAction, 0);
var start_time = getVleFromElmt(f.sltStartHour, 0) + "" + sltStartMin;

var aryWeekday = [0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01];
//Mon = 0x40,  Tue = 0x20,  Wed = 0x10, Thur = 0x08,  Friday =0x04,  Sat = 0x02,  Sund = 0x01;
for(var i=1; i<7; i++) {
var idx = getIdxbyName(f, "iWeekday"+i);
var val = getVleFromElmt(f[idx], 0);
if (val == 1) {
if (total != 0) str += ",";
str += i;
week += aryWeekday[i-1];
total++;
}
}
val = getVleFromElmt(f.iWeekday0, 0);
if (val == 1) {
if (total != 0) str += ",";
str += "0";
week += aryWeekday[6];
}
f.weekday_save.value = str;
f.weekday_show.value = week;

cpntCtrl(true, document.schedule, document.schedule.sltStartYear, 17);
return true;
}
</script>

</head>
<body onload="initValue()">
<table class="body">
<tr><td>
<h1 id="wTitle">Schedule</h1>
<hr size="1" />
<br />

<form method="post" name="schedule" action="/goform/schedule_edit" onSubmit="return CheckValue()">
<h2 class="title"><span id="op"></span>&nbsp;<span id="wSchedule">Schedule</span></h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td colspan=2 align=left><input type=checkbox name="ScheduleEn" value=1 onclick="onClkSchedEn()">
<span id="wScheduleEn">Enable</span></td>
</tr>
<tr><td width=15% id="wScheduleStartDate">Start Date</td>
<td><select name="sltStartYear"></select>-
<select name="sltStartMonth"></select>-
<select name="sltStartDay"></select>
<span id="wSchStartDateDes">( Year - Month - Day )</span>
</td>
</tr>
<tr><td id="wScheduleStartTime">Start time</td>
<td><select name="sltStartHour"></select>:
<select name="sltStartMin"></select>
<span id="wSchStartTimeDes">( Hour : Minute )</span>
</td>
</tr>
<tr><td id="wScheduleAction">Action</td>
<td><select name="sltAction">
<option id="wActionReboot" value=2>Auto Reboot</option>
<option id="wActionWiFiUp" value=4>Wi-Fi (2.4GHz) UP</option>
<option id="wActionWiFiDown" value=5>Wi-Fi (2.4GHz) DOWN</option></select></td>
</tr>
<tr><td id="wScheduleAct">Acts</td>
<td><select name="sltAct" onchange="onChgAct()"><option id="wActOnce" value=0>Once</option>
<option id="wActRoutine" value=1>Routine</option></select></td>
</tr>
<tr><td id="wScheduleWeekday">Weekday</td>
<td><input type=checkbox name="iWeekday1" value=1><span id="wMonday">Monday</span>
<input type=checkbox name="iWeekday2" value=1><span id="wTuesday">Tuesday</span>
<input type=checkbox name="iWeekday3" value=1><span id="wWednesday">Wednesday</span>
<input type=checkbox name="iWeekday4" value=1><span id="wThursday">Thursday</span>
<input type=checkbox name="iWeekday5" value=1><span id="wFriday">Friday</span>
<input type=checkbox name="iWeekday6" value=1><span id="wSaturday">Saturday</span>
<input type=checkbox name="iWeekday0" value=1><span id="wSunday">Sunday</span></td>
</tr>
</table>
<br />
<table width="100%" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type=submit class="btnw" value="OK" id="wApply">&nbsp;&nbsp;
<input type=reset  class="btnw" value="Cancel" id="wCancel" onClick="window.location='sched.asp';">
<input type=hidden name=weekday_save>
<input type=hidden name=weekday_show>
<input type=hidden name=idx>
</td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>