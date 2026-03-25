<html>
<head>
<title>Wireless</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" href="/style/normal_ws.css" type="text/css">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script type="text/javascript" src="/dtree/dhtml.js"></script>
<script type="text/javascript" src="/dtree/tool.js"></script>
<script type="text/javascript" src="/dtree/ajax.js"></script>
</head>

<body onload="initAll()">
<table class="body">
<tr><td>
<h1 id="wizTitle">2.4G Wireless</h1>
<hr size="1" />
<br />

<form name="frm">
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center" id="m-ssid">
<tr>
<td id="tab1" class="ontab" onclick="dhtml.cycleTab(this.id);">SSID 1</td>
<td id="tab2" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 2</td>
<td id="tab3" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 3</td>
<td id="tab4" class="offtab" onclick="dhtml.cycleTab(this.id);">SSID 4</td>
<td width="40%" class="tabpadding"></td>
</tr>
</table>

<div class="pagetext" id="page1" style="visibility: visible; display: block;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>

<table width="80%" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td class=title id="wlSecSSID_0" width=40%>SSID</td>
<td id="wlSecSSID0Value"></td>
<td></td>
</tr>
<tr><td class=title id="wlSecSet_0" colspan="3">Wireless Security Settings</td>
</tr>
<tr><td id="wlSecMode_0" style="text-indent: 10px">Mode</td>
<td><select name=sWLSecMode_0 onchange="onChgMode(0)">
<option id="wlSecMDis_0" value="Disable">Disable</option>
<option id="wlSecMWep_0" value="WEPAUTO">WEP</option>
<option id="wlSecMWPAPSK_0" value="WPAPSK">WPA/PSK</option>
<option id="wlSecMWPA2PSK_0" value="WPA2PSK">WPA2/PSK</option>
<option id="wlSecMWPAWPA2PSK_0" value="WPAPSKWPA2PSK">Mixed(WPA+WPA2)/PSK</option>
<option id="wlSecMIEEE8021X_0" value="IEEE8021X">WEP/802.1x</option>
<option id="wlSecMWPA_0" value="WPA">WPA/802.1x</option>
<option id="wlSecMWPA2_0" value="WPA2">WPA2/802.1x</option>
<option id="wlSecMWPAWPA2_0" value="WPA1WPA2">Mixed(WPA+WPA2)/802.1x</option>
</select></td>
<td></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr class="div_radius_0">
<td colspan="3" style="text-indent: 10px">Set up&nbsp;
<a href="#" onclick="radiusSetup(0);">RADIUS Server</a>&nbsp;if 802.1x is enabled.</td>
</tr>
<tr class="div_wpa_0">
<td id="secureWPAAlgorithm_0" style="text-indent: 10px">WPA Algorithms:</td>
<td><input name="cipher_0" value="0" type="radio">TKIP &nbsp;
<input name="cipher_0" value="1" type="radio">AES &nbsp;
<input name="cipher_0" value="2" type="radio">TKIP/AES</td>
<td></td>
</tr>
<tr class="div_wpa_0">
<td id="secureWPAPassPhrase_0" style="text-indent: 10px">Pass Phrase:</td>
<td><input type="password" name="passphrase_0" id="passphrase_0" size="28" maxlength="64"></td>
<td></td>
</tr>
<tr class="div_wpa_0">
<td id="secureWPAKeyRenewInterval_0" style="text-indent: 10px">Key Renewal Interval:</td>
<td><input name="keyRenewalInterval_0" id="keyRenewalInterval_0" size="4" maxlength="4" value="3600"> seconds</td>
<td></td>
</tr>
<tr class="div_wpa_0" style="visibility: hidden; display: none;">
<td id="secureWPAPMKCachePeriod_0" style="text-indent: 10px">PMK Cache Period:</td>
<td><input name="PMKCachePeriod_0" id="PMKCachePeriod_0" size="4" maxlength="4"> minutes</td>
<td></td>
</tr>
<tr class="div_wpa_0" style="visibility: hidden; display: none;">
<td id="secureWPAPreAuth_0" style="text-indent: 10px">Pre-Authentication:</td>
<td><input name="PreAuthentication_0" value="0" type="radio"><span id="secureWPAPreAuthDisable_0">Disable &nbsp;</span>
<input name="PreAuthentication_0"  value="1" type="radio"><span id="secureWPAPreAuthEnable_0">Enable &nbsp;</span></td>
<td></td>
</tr>
<tr class="div_wep_0">
<td style="text-indent: 10px"><input type="radio" value="1" name="wep_default_key_0"/>
<span id="secureWEPKey1_0">Key</span>&nbsp;1 :</td>
<td><input type="password" name="wep_key_1_0" maxlength="26" /></td>
<td><select id="WEP1Select_0" name="WEP1Select_0">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_0">
<td style="text-indent: 10px"><input type="radio" value="2" name="wep_default_key_0"/>
<span id="secureWEPKey2_0">Key</span>&nbsp;2 :</td>
<td><input type="password" name="wep_key_2_0" maxlength="26"/></td>
<td><select id="WEP2Select_0" name="WEP2Select_0">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_0">
<td style="text-indent: 10px"><input type="radio" value="3" name="wep_default_key_0"/>
<span id="secureWEPKey3_0">Key</span>&nbsp;3 :</td>
<td><input type="password" name="wep_key_3_0" maxlength="26" /></td>
<td><select id="WEP3Select_0" name="WEP3Select_0">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_0">
<td style="text-indent: 10px"><input type="radio" value="4" name="wep_default_key_0"/>
<span id="secureWEPKey4_0">Key</span>&nbsp;4 :</td>
<td><input type="password" name="wep_key_4_0" maxlength="26" /></td>
<td><select id="WEP4Select_0" name="WEP4Select_0">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_0">
<td id="secure8021XWEP_0" style="text-indent: 10px">802.1x WEP:</td>
<td><input name="ieee8021x_wep_0" value="0" type="radio"><span id="secure1XWEPDisable_0">Disable</span> &nbsp;
<input name="ieee8021x_wep_0" value="1" type="radio"><span id="secure1XWEPEnable_0">Enable</span>
</td>
<td></td>
</tr>
</table>

</td></tr>
</table>
</div>

<div class="pagetext" id="page2" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>

<table width="80%" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td class=title id="wlSecSSID_1" width=40%>SSID</td>
<td id="wlSecSSID1Value"></td>
</tr>
<tr><td class=title id="wlSecSet_1" colspan="2">Wireless Security Settings</td>
</tr>
<tr><td id="wlSecMode_1" style="text-indent: 10px">Mode</td>
<td><select name=sWLSecMode_1 onchange="onChgMode(1)">
<option id="wlSecMDis_1" value="Disable">Disable</option>
<option id="wlSecMWep_1" value="WEPAUTO">WEP</option>
<option id="wlSecMWPAPSK_1" value="WPAPSK">WPA/PSK</option>
<option id="wlSecMWPA2PSK_1" value="WPA2PSK">WPA2/PSK</option>
<option id="wlSecMWPAWPA2PSK_1" value="WPAPSKWPA2PSK">Mixed(WPA+WPA2)/PSK</option>
<option id="wlSecMIEEE8021X_1" value="IEEE8021X">WEP/802.1x</option>
<option id="wlSecMWPA_1" value="WPA">WPA/802.1x</option>
<option id="wlSecMWPA2_1" value="WPA2">WPA2/802.1x</option>
<option id="wlSecMWPAWPA2_1" value="WPA1WPA2">Mixed(WPA+WPA2)/802.1x</option>
</select></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr class="div_radius_1">
<td colspan="3" style="text-indent: 10px">Set up&nbsp;
<a href="#" onclick="radiusSetup(1);">RADIUS Server</a>&nbsp;if 802.1x is enabled.</td>
</tr>
<tr class="div_wpa_1">
<td id="secureWPAAlgorithm_1" style="text-indent: 10px">WPA Algorithms:</td>
<td><input name="cipher_1" value="0" type="radio">TKIP &nbsp;
<input name="cipher_1" value="1" type="radio">AES &nbsp;
<input name="cipher_1" value="2" type="radio">TKIP/AES</td>
<td></td>
</tr>
<tr class="div_wpa_1">
<td id="secureWPAPassPhrase_1" style="text-indent: 10px">Pass Phrase:</td>
<td><input type="password" name="passphrase_1" id="passphrase_1" size="28" maxlength="64"></td>
<td></td>
</tr>
<tr class="div_wpa_1">
<td id="secureWPAKeyRenewInterval_1" style="text-indent: 10px">Key Renewal Interval:</td>
<td><input name="keyRenewalInterval_1" id="keyRenewalInterval_1" size="4" maxlength="4" value="3600"> seconds</td>
<td></td>
</tr>
<tr class="div_wpa_1" style="visibility: hidden; display: none;">
<td id="secureWPAPMKCachePeriod_1" style="text-indent: 10px">PMK Cache Period:</td>
<td><input name="PMKCachePeriod_1" id="PMKCachePeriod_1" size="4" maxlength="4"> minutes</td>
<td></td>
</tr>
<tr class="div_wpa_1" style="visibility: hidden; display: none;">
<td id="secureWPAPreAuth_1" style="text-indent: 10px">Pre-Authentication:</td>
<td><input name="PreAuthentication_1" value="0" type="radio"><span id="secureWPAPreAuthDisable_1">Disable &nbsp;</span>
<input name="PreAuthentication_1"  value="1" type="radio"><span id="secureWPAPreAuthEnable_1">Enable &nbsp;</span></td>
<td></td>
</tr>
<tr class="div_wep_1">
<td style="text-indent: 10px"><input type="radio" value="1" name="wep_default_key_1"/>
<span id="secureWEPKey1_1">Key</span>&nbsp;1 :</td>
<td><input type="password" name="wep_key_1_1" maxlength="26" /></td>
<td><select id="WEP1Select_1" name="WEP1Select_1">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_1">
<td style="text-indent: 10px"><input type="radio" value="2" name="wep_default_key_1"/>
<span id="secureWEPKey2_1">Key</span>&nbsp;2 :</td>
<td><input type="password" name="wep_key_2_1" maxlength="26"/></td>
<td><select id="WEP2Select_1" name="WEP2Select_1">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_1">
<td style="text-indent: 10px"><input type="radio" value="3" name="wep_default_key_1"/>
<span id="secureWEPKey3_1">Key</span>&nbsp;3 :</td>
<td><input type="password" name="wep_key_3_1" maxlength="26" /></td>
<td><select id="WEP3Select_1" name="WEP3Select_1">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_1">
<td style="text-indent: 10px"><input type="radio" value="4" name="wep_default_key_1"/>
<span id="secureWEPKey4_1">Key</span>&nbsp;4 :</td>
<td><input type="password" name="wep_key_4_1" maxlength="26" /></td>
<td><select id="WEP4Select_1" name="WEP4Select_1">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_1">
<td id="secure8021XWEP_1" style="text-indent: 10px">802.1x WEP:</td>
<td><input name="ieee8021x_wep_1" value="0" type="radio"><span id="secure1XWEPDisable_1">Disable</span> &nbsp;
<input name="ieee8021x_wep_1" value="1" type="radio"><span id="secure1XWEPEnable_1">Enable</span>
</td>
<td></td>
</tr>
</table>

</td></tr>
</table>
</div>

<div class="pagetext" id="page3" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>

<table width="80%" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td class=title id="wlSecSSID_2" width=40%>SSID</td>
<td id="wlSecSSID2Value"></td>
</tr>
<tr><td class=title id="wlSecSet_2" colspan="2">Wireless Security Settings</td>
</tr>
<tr><td id="wlSecMode_2" style="text-indent: 10px">Mode</td>
<td><select name=sWLSecMode_2 onchange="onChgMode(2)">
<option id="wlSecMDis_2" value="Disable">Disable</option>
<option id="wlSecMWep_2" value="WEPAUTO">WEP</option>
<option id="wlSecMWPAPSK_2" value="WPAPSK">WPA/PSK</option>
<option id="wlSecMWPA2PSK_2" value="WPA2PSK">WPA2/PSK</option>
<option id="wlSecMWPAWPA2PSK_2" value="WPAPSKWPA2PSK">Mixed(WPA+WPA2)/PSK</option>
<option id="wlSecMIEEE8021X_2" value="IEEE8021X">WEP/802.1x</option>
<option id="wlSecMWPA_2" value="WPA">WPA/802.1x</option>
<option id="wlSecMWPA2_2" value="WPA2">WPA2/802.1x</option>
<option id="wlSecMWPAWPA2_2" value="WPA1WPA2">Mixed(WPA+WPA2)/802.1x</option>
</select></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr class="div_radius_2">
<td colspan="3" style="text-indent: 10px">Set up&nbsp;
<a href="#" onclick="radiusSetup(2);">RADIUS Server</a>&nbsp;if 802.1x is enabled.</td>
</tr>
<tr class="div_wpa_2">
<td id="secureWPAAlgorithm_2" style="text-indent: 10px">WPA Algorithms:</td>
<td><input name="cipher_2" value="0" type="radio">TKIP &nbsp;
<input name="cipher_2" value="1" type="radio">AES &nbsp;
<input name="cipher_2" value="2" type="radio">TKIP/AES</td>
<td></td>
</tr>
<tr class="div_wpa_2">
<td id="secureWPAPassPhrase_2" style="text-indent: 10px">Pass Phrase:</td>
<td><input type="password" name="passphrase_2" id="passphrase_2" size="28" maxlength="64"></td>
<td></td>
</tr>
<tr class="div_wpa_2">
<td id="secureWPAKeyRenewInterval_2" style="text-indent: 10px">Key Renewal Interval:</td>
<td><input name="keyRenewalInterval_2" id="keyRenewalInterval_2" size="4" maxlength="4" value="3600"> seconds</td>
<td></td>
</tr>
<tr class="div_wpa_2" style="visibility: hidden; display: none;">
<td id="secureWPAPMKCachePeriod_2" style="text-indent: 10px">PMK Cache Period:</td>
<td><input name="PMKCachePeriod_2" id="PMKCachePeriod_2" size="4" maxlength="4"> minutes</td>
<td></td>
</tr>
<tr class="div_wpa_2" style="visibility: hidden; display: none;">
<td id="secureWPAPreAuth_2" style="text-indent: 10px">Pre-Authentication:</td>
<td><input name="PreAuthentication_2" value="0" type="radio"><span id="secureWPAPreAuthDisable_2">Disable &nbsp;</span>
<input name="PreAuthentication_2"  value="1" type="radio"><span id="secureWPAPreAuthEnable_2">Enable &nbsp;</span></td>
<td></td>
</tr>
<tr class="div_wep_2">
<td style="text-indent: 10px"><input type="radio" value="1" name="wep_default_key_2"/>
<span id="secureWEPKey1_2">Key</span>&nbsp;1 :</td>
<td><input type="password" name="wep_key_1_2" maxlength="26" /></td>
<td><select id="WEP1Select_2" name="WEP1Select_2">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_2">
<td style="text-indent: 10px"><input type="radio" value="2" name="wep_default_key_2"/>
<span id="secureWEPKey2_2">Key</span>&nbsp;2 :</td>
<td><input type="password" name="wep_key_2_2" maxlength="26"/></td>
<td><select id="WEP2Select_2" name="WEP2Select_2">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_2">
<td style="text-indent: 10px"><input type="radio" value="3" name="wep_default_key_2"/>
<span id="secureWEPKey3_2">Key</span>&nbsp;3 :</td>
<td><input type="password" name="wep_key_3_2" maxlength="26" /></td>
<td><select id="WEP3Select_2" name="WEP3Select_2">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_2">
<td style="text-indent: 10px"><input type="radio" value="4" name="wep_default_key_2"/>
<span id="secureWEPKey4_2">Key</span>&nbsp;4 :</td>
<td><input type="password" name="wep_key_4_2" maxlength="26" /></td>
<td><select id="WEP4Select_2" name="WEP4Select_2">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_2">
<td id="secure8021XWEP_2" style="text-indent: 10px">802.1x WEP:</td>
<td><input name="ieee8021x_wep_2" value="0" type="radio"><span id="secure1XWEPDisable_2">Disable</span> &nbsp;
<input name="ieee8021x_wep_2" value="1" type="radio"><span id="secure1XWEPEnable_2">Enable</span>
</td>
<td></td>
</tr>

</table>

</td></tr>
</table>
</div>

<div class="pagetext" id="page4" style="visibility: hidden; display: none;">
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center" class="class1">
<tr><td>

<table width="80%" cellspacing="2" cellpadding="2" border="0" align="center">
<tr><td class=title id="wlSecSSID_3" width=40%>SSID</td>
<td id="wlSecSSID3Value"></td>
</tr>
<tr><td class=title id="wlSecSet_3" colspan="2">Wireless Security Settings</td>
</tr>
<tr><td id="wlSecMode_3" style="text-indent: 10px">Mode</td>
<td><select name=sWLSecMode_3 onchange="onChgMode(3)">
<option id="wlSecMDis_3" value="Disable">Disable</option>
<option id="wlSecMWep_3" value="WEPAUTO">WEP</option>
<option id="wlSecMWPAPSK_3" value="WPAPSK">WPA/PSK</option>
<option id="wlSecMWPA2PSK_3" value="WPA2PSK">WPA2/PSK</option>
<option id="wlSecMWPAWPA2PSK_3" value="WPAPSKWPA2PSK">Mixed(WPA+WPA2)/PSK</option>
<option id="wlSecMIEEE8021X_3" value="IEEE8021X">WEP/802.1x</option>
<option id="wlSecMWPA_3" value="WPA">WPA/802.1x</option>
<option id="wlSecMWPA2_3" value="WPA2">WPA2/802.1x</option>
<option id="wlSecMWPAWPA2_3" value="WPA1WPA2">Mixed(WPA+WPA2)/802.1x</option>
</select></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr class="div_radius_3">
<td colspan="3" style="text-indent: 10px">Set up&nbsp;
<a href="#" onclick="radiusSetup(3);">RADIUS Server</a>&nbsp;if 802.1x is enabled.</td>
</tr>
<tr class="div_wpa_3">
<td id="secureWPAAlgorithm_3" style="text-indent: 10px">WPA Algorithms:</td>
<td><input name="cipher_3" value="0" type="radio">TKIP &nbsp;
<input name="cipher_3" value="1" type="radio">AES &nbsp;
<input name="cipher_3" value="2" type="radio">TKIP/AES</td>
<td></td>
</tr>
<tr class="div_wpa_3">
<td id="secureWPAPassPhrase_3" style="text-indent: 10px">Pass Phrase:</td>
<td><input type="password" name="passphrase_3" id="passphrase_3" size="28" maxlength="64"></td>
<td></td>
</tr>
<tr class="div_wpa_3">
<td id="secureWPAKeyRenewInterval_3" style="text-indent: 10px">Key Renewal Interval:</td>
<td><input name="keyRenewalInterval_3" id="keyRenewalInterval_3" size="4" maxlength="4" value="3600"> seconds</td>
<td></td>
</tr>
<tr class="div_wpa_3" style="visibility: hidden; display: none;">
<td id="secureWPAPMKCachePeriod_3" style="text-indent: 10px">PMK Cache Period:</td>
<td><input name="PMKCachePeriod_3" id="PMKCachePeriod_3" size="4" maxlength="4"> minutes</td>
<td></td>
</tr>
<tr class="div_wpa_3" style="visibility: hidden; display: none;">
<td id="secureWPAPreAuth_3" style="text-indent: 10px">Pre-Authentication:</td>
<td><input name="PreAuthentication_3" value="0" type="radio"><span id="secureWPAPreAuthDisable_3">Disable &nbsp;</span>
<input name="PreAuthentication_3"  value="1" type="radio"><span id="secureWPAPreAuthEnable_3">Enable &nbsp;</span></td>
<td></td>
</tr>
<tr class="div_wep_3">
<td style="text-indent: 10px"><input type="radio" value="1" name="wep_default_key_3"/>
<span id="secureWEPKey1_3">Key</span>&nbsp;1 :</td>
<td><input type="password" name="wep_key_1_3" maxlength="26" /></td>
<td><select id="WEP1Select_3" name="WEP1Select_3">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_3">
<td style="text-indent: 10px"><input type="radio" value="2" name="wep_default_key_3"/>
<span id="secureWEPKey2_3">Key</span>&nbsp;2 :</td>
<td><input type="password" name="wep_key_2_3" maxlength="26"/></td>
<td><select id="WEP2Select_3" name="WEP2Select_3">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_3">
<td style="text-indent: 10px"><input type="radio" value="3" name="wep_default_key_3"/>
<span id="secureWEPKey3_3">Key</span>&nbsp;3 :</td>
<td><input type="password" name="wep_key_3_3" maxlength="26" /></td>
<td><select id="WEP3Select_3" name="WEP3Select_3">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_3">
<td style="text-indent: 10px"><input type="radio" value="4" name="wep_default_key_3"/>
<span id="secureWEPKey4_3">Key</span>&nbsp;4 :</td>
<td><input type="password" name="wep_key_4_3" maxlength="26" /></td>
<td><select id="WEP4Select_3" name="WEP4Select_3">
<option value="1">ASCII</option>
<option value="0">Hex</option></select>
</td>
</tr>
<tr class="div_wep_3">
<td id="secure8021XWEP_3" style="text-indent: 10px">802.1x WEP:</td>
<td><input name="ieee8021x_wep_3" value="0" type="radio"><span id="secure1XWEPDisable_3">Disable</span> &nbsp;
<input name="ieee8021x_wep_3" value="1" type="radio"><span id="secure1XWEPEnable_3">Enable</span>
</td>
<td></td>
</tr>

</table>

</td></tr>
</table>
</div>

<br />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td width=25% style='background-color:#4682B4; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#4682B4; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#e5e5e5; height:8px;font-size:5px;'>&nbsp;</td>
<td width=25% style='background-color:#e5e5e5; height:8px;font-size:5px;'>&nbsp;</td>
</tr>
<tr>
<td align=right id="Wless24g">Wireless(2.4GHz)</td>
<td align=right id="Secu24g">Security(2.4GHz)</td>
<td align=right id="Wless5g">Wireless(5GHz)</td>
<td align=right id="Secu5g">Security(5GHz)</td>
</tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="1">
<tr align="right">
<td><input type="hidden" name="RadiusServerIP_0" id="RadiusServerIP_0">
<input type="hidden" name="RadiusServerPort_0" id="RadiusServerPort_0">
<input type="hidden" name="RadiusServerSecret_0" id="RadiusServerSecret_0">
<input type="hidden" name="RadiusServerSessionTimeout_0" id="RadiusServerSessionTimeout_0">
<input type="hidden" name="RadiusServerIP_1" id="RadiusServerIP_1">
<input type="hidden" name="RadiusServerPort_1" id="RadiusServerPort_1">
<input type="hidden" name="RadiusServerSecret_1" id="RadiusServerSecret_1">
<input type="hidden" name="RadiusServerSessionTimeout_1" id="RadiusServerSessionTimeout_1">
<input type="hidden" name="RadiusServerIP_2" id="RadiusServerIP_2">
<input type="hidden" name="RadiusServerPort_2" id="RadiusServerPort_2">
<input type="hidden" name="RadiusServerSecret_2" id="RadiusServerSecret_2">
<input type="hidden" name="RadiusServerSessionTimeout_2" id="RadiusServerSessionTimeout_2">
<input type="hidden" name="RadiusServerIP_3" id="RadiusServerIP_3">
<input type="hidden" name="RadiusServerPort_3" id="RadiusServerPort_3">
<input type="hidden" name="RadiusServerSecret_3" id="RadiusServerSecret_3">
<input type="hidden" name="RadiusServerSessionTimeout_3" id="RadiusServerSessionTimeout_3">
<input type=button class="btnw" value="Back" id="lBack" onClick="JavaScript:history.back();">&nbsp;&nbsp;
<input type=button class="btnw" value="Next" id="lNext" onClick="onClkNxt()">&nbsp;&nbsp;
<input type=button class="btnw" value="Cancel" id="lCancel" onClick="onClkBtnCcl()"></td>
</tr>
</table>
</form>

</td></tr>
</table>

</body>
</html>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");
Butterlate.setTextDomain("wireless");

var f = document.frm;
var w = parent.wizard;
var SSID = new Array();
var PreAuth = new Array();
var AuthMode = new Array();
var EncrypType = new Array();
var DefaultKeyID = new Array();
var Key1Type = new Array();
var Key1Str = new Array();
var Key2Type = new Array();
var Key2Str = new Array();
var Key3Type = new Array();
var Key3Str = new Array();
var Key4Type = new Array();
var Key4Str = new Array();
var WPAPSK = new Array();
var RekeyMethod = new Array();
var RekeyInterval = new Array();
var PMKCachePeriod = new Array();
var IEEE8021X = new Array();
var RADIUS_Server = new Array();
var RADIUS_Port = new Array();
var RADIUS_Key = new Array();
var session_timeout_interval = new Array();
var RADIUS_SSID = 0;
//var flag = 0;

function initTranslation()
{
var e = document.getElementById("wizTitle");
e.innerHTML = _("wiz title") + " >> " + _("wiz 2.4g security");

for (var i=0; i<4; i++) {
e = document.getElementById("wlSecSSID_" + i);
e.innerHTML = _("status wlan ssid");
e = document.getElementById("wlSecSet_" + i);
e.innerHTML = _("wiz wireless security title");
e = document.getElementById("wlSecMode_" + i);
e.innerHTML = _("wiz wireless security mode");


//		e = eval("document.getElementById('secureWEP_"+i+"')");
//		e.innerHTML = _("secure wep");
e = eval("document.getElementById('secureWEPKey1_"+i+"')");
e.innerHTML = _("wireless wepkey");
e = eval("document.getElementById('secureWEPKey2_"+i+"')");
e.innerHTML = _("wireless wepkey");
e = eval("document.getElementById('secureWEPKey3_"+i+"')");
e.innerHTML = _("wireless wepkey");
e = eval("document.getElementById('secureWEPKey4_"+i+"')");
e.innerHTML = _("wireless wepkey");

//		e = eval("document.getElementById('secreWPA_"+i+"')");
//		e.innerHTML = _("secure wpa");
e = eval("document.getElementById('secureWPAAlgorithm_"+i+"')");
e.innerHTML = _("secure wpa algorithm");
e = eval("document.getElementById('secureWPAPassPhrase_"+i+"')");
e.innerHTML = _("secure wpa pass phrase");
e = eval("document.getElementById('secureWPAKeyRenewInterval_"+i+"')");
e.innerHTML = _("secure wpa key renew interval");
e = eval("document.getElementById('secureWPAPMKCachePeriod_"+i+"')");
e.innerHTML = _("secure wpa pmk cache period");
e = eval("document.getElementById('secureWPAPreAuth_"+i+"')");
e.innerHTML = _("secure wpa preauth");
e = eval("document.getElementById('secureWPAPreAuthDisable_"+i+"')");
e.innerHTML = _("wireless disable");
e = eval("document.getElementById('secureWPAPreAuthEnable_"+i+"')");
e.innerHTML = _("wireless enable");

e = eval("document.getElementById('secure8021XWEP_"+i+"')");
e.innerHTML = _("secure 8021x wep");
e = eval("document.getElementById('secure1XWEPDisable_"+i+"')");
e.innerHTML = _("wireless disable");
e = eval("document.getElementById('secure1XWEPEnable_"+i+"')");
e.innerHTML = _("wireless enable");
}
e = document.getElementById("Wless24g");
e.innerHTML = _("status wlan 24g");
e = document.getElementById("Wless5g");
e.innerHTML = _("status wlan 5g");
e = document.getElementById("Secu24g");
e.innerHTML = _("status security 24g");
e = document.getElementById("Secu5g");
e.innerHTML = _("status security 5g");

e = document.getElementById("lBack");
e.value = _("wiz back");
e = document.getElementById("lNext");
e.value = _("wiz next");
e = document.getElementById("lCancel");
e.value = _("admin cancel");
}

function processUpdate(req, ref)
{
if (req.responseText) {
var all_str = req.responseText.split("\n");

for (var i = 0; i < all_str.length-2; i++) {
var fields_str = all_str[i+1].split("\r");

SSID[i] = fields_str[0];
PreAuth[i] = fields_str[1];
AuthMode[i] = fields_str[2];
EncrypType[i] = fields_str[3];
DefaultKeyID[i] = fields_str[4];
Key1Type[i] = fields_str[5];
Key1Str[i] = fields_str[6];
Key2Type[i] = fields_str[7];
Key2Str[i] = fields_str[8];
Key3Type[i] = fields_str[9];
Key3Str[i] = fields_str[10];
Key4Type[i] = fields_str[11];
Key4Str[i] = fields_str[12];
WPAPSK[i] = fields_str[13];
RekeyMethod[i] = fields_str[14];
RekeyInterval[i] = fields_str[15];
PMKCachePeriod[i] = fields_str[16];
IEEE8021X[i] = fields_str[17];
RADIUS_Server[i] = fields_str[18];
RADIUS_Port[i] = fields_str[19];
RADIUS_Key[i] = fields_str[20];
session_timeout_interval[i] = fields_str[21];

/* !!!! IMPORTANT !!!!*/
if (IEEE8021X[i] == "1")
AuthMode[i] = "IEEE8021X";

if (AuthMode[i] == "OPEN" && EncrypType[i] == "NONE" && IEEE8021X[i] == "0")
AuthMode[i] = "Disable";
}
}
LoadFields(0);
LoadFields(1);
LoadFields(2);
LoadFields(3);
}

function LoadFields(MBSSID)
{
var idx = getIdxbyName(f, "sWLSecMode_" + MBSSID);
setVle2Elmt(f[idx], AuthMode[MBSSID]);

eval("f.wep_key_1_"+MBSSID).value = Key1Str[MBSSID];
eval("f.wep_key_2_"+MBSSID).value = Key2Str[MBSSID];
eval("f.wep_key_3_"+MBSSID).value = Key3Str[MBSSID];
eval("f.wep_key_4_"+MBSSID).value = Key4Str[MBSSID];

eval("f.WEP1Select_"+MBSSID).selectedIndex = (Key1Type[MBSSID] == "0" ? 1 : 0);
eval("f.WEP2Select_"+MBSSID).selectedIndex = (Key2Type[MBSSID] == "0" ? 1 : 0);
eval("f.WEP3Select_"+MBSSID).selectedIndex = (Key3Type[MBSSID] == "0" ? 1 : 0);
eval("f.WEP4Select_"+MBSSID).selectedIndex = (Key4Type[MBSSID] == "0" ? 1 : 0);

if (DefaultKeyID[MBSSID] != "")
eval("f.wep_default_key_"+MBSSID)[parseInt(DefaultKeyID[MBSSID])-1].checked = true;

// WPA
if(EncrypType[MBSSID] == "TKIP")
eval("f.cipher_"+MBSSID)[0].checked = true;
else if(EncrypType[MBSSID] == "AES")
eval("f.cipher_"+MBSSID)[1].checked = true;
else if(EncrypType[MBSSID] == "TKIPAES")
eval("f.cipher_"+MBSSID)[2].checked = true;

eval("f.passphrase_"+MBSSID).value = WPAPSK[MBSSID];
eval("f.keyRenewalInterval_"+MBSSID).value = RekeyInterval[MBSSID];
eval("f.PMKCachePeriod_"+MBSSID).value = PMKCachePeriod[MBSSID];

if (PreAuth[MBSSID] == "0")
eval("f.PreAuthentication_"+MBSSID)[0].checked = true;
else
eval("f.PreAuthentication_"+MBSSID)[1].checked = true;

//802.1x wep
if (IEEE8021X[MBSSID] == "1") {
if (EncrypType[MBSSID] == "WEP")
eval("f.ieee8021x_wep_"+MBSSID)[1].checked = true;
else
eval("f.ieee8021x_wep_"+MBSSID)[0].checked = true;
}
eval("document.getElementById('RadiusServerIP_"+MBSSID+"')").value = RADIUS_Server[MBSSID];
eval("document.getElementById('RadiusServerPort_"+MBSSID+"')").value = RADIUS_Port[MBSSID];
eval("document.getElementById('RadiusServerSecret_"+MBSSID+"')").value = RADIUS_Key[MBSSID];
eval("document.getElementById('RadiusServerSessionTimeout_"+MBSSID+"')").value = session_timeout_interval[MBSSID];

onChgMode(MBSSID);
}

function initAll()
{
initTranslation();

dhtml.cycleTab("tab1");

UpdateId("wlSecSSID0Value", w.wSsid1);
UpdateId("wlSecSSID1Value", w.wSsid2);
UpdateId("wlSecSSID2Value", w.wSsid3);
UpdateId("wlSecSSID3Value", w.wSsid4);

var arySsid = [w.wSsid1, w.wSsid2, w.wSsid3, w.wSsid4];
for(var i=0; i<4; i++) {
if (arySsid[i] == "") {
var idx = getIdxbyName(f, "sWLSecMode_" + i);
f[idx].disabled = true;
}
}
loadXMLDoc("/goform/wirelessGetSecurity", processUpdate);
}

function radiusSetup(MBSSID)
{
RADIUS_SSID = MBSSID;

var id_x = getIdxbyName(f, "sWLSecMode_" + MBSSID);
var security_mode = getVleFromElmt(f[id_x], 0);

if (security_mode != "WPA" && security_mode != "WPA2"
&& security_mode != "WPA1WPA2" && security_mode != "IEEE8021X") {
alert("[SSID"+(parseInt(MBSSID)+1)+"]802.1x isn't enabled");
return false;
} else {
window.open('../wireless/radius.asp', 'radius', 'toolbars=no,width=800,height=300px,top=150px,left='+(screen.width/2-230)+'px,status=no,menubar=no');
return true;
}
}

function onChgMode(MBSSID)
{
var id_x = getIdxbyName(f, "sWLSecMode_" + MBSSID);
var security_mode = getVleFromElmt(f[id_x], 0);

hideElmtByClass(document, "tr", "div_wpa_"+MBSSID);
hideElmtByClass(document, "tr", "div_radius_"+MBSSID);
hideElmtByClass(document, "tr", "div_wep_"+MBSSID);

cpntCtrl(false, f, f[id_x+1], 22);

if (security_mode == "WEPAUTO") {
showElmtByClass(document, "tr", "div_wep_"+MBSSID);
eval("f.wep_default_key_"+MBSSID)[0].disabled = false;
eval("f.wep_default_key_"+MBSSID)[1].disabled = false;
eval("f.wep_default_key_"+MBSSID)[2].disabled = false;
eval("f.wep_default_key_"+MBSSID)[3].disabled = false;
eval("f.wep_key_1_"+MBSSID).disabled = false;
eval("f.wep_key_2_"+MBSSID).disabled = false;
eval("f.wep_key_3_"+MBSSID).disabled = false;
eval("f.wep_key_4_"+MBSSID).disabled = false;
eval("f.WEP1Select_"+MBSSID).disabled = false;
eval("f.WEP2Select_"+MBSSID).disabled = false;
eval("f.WEP3Select_"+MBSSID).disabled = false;
eval("f.WEP4Select_"+MBSSID).disabled = false;

} else if (security_mode == "WPAPSK" || security_mode == "WPA2PSK" || security_mode == "WPAPSKWPA2PSK") {
showElmtByClass(document, "tr", "div_wpa_"+MBSSID);
eval("f.cipher_"+MBSSID)[0].disabled = false;
eval("f.cipher_"+MBSSID)[1].disabled = false;
eval("f.cipher_"+MBSSID)[2].disabled = false;

eval("f.passphrase_"+MBSSID).disabled = false;
eval("f.keyRenewalInterval_"+MBSSID).disabled = false;

} else if (security_mode == "WPA" || security_mode == "WPA2" || security_mode == "WPA1WPA2") {
showElmtByClass(document, "tr", "div_wpa_"+MBSSID);
showElmtByClass(document, "tr", "div_radius_"+MBSSID);
eval("f.cipher_"+MBSSID)[0].disabled = false;
eval("f.cipher_"+MBSSID)[1].disabled = false;
eval("f.cipher_"+MBSSID)[2].disabled = false;
eval("f.keyRenewalInterval_"+MBSSID).disabled = false;

if (security_mode == "WPA2") {
eval("f.PMKCachePeriod_"+MBSSID).disabled = false;
eval("f.PreAuthentication_"+MBSSID)[0].disabled = false;
eval("f.PreAuthentication_"+MBSSID)[1].disabled = false;
}

} else if (security_mode == "IEEE8021X") {
showElmtByClass(document, "tr", "div_wep_"+MBSSID);
showElmtByClass(document, "tr", "div_radius_"+MBSSID);
eval("f.ieee8021x_wep_"+MBSSID)[0].disabled = false;
eval("f.ieee8021x_wep_"+MBSSID)[1].disabled = false;
}
}

function check_Wep(securitymode, MBSSID)
{
var defaultid = 0;
var key_input;

for (var i = 0; i < 4; i++) {
if (eval("f.wep_default_key_"+MBSSID)[i].checked)
defaultid = i+1;
}

if (defaultid == 0) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please select a WEP key as default key!");
return false;
}

if (defaultid == 1)
var keyvalue = eval("f.wep_key_1_"+MBSSID).value;
else if (defaultid == 2)
var keyvalue = eval("f.wep_key_2_"+MBSSID).value;
else if (defaultid == 3)
var keyvalue = eval("f.wep_key_3_"+MBSSID).value;
else if (defaultid == 4)
var keyvalue = eval("f.wep_key_4_"+MBSSID).value;

if (keyvalue.length == 0 && securitymode == "WEPAUTO") { // shared wep  || md5
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input wep key"+defaultid+" !");
eval("f.wep_key_"+defaultid+"_"+MBSSID).select();
eval("f.wep_key_"+defaultid+"_"+MBSSID).focus();
return false;
}

for (i = 1; i <= 4; i++) {
var keylength = eval("f.wep_key_"+i+"_"+MBSSID).value.length;
if (keylength != 0) {
if (eval("f.WEP"+i+"Select_"+MBSSID).options.selectedIndex == 0) {
if (keylength != 5 && keylength != 13) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input 5 or 13 characters of wep key"+i+" !");
eval("f.wep_key_"+i+"_"+MBSSID).select();
eval("f.wep_key_"+i+"_"+MBSSID).focus();
return false;
}
if (checkInjection(eval("f.wep_key_"+i+"_"+MBSSID).value) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Wep key"+i+" contains invalid characters.");
eval("f.wep_key_"+i+"_"+MBSSID).select();
eval("f.wep_key_"+i+"_"+MBSSID).focus();
return false;
}
}
if (eval("f.WEP"+i+"Select_"+MBSSID).options.selectedIndex == 1) {
if (keylength != 10 && keylength != 26) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input 10 or 26 characters of wep key"+i+" !");
eval("f.wep_key_"+i+"_"+MBSSID).select();
eval("f.wep_key_"+i+"_"+MBSSID).focus();
return false;
}
if (checkHex(eval("f.wep_key_"+i+"_"+MBSSID).value) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Invalid Wep key"+i+" format !");
eval("f.wep_key_"+i+"_"+MBSSID).select();
eval("f.wep_key_"+i+"_"+MBSSID).focus();
return false;
}
}
}
}
return true;
}

function check_wpa(MBSSID)
{
if (eval("f.cipher_"+MBSSID)[0].checked != true &&
eval("f.cipher_"+MBSSID)[1].checked != true &&
eval("f.cipher_"+MBSSID)[2].checked != true) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please choose a WPA Algorithms.");
return false;
}

if (isAllNum(eval("f.keyRenewalInterval_"+MBSSID).value) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input a valid key renewal interval");
eval("f.keyRenewalInterval_"+MBSSID).select();
eval("f.keyRenewalInterval_"+MBSSID).focus();
return false;
}

if(eval("f.keyRenewalInterval_"+MBSSID).value < 60) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Warning: A short key renewal interval.");
//return false;
}

return true;
}

function check_radius(MBSSID)
{
if (!eval("f.RadiusServerIP_"+MBSSID).value.length
|| !eval("f.RadiusServerPort_"+MBSSID).value.length
|| !eval("f.RadiusServerSecret_"+MBSSID).value.length) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please Setup RADIUS Server.");
return false;
}
if (checkIpAddr(eval("f.RadiusServerIP_"+MBSSID)) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please Setup RADIUS Server.");
return false;
}
return true;
}

function checkData(MBSSID)
{
var id_x = getIdxbyName(f, "sWLSecMode_" + MBSSID);
var securitymode = getVleFromElmt(f[id_x], 0);

//	if (AuthMode[MBSSID] != securitymode)
//		flag = 1;
if (securitymode == "WEPAUTO"){
if (!check_Wep(securitymode, MBSSID))
return false;
}
// WPA/WPA2/(WPA+WPA2) PSK
else if (securitymode == "WPAPSK" || securitymode == "WPA2PSK" || securitymode == "WPAPSKWPA2PSK") {
var keyvalue = eval("f.passphrase_"+MBSSID).value;

if (keyvalue.length == 0) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input wpapsk key!");
eval("f.passphrase_"+MBSSID).select();
eval("f.passphrase_"+MBSSID).focus();
return false;
}

if (keyvalue.length < 8) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input at least 8 character of wpapsk key!");
eval("f.passphrase_"+MBSSID).select();
eval("f.passphrase_"+MBSSID).focus();
return false;
}

if (checkInjection(eval("f.passphrase_"+MBSSID).value) == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Invalid characters in Pass Phrase.");
eval("f.passphrase_"+MBSSID).select();
eval("f.passphrase_"+MBSSID).focus();
return false;
}

if (check_wpa(MBSSID) == false)
return false;
}
//802.1x
else if (securitymode == "IEEE8021X") {
if (eval("f.ieee8021x_wep_"+MBSSID)[0].checked == false && eval("f.ieee8021x_wep_"+MBSSID)[1].checked == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please choose the 802.1x WEP option.");
return false;
}
if (check_radius(MBSSID) == false)
return false;
}
else if (securitymode == "WPA" || securitymode == "WPA1WPA2") {	// WPA or WPA1WP2 mixed mode
if (check_wpa(MBSSID) == false)
return false;
if (check_radius(MBSSID) == false)
return false;
}
else if (securitymode == "WPA2")	{							// WPA2
if (check_wpa(MBSSID) == false)
return false;
if (eval("f.PreAuthentication_"+MBSSID)[0].checked == false && eval("f.PreAuthentication_"+MBSSID)[1].checked == false) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please choose the Pre-Authentication options.");
return false;
}

if (!eval("f.PMKCachePeriod_"+MBSSID).value.length) {
alert("[SSID"+(parseInt(MBSSID)+1)+"]Please input the PMK Cache Period.");
eval("f.PMKCachePeriod_"+MBSSID).select();
eval("f.PMKCachePeriod_"+MBSSID).focus();
return false;
}
if (check_radius(MBSSID) == false)
return false;
}
return true;
}

function onClkNxt()
{
if (!(checkData(0) && checkData(1) && checkData(2) && checkData(3)))
return false;

for (var i=0; i<4; i++) {
id_x = getIdxbyName(f, "sWLSecMode_" + i);
w.wWLSecMode[i] = getVleFromElmt(f[id_x], 0);

if(eval("f.cipher_"+i)[0].checked)
w.wCipher[i] = 0;
else if(eval("f.cipher_"+i)[1].checked)
w.wCipher[i] = 1;
else if(eval("f.cipher_"+i)[2].checked)
w.wCipher[i] = 2;

w.wPassphrase[i] = eval("f.passphrase_"+i).value;
w.wKeyRenewalInterval[i] = eval("f.keyRenewalInterval_"+i).value;
w.wPMKCachePeriod[i] = eval("f.PMKCachePeriod_"+i).value;

if(eval("f.PreAuthentication_"+i)[0].checked)
w.wPreAuthentication[i] = 0;
else if(eval("f.PreAuthentication_"+i)[1].checked)
w.wPreAuthentication[i] = 1;

for (var j = 0; j < 4; j++) {
if (eval("f.wep_default_key_"+i)[j].checked)
w.wWep_default_key[i] = j+1;
}
w.wWep_key_1[i] = eval("f.wep_key_1_"+i).value;
w.wWep_key_2[i] = eval("f.wep_key_2_"+i).value;
w.wWep_key_3[i] = eval("f.wep_key_3_"+i).value;
w.wWep_key_4[i] = eval("f.wep_key_4_"+i).value;
w.wWEP1Select[i] = (eval("f.WEP1Select_"+i).selectedIndex == 0 ? 1 : 0);
w.wWEP2Select[i] = (eval("f.WEP2Select_"+i).selectedIndex == 0 ? 1 : 0);
w.wWEP3Select[i] = (eval("f.WEP3Select_"+i).selectedIndex == 0 ? 1 : 0);
w.wWEP4Select[i] = (eval("f.WEP4Select_"+i).selectedIndex == 0 ? 1 : 0);

if(eval("f.ieee8021x_wep_"+i)[0].checked)
w.wIeee8021x_wep[i] = 0;
else if(eval("f.ieee8021x_wep_"+i)[1].checked)
w.wIeee8021x_wep[i] = 1;

w.wRadiusServerIP[i] = eval("f.RadiusServerIP_"+i).value;
w.wRadiusServerPort[i] = eval("f.RadiusServerPort_"+i).value;
w.wRadiusServerSecret[i] = eval("f.RadiusServerSecret_"+i).value;
w.wRadiusServerSessionTimeout[i] = eval("f.RadiusServerSessionTimeout_"+i).value;
}

document.location.href = "wizard3.asp";
}

function checkInjection(str)
{
var len = str.length;
for (var i=0; i<str.length; i++) {
if ( str.charAt(i) == '\r' || str.charAt(i) == '\n'){
return false;
}else
continue;
}
return true;
}

function onClkBtnCcl()
{
if(confirm(_("wiz cancel confirm"))) {
parent.location = "/home.asp";
}
}
</script>