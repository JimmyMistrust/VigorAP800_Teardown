<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>VigorAP 800 Status</title>
<style type="text/css">
<!--
td {font-size: 10pt;}
-->
</style>
</head>

<body bgcolor="#D43039" background="./graphics/menuback.jpg" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
<div id="div0">
<table width="200" align="center">
<tr>
<td class=normal align=center background="graphics/LED.jpg">
<b><font face="Arial" color=#4FFF40>
<span class=admin style=display:none>Admin mode<br></span>
<span class=user style=display:none>User mode<br></span>
</font></b>
</td>
</tr>
</table>
</div>

<div id="div1" style=display:none>
<table width="200" align="center">
<tr>
<td class=normal align=center background="graphics/LED.jpg">
<b><font face="Arial" color=#4FFF40>
<span class=admin style=display:none>Admin mode<br></span>
<span class=user style=display:none>User mode<br></span>
Status:&nbsp;Ready</font></b>
</td>
</tr>
</table>
</div>

<div id="div2" style=display:none>
<table width="200" align="center">
<tr>
<td class=normal align=center background="graphics/LED.jpg">
<b><font face="Arial" color=#4FFF40>
<span class=admin style=display:none>Admin mode<br></span>
<span class=user style=display:none>User mode<br></span>
Status:&nbsp;Settings Saved</font></b>
</td>
</tr>
</table>
</div>

<div id="div3" style=display:none>
<table width="200" align="center">
<tr>
<td class=normal align=center background="graphics/LED.jpg">
<b><font face="Arial" color=#4FFF40>
<span class=admin style=display:none>Admin mode<br></span>
<span class=user style=display:none>User mode<br></span>
Status:&nbsp;</font></b>
<b><font face="Arial" color=red>Invalid</font></b>
</td>
</tr>
</table>
</div>

<div id="div4" style=display:none>
<table width="200" align="center">
<tr>
<td class=normal align=center background="graphics/LED.jpg">
<b><font face="Arial" color=#4FFF40>
<span class=admin style=display:none>Admin mode<br></span>
<span class=user style=display:none>User mode<br></span>
Status: Upload Successful</font></b>
</td>
</tr>
</table>
</div>

<div id="div5" style=display:none>
<table width="200" align="center">
<tr>
<td class=normal align=center background="graphics/LED.jpg">
<b><font face="Arial" color=#4FFF40>
<span class=admin style=display:none>Admin mode<br></span>
<span class=user style=display:none>User mode<br></span>
</font></b>
<b><font face="Arial" color=red>Status: Firmware Damage</font></b>
</td>
</tr>
</table>
</div>

<div>
<table width="200" align="center">
<tr>
<td class=normal align=center background="graphics/LED.jpg">
<b><font face="Arial" color=#4FFF40>
<span class=ap style=display:none>AP Mode<br></span>
<span class=si style=display:none>Station-Infrastructure Mode<br></span>
<span class=ap_btp style=display:none>AP Bridge-Point to Point Mode<br></span>
<span class=ap_btm style=display:none>AP Bridge-Point to Multi-Point Mode<br></span>
<span class=ap_wds style=display:none>AP Bridge-WDS Mode<br></span>
<span class=uni_repe style=display:none>Universal Repeater Mode<br></span>
</font></b>
</td>
</tr>
</table>
</div>

</body>
</html>

<script>
var i_only_show_mode = 1;

initPage();

function showElmtByClass(_doc, _tag, _el)
{
var doc = _doc;
var tag = _tag;
var el = _el;
if (doc.getElementsByTagName) {
var nodes = doc.getElementsByTagName(tag);
var max = nodes.length;
for (var i = 0; i < max; i++) {
var node = nodes.item(i);
if (node.className == el) { node.style.display = ""; }
}
}
}

function hideElmtByClass(_doc, _tag, _el)
{
var doc = _doc;
var tag = _tag;
var el = _el;
if (doc.getElementsByTagName) {
var nodes = doc.getElementsByTagName(tag);
var max = nodes.length;
for (var i = 0; i < max; i++) {
var node = nodes.item(i);
if (node.className == el) { node.style.display = "none"; }
}
}
}

function getElmtById(doc, idVal) {
if (doc.getElementById != null) {
return doc.getElementById(idVal);
}
if (doc.all != null) {
return doc.all[idVal];
}
alert("getElmtById has problem!");
return null;
}

function showAPMode()
{
var opmode = "<% getCfgGeneral(1, 'OperationMode'); %>";
var ap800_mode = "<% getCfgGeneral(1, '800_ap_mode'); %>";

if (opmode == "0") {
switch (ap800_mode) {
case "0":
showElmtByClass(document, "span", "ap");
hideElmtByClass(document, "span", "ap_btp");
hideElmtByClass(document, "span", "ap_btm");
hideElmtByClass(document, "span", "ap_wds");
hideElmtByClass(document, "span", "si");
hideElmtByClass(document, "span", "uni_repe");
break;
case "1":
showElmtByClass(document, "span", "ap_btp");
hideElmtByClass(document, "span", "ap");
hideElmtByClass(document, "span", "ap_btm");
hideElmtByClass(document, "span", "ap_wds");
hideElmtByClass(document, "span", "si");
hideElmtByClass(document, "span", "uni_repe");
break;
case "2":
showElmtByClass(document, "span", "ap_btm");
hideElmtByClass(document, "span", "ap_btp");
hideElmtByClass(document, "span", "ap");
hideElmtByClass(document, "span", "ap_wds");
hideElmtByClass(document, "span", "si");
hideElmtByClass(document, "span", "uni_repe");
break;
case "3":
showElmtByClass(document, "span", "ap_wds");
hideElmtByClass(document, "span", "ap_btm");
hideElmtByClass(document, "span", "ap_btp");
hideElmtByClass(document, "span", "ap");
hideElmtByClass(document, "span", "si");
hideElmtByClass(document, "span", "uni_repe");
break;
default:
break;
}
} else if (opmode == "2") {
showElmtByClass(document, "span", "si");
hideElmtByClass(document, "span", "ap_btm");
hideElmtByClass(document, "span", "ap_btp");
hideElmtByClass(document, "span", "ap");
hideElmtByClass(document, "span", "ap_wds");
hideElmtByClass(document, "span", "uni_repe");
} else if (opmode == "3") {
showElmtByClass(document, "span", "uni_repe");
hideElmtByClass(document, "span", "ap_btm");
hideElmtByClass(document, "span", "ap_btp");
hideElmtByClass(document, "span", "ap");
hideElmtByClass(document, "span", "ap_wds");
hideElmtByClass(document, "span", "si");
}
}

function initPage()
{
//if (top.iWebCfgLevel==0) {
showElmtByClass(document, "span", "admin");
//}
//if (top.iWebCfgLevel==1) {
//showElmtByClass(document, "span", "user");
//}
showAPMode();
}

////iTag////
//=0 : Ready,     show "Status: Ready" (black:black)
//=1 : Submit OK, show "Staus: Settings Saved" (black:black)
//=2 : "Configuration Backup" & "Signature upgrade" Staus: Upload Successful
//=3 : Firmware Upgrade fail
//=-1 : Submit ERROR, show "Staus: Invalid" (black:red)
//=-2: show nothing.
////END/////

var showit = (document.layers) ? "show" : "block";
var hideit = (document.layers) ? "hide" : "none";

getElmtById(document, "div1").style.display=hideit;
getElmtById(document, "div2").style.display=hideit;
getElmtById(document, "div3").style.display=hideit;
getElmtById(document, "div4").style.display=hideit;
getElmtById(document, "div5").style.display=hideit;

function showSta()
{
//var itag = '<!--#echo var="iActionStatusFlag"-->';
if(top.iFwUpgradeState == 3){
itag = 3;
}else{
itag = top.iActionStatusFlag;
}

if( top.ACTION_STATUS == -1 ){
switch(parseInt(itag)){

case 0:
getElmtById(document, "div1").style.display=showit;
getElmtById(document, "div2").style.display=hideit;
getElmtById(document, "div3").style.display=hideit;
getElmtById(document, "div4").style.display=hideit;
getElmtById(document, "div5").style.display=hideit;
break;
case 1:
getElmtById(document, "div1").style.display=hideit;
getElmtById(document, "div2").style.display=showit;
getElmtById(document, "div3").style.display=hideit;
getElmtById(document, "div4").style.display=hideit;
getElmtById(document, "div5").style.display=hideit;
break;
case 2:
getElmtById(document, "div1").style.display=hideit;
getElmtById(document, "div2").style.display=hideit;
getElmtById(document, "div3").style.display=hideit;
getElmtById(document, "div4").style.display=showit;
getElmtById(document, "div5").style.display=hideit;
break;
case 3:
getElmtById(document, "div1").style.display=hideit;
getElmtById(document, "div2").style.display=hideit;
getElmtById(document, "div3").style.display=hideit;
getElmtById(document, "div4").style.display=hideit;
getElmtById(document, "div5").style.display=showit;
break;
case -1:
getElmtById(document, "div1").style.display=hideit;
getElmtById(document, "div2").style.display=hideit;
getElmtById(document, "div3").style.display=showit;
getElmtById(document, "div4").style.display=hideit;
getElmtById(document, "div5").style.display=hideit;
break;
default:
getElmtById(document, "div1").style.display=hideit;
getElmtById(document, "div2").style.display=hideit;
getElmtById(document, "div3").style.display=hideit;
getElmtById(document, "div4").style.display=hideit;
getElmtById(document, "div5").style.display=hideit;
break;
}
}
if( top.ACTION_STATUS == 0 ){
getElmtById(document, "div1").style.display=showit;
getElmtById(document, "div2").style.display=hideit;
getElmtById(document, "div3").style.display=hideit;
getElmtById(document, "div4").style.display=hideit;
getElmtById(document, "div5").style.display=hideit;
}

if(top.main && itag != -2 && itag != 0) {
for( var d = 0; d < top.main.document.forms.length; d++ ) {
addhandlers( top.main.document.forms[d] );
for( var e = 0; e < top.main.document.forms[d].elements.length; e++ ) {
addhandlers(top.main.document.forms[d].elements[e]);
}
}
}
}

function handler( e ) {
var elmt, type;
if ( top.isNav ) { elmt = e.target;   type = e.type; }
if ( top.isIE )  { e = top.main.window.event;  elmt = e.srcElement;     type = e.type; }
if (!(elmt))
return;
if(type == top.ON_FOCUS)
parent.ACTION_STATUS = 0;

}

function addhandlers(_o){
var o = _o;
o.onfocus = handler;
}

if(i_only_show_mode == 1){
getElmtById(document, "div0").style.display=showit;
getElmtById(document, "div1").style.display=hideit;
getElmtById(document, "div2").style.display=hideit;
getElmtById(document, "div3").style.display=hideit;
getElmtById(document, "div4").style.display=hideit;
getElmtById(document, "div5").style.display=hideit;
} else {
setInterval("showSta()", 1000);
}

function damage_alert()
{
if(top.iFwUpgradeState == 3){
alert("Warning: Firmware Damage!!!\nYou must upgrade FW immediately, or the router will die after reboot!");
}
}
</script>