<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>VigorAP 800 Menu</title>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/dtree/menu.css" type="text/css" />
<script type="text/javascript" src="/dtree/menu.js"></script>
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript">
var isFimwareUpload = 0;
Butterlate.setTextDomain("main");

function initTranslation()
{
var e = document.getElementById("all_right_reserved");
e.innerHTML = _("treeapp all right reserved");
}

function setUnderFirmwareUpload(flag)
{
isFimwareUpload = flag;
}

function go(zz)
{
if(!isFimwareUpload)
parent.view.location = zz;
}
</script>
</head>

<body onload="initTranslation()">
<table id="menu" summary="Main navigation menu">
<tr><td>
<ul class="level0">
<script type="text/javascript">
var opmode = '<% getCfgZero(1, "OperationMode"); %>';
var ap800_mode = "<% getCfgGeneral(1, "800_ap_mode"); %>";
var dhcpen = '<% getCfgZero(1, "dhcpEnabled"); %>';
var dhcpen2 = <% getCfgZero(1, "dhcp2Enabled"); %>;
var dpbsta = '<% getDpbSta(); %>';
var ethconv = '<% getCfgZero(1, "ethConvert"); %>';
var wdsb = '<% getWDSBuilt(); %>';
var wscb = '<% getWSCBuilt(); %>';
var syslogb = '<% getSysLogBuilt(); %>';
var wl_5g = '<% get5GExist(); %>';

addSubNode("wizard",   null, _("treeapp quick wizard"),         "javascript:go('adm/wizard1.asp');");
addSubNode("online",   null, _("treeapp online status"),        "javascript:go('online.asp');");
addNode("br", _("treeapp br"));

addSubNode("opmode",   null, _("treeapp operation mode"),       "javascript:go('opmode.asp');");
addNode("lan", _("treeapp lan"));
addSubNode("lan_setup",    "lan", _("treeapp general setup"),   "javascript:go('internet/lan.asp');");
if (opmode != '0') {
//addSubNode("lan_strt", "lan", _("treeapp static route"),    "javascript:go('internet/routing.asp');");
}
addNode("cam", _("treeapp cam"));
addSubNode("cam_setup",    "cam", _("treeapp general setup"),   "javascript:go('internet/camgeset.asp');");
addSubNode("cam_funspl",    "cam", _("treeapp fun support list"),   "javascript:go('internet/camfunspl.asp');");

if ((opmode == '0' && dpbsta == '1' && ethconv == '1') || opmode == '2')
{
addNode("wl", _("treeapp wireless lan"));
if (opmode == '2')
addSubNode("wl_basic",   "wl", _("treeapp basic"),            "javascript:go('wireless/basic_si.asp');");
// addSubNode("wl_profile", "wl", _("treeapp profile"),          "javascript:go('station/profile.asp');");
// addSubNode("wl_link",    "wl", _("treeapp link status"),      "javascript:go('station/link_status.asp');");
addSubNode("wl_sitesur", "wl", _("treeapp site survey"),      "javascript:go('station/site_survey.asp');");
addSubNode("wl_stat",    "wl", _("treeapp statistics"),       "javascript:go('station/statistics.asp');");
// addSubNode("wl_adv",     "wl", _("treeapp advance"),          "javascript:go('station/advance.asp');");
if (opmode != '2') {
addSubNode("wl_qos",     "wl", _("treeapp qos"),              "javascript:go('station/qos.asp');");
addSubNode("wl_11n",     "wl", _("treeapp 11n configurations"),  "javascript:go('station/11n_cfg.asp');");
addSubNode("wl_about",   "wl", _("treeapp about"),            "javascript:go('station/about.asp');");
}
if ((opmode == '0' && (ap800_mode== '0' || ap800_mode == '3')) || (opmode == '3'))
addSubNode("wl_adv",     "wl", _("treeapp wmm"),              "javascript:go('wireless/wmm.asp');");
if (wscb == "1")
addSubNode("wl_wps", "wl", _("treeapp wps"),              "javascript:go('wps/wps_sta.asp');");
}
else
{
addNode("wl", _("treeapp wireless lan"));
addSubNode("wl_basic",   "wl", _("treeapp basic"),            "javascript:go('wireless/basic.asp');");
if (ap800_mode != '1' && ap800_mode != '2') {
addSubNode("wl_secur",   "wl", _("treeapp security"),         "javascript:go('wireless/security.asp');");
addSubNode("wl_access",  "wl", _("treeapp access"),           "javascript:go('wireless/access.asp');");
if (wscb == "1")
addSubNode("wl_wps",    "wl", _("treeapp wps"),           "javascript:go('wps/wps.asp');");
}
addSubNode("wl_apdis",   "wl", _("treeapp ap discovery"),     "javascript:go('wireless/ap_discovery.asp');");
if (opmode == '0' && ap800_mode != '0')
addSubNode("wl_wdsstatus",  "wl", _("treeapp wds status"),           "javascript:go('wireless/ap_wds_status.asp');");
if (opmode == '3')
addSubNode("wl_apcli",  "wl", _("treeapp universal repeater"),     "javascript:go('wireless/apcli.asp');");
if ((opmode == '0' && (ap800_mode== '0' || ap800_mode == '3')) || (opmode == '3'))
addSubNode("wl_adv",     "wl", _("treeapp wmm"),              "javascript:go('wireless/wmm.asp');");
if (ap800_mode != '1' && ap800_mode != '2') {
addSubNode("wl_stainfo", "wl", _("treeapp station list"),     "javascript:go('wireless/stainfo.asp');");
addSubNode("wl_bandwidth", "wl", _("treeapp bandwidth management"),     "javascript:go('wireless/bandwidth_limit.asp');");
}
}

addNode("wl_5g", _("treeapp wireless lan 5g"));
addSubNode("wl_basic_5g",   "wl_5g", _("treeapp basic"),            "javascript:go('wireless/basic_5g.asp');");
addSubNode("wl_secur_5g",   "wl_5g", _("treeapp security"),         "javascript:go('wireless/security_5g.asp');");
addSubNode("wl_access_5g",   "wl_5g", _("treeapp access"),          "javascript:go('wireless/access_5g.asp');");
addSubNode("wl_apdis_5g",   "wl_5g", _("treeapp ap discovery"),     "javascript:go('wireless/ap_discovery_5g.asp');");
addSubNode("wl_stainfo_5g",   "wl_5g", _("treeapp station list"),   "javascript:go('wireless/stainfo_5g.asp');");
addSubNode("wl_bandwidth_5g", "wl_5g", _("treeapp bandwidth management"),     "javascript:go('wireless/bandwidth_limit_5g.asp');");

addSubNode("radsv", null, _("treeapp radius server"), "javascript:go('wireless/radius_serv.asp');");

addNode("app", _("treeapp applications"));
addSubNode("app_schedule", "app", _("treeapp schedule"),  "javascript:go('adm/sched.asp');");
addSubNode("app_keepalive", "app", _("treeapp ioskeepalive"),  "javascript:go('adm/keep_alive.asp');");

addNode("sys", _("treeapp system maintenance"));
addSubNode("sys_status",     "sys", _("treeapp system status"),                "javascript:go('adm/sys.asp');");
addSubNode("sys_tr069",      "sys", _("treeapp tr069"),                		   "javascript:go('adm/tr069.asp');");
addSubNode("sys_admpass",    "sys", _("treeapp administration password"),      "javascript:go('adm/adminpwd.asp');");
addSubNode("sys_backup",     "sys", _("treeapp configuration backup"),         "javascript:go('adm/cfgbackup.asp');");
addSubNode("sys_date",       "sys", _("treeapp time/date"),                "javascript:go('adm/time.asp');");
//if (opmode != '0') {
//	addSubNode("sys_date",       "sys", _("treeapp time/date"),                    "javascript:go('adm/time.asp');");
//}
addSubNode("sys_mgt",     "sys", _("treeapp management"),                   "javascript:go('adm/management.asp');");
addSubNode("sys_reboot",     "sys", _("treeapp reboot system"),                "javascript:go('adm/reboot.asp');");
addSubNode("sys_fwup",       "sys", _("treeapp firmware upgrade"),             "javascript:go('adm/upload_firmware.asp');");

//if(syslogb == "1" || dhcpen == "1" || dhcpen2 == 1) {
addNode("diag", _("treeapp diagnostics"));
if (syslogb == "1")
addSubNode("diag_log",   "diag", _("treeapp system log"),              "javascript:go('adm/syslog.asp');");
if (dhcpen == "1" || dhcpen2 == 1)
addSubNode("diag_dhcp",  "diag", _("treeapp dhcp table"),              "javascript:go('internet/dhcpcliinfo.asp');");
addSubNode("diag_speed",     "diag", _("treeapp speed test"),      			"javascript:go('test.asp');");
//}

addSupportNode("suuport_br",         "<br />",                               "#");
addSupportNode("suuport_area",       _("treeapp support area"),              "#");
addSupportNode("suuport_appnote",    _("treeapp application note"),          "javascript:void(window.open('http://www.draytek.com.tw/index.php?option=com_k2&view=itemlist&layout=category&task=&id=&Itemid=293&lang=en'));");
addSupportNode("suuport_reg",        _("treeapp product registration"),      "javascript:go('adm/reg.asp');");
MenuLoad();
</script>

</ul>
</td></tr>
</table>
<table border="0" align="center" cellspacing="0" cellpadding="0">
<tr align="center">
<td valign="bottom" colspan="2">
<font id="all_right_reserved" face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">All Rights Reserved.</font>
</td>
</tr>
</table>
</body>

</html>