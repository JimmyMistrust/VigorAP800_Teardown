<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>VigorAP 800</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script language="JavaScript" type="text/javascript">
function initLanguage()
{
var lang = "<% getCfgGeneral(1, "Language"); %>";
var cook = "en";
var lang_en = "<% getLangBuilt("en"); %>";
var lang_zhtw = "<% getLangBuilt("zhtw"); %>";
var lang_zhcn = "<% getLangBuilt("zhcn"); %>";

if (document.cookie.length > 0) {
var s = document.cookie.indexOf("language=");
var e = document.cookie.indexOf(";", s);
if (s != -1) {
if (e == -1)
cook = document.cookie.substring(s+9);
else
cook = document.cookie.substring(s+9, e);
}
}

if (lang == "en") {
document.cookie="language=en; path=/";
if (cook != lang)
window.location.reload();
if (lang_en != "1") {
if (lang_zhtw == "1") {
document.cookie="language=zhtw; path=/";
window.location.reload();
}
else if (lang_zhcn == "1") {
document.cookie="language=zhcn; path=/";
window.location.reload();
}
}
}
else if (lang == "zhtw") {
document.cookie="language=zhtw; path=/";
if (cook != lang)
window.location.reload();
if (lang_zhtw != "1") {
if (lang_en == "1") {
document.cookie="language=en; path=/";
window.location.reload();
}
else if (lang_zhcn == "1") {
document.cookie="language=zhcn; path=/";
window.location.reload();
}
}
}
else if (lang == "zhcn") {
document.cookie="language=zhcn; path=/";
if (cook != lang)
window.location.reload();
if (lang_zhcn != "1") {
if (lang_en == "1") {
document.cookie="language=en; path=/";
window.location.reload();
}
else if (lang_zhtw == "1") {
document.cookie="language=zhtw; path=/";
window.location.reload();
}
}
}
}

function onInit()
{
initLanguage();
<% FirmwareUpgradePostASP(); %>
}
</script>
</head>

<frameset rows="97, *" border="0" framespacing="0" frameborder="no" onLoad="onInit()">
<frame src="header.asp" name="header" noresize scrolling="no">
<frameset cols="208, *" border="0" framespacing="0" frameborder="no">
<frameset rows="0, 30, *, 40" border="0" framespacing="0" frameborder="0">
<frame src="wiz_var.asp" name="wizard" noresize scrolling="no">
<frame src="l_m.asp" name="fimage" noresize scrolling="no">
<frame src="treeapp.asp" name="menu" marginwidth="0" marginheight="0" frameborder="no" scrolling="auto">
<frame src="act_sta.asp" name="act_sta" noresize scrolling="no">
</frameset>
<frame src="adm/sys.asp" name="view" marginwidth="0" topmargin="0" marginheight="0" frameborder="no" scrolling="auto">
</frameset>
</frameset>
<noframes>
<body bgcolor="#FFFFFF">Your browser does not handle frames!</body>
</noframes>

</html>