<html>
<head>
<title>Wireless AP Discovery Statistics</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

function initTranslation()
{
var e = document.getElementById("apChartTitle");
e.innerHTML = _("parent wireless lan")+" >> "+_("scan ap chart title");

}

function initValue()
{
var e = document.getElementById("recCh");
e.innerHTML = "&nbsp;&nbsp; " + document.frm1.minCh.value;
}

function PageInit()
{
initTranslation();
initValue();
}
</script>
</head>

<body onload="PageInit()">
<table class="body">
<tr><td>
<h1 id="apChartTitle">AP Discovery Channel Statistics</h1>
<hr size="1" />
<br />

<form name="frm1">
<div>

<table border="0">
<tr>
<td class="title">Recommended channels for usage:</td>
<td id="recCh"></td>
</tr>
</table>
<br><br>
<table align="center" border="0">
<tr align="center">
<td class="title">AP number v.s. Channel</td>
</tr>
</table>
<table align="center" border="1" >
<tr>
<td>
<% getApChannelStatistics(); %>
</td>
</tr>
</table>
<table align="center" border="0">
<tr align="center">
<td class="title">Channel</td>
</tr>
</table>
<br><br>
<table align="center" border="0">
<tr align="center">
<td><input type="button" class="btnw" value="Back" onclick="document.location = 'ap_discovery.asp';"></td>
</tr>
</table>

</div>
</form>

</td></tr>
</table>

</body>
