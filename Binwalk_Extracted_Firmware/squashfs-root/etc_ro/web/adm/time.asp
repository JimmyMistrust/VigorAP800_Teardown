<html>
<head>
<title>Time and Date</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" Content="No-cach">
<meta http-equiv="Expires" Content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" language="JavaScript">
Butterlate.setTextDomain("admin");

var intertime;

function useTimeSwitch()
{
cpntCtrl(document.NTP.useNtpTime[1], document.NTP, document.NTP.time_zone, 5);
}

function NTPFormCheck()
{
if (document.NTP.useNtpTime[0].checked == true)	// use browser time
document.NTP.NTPServerIP.value = "";

if( document.NTP.NTPServerIP.value != "" &&
document.NTP.NTPSync.value == ""){
alert("Please specify a value for the interval of synchroniztion.");
return false;
}
if(checkAllNum( document.NTP.NTPSync.value ) == 0){
alert("Invalid NTP synchronization value.");
return false;
}
cpntCtrl(true, document.NTP, document.NTP.time_zone, 4);
document.NTP.brwsTime.value = getCurrTime();
return true;
}

function initTranslation()
{
var e = document.getElementById("manNTPTitle");
e.innerHTML = _("parent system maintenance")+" >> "+_("ntp title");

e = document.getElementById("daylights");
e.innerHTML = _("ntp daylights");
e = document.getElementById("sec");
e.innerHTML = _("ntp sec");
e = document.getElementById("day");
e.innerHTML = _("ntp day");
e = document.getElementById("day1");
e.innerHTML = _("ntp day1");
e = document.getElementById("day2");
e.innerHTML = _("ntp day2");
e = document.getElementById("min");
e.innerHTML = _("ntp min");
e = document.getElementById("min1");
e.innerHTML = _("ntp min1");
e = document.getElementById("min2");
e.innerHTML = _("ntp min2");
e = document.getElementById("min3");
e.innerHTML = _("ntp min3");
e = document.getElementById("min4");
e.innerHTML = _("ntp min4");
e = document.getElementById("hour");
e.innerHTML = _("ntp hour");
e = document.getElementById("hour1");
e.innerHTML = _("ntp hour1");
e = document.getElementById("hour2");
e.innerHTML = _("ntp hour2");
e = document.getElementById("manTimeInfo");
e.innerHTML = _("ntp time info");
e = document.getElementById("manTimeSetting");
e.innerHTML = _("ntp time setting");
e = document.getElementById("manNTPTimeZone");
e.innerHTML = _("ntp timezone");

e = document.getElementById("manNTPMidIsland");
e.innerHTML = _("ntp mid island");
e = document.getElementById("manNTPHawaii");
e.innerHTML = _("ntp hawaii");
e = document.getElementById("manNTPAlaska");
e.innerHTML = _("ntp alaska");
e = document.getElementById("manNTPPacific");
e.innerHTML = _("ntp pacific");
e = document.getElementById("manNTPTijuana");
e.innerHTML = _("ntp tijuana");
e = document.getElementById("manNTPMountain");
e.innerHTML = _("ntp mountain");
e = document.getElementById("manNTPArizona");
e.innerHTML = _("ntp arizona");
e = document.getElementById("manNTPCentral");
e.innerHTML = _("ntp central");
e = document.getElementById("manNTPMidUS");
e.innerHTML = _("ntp mid us");
e = document.getElementById("manNTPHonduras");
e.innerHTML = _("ntp honduras");
e = document.getElementById("manNTPIndianaEast");
e.innerHTML = _("ntp indiana east");
e = document.getElementById("manNTPEastern");
e.innerHTML = _("ntp eastern");
e = document.getElementById("manNTPAtlantic");
e.innerHTML = _("ntp atlantic");
e = document.getElementById("manNTPBolivia");
e.innerHTML = _("ntp bolivia");
e = document.getElementById("manNTPNewfoundland");
e.innerHTML = _("ntp newfoundland");
e = document.getElementById("manNTPGuyana");
e.innerHTML = _("ntp guyana");
e = document.getElementById("manNTPBrazilEast");
e.innerHTML = _("ntp brazil east");
e = document.getElementById("manNTPMidAtlantic");
e.innerHTML = _("ntp mid atlantic");
e = document.getElementById("manNTPAzoresIslands");
e.innerHTML = _("ntp azores islands");
e = document.getElementById("manNTPGambia");
e.innerHTML = _("ntp gambia");
e = document.getElementById("manNTPEngland");
e.innerHTML = _("ntp england");
e = document.getElementById("manNTPDublin");
e.innerHTML = _("ntp dublin");
e = document.getElementById("manNTPSpain");
e.innerHTML = _("ntp spain");
e = document.getElementById("manNTPGermany");
e.innerHTML = _("ntp germany");
e = document.getElementById("manNTPSweden");
e.innerHTML = _("ntp sweden");
e = document.getElementById("manNTPCzechRepublic");
e.innerHTML = _("ntp czech republic");
e = document.getElementById("manNTPSlovenia");
e.innerHTML = _("ntp slovenia");
e = document.getElementById("manNTPSerbia");
e.innerHTML = _("ntp serbia");
e = document.getElementById("manNTPTunisia");
e.innerHTML = _("ntp tunisia");
e = document.getElementById("manNTPFinland");
e.innerHTML = _("ntp finland");
e = document.getElementById("manNTPGreece");
e.innerHTML = _("ntp greece");
e = document.getElementById("manNTPSouthAfrica");
e.innerHTML = _("ntp south africa");
e = document.getElementById("manNTPIraq");
e.innerHTML = _("ntp iraq");
e = document.getElementById("manNTPMoscowWinter");
e.innerHTML = _("ntp moscow winter");
e = document.getElementById("manNTPIran");
e.innerHTML = _("ntp iran");
e = document.getElementById("manNTPArmenia");
e.innerHTML = _("ntp armenia");
e = document.getElementById("manNTPArab");
e.innerHTML = _("ntp arab");
e = document.getElementById("manNTPAfghanistan");
e.innerHTML = _("ntp afghanistan");
e = document.getElementById("manNTPEkaterinburg");
e.innerHTML = _("ntp ekaterinburg");
e = document.getElementById("manNTPPakistan");
e.innerHTML = _("ntp pakistan");
e = document.getElementById("manNTPIndia");
e.innerHTML = _("ntp india");
e = document.getElementById("manNTPBangladesh");
e.innerHTML = _("ntp bangladesh");
e = document.getElementById("manNTPOmsk");
e.innerHTML = _("ntp omsk");
e = document.getElementById("manNTPThailand");
e.innerHTML = _("ntp thailand");
e = document.getElementById("manNTPKrasnoyarsk");
e.innerHTML = _("ntp krasnoyarsk");
e = document.getElementById("manNTPChinaCoast");
e.innerHTML = _("ntp chinacoast");
e = document.getElementById("manNTPTaipei");
e.innerHTML = _("ntp taipei");
e = document.getElementById("manNTPSingapore");
e.innerHTML = _("ntp singapore");
e = document.getElementById("manNTPIrkutsk");
e.innerHTML = _("ntp irkutsk");
e = document.getElementById("manNTPJapan");
e.innerHTML = _("ntp japan");
e = document.getElementById("manNTPKorean");
e.innerHTML = _("ntp korean");
e = document.getElementById("manNTPYakutsk");
e.innerHTML = _("ntp yakutsk");
e = document.getElementById("manNTPGuam");
e.innerHTML = _("ntp guam");
e = document.getElementById("manNTPVladivostok");
e.innerHTML = _("ntp vladivostok");
e = document.getElementById("manNTPSolomonIslands");
e.innerHTML = _("ntp solomon islands");
e = document.getElementById("manNTPMagadan");
e.innerHTML = _("ntp magadan");
e = document.getElementById("manNTPFiji");
e.innerHTML = _("ntp fiji");
e = document.getElementById("manNTPNewZealand");
e.innerHTML = _("ntp newzealand");
e = document.getElementById("manNTPAustraliaWA");
e.innerHTML = _("ntp australia wa");
e = document.getElementById("manNTPAustraliaEu");
e.innerHTML = _("ntp australia eu");
e = document.getElementById("manNTPAustraliaNA");
e.innerHTML = _("ntp australia na");
e = document.getElementById("manNTPAustraliaSA");
e.innerHTML = _("ntp australia sa");
e = document.getElementById("manNTPAustraliaQLD");
e.innerHTML = _("ntp australia qld");
e = document.getElementById("manNTPAustraliaNSW");
e.innerHTML = _("ntp australia nsw");
e = document.getElementById("manNTPAustraliaLH");
e.innerHTML = _("ntp australia lh");

e = document.getElementById("manNTPCurrentTime");
e.innerHTML = _("ntp current time");
e = document.getElementById("manNTPSyncWithHost");
e.value = _("ntp sync with host");
e = document.getElementById("manTimeUseBrowser");
e.innerHTML = _("ntp time use browser");
e = document.getElementById("manTimeUseNTP");
e.innerHTML = _("ntp time use ntp");
e = document.getElementById("manNTPServer");
e.innerHTML = _("ntp server");
e = document.getElementById("manUseDft");
e.value = _("use default ntp server");
e = document.getElementById("manNTPSync");
e.innerHTML = _("ntp sync");

e = document.getElementById("manNTPApply");
e.value = _("admin apply");
e = document.getElementById("manNTPCancel");
e.value = _("admin cancel");
}

function initValue()
{
//	tick();
var tz = "<% getCfgGeneral(1, "TZ", 1); %>";
var dateb = "<% getDATEBuilt(); %>";
var ntpsync = "<% getCfgGeneral(1, "NTPSync", 1); %>";
var ntpserver = "<% getCfgGeneral(1, "NTPServerIP", 1); %>";
var daylight = "<% getCfgGeneral(1, "DaylightSaving", 1); %>";

initTranslation();

if (dateb == "1")
{
document.getElementById("div_date").style.visibility = "visible";
document.getElementById("div_date").style.display = "";
document.NTP.ntpcurrenttime.disabled = false;
}
else
{
document.getElementById("div_date").style.visibility = "hidden";
document.getElementById("div_date").style.display = "none";
document.NTP.ntpcurrenttime.disabled = true;
}

setVle2Elmt(document.NTP.time_zone, tz, 0);

setVle2Elmt(document.NTP.NTPSync, ntpsync, 0);

if (ntpserver == "" )
document.NTP.useNtpTime[0].checked = true;
else
document.NTP.useNtpTime[1].checked = true;

if (daylight == "1")
document.NTP.daylight.checked = true;
else
document.NTP.daylight.checked = false;

useTimeSwitch();
syncWithHost();
}

Date.prototype.format = function(){
this.toUTCString().match(/^(\w{3}), (\d+) (\w{3}) (\d{4}) ([\d:]+) [A-Z]+$/);
var date = parseInt(RegExp.$2, 10);
return RegExp.$4 + ' ' + RegExp.$3 + ' ' + (date<10 ? ' '+date : date) + ' ' + RegExp.$1 + ' ' + RegExp.$5;
};

function tick(req)
{
var tmp = req.responseText.replace(/ +/g,"|");
var array = tmp.split("|");
var datestring = "";

array[4] = "GMT";
datestring = array.join(" ");
if (req.responseText) {
var org = datestring;
//var org = req.responseText;
d = new Date();
time = org;
time = Date.parse(org);
intertime = setInterval("time+=1000", 1000);
timeRefresh();
}
}

function timeRefresh(){
d.setTime(time);
document.NTP.ntpcurrenttime.value = d.format();
setTimeout(timeRefresh, 1000);
}

function useDft(){
document.NTP.NTPServerIP.value = "pool.ntp.org";
}

function getCurrTime(){
var currentTime = new Date();

var seconds = currentTime.getSeconds();
var minutes = currentTime.getMinutes();
var hours = currentTime.getHours();
var month = currentTime.getMonth() + 1;
var day = currentTime.getDate();
var year = currentTime.getFullYear();

var seconds_str = " ";
var minutes_str = " ";
var hours_str = " ";
var month_str = " ";
var day_str = " ";
var year_str = " ";

if(seconds < 10)
seconds_str = "0" + seconds;
else
seconds_str = ""+seconds;

if(minutes < 10)
minutes_str = "0" + minutes;
else
minutes_str = ""+minutes;

if(hours < 10)
hours_str = "0" + hours;
else
hours_str = ""+hours;

if(month < 10)
month_str = "0" + month;
else
month_str = ""+month;

if(day < 10)
day_str = "0" + day;
else
day_str = day;

return month_str + day_str + hours_str + minutes_str + year + "." + seconds_str + " ";
}

function syncWithHost()
{
var tmp = getCurrTime();
clearInterval(intertime);
loadXMLDoc("POST", "/goform/NTPSyncWithHost", tick, tmp);
}

function checkAllNum(str)
{
for (var i=0; i<str.length; i++) {
if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ))
continue;
return false;
}
return true;
}

</script>
</head>

<body onLoad="initValue()">
<table class="body">
<tr><td>
<h1 id="manNTPTitle">Time and Date</h1>
<hr size="1" />
<br />

<!-- ================= NTP Settings ================= -->
<form name="NTP" method="post" action="/goform/NTP">
<div>
<h2 id="manTimeInfo" class="title">Time Information</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr id="div_date">
<td class="head" id="manNTPCurrentTime">Current System Time</td>
<td>
<input size="32" name="ntpcurrenttime" type="text" readonly="1">
<input type="button" value="Inquire Time" id="manNTPSyncWithHost" name="manNTPSyncWithHost" onClick="syncWithHost()">
</td>
</tr>
</table>

<br />
<h2 id="manTimeSetting" class="title">Time Setting</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr>
<td class="head" colspan=2>
<input type="radio" name="useNtpTime" value="0" onClick="useTimeSwitch()" checked><span id="manTimeUseBrowser">Use Browser Time</span>
</td>
</tr>
<tr>
<td class="head" colspan=2>
<input type="radio" name="useNtpTime" value="1" onClick="useTimeSwitch()"><span id="manTimeUseNTP">Use NTP Client</span>
</td>
</tr>
<tr>
<td class="head" id="manNTPTimeZone" style="text-indent: 20px">Time Zone</td>
<td>
<select name="time_zone">
<option value="UCT_-11" id="manNTPMidIsland">(GMT-11:00) Midway Island, Samoa</option>
<option value="UCT_-10" id="manNTPHawaii">(GMT-10:00) Hawaii</option>
<option value="NAS_-09" id="manNTPAlaska">(GMT-09:00) Alaska</option>
<option value="PST_-08" id="manNTPPacific">(GMT-08:00) Pacific Time (US, Canada)</option>
<option value="PS1_-08" id="manNTPTijuana">(GMT-08:00) Mexico (Tijuana)</option>
<option value="MST_-07" id="manNTPMountain">(GMT-07:00) Mountain Time (US, Canada)</option>
<option value="MS1_-07" id="manNTPArizona">(GMT-07:00) Arizona</option>
<option value="CST_-06" id="manNTPCentral">(GMT-06:00) Central Time (US, Canada)</option>
<option value="UCT_-06" id="manNTPMidUS">(GMT-06:00) Middle America</option>
<option value="CS1_-06" id="manNTPHonduras">(GMT-06:00) Honduras, Mexico</option>
<option value="UCT_-05" id="manNTPIndianaEast">(GMT-05:00) Indiana East, Colombia, Ecuador, Peru</option>
<option value="EST_-05" id="manNTPEastern">(GMT-05:00) Eastern Time (US, Canada)</option>
<option value="AST_-04" id="manNTPAtlantic">(GMT-04:00) Atlantic Time, Brazil West</option>
<option value="UCT_-04" id="manNTPBolivia">(GMT-04:00) Bolivia, Chile, Venezuela</option>
<option value="GMT_-3:30" id="manNTPNewfoundland">(GMT-03:30) Canada (Newfoundland)</option>
<option value="UCT_-03" id="manNTPGuyana">(GMT-03:00) Argentina, Guyana</option>
<option value="EBS_-03" id="manNTPBrazilEast">(GMT-03:00) Brazil East, Greenland</option>
<option value="NOR_-02" id="manNTPMidAtlantic">(GMT-02:00) Mid-Atlantic</option>
<option value="EUT_-01" id="manNTPAzoresIslands">(GMT-01:00) Azores Islands, Cape Verde Islands</option>
<option value="UCT_000" id="manNTPGambia">(GMT) Gambia, Liberia, Morocco</option>
<option value="GMT_000" id="manNTPEngland">(GMT) England, Portugal</option>
<option value="GM1_000" id="manNTPDublin">(GMT) Greenwich Mean Time : Dublin</option>
<option value="MET_001" id="manNTPSpain">(GMT+01:00) Spain, France, Switzerland, Italy</option>
<option value="MEZ_001" id="manNTPGermany">(GMT+01:00) Germany, Netherlands, Belgium</option>
<option value="ME1_001" id="manNTPSweden">(GMT+01:00) Sweden, Denmark, Lithuania, Poland</option>
<option value="ME2_001" id="manNTPCzechRepublic">(GMT+01:00) Czech Republic, Austria, Slovakia, Hungary</option>
<option value="ME3_001" id="manNTPSlovenia">(GMT+01:00) Slovenia, Croatia, Bosnia Herzegovina</option>
<option value="ME4_001" id="manNTPSerbia">(GMT+01:00) Serbia, Macedonia, Bulgaria</option>
<option value="UCT_001" id="manNTPTunisia">(GMT+01:00) Tunisia</option>
<option value="GMT_002" id="manNTPFinland">(GMT+02:00) Finland, Estonia, Latvia, Belarus</option>
<option value="EET_002" id="manNTPGreece">(GMT+02:00) Greece, Romania, Ukraine, Turkey</option>
<option value="SAS_002" id="manNTPSouthAfrica">(GMT+02:00) Egypt, South Africa, Zimbabwe</option>
<option value="IST_003" id="manNTPIraq">(GMT+03:00) Iraq, Jordan, Kuwait, Saudi Arabia</option>
<option value="GMT_003" id="manNTPIran">(GMT+03:00) Iran, Kenya</option>
<option value="MSK_004" id="manNTPMoscowWinter">(GMT+04:00) Moscow</option>
<option value="UCT_004" id="manNTPArmenia">(GMT+04:00) Armenia, Azerbaijan, Georgia</option>
<option value="UC1_004" id="manNTPArab">(GMT+04:00) United Arab Emirates, Oman</option>
<option value="UCT_4:30" id="manNTPAfghanistan">(GMT+04:30) Afghanistan</option>
<option value="UCT_005" id="manNTPPakistan">(GMT+05:00) Pakistan, Uzbekistan</option>
<option value="GMT_005" id="manNTPEkaterinburg">(GMT+05:00) Russia (Ekaterinburg)</option>
<option value="UCT_5:30" id="manNTPIndia">(GMT+05:30) India</option>
<option value="UCT_006" id="manNTPBangladesh">(GMT+06:00) Bangladesh, Sri Lanka, Kazakhstan</option>
<option value="GMT_006" id="manNTPOmsk">(GMT+06:00) Russia (Omsk)</option>
<option value="UCT_007" id="manNTPThailand">(GMT+07:00) Thailand, Indonesia, Vietnam</option>
<option value="GMT_007" id="manNTPKrasnoyarsk">(GMT+07:00) Russia (Krasnoyarsk)</option>
<option value="CST_008" id="manNTPChinaCoast">(GMT+08:00) China Coast, Hong Kong</option>
<option value="CCT_008" id="manNTPTaipei">(GMT+08:00) Taipei</option>
<option value="SST_008" id="manNTPSingapore">(GMT+08:00) Singapore</option>
<option value="AWS_008" id="manNTPAustraliaWA">(GMT+08:00) Australia (WA/Perth)</option>
<option value="GMT_008" id="manNTPIrkutsk">(GMT+08:00) Russia (Irkutsk)</option>
<option value="ACWS_8:45" id="manNTPAustraliaEu">(GMT+08:45) Australia (Eucla)</option>
<option value="JST_009" id="manNTPJapan">(GMT+09:00) Japan, Korea</option>
<option value="KST_009" id="manNTPKorean">(GMT+09:00) Korean</option>
<option value="GMT_009" id="manNTPYakutsk">(GMT+09:00) Russia (Yakutsk)</option>
<option value="ACS_9:30" id="manNTPAustraliaNA">(GMT+09:30) Australia (NA/Darwin)</option>
<option value="ACSDST_9:30" id="manNTPAustraliaSA">(GMT+09:30) Australia (SA/Adelaide/Broken Hill)</option>
<option value="UCT_010" id="manNTPGuam">(GMT+10:00) Guam, Papua New Guinea</option>
<option value="AES_010" id="manNTPAustraliaQLD">(GMT+10:00) Australia (Queensland/Brisbane/Lindeman)</option>
<option value="AESDST_010" id="manNTPAustraliaNSW">(GMT+10:00) Australia (NSW/ACT/Canberra/Melbourne/Sydney/Hobart)</option>
<option value="GMT_010" id="manNTPVladivostok">(GMT+10:00) Russia (Vladivostok)</option>
<option value="ALHSDST_10:30" id="manNTPAustraliaLH">(GMT+10:30) Australia (Lord Howe Island)</option>
<option value="UCT_011" id="manNTPSolomonIslands">(GMT+11:00) Solomon Islands, New Caledonia</option>
<option value="GMT_011" id="manNTPMagadan">(GMT+11:00) Russia (Magadan)</option>
<option value="UCT_012" id="manNTPFiji">(GMT+12:00) Fiji, Marshall Islands</option>
<option value="NZS_012" id="manNTPNewZealand">(GMT+12:00) New Zealand</option>
</select>
</td>
</tr>
<tr>
<td class="head" id="manNTPServer" style="text-indent: 20px">NTP Server</td>
<td><input size="32" maxlength="64" name="NTPServerIP" value="<% getCfgGeneral(1, "NTPServerIP", 0); %>" type="text">
<input type="button" value="Use Default" id="manUseDft" onClick="useDft()">
</td>
</tr>
<tr>
<td class="head" id="daylightSaving" style="text-indent: 20px"><span id="daylights">Daylight Saving</span></td>
<td><input type="checkbox" id="daylight" name="daylight"></td>
</tr>
<tr>
<td class="head" id="manNTPSync" style="text-indent: 20px">NTP synchronization</td>
<td>
<select name="NTPSync">
<option value="30" id="sec">30 sec</option>
<option value="60" id="min">1 min</option>
<option value="180" id="min1">3 min</option>
<option value="300" id="min2">5 min</option>
<option value="600" id="min3">10 min</option>
<option value="1800" id="min4">30 min</option>
<option value="3600" id="hour">1 hour</option>
<option value="10800" id="hour1">3 hour</option>
<option value="18000" id="hour2">5 hour</option>
<option value="86400" id="day">1 day</option>
<option value="259200" id="day1">3 day</option>
<option value="432000" id="day2">5 day</option>
</select>
</td>
</tr>
</table>

<br />
<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="center">
<td>
<input type="hidden" name="brwsTime">
<input type=submit class="btnw" value="OK" id="manNTPApply" onClick="return NTPFormCheck()"> &nbsp; &nbsp;
<input type=reset  class="btnw" value="Cancel"id="manNTPCancel" onClick="window.location.reload()">
</td>
</tr>
</table>
</div>
</form>

</td></tr>
</table>

</body>
</html>