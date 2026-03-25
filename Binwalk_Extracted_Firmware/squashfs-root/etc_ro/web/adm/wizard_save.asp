<html>
<head>
<title>Quick Start Wizard Save</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" Content="No-cach">
<meta http-equiv="Expires" Content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

var w = parent.wizard;

function onClkBtnCcl()
{
if(confirm(_("wiz cancel confirm"))) {
parent.location = "/home.asp";
}
}

function submit_form()
{
var frmSubmit = document.wizardSetup;

frmSubmit[1].value = "";
frmSubmit[2].value = "";
frmSubmit[3].value = w.wOpmode;
frmSubmit[4].value = w.wWirelessmode;
frmSubmit[5].value = w.wSsidSubEn;
frmSubmit[6].value = w.wSsid1;
frmSubmit[7].value = w.wSsid2;
frmSubmit[8].value = w.wSsid3;
frmSubmit[9].value = w.wSsid4;
frmSubmit[10].value = w.wSsid_vlan1;
frmSubmit[11].value = w.wSsid_vlan2;
frmSubmit[12].value = w.wSsid_vlan3;
frmSubmit[13].value = w.wSsid_vlan4;
frmSubmit[14].value = w.wChannel;
frmSubmit[15].value = w.wChnExt;

frmSubmit[16].value = w.wWdsPhyMode;
frmSubmit[17].value = w.wWdsEncryType;
frmSubmit[18].value = w.wWdsVlan0;
frmSubmit[19].value = w.wWdsVlan1;
frmSubmit[20].value = w.wWdsVlan2;
frmSubmit[21].value = w.wWdsVlan3;
frmSubmit[22].value = w.wWdsKey0;
frmSubmit[23].value = w.wWdsKey1;
frmSubmit[24].value = w.wWdsKey2;
frmSubmit[25].value = w.wWdsKey3;
frmSubmit[26].value = w.wWdsMacList;

frmSubmit[27].value = w.wURSsid;
frmSubmit[28].value = w.wURBSsid;
frmSubmit[29].value = w.wURMode;
frmSubmit[30].value = w.wUREnc;
frmSubmit[31].value = w.wURKeyid;
frmSubmit[32].value = w.wURWpapsk;
frmSubmit[33].value = w.wURKey1;
frmSubmit[34].value = w.wURKey2;
frmSubmit[35].value = w.wURKey3;
frmSubmit[36].value = w.wURKey4;
frmSubmit[37].value = w.wURKey1Type;
frmSubmit[38].value = w.wURKey2Type;
frmSubmit[39].value = w.wURKey3Type;
frmSubmit[40].value = w.wURKey4Type;

frmSubmit[41].value = w.wProfName;
frmSubmit[42].value = w.wProfSsid;
frmSubmit[43].value = w.wProfNetTyp;
frmSubmit[44].value = w.wProfPowerMd;
frmSubmit[45].value = w.wProfChn;
frmSubmit[46].value = w.wProfPremable;
frmSubmit[47].value = w.wProfRtsEn;
frmSubmit[48].value = w.wProfRtsVal;
frmSubmit[49].value = w.wProfFragement;
frmSubmit[50].value = w.wProfFragVal;
frmSubmit[51].value = w.wProfSecMode;
frmSubmit[52].value = w.wProfWepKeyLen;
frmSubmit[53].value = w.wProfWepKeyMth;
frmSubmit[54].value = w.wProfWepKey1;
frmSubmit[55].value = w.wProfWepKey2;
frmSubmit[56].value = w.wProfWepKey3;
frmSubmit[57].value = w.wProfWepKey4;
frmSubmit[58].value = w.wProfDefKey;
frmSubmit[59].value = w.wProfWpaCiper;
frmSubmit[60].value = w.wProfWpaPass;

frmSubmit[61].value = w.wWirelessmode_5g;
frmSubmit[62].value = w.wSsid1_5g;
frmSubmit[63].value = w.wSsid2_5g;
frmSubmit[64].value = w.wSsid3_5g;
frmSubmit[65].value = w.wSsid_vlan1_5g;
frmSubmit[66].value = w.wSsid_vlan2_5g;
frmSubmit[67].value = w.wSsid_vlan3_5g;
frmSubmit[68].value = w.wChannel_5g;
frmSubmit[69].value = w.wChnExt_5g;
frmSubmit[70].value = w.wMSsidNum;
frmSubmit[71].value = w.wMSsidNum_5g;

frmSubmit[72].value = w.wWLSecMode[0];
frmSubmit[73].value = w.wCipher[0];
frmSubmit[74].value = w.wPassphrase[0];
frmSubmit[75].value = w.wKeyRenewalInterval[0];
frmSubmit[76].value = w.wPMKCachePeriod[0];
frmSubmit[77].value = w.wPreAuthentication[0];
frmSubmit[78].value = w.wWep_default_key[0];
frmSubmit[79].value = w.wWep_key_1[0];
frmSubmit[80].value = w.wWep_key_2[0];
frmSubmit[81].value = w.wWep_key_3[0];
frmSubmit[82].value = w.wWep_key_4[0];
frmSubmit[83].value = w.wWEP1Select[0];
frmSubmit[84].value = w.wWEP2Select[0];
frmSubmit[85].value = w.wWEP3Select[0];
frmSubmit[86].value = w.wWEP4Select[0];
frmSubmit[87].value = w.wIeee8021x_wep[0];
frmSubmit[88].value = w.wRadiusServerIP[0];
frmSubmit[89].value = w.wRadiusServerPort[0];
frmSubmit[90].value = w.wRadiusServerSecret[0];
frmSubmit[91].value = w.wRadiusServerSessionTimeout[0];

frmSubmit[92].value = w.wWLSecMode[1];
frmSubmit[93].value = w.wCipher[1];
frmSubmit[94].value = w.wPassphrase[1];
frmSubmit[95].value = w.wKeyRenewalInterval[1];
frmSubmit[96].value = w.wPMKCachePeriod[1];
frmSubmit[97].value = w.wPreAuthentication[1];
frmSubmit[98].value = w.wWep_default_key[1];
frmSubmit[99].value = w.wWep_key_1[1];
frmSubmit[100].value = w.wWep_key_2[1];
frmSubmit[101].value = w.wWep_key_3[1];
frmSubmit[102].value = w.wWep_key_4[1];
frmSubmit[103].value = w.wWEP1Select[1];
frmSubmit[104].value = w.wWEP2Select[1];
frmSubmit[105].value = w.wWEP3Select[1];
frmSubmit[106].value = w.wWEP4Select[1];
frmSubmit[107].value = w.wIeee8021x_wep[1];
frmSubmit[108].value = w.wRadiusServerIP[1];
frmSubmit[109].value = w.wRadiusServerPort[1];
frmSubmit[110].value = w.wRadiusServerSecret[1];
frmSubmit[111].value = w.wRadiusServerSessionTimeout[1];

frmSubmit[112].value = w.wWLSecMode[2];
frmSubmit[113].value = w.wCipher[2];
frmSubmit[114].value = w.wPassphrase[2];
frmSubmit[115].value = w.wKeyRenewalInterval[2];
frmSubmit[116].value = w.wPMKCachePeriod[2];
frmSubmit[117].value = w.wPreAuthentication[2];
frmSubmit[118].value = w.wWep_default_key[2];
frmSubmit[119].value = w.wWep_key_1[2];
frmSubmit[120].value = w.wWep_key_2[2];
frmSubmit[121].value = w.wWep_key_3[2];
frmSubmit[122].value = w.wWep_key_4[2];
frmSubmit[123].value = w.wWEP1Select[2];
frmSubmit[124].value = w.wWEP2Select[2];
frmSubmit[125].value = w.wWEP3Select[2];
frmSubmit[126].value = w.wWEP4Select[2];
frmSubmit[127].value = w.wIeee8021x_wep[2];
frmSubmit[128].value = w.wRadiusServerIP[2];
frmSubmit[129].value = w.wRadiusServerPort[2];
frmSubmit[130].value = w.wRadiusServerSecret[2];
frmSubmit[131].value = w.wRadiusServerSessionTimeout[2];

frmSubmit[132].value = w.wWLSecMode[3];
frmSubmit[133].value = w.wCipher[3];
frmSubmit[134].value = w.wPassphrase[3];
frmSubmit[135].value = w.wKeyRenewalInterval[3];
frmSubmit[136].value = w.wPMKCachePeriod[3];
frmSubmit[137].value = w.wPreAuthentication[3];
frmSubmit[138].value = w.wWep_default_key[3];
frmSubmit[139].value = w.wWep_key_1[3];
frmSubmit[140].value = w.wWep_key_2[3];
frmSubmit[141].value = w.wWep_key_3[3];
frmSubmit[142].value = w.wWep_key_4[3];
frmSubmit[143].value = w.wWEP1Select[3];
frmSubmit[144].value = w.wWEP2Select[3];
frmSubmit[145].value = w.wWEP3Select[3];
frmSubmit[146].value = w.wWEP4Select[3];
frmSubmit[147].value = w.wIeee8021x_wep[3];
frmSubmit[148].value = w.wRadiusServerIP[3];
frmSubmit[149].value = w.wRadiusServerPort[3];
frmSubmit[150].value = w.wRadiusServerSecret[3];
frmSubmit[151].value = w.wRadiusServerSessionTimeout[3];

frmSubmit[152].value = w.wWLSecMode_5g[0];
frmSubmit[153].value = w.wCipher_5g[0];
frmSubmit[154].value = w.wPassphrase_5g[0];
frmSubmit[155].value = w.wKeyRenewalInterval_5g[0];
frmSubmit[156].value = w.wPMKCachePeriod_5g[0];
frmSubmit[157].value = w.wPreAuthentication_5g[0];
frmSubmit[158].value = w.wWep_default_key_5g[0];
frmSubmit[159].value = w.wWep_key_1_5g[0];
frmSubmit[160].value = w.wWep_key_2_5g[0];
frmSubmit[161].value = w.wWep_key_3_5g[0];
frmSubmit[162].value = w.wWep_key_4_5g[0];
frmSubmit[163].value = w.wWEP1Select_5g[0];
frmSubmit[164].value = w.wWEP2Select_5g[0];
frmSubmit[165].value = w.wWEP3Select_5g[0];
frmSubmit[166].value = w.wWEP4Select_5g[0];
frmSubmit[167].value = w.wIeee8021x_wep_5g[0];
frmSubmit[168].value = w.wRadiusServerIP_5g[0];
frmSubmit[169].value = w.wRadiusServerPort_5g[0];
frmSubmit[170].value = w.wRadiusServerSecret_5g[0];
frmSubmit[171].value = w.wRadiusServerSessionTimeout_5g[0];

frmSubmit[172].value = w.wWLSecMode_5g[1];
frmSubmit[173].value = w.wCipher_5g[1];
frmSubmit[174].value = w.wPassphrase_5g[1];
frmSubmit[175].value = w.wKeyRenewalInterval_5g[1];
frmSubmit[176].value = w.wPMKCachePeriod_5g[1];
frmSubmit[177].value = w.wPreAuthentication_5g[1];
frmSubmit[178].value = w.wWep_default_key_5g[1];
frmSubmit[179].value = w.wWep_key_1_5g[1];
frmSubmit[180].value = w.wWep_key_2_5g[1];
frmSubmit[181].value = w.wWep_key_3_5g[1];
frmSubmit[182].value = w.wWep_key_4_5g[1];
frmSubmit[183].value = w.wWEP1Select_5g[1];
frmSubmit[184].value = w.wWEP2Select_5g[1];
frmSubmit[185].value = w.wWEP3Select_5g[1];
frmSubmit[186].value = w.wWEP4Select_5g[1];
frmSubmit[187].value = w.wIeee8021x_wep_5g[1];
frmSubmit[188].value = w.wRadiusServerIP_5g[1];
frmSubmit[189].value = w.wRadiusServerPort_5g[1];
frmSubmit[190].value = w.wRadiusServerSecret_5g[1];
frmSubmit[191].value = w.wRadiusServerSessionTimeout_5g[1];

frmSubmit[192].value = w.wWLSecMode_5g[2];
frmSubmit[193].value = w.wCipher_5g[2];
frmSubmit[194].value = w.wPassphrase_5g[2];
frmSubmit[195].value = w.wKeyRenewalInterval_5g[2];
frmSubmit[196].value = w.wPMKCachePeriod_5g[2];
frmSubmit[197].value = w.wPreAuthentication_5g[2];
frmSubmit[198].value = w.wWep_default_key_5g[2];
frmSubmit[199].value = w.wWep_key_1_5g[2];
frmSubmit[200].value = w.wWep_key_2_5g[2];
frmSubmit[201].value = w.wWep_key_3_5g[2];
frmSubmit[202].value = w.wWep_key_4_5g[2];
frmSubmit[203].value = w.wWEP1Select_5g[2];
frmSubmit[204].value = w.wWEP2Select_5g[2];
frmSubmit[205].value = w.wWEP3Select_5g[2];
frmSubmit[206].value = w.wWEP4Select_5g[2];
frmSubmit[207].value = w.wIeee8021x_wep_5g[2];
frmSubmit[208].value = w.wRadiusServerIP_5g[2];
frmSubmit[209].value = w.wRadiusServerPort_5g[2];
frmSubmit[210].value = w.wRadiusServerSecret_5g[2];
frmSubmit[211].value = w.wRadiusServerSessionTimeout_5g[2];
//
//	frmSubmit[212].value = w.;
//	frmSubmit[213].value = w.;
//	frmSubmit[214].value = w.;
//	frmSubmit[215].value = w.;
//	frmSubmit[216].value = w.;
//	frmSubmit[217].value = w.;
//	frmSubmit[218].value = w.;
//	frmSubmit[219].value = w.;
//	frmSubmit[220].value = w.;
w.isRefresh = "1";
frmSubmit.submit();
}


function initTranslation()
{
var e = document.getElementById("wizTitle");
e.innerHTML = _("wiz title");

e = document.getElementById("wizSave");
e.innerHTML = _("wiz save");
e = document.getElementById("wizSave_str1");
e.innerHTML = _("wiz save str1");
e = document.getElementById("wizSave_str2");
e.innerHTML = _("wiz save str2");
e = document.getElementById("wizSave_str3");
e.innerHTML = _("wiz save str3");
//	e = document.getElementById("wizSave_str4");
//	e.innerHTML = _("wiz save str4");
//	e = document.getElementById("wizSave_str5");
//	e.innerHTML = _("wiz save str5");
//	e = document.getElementById("wizSave_str6");
//	e.innerHTML = _("wiz save str6");

e = document.getElementById("btnBck");
e.value = _("wiz back");
e = document.getElementById("btnFin");
e.value = _("wiz finish");
e = document.getElementById("btnCcl");
e.value = _("admin cancel");
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
<h1 id="wizTitle">Quick Start Wizard</h1>
<hr size="1" />
<br />

<form name="wizardSetup" method="post" action="/goform/WizardSetup">
<h2 id="wizSave" class="title">Vigor Wizard Setup is now finished!</h2>
<table width="100%" height="280" cellspacing="1" cellpadding="2" class="config">
<tr>
<td valign=top>
<table align="center" width="90%" cellspacing=2 cellpadding="0">
<tr><td><br /></td></tr>
<tr>
<td>
<span id="wizSave_str3">Basic Settings for AP800 is completed</span>.<br><br>
<span id="wizSave_str1">Press Finish button to save and finish the wizard setup</span>.<br>
<span id="wizSave_str2">Note that the configuration process takes a few seconds to complete</span>.<br><br><!--
<span id="wizSave_str4">For security purposes, strongly suggest you to setup</span>&nbsp;<b><span id="wizSave_str5">Security Mode for Wireless</span></b>&nbsp;<span id="wizSave_str6">in advanced setting pages</span>.-->

<br><br>
</td>
</tr>
</table>
</td>
</tr>
</table>

<br />
<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="right">
<td>
<input type="hidden" name="wizard_save" value="1" />
<input type="hidden" name="aa" />
<input type="hidden" name="bb" />
<input type="hidden" name="wOpmode" />
<input type="hidden" name="wWirelessmode" />
<input type="hidden" name="wSsidSubEn" />
<input type="hidden" name="wSsid1" />
<input type="hidden" name="wSsid2" />
<input type="hidden" name="wSsid3" />
<input type="hidden" name="wSsid4" />
<input type="hidden" name="wSsid_vlan1" />
<input type="hidden" name="wSsid_vlan2" />
<input type="hidden" name="wSsid_vlan3" />
<input type="hidden" name="wSsid_vlan4" />
<input type="hidden" name="wChannel" />
<input type="hidden" name="wChnExt" />
<input type="hidden" name="wWdsPhyMode" />
<input type="hidden" name="wWdsEncryType" />
<input type="hidden" name="wWdsVlan0" />
<input type="hidden" name="wWdsVlan1" />
<input type="hidden" name="wWdsVlan2" />
<input type="hidden" name="wWdsVlan3" />
<input type="hidden" name="wWdsKey0" />
<input type="hidden" name="wWdsKey1" />
<input type="hidden" name="wWdsKey2" />
<input type="hidden" name="wWdsKey3" />
<input type="hidden" name="wWdsMacList" />
<input type="hidden" name="wURSsid" />
<input type="hidden" name="wURBSsid" />
<input type="hidden" name="wURMode" />
<input type="hidden" name="wUREnc" />
<input type="hidden" name="wURKeyid" />
<input type="hidden" name="wURWpapsk" />
<input type="hidden" name="wURKey1" />
<input type="hidden" name="wURKey2" />
<input type="hidden" name="wURKey3" />
<input type="hidden" name="wURKey4" />
<input type="hidden" name="wURKey1Type" />
<input type="hidden" name="wURKey2Type" />
<input type="hidden" name="wURKey3Type" />
<input type="hidden" name="wURKey4Type" />
<input type="hidden" name="wProfName" />
<input type="hidden" name="wProfSsid" />
<input type="hidden" name="wProfNetTyp" />
<input type="hidden" name="wProfPowerMd" />
<input type="hidden" name="wProfChn" />
<input type="hidden" name="wProfPremable" />
<input type="hidden" name="wProfRtsEn" />
<input type="hidden" name="wProfRtsVal" />
<input type="hidden" name="wProfFragement" />
<input type="hidden" name="wProfFragVal" />
<input type="hidden" name="wProfSecMode" />
<input type="hidden" name="wProfWepKeyLen" />
<input type="hidden" name="wProfWepKeyMth" />
<input type="hidden" name="wProfWepKey1" />
<input type="hidden" name="wProfWepKey2" />
<input type="hidden" name="wProfWepKey3" />
<input type="hidden" name="wProfWepKey4" />
<input type="hidden" name="wProfDefKey" />
<input type="hidden" name="wProfWpaCiper" />
<input type="hidden" name="wProfWpaPass" />
<input type="hidden" name="wWirelessmode_5g" />
<input type="hidden" name="wSsid1_5g" />
<input type="hidden" name="wSsid2_5g" />
<input type="hidden" name="wSsid3_5g" />
<input type="hidden" name="wSsid_vlan1_5g" />
<input type="hidden" name="wSsid_vlan2_5g" />
<input type="hidden" name="wSsid_vlan3_5g" />
<input type="hidden" name="wChannel_5g" />
<input type="hidden" name="wChnExt_5g" />
<input type="hidden" name="wMSsidNum" />
<input type="hidden" name="wMSsidNum_5g" />

<input type="hidden" name="WLSecMode_0" />
<input type="hidden" name="cipher_0" />
<input type="hidden" name="passphrase_0" />
<input type="hidden" name="keyRenewalInterval_0" />
<input type="hidden" name="PMKCachePeriod_0" />
<input type="hidden" name="PreAuthentication_0" />
<input type="hidden" name="wep_default_key_0" />
<input type="hidden" name="wep_key_1_0" />
<input type="hidden" name="wep_key_2_0" />
<input type="hidden" name="wep_key_3_0" />
<input type="hidden" name="wep_key_4_0" />
<input type="hidden" name="WEP1Select_0" />
<input type="hidden" name="WEP2Select_0" />
<input type="hidden" name="WEP3Select_0" />
<input type="hidden" name="WEP4Select_0" />
<input type="hidden" name="ieee8021x_wep_0" />
<input type="hidden" name="RadiusServerIP_0" />
<input type="hidden" name="RadiusServerPort_0" />
<input type="hidden" name="RadiusServerSecret_0" />
<input type="hidden" name="RadiusServerSessionTimeout_0" />

<input type="hidden" name="WLSecMode_1" />
<input type="hidden" name="cipher_1" />
<input type="hidden" name="passphrase_1" />
<input type="hidden" name="keyRenewalInterval_1" />
<input type="hidden" name="PMKCachePeriod_1" />
<input type="hidden" name="PreAuthentication_1" />
<input type="hidden" name="wep_default_key_1" />
<input type="hidden" name="wep_key_1_1" />
<input type="hidden" name="wep_key_2_1" />
<input type="hidden" name="wep_key_3_1" />
<input type="hidden" name="wep_key_4_1" />
<input type="hidden" name="WEP1Select_1" />
<input type="hidden" name="WEP2Select_1" />
<input type="hidden" name="WEP3Select_1" />
<input type="hidden" name="WEP4Select_1" />
<input type="hidden" name="ieee8021x_wep_1" />
<input type="hidden" name="RadiusServerIP_1" />
<input type="hidden" name="RadiusServerPort_1" />
<input type="hidden" name="RadiusServerSecret_1" />
<input type="hidden" name="RadiusServerSessionTimeout_1" />

<input type="hidden" name="WLSecMode_2" />
<input type="hidden" name="cipher_2" />
<input type="hidden" name="passphrase_2" />
<input type="hidden" name="keyRenewalInterval_2" />
<input type="hidden" name="PMKCachePeriod_2" />
<input type="hidden" name="PreAuthentication_2" />
<input type="hidden" name="wep_default_key_2" />
<input type="hidden" name="wep_key_1_2" />
<input type="hidden" name="wep_key_2_2" />
<input type="hidden" name="wep_key_3_2" />
<input type="hidden" name="wep_key_4_2" />
<input type="hidden" name="WEP1Select_2" />
<input type="hidden" name="WEP2Select_2" />
<input type="hidden" name="WEP3Select_2" />
<input type="hidden" name="WEP4Select_2" />
<input type="hidden" name="ieee8021x_wep_2" />
<input type="hidden" name="RadiusServerIP_2" />
<input type="hidden" name="RadiusServerPort_2" />
<input type="hidden" name="RadiusServerSecret_2" />
<input type="hidden" name="RadiusServerSessionTimeout_2" />

<input type="hidden" name="WLSecMode_3" />
<input type="hidden" name="cipher_3" />
<input type="hidden" name="passphrase_3" />
<input type="hidden" name="keyRenewalInterval_3" />
<input type="hidden" name="PMKCachePeriod_3" />
<input type="hidden" name="PreAuthentication_3" />
<input type="hidden" name="wep_default_key_3" />
<input type="hidden" name="wep_key_1_3" />
<input type="hidden" name="wep_key_2_3" />
<input type="hidden" name="wep_key_3_3" />
<input type="hidden" name="wep_key_4_3" />
<input type="hidden" name="WEP1Select_3" />
<input type="hidden" name="WEP2Select_3" />
<input type="hidden" name="WEP3Select_3" />
<input type="hidden" name="WEP4Select_3" />
<input type="hidden" name="ieee8021x_wep_3" />
<input type="hidden" name="RadiusServerIP_3" />
<input type="hidden" name="RadiusServerPort_3" />
<input type="hidden" name="RadiusServerSecret_3" />
<input type="hidden" name="RadiusServerSessionTimeout_3" />

<input type="hidden" name="WLSecMode_5g_0" />
<input type="hidden" name="cipher_5g_0" />
<input type="hidden" name="passphrase_5g_0" />
<input type="hidden" name="keyRenewalInterval_5g_0" />
<input type="hidden" name="PMKCachePeriod_5g_0" />
<input type="hidden" name="PreAuthentication_5g_0" />
<input type="hidden" name="wep_default_key_5g_0" />
<input type="hidden" name="wep_key_1_5g_0" />
<input type="hidden" name="wep_key_2_5g_0" />
<input type="hidden" name="wep_key_3_5g_0" />
<input type="hidden" name="wep_key_4_5g_0" />
<input type="hidden" name="WEP1Select_5g_0" />
<input type="hidden" name="WEP2Select_5g_0" />
<input type="hidden" name="WEP3Select_5g_0" />
<input type="hidden" name="WEP4Select_5g_0" />
<input type="hidden" name="ieee8021x_wep_5g_0" />
<input type="hidden" name="RadiusServerIP_5g_0" />
<input type="hidden" name="RadiusServerPort_5g_0" />
<input type="hidden" name="RadiusServerSecret_5g_0" />
<input type="hidden" name="RadiusServerSessionTimeout_5g_0" />

<input type="hidden" name="WLSecMode_5g_1" />
<input type="hidden" name="cipher_5g_1" />
<input type="hidden" name="passphrase_5g_1" />
<input type="hidden" name="keyRenewalInterval_5g_1" />
<input type="hidden" name="PMKCachePeriod_5g_1" />
<input type="hidden" name="PreAuthentication_5g_1" />
<input type="hidden" name="wep_default_key_5g_1" />
<input type="hidden" name="wep_key_1_5g_1" />
<input type="hidden" name="wep_key_2_5g_1" />
<input type="hidden" name="wep_key_3_5g_1" />
<input type="hidden" name="wep_key_4_5g_1" />
<input type="hidden" name="WEP1Select_5g_1" />
<input type="hidden" name="WEP2Select_5g_1" />
<input type="hidden" name="WEP3Select_5g_1" />
<input type="hidden" name="WEP4Select_5g_1" />
<input type="hidden" name="ieee8021x_wep_5g_1" />
<input type="hidden" name="RadiusServerIP_5g_1" />
<input type="hidden" name="RadiusServerPort_5g_1" />
<input type="hidden" name="RadiusServerSecret_5g_1" />
<input type="hidden" name="RadiusServerSessionTimeout_5g_1" />

<input type="hidden" name="WLSecMode_5g_2" />
<input type="hidden" name="cipher_5g_2" />
<input type="hidden" name="passphrase_5g_2" />
<input type="hidden" name="keyRenewalInterval_5g_2" />
<input type="hidden" name="PMKCachePeriod_5g_2" />
<input type="hidden" name="PreAuthentication_5g_2" />
<input type="hidden" name="wep_default_key_5g_2" />
<input type="hidden" name="wep_key_1_5g_2" />
<input type="hidden" name="wep_key_2_5g_2" />
<input type="hidden" name="wep_key_3_5g_2" />
<input type="hidden" name="wep_key_4_5g_2" />
<input type="hidden" name="WEP1Select_5g_2" />
<input type="hidden" name="WEP2Select_5g_2" />
<input type="hidden" name="WEP3Select_5g_2" />
<input type="hidden" name="WEP4Select_5g_2" />
<input type="hidden" name="ieee8021x_wep_5g_2" />
<input type="hidden" name="RadiusServerIP_5g_2" />
<input type="hidden" name="RadiusServerPort_5g_2" />
<input type="hidden" name="RadiusServerSecret_5g_2" />
<input type="hidden" name="RadiusServerSessionTimeout_5g_2" />
<input type="button" name="btnBck" id="btnBck" value="&lt; Back" onclick="JavaScript:history.back();">&nbsp;&nbsp;
<input type="button" name="btnFin" id="btnFin" value="Finish" onclick="submit_form()">&nbsp;&nbsp;
<input type="button" name="btnCcl" id="btnCcl" value="Cancel" onClick="onClkBtnCcl()">
</td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>