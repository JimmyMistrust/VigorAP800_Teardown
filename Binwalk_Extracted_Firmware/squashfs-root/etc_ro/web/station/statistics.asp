<html>
<head>
<title>Wireless Station Statistics</title>
<meta http-equiv="refresh" content="3; URL=./statistics.asp">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

function initTranslation()
{
var e = document.getElementById("statisticTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("statistic title");

e = document.getElementById("statisticTx");
e.innerHTML = _("statistic tx");
e = document.getElementById("statisticRx");
e.innerHTML = _("statistic rx");
e = document.getElementById("statisticResetCounter");
e.value = _("statistic reset counter");
}

function PageInit()
{
initTranslation();
}
</script>
<style type="text/css">
td.head {
width: 50%;
}
</style>
</head>

<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="statisticTitle">Station Statistics</h1>
<hr size="1" />
<br />

<form method=post name="sta_statistics" action="/goform/resetStaCounters">
<h2 id="statisticTx" class="title">Transmit Statistics</h2>
<table width="100%" cellpadding="2" cellspacing="1" border="1">
<% getStaStatsTx(); %>
<tr>
<td class="head">Frames Received With CRC Error </td>
<td><% getStaStatsRxCRCErr(); %></td>
</tr>

<tr>
<td class="head">Frames Dropped Due To Out-of-Resource</td>
<td><% getStaStatsRxNoBuf(); %></td>
</tr>

<tr>
<td class="head">Duplicate Frames Received </td>
<td><% getStaStatsRxDup(); %></td>
</tr>
</table>
<input type=hidden name=dummyData value="1">

<br />
<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="center"><td>
<input type="submit" value="Reset Counters" id="statisticResetCounter">
</td></tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>
