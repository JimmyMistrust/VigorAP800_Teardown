<html>
<head>
<title>Speed Test</title>
<link rel="stylesheet" href="style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/dtree/ajax.js"></script>
</head>

<body onload="updatedata()">
<table class="body">
<tr><td>
<h1 id="iTitle">Speed Test</h1>
<hr size="1" />
<br />

<h2 id="speedtitle" class="title">Speed Test</h2>
<table width="100%" cellpadding="2" cellspacing="1" class="config">
<tr><td>Test Result:</td></tr>
<tr><td>Download Speed : <span id="dSpeed"></span></td></tr>
<tr><td>
<table height='2' width='300' cellspacing='0'>
<td bgColor='#CC0000' id="download_per"></td><td bgColor=#FF6666>&nbsp;</td></tr>
</table>
</td></tr>
<tr><td>Upload Speed : <span id="uSpeed"></span></td></tr>
<tr><td>
<table height='2' width='300' cellspacing='0'>
<td bgColor='#CC0000' id="upload_per"></td><td bgColor=#FF6666>&nbsp;</td></tr>
</table>
</td></tr>
</table>

</td></tr>
</table>
</body>
</html>
<script>
Butterlate.setTextDomain("admin");
var time;
var starttime, endtime;
var unit = "Kbps";

function updatedata()
{
time          = new Date();
uEndtime   	  = time.getTime();

uTime = (uEndtime-parent.uStarttime)/1000;
rate = (parent.filelen)*8/uTime;

if (parseInt(rate/1024) > 1) {
unit = "Mbps";
rate = Math.round((rate/1024)*100)/100;
}

initTranslation();
document.getElementById("dSpeed").innerHTML = "<font color=blue>" + parent.drate + parent.dunit + "</font>";
document.getElementById("uSpeed").innerHTML = "<font color=blue>" +rate + unit+ "</font>";


document.getElementById("download_per").width = parseInt(parent.drate)*3;
document.getElementById("download_per").innerHTML = "<font color=white>" + parseInt(parent.drate) +"%</font>";
document.getElementById("upload_per").width = parseInt(rate)*3;
document.getElementById("upload_per").innerHTML = "<font color=white>" + parseInt(rate) +"%</font>";
}

function initTranslation()
{
var e = document.getElementById("iTitle");
e.innerHTML = _("parent diagonostics")+" >> "+_("speed test");

e = document.getElementById("speedtitle");
e.innerHTML = _("speed test");
}
</script>