Butterlate.setTextDomain("msg");

var isNav = ( navigator.appName.indexOf( "Netscape" ) != -1 );
var isIE = ( navigator.appName.indexOf( "Microsoft" ) != -1 );
var isOpr = ( navigator.appName.indexOf( "Opera" ) != -1 );

var IP_FMT = "IP";
var MAC_FMT = "MAC";

function chkPwd(_SysOldPass, _w1, _w2, _w3)
{
	var SysOldPass = _SysOldPass;
	var w1 = _w1;
	var w2 = _w2;
	var w3 = _w3;

	if( w2.value != w3.value )
	{
		w1.value = w2.value = w3.value = "";
		return false;
	}
	else
	{
		return true;
	}
}
////////////////// check Ip is valid //////////////
//      control.value == bool --> active all element

function enable0( _control )
{
	var control = _control;
	if(!(control.checked == true))
	{
		control.focus();
	}
}

function cpntCtrl( _ctrl, _frm, _fstElmt, _cnt)
{
	var ctrl = _ctrl, frm = _frm, fstElmt = _fstElmt, cnt = _cnt;
	var check;
	var tt = getIdxOfForm(fstElmt);

	/* if ctrl lose right of control */
	if ( ctrl == true ||  ctrl == false ) {
		check = ctrl;
		for ( var i = tt; i < cnt + tt; i++ ) {
			frm[i].disabled = !check;
		}
		return;
	}

	switch ( ctrl.type ) {
		case "radio":
		case "checkbox":
			check = ctrl.checked;
			for ( var i = tt; i < cnt + tt; i++ ) {
				frm[i].disabled = !check;
			}
			break;
	} // switch
}

function swapElmt( _elmt1, _elmt2 )
{
	var elmt1 = _elmt1;
	var elmt2 = _elmt2;
	var temp;
	
	if ( elmt1.type != "text" || elmt1.type != elmt2.type ) return false;
	temp = elmt1.value;
	elmt1.value = elmt2.value;
	elmt2.value = temp;
}

function checkPortsRange( _elmt1, _elmt2 )
{
	var elmt1 = _elmt1;
	var elmt2 = _elmt2;
	var error = false;
	var nElmt1 = elmt1.value;
	var nElmt2 = elmt2.value;
	
	if ( ( elmt1.value != "" && !(elmt1.value >= 0 && elmt1.value <= 0xffff) ) )
	{
		elmt1.value = elmt1.value.slice( 0, elmt1.value.length-1 );
		if ( isNav ) elmt1.select();
		error = true;
	}
	if ( ( elmt2.value != "" && !( elmt2.value >= 0 && elmt2.value <= 0xffff ) ) )
	{
		elmt2.value = elmt2.value.slice( 0, elmt2.value.length-1 );
		if ( isNav ) elmt2.select();
		error = true;
	}
}

function isSwapPorts( _elmt1, _elmt2 )
{
	var elmt1 = _elmt1;
	var elmt2 = _elmt2;

	if ( elmt1.value == "" ) elmt1.value = 0;
	if ( elmt2.value == "" ) elmt2.value = 0;
	elmt1.value = parseInt( elmt1.value, 10 );
	elmt2.value = parseInt( elmt2.value, 10 );
	if ( isNaN(elmt1.value) ) elmt1.value = "";
	if ( isNaN(elmt2.value) ) elmt2.value = "";
	if ( parseInt(elmt1.value) > parseInt(elmt2.value) ) swapElmt( elmt1, elmt2 );
}

function check4Ip( _elmt )
{
	var elmt = _elmt;
	var idx = getIdxOfForm( elmt );
	chword( elmt.form[idx], elmt.form[idx+1] );
	chword( elmt.form[idx+1], elmt.form[idx+2] );
	chword( elmt.form[idx+2], elmt.form[idx+3] );
	chword( elmt.form[idx+3], elmt.form[idx+3] );
}

function chword( _f1, _f2 )
{
	var f1 = _f1;
	var f2 = _f2;
	if ( f1.value.indexOf(".") >= 0 )
	{
		f1.value = f1.value.slice( 0, f1.value.length-1 );
		if ( f1 != f2 )
		{
			f2.focus();
		}
		return;
	}
	if( !(f1.value <= 255 && f1.value >= 0) )
	{
		f1.value = f1.value.slice( 0, f1.value.length-1 );
		if ( isNav )
		{
			f1.select();
		}
	}
}

function raisePower( _x, _y )
{
	var x = _x;
	var y = _y;
	return Math.pow( x, y )
}

function isStrIp( _strIp )
{
	var strIp = _strIp;
	strIp += "";
	var aryIp = strIp.split(".");
	if( aryIp.length != 4 ) return false;
	else {
		for( var i=0, u32Ip=0; i<4; i++ )
		{
			if( !(aryIp[i] <= 255 && aryIp[i] >= 0) ) return false;
			u32Ip += parseInt(aryIp[i])*raisePower(256, 3-i);
		}
	}
	if ( u32Ip > 0 && u32Ip <= 0xffffffff ) return true;  //shirley,20050804,Mantis 2283
	else return false;
}

function inet_addr( _strIp )
{
	var strIp = _strIp;
	var aryIp;
	if(isStrIp(strIp)){
		aryIp = strIp.split(".");
	}else{
		return strIp;
	}
	if( aryIp.length != 4 || aryIp[3] == "" )
	{
		return false;
	}
	else
	{
		for( var i=0, uiIp=0; i<4; i++)
		{
			if( !(aryIp[i] <= 255 && aryIp[i] >= 0) )
			{
				return false;
			}
			uiIp += aryIp[i]*raisePower(256, 3-i);
		}
	}
	return uiIp;
}

function inet_ntoa( _uiIp )
{
	var uiIp = _uiIp;
	var strIp = new String();
	var aryIp = new Array();
	if ( uiIp == 0 || uiIp == 0xffffffff )
	{
		strIp = "";
		return strIp;
	}
	for ( i=0; i<4; i++ )
	{
		aryIp[3-i] = uiIp % 256;
		uiIp = (uiIp - aryIp[3-i])/256;
	}
	for ( i=0; i<4; i++ )
	{
		if( i < 3 ) strIp += aryIp[i]+".";
		else strIp += aryIp[i];
	}
	return strIp;
}

function isEqualLan( _ip1, _mask1, _ip2 )
{
	var ip1 = _ip1;
	var mask1 = _mask1;
	var ip2 = _ip2;
	var uiIp1 = inet_addr( ip1 );
	var uiMsk1 = inet_addr( mask1 );
	var uiIp2 = inet_addr( ip2 );
	if( ((Math.floor(uiIp1/0x10000) & Math.floor(uiMsk1/0x10000)) == (Math.floor(uiIp2/0x10000) & Math.floor(uiMsk1/0x10000))) &&
		((Math.floor(uiIp1%0x10000) & Math.floor(uiMsk1%0x10000)) == (Math.floor(uiIp2%0x10000) & Math.floor(uiMsk1%0x10000))) )
		return true;
	else
		return false;
}

function setEqualLan( _ip1, _mask1, _ip2 )
{
	var ip1 = _ip1;
	var mask1 = _mask1;
	var ip2 = _ip2;
	if( isEqualLan( ip1, mask1, ip2 ) == false )
	{
		var uiIp1 = inet_addr( ip1 );
		var uiMsk1 = inet_addr( mask1 );
		var uiIp2 = inet_addr( ip2 );
		uiIp2 = (uiIp1 & uiMsk1) | (uiIp2 & ~uiMsk1);
		return  inet_ntoa( uiIp2 );
	}
	return true;
}

function getIdxOfForm( _elmt )
{
	var elmt = _elmt;
	if ( elmt.type )
	{
		for ( var i=0; i<elmt.form.length; i++ )
		{
			if(elmt.name!="" && elmt.form[i].name!=""){
				if( elmt.name == elmt.form[i].name) return i;
			}else{
				if( elmt == elmt.form[i]) return i;
			}
		}
	}
	return false;
} 

function getIdxbyName(_form, _name )
{
	if (!_name || _name == "") return false;
	for (var i=0; i<_form.length; i++) {
		if (_form[i].name != "" && _form[i].name == _name) return i;
	}
	return false;
}

// spare ULONG IP or Address IP to 4 IP of text
// the kind of vle is 'string ip' or 'U32 ip' or ''
function spareIp( _elmt, _vle )
{
	var elmt = _elmt;
	var vle = _vle;
	var aryIp = new Array(4);
	var idx = getIdxOfForm( elmt );
	if ( "" == vle )
	{
		aryIp[0] = aryIp[1] = aryIp[2] = aryIp[3] = "";
	}
	else if ( isStrIp( vle ) )
	{
		aryIp = vle.split(".");
	}
	else if ( vle > 0 && vle < 0xffffffff )
	{
		aryIp = inet_ntoa( vle ).split(".");
	}
	else
		return false;
		
	for ( var i=0; i<4; i++ )
	{
		elmt.form[idx+i].value = aryIp[i];
	}
}

// mix 4 ip of number to IP address
function mixIp( _elmt )
{
	var elmt = _elmt;
	var idx = getIdxOfForm( elmt );
	var strIp = "";
	strIp = elmt.form[idx+0].value + "." + elmt.form[idx+1].value + "." + elmt.form[idx+2].value + "." + elmt.form[idx+3].value;
	if ( isStrIp( strIp ) )
		return strIp;
	else if ( "..." == strIp )
	{
		strIp = "";
		return strIp;
	}
	else
		return false;
}

function setVle2Elmt( _elmt, _vle, _fmt )
{
	var elmt = _elmt;
	var vle = _vle;
	var fmt = _fmt;
	switch( elmt.type )
	{
		case "button":
			break;
		case "checkbox":
			if ( vle > 0 || true == vle || "true" == vle || "1" == vle || "on" == vle )
				elmt.checked = true;
			else
				elmt.checked = false;
			break;
		case "radio":
			for ( var i=0; i<elmt.form.length; i++ )
				if ( elmt.name == elmt.form[i].name && ( vle == elmt.form[i].value ) )
					elmt.form[i].checked = true;
			break;
		case "submit":
			break;
		case "text":
		case "hidden":
			if ( fmt == IP_FMT )
				spareIp( elmt, vle );
			else
				elmt.value = vle;
			break;
		case "password":
			elmt.value = vle;
			break;
		case "select-one":
			for ( var i=0; i<elmt.options.length; i++ )
			{
				if ( elmt.options[i].value == vle )
				{
					elmt.selectedIndex = i;
					elmt.options[i].selected = true;
					return;
				}
			}
			elmt.selectedIndex  = 0;
			break;
		case "textarea":
			elmt.value=vle;
			break;
	}
	return;
}

function getVleFromElmt( _elmt, _fmt )
{
	var elmt = _elmt;
	var fmt = _fmt;

	switch( elmt.type )
	{
		case "button":
			break;
		case "checkbox":
			if ( elmt.checked == true )
				return "1";
			else
				return "0";
			break;
		case "radio":
			for ( var i=0; i<elmt.form.length; i++ )
				if ( elmt.name == elmt.form[i].name && (true == elmt.form[i].checked ) )
					return elmt.form[i].value;
			break;
		case "submit":
			break;
		case "text":
		case "hidden":
			if ( fmt == IP_FMT ){
				if ( mixIp( elmt ) != false ) return mixIp( elmt );
				else return "";
			}
			else if ( fmt == MAC_FMT ){
				if ( mixMac( elmt ) != false ) return mixMac( elmt );
				else return "";
			}
			else
				return elmt.value;
			break;
		case "password":
			return elmt.value;
			break;
		case "select-one":
			for ( var i=0; i<elmt.options.length; i++ )
				if ( elmt.options[i].selected == true )
				{
					return elmt.options[i].value;
				}
			break;
	}
} 

var _choosePc_ip;
var _choosePc_elmt;
var _choosePc_aryIp;
function choosePc( elmt, aryIp )
{
	_choosePc_elmt = elmt;
	if ( aryIp == null ) {
		_choosePc_aryIp = new Array();
	}
	else {
		_choosePc_aryIp = aryIp;
	}
	_choosePc_ip = 0;
	aWindow = window.open("../cgi-bin/func.cgi?fid="+FUNC_FID_CHOOSE_PC,"pcWindow","toolbars=no,width=150px,height=200px,status=no,scrollbars=no,resize=yes,menubar=no");
	cycle();
}

function cycle()
{
	if( _choosePc_ip != 0 ){
		setVle2Elmt( _choosePc_elmt, _choosePc_ip, 0 );  //shirley,20060607
	}else{
		window.setTimeout( "cycle()",500 );
	}
}

function escapeUrl(str) {
	str = escape(str);
	str = str.replace(/\+/g, "%2b");
	str = str.replace(/%20/g, "+");
	return str;
}

function isStrPort(str) {
	var b,c,d;
	var strPort = str;
	strPort += "";
	if( strPort.length == 0){
		return false;
	}
	for( b = 0; b <  strPort.length ; b++){
		c = parseInt( strPort.charAt(b),10 );
		if( isNaN(c) ){
			return false;
		}
	}
	d = parseInt( strPort ,10 );
	if ( isNaN(d) ){
		return false;
	}
	if ( ( d >= 65536 ) || ( d <= 0 ) )
		return false;
	
	return true;
}

function getElmtById(doc, idVal)
{
	if(doc.getElementById != null) {
		return doc.getElementById(idVal);
	}
	if(doc.all != null) {
		return doc.all[idVal];
	}
	alert("getElmtById has problem!");
	return null;
}

function strFormat(str, len)
{
	str = str.toString();
	var l = checkLength(str);
	for(var i=l; i<len; i++){
		str += "\u00a0";
	}
	return str;
}

function checkLength(strTemp)
{
	var i,sum;
	sum=0;
	for(i=0;i<strTemp.length;i++)
	{
		if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255))
			sum=sum+1;
		else
			sum=sum+2;
	}
	return sum;
}

function adjHex(_elmt, _vle)
{
	var elmt = _elmt;
	var vle = _vle;
	if (elmt != null && elmt.value != null) {
		if (!isNaN( parseInt(elmt.value, 16))) {
			if ((elmt.value.indexOf( "0" ) == 0 && elmt.value.length == 2 &&
				parseInt(elmt.value, 16) > 0 ) || elmt.value == "00" ) {
				elmt.value = "0"+parseInt(elmt.value, 16).toString(16).toUpperCase();
			} else {
				elmt.value = parseInt(elmt.value, 16).toString(16).toUpperCase();
			}
			if ((vle != 1) && (elmt.value.length == 2)) {
				elmt.form[getIdxOfForm( elmt )+1].focus();
				elmt.form[getIdxOfForm( elmt )+1].select();
			}
		} else {
			elmt.value = "";
		}
	}
}

function mixMac(elmt)
{
	var strMac="";
	var i, j, idx;
	idx = getIdxOfForm( elmt );
	for (i=0; i<6; i++) {
		j = idx + i;
		if (elmt.form[j].value.length == 1) {
			elmt.form[j].value = "0"+elmt.form[j].value;
		}
		if(i < 5)strMac += elmt.form[j].value + "-";
		else strMac += elmt.form[j].value;
	}
	if(strMac == "-----"){
		alert("Mac Address cannot be empty!");
		return false;
	}
	else if(strMac == "00-00-00-00-00-00"){
		alert("Mac Address cannot be \"00:00:00:00:00:00\".");
		return false;
	}
	return strMac;
}

function JudgeNetMask( Mask )
{
	var r,i, rb, chg, zcount;
	var judge;
	if(Mask == "255.255.255.255") return true;
	judge = inet_addr(Mask);
	if(judge == 0 ) return false;
	r = judge & (1<<0)? 1:0;
	chg = 0;
	zcount = r ? 0 : 1;
	for(i=1; i<=31; i++){
		judge >>= 1;
		rb = judge & (1<<0)? 1:0;
		if(rb != r) r = rb, chg++;
		if(chg >= 2) return false;
		if(r == 0) zcount ++;
	}
	return true;
}

function ShellSort(_arr, _key, _type)
{
	var arr = _arr;
	var key = _key;
	var tp = _type;
	var increment = arr.length;
	do {
		increment = (increment/3|0) + 1;
		arr = ShellPass(arr, increment, key, tp);
	}
	while (increment > 1)
	return arr;
}

function ShellPass(_arr, _d, _key, _type)
{
	var arr = _arr;
	var d = _d;
	var key = _key;
	var tp = _type;
	var iTmp1, iTmp2, aryTemp, j;
	if(!tp){
	    for(var i=d; i<arr.length; i++) {
		    iTmp1 = strParser(arr[i][key]);
		    iTmp2 = strParser(arr[i-d][key]);
		    if(iTmp1 < iTmp2) {
			    aryTemp = arr[i];
			    j = i-d;
			    do {
				    arr[j+d] = arr[j];
				    j = j-d;
			    }
			    while (j>-1 && strParser(aryTemp[key]) < strParser(arr[j][key]));
			    arr[j+d] = aryTemp;
		    }
	    }
	}else{
		for(var i=d; i<arr.length; i++) {
			iTmp1 = strParser(arr[i][key]);
			iTmp2 = strParser(arr[i-d][key]);
			if(iTmp1 > iTmp2) {
				aryTemp = arr[i];
				j = i-d;
				do {
					arr[j+d] = arr[j];
					j = j-d;
				}
				while (j>-1 && strParser(aryTemp[key]) > strParser(arr[j][key]));
				arr[j+d] = aryTemp;
			}
		}
	}
	return arr;
}

function strParser(_str)
{
	var str = _str;
	str = str.replace(/\s{1,}/g, "");
	str = str.replace(/\(/g, "");
	str = str.replace(/\/\d+\)/g, "");
	str = str.replace(/\/\d+/g, "");
    str = str.replace(/>/g, "");
    str = str.replace(/_[-\w]+/g, "");
	if(isStrIp(str)){
		str = inet_addr(str);
	}else if(!isNaN(parseInt(str))){
		str = parseInt(str);
	}else if(str == "---"){
		str = -1;
	}else{
		str = -2;
	}
	return str;
}

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

function showElmtById(_doc, _el)
{
	var doc = _doc;
	var el = _el;
	getElmtById(doc, el).style.display = style_display_on();
	getElmtById(doc, el).style.visibility = "visible";
}

function hideElmtById(_doc, _el)
{
	var doc = _doc;
	var el = _el;
	getElmtById(doc, el).style.display = "none"; 
	getElmtById(doc, el).style.visibility = "hidden";
}

function HttpCheck(__string) {
	var urlStyle1 = /^http:\/\/[A-Za-z0-9\-]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
	var urlStyle2 = /^Http:\/\/[A-Za-z0-9\-]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
	var urlStyle3 = /^[A-Za-z0-9\-]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
	
	if (!urlStyle1.test(__string) && !urlStyle2.test(__string) && !urlStyle3.test(__string)){
		return false;
	}
	return true;
}

function HttpsCheck(__string) {
	var urlStyle1 = /^https:\/\/[A-Za-z0-9\-]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
	var urlStyle2 = /^Https:\/\/[A-Za-z0-9\-]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
	var urlStyle3 = /^[A-Za-z0-9\-]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
	
	if (!urlStyle1.test(__string) && !urlStyle2.test(__string) && !urlStyle3.test(__string)){
		return false;
	}
	return true;
}

function isStrNum(str) {
   var b,c,d;	
   var strByte = str;
   strByte += "";
   if( strByte.length == 0){
   	return false;
   }
   for( b = 0; b <  strByte.length ; b++){
     c = parseInt( strByte.charAt(b),10 );
     if( isNaN(c) ){
    	return false;
     }
   }
   d = parseInt( strByte ,10 );
   if ( isNaN(d) ){
    	return false;
   } 
   return true;
}

function adv_format(value,num)   //四舍五入
    {
    var a_str = formatnumber(value,num);
    var a_int = parseFloat(a_str);
    if (value.toString().length>a_str.length)
        {
        var b_str = value.toString().substring(a_str.length,a_str.length+1);
        var b_int = parseFloat(b_str);
        if (b_int<5)
            {
            return a_str;
            }
        else
            {
            var bonus_str,bonus_int;
            if (num==0)
                {
                bonus_int = 1;
                }
            else
                {
                bonus_str = "0.";
                for (var i=1; i<num; i++)
                    bonus_str+="0";
                bonus_str+="1";
                bonus_int = parseFloat(bonus_str);
                }
            a_str = formatnumber(a_int + bonus_int, num);
            }
        }
        return a_str;
    }

function formatnumber(value,num)    //直接去尾
    {
    var a,b,c,i;
    a = value.toString();
    b = a.indexOf('.');
    c = a.length;
    if (num==0)
        {
        if (b!=-1)
            a = a.substring(0,b);
        }
    else
        {
        if (b==-1)
            {
            a = a + ".";
            for (i=1;i<=num;i++)
                a = a + "0";
            }
        else
            {
            a = a.substring(0,b+num+1);
            for (i=c;i<=b+num;i++)
                a = a + "0";
            }
        }
    return a;
    }

function resizeWindow(win)
{
	var w = win.document.body.scrollWidth+60;
	var h = win.document.body.scrollHeight+60;
	win.resizeTo(w,h);
}

function getCharset(_doc)
{
	var charset = "";
	if (isNav) {
		charset = _doc.characterSet.toUpperCase();
	} else if (isIE || isOpr) {
		charset = _doc.charset.toUpperCase();
	}
	return charset;
}

function adjHex(_elmt, _vle)
{
	var elmt = _elmt;
	var vle = _vle;
	if (elmt != null && elmt.value != null) {
		if (!isNaN( parseInt(elmt.value, 16))) {
			if ((elmt.value.indexOf( "0" ) == 0 && elmt.value.length == 2 &&
				parseInt(elmt.value, 16) > 0 ) || elmt.value == "00" ) {
				elmt.value = "0"+parseInt(elmt.value, 16).toString(16).toUpperCase();
			} else {
				elmt.value = parseInt(elmt.value, 16).toString(16).toUpperCase();
			}
			if ((vle != 1) && (elmt.value.length == 2)) {
				elmt.form[getIdxOfForm( elmt )+1].focus();
				elmt.form[getIdxOfForm( elmt )+1].select();
			}
		} else {
			elmt.value = "";
		}
	}
}

function checkHex(str)
{
	var len = str.length;

	for (var i=0; i<str.length; i++) {
		if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
			(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
			(str.charAt(i) >= 'A' && str.charAt(i) <= 'F') ) {
				continue;
		} else
	        return false;
	}
    return true;
}

function clearChildNodes(elem) {
    while (elem.childNodes.length > 0) {
        elem.removeChild(elem.firstChild);
    }
    return elem;
}

function addCell(tr, td, content)
{
    td.appendChild(content);    // Add content to cell
    tr.appendChild(td);         // Add cell to row
}

function CreateStyledElement(element, style, id)
{
    var elm = document.createElement(element);
    elm.id = elm.name = id;
    elm.setAttribute("class", style); // For FF
    elm.setAttribute("className", style); // For MSIE
    return elm;
}

function CreateTd(style)
{
    return CreateStyledElement("td", style);
}

function addTypedTextCell(tr, type, value, style, colspan)
{
    var cell = CreateStyledElement(type, style);
    if(colspan)
        cell.setAttribute("colSpan", colspan);
    addCell(tr, cell, document.createTextNode(value));
    return cell;
}

function addTextCell(tr, value, style, colspan)
{
    return addTypedTextCell(tr, "td", value, style, colspan);
}

function addTextHeaderCell(tr, value, style, colspan)
{
    return addTypedTextCell(tr, "th", value, style, colspan);
}

function addLabelTextCell(tr, value, style, id)
{
    var td = CreateTd(style);
    var label = document.createElement("label");
    label.setAttribute("for", id);
    addCell(td, label, document.createTextNode(value));
    tr.appendChild(td);
    return td;
}

function addCheckBoxCell(tr, value, style, name)
{
    var td = CreateTd(style);
    var field = document.createElement("input");
    field.type = "checkbox";
    field.id = field.name = name;
    addCell(tr, td, field);
    if(value) {
        field.setAttribute("checked", true); // FF
        field.setAttribute("defaultChecked", true); // MSIE+W3C
    }
    return field;
}

function addSelectCell(tr, oT, oV, value, style, name)
{
    var td = CreateTd(style);
    var field = document.createElement('select');
    field.id = field.name = name;
    var x;
    for (x=0; x < oT.length; x++) {
        var optionItem = document.createElement('option');
        optionItem.value = oV[x];
        if(value == optionItem.value) {
            optionItem.setAttribute("selected", true);
            optionItem.setAttribute("defaultSelected", true);
        }
        optionItem.appendChild(document.createTextNode(oT[x]));
        field.appendChild(optionItem);
    }
    addCell(tr, td, field);
    return field;
}

function addSelectCellCol(tr, oT, oV, value, style, name, colspan)
{
    var td = CreateTd(style);
    td.colSpan = colspan;
    var field = document.createElement('select');
    field.id = field.name = name;
    var x;
    for (x=0; x < oT.length; x++) {
        var optionItem = document.createElement('option');
        optionItem.value = oV[x];
        if(value == optionItem.value) {
            optionItem.setAttribute("selected", true);
            optionItem.setAttribute("defaultSelected", true);
        }
        optionItem.appendChild(document.createTextNode(oT[x]));
        field.appendChild(optionItem);
    }
    addCell(tr, td, field);
    return field;
}

function addSelectCellHide(tr, oT, oV, value, style, name)
{
    var td = CreateTd(style);
    td.setAttribute('style', 'display:none');
    td.style.display ="none";
    var field = document.createElement('select');
    field.id = field.name = name;
    var x;
    for (x=0; x < oT.length; x++) {
        var optionItem = document.createElement('option');
        optionItem.value = oV[x];
        if(value == optionItem.value) {
            optionItem.setAttribute("selected", true);
            optionItem.setAttribute("defaultSelected", true);
        }
        optionItem.appendChild(document.createTextNode(oT[x]));
        field.appendChild(optionItem);
    }
    addCell(tr, td, field);
    return field;
}

function addInputCell(tr, value, style, name, size)
{
    var td = CreateTd(style);
    var field = document.createElement('input');
    field.id = field.name = name;
    field.setAttribute("size", size);
    field.setAttribute("value", value);
    field.setAttribute("defaultValue", value);
    addCell(tr, td, field);
    return field;
}

function addInputAreaCell(tr, value, style, name, col_size, row_size)
{
    var td = CreateTd(style);
    var field = document.createElement('textarea');
    field.id = field.name = name;
    field.setAttribute("rows", row_size);
    field.setAttribute("cols", col_size);
    field.value = value;
    field.defaultValue = value;
    addCell(tr, td, field);
    return field;
}

function addHiddenInputCell(tr, value, style, name, size)
{
    var td = CreateTd(style);
    var field = document.createElement('input');
    field.id = field.name = name;
    field.setAttribute("size", size);
    field.setAttribute("value", value);
    field.setAttribute("defaultValue", value);
    field.type = 'hidden';
    addCell(tr, td, field);
    return field;
}

function addPasswordCell(tr, value, style, name, size)
{
    var td = CreateTd(style);
    var field = document.createElement('input');
    field.type = 'password';
    field.id = field.name = name;
    field.setAttribute("size", size);
    field.setAttribute("value", value);
    field.setAttribute("defaultValue", value);
    addCell(tr, td, field);
    return field;
}

function addImageCell(tr, style, src, text)
{
    var td = CreateTd(style);
    var field = document.createElement('img');
    field.src = src;
    field.border = 0;
    field.title = field.alt = text;
    addCell(tr, td, field);
    return field;
}

function addRadioCell(tr, value, style, name, id)
{
    var td = CreateTd(style);
	var field=document.createElement('input');//for IE9 compatibility issue
 
    field.id = id;
    field.name = name;
    field.type = "radio";
    field.setAttribute("value",id);
    addCell(tr, td, field);
    if (value) {
        field.setAttribute("checked", "checked");
        field.setAttribute("defaultChecked", "checked"); // MSIE+W3C
    }    
    return field;
}

function addLink(tr, style, url, text, target)
{
    // default vlaue
    var  target = (target == null) ? "" : target;


    var td = CreateStyledElement("td", style);
    var link = document.createElement("a");
    link.href = url;
    link.target = target;
    link.appendChild(document.createTextNode(text)); // Add Text
    td.appendChild(link);       // Add link to cell
    tr.appendChild(td);         // Add cell to row
}

function addHiddenParam(form, name, value)
{
    var field = document.createElement('input');
    field.type = 'hidden';
    field.id = field.name = name;
    field.value = value;
    form.appendChild(field);         // Add cell to row
    return field;
}

function addButtonCell(tr, value, style, name)
{
    var td = CreateTd(style);
    var field = document.createElement('input');
    field.id = field.name = name;
    field.type = "button";
    field.value = value;
    addCell(tr, td, field);
    return field;
}

function UpdateId(id, val)
{
    var elm = document.getElementById(id);
    if(elm) {
        elm.innerHTML = val;
    }
    return elm;
}

function atoi(str, num)
{
	i = 1;
	if (num != 1) {
		while (i != num && str.length != 0) {
			if (str.charAt(0) == '.') {
				i++;
			}
			str = str.substring(1);
		}
		if (i != num)
			return -1;
	}

	for (i=0; i<str.length; i++) {
		if (str.charAt(i) == '.') {
			str = str.substring(0, i);
			break;
		}
	}
	if (str.length == 0)
		return -1;
	return parseInt(str, 10);
}

function checkRange(str, num, min, max)
{
	d = atoi(str, num);
	if (d > max || d < min)
		return false;
	return true;
}

function isAllNum(str)
{
	for (var i=0; i<str.length; i++) {
		if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ))
			continue;
		return 0;
	}
	return 1;
}

function checkIpAddr(field, ismask)
{
	if (field.value == "") {
		alert("Error. IP address is empty.");
		field.value = field.defaultValue;
		field.focus();
		return false;
	}

	if (isAllNum(field.value) == 0) {
		alert('It should be a [0-9] number.');
		field.value = field.defaultValue;
		field.focus();
		return false;
	}

	if (ismask) {
		if ((!checkRange(field.value, 1, 0, 256)) ||
				(!checkRange(field.value, 2, 0, 256)) ||
				(!checkRange(field.value, 3, 0, 256)) ||
				(!checkRange(field.value, 4, 0, 256)))
		{
			alert('IP address format error.');
			field.value = field.defaultValue;
			field.focus();
			return false;
		}
	}
	else {
		if ((!checkRange(field.value, 1, 0, 255)) ||
				(!checkRange(field.value, 2, 0, 255)) ||
				(!checkRange(field.value, 3, 0, 255)) ||
				(!checkRange(field.value, 4, 1, 254)))
		{
			alert('IP address format error.');
			field.value = field.defaultValue;
			field.focus();
			return false;
		}
	}
	return true;
}

function checkStrictInjection(str)
{
	var len = str.length;
	for (var i=0; i<str.length; i++) {
		if ( str.charAt(i) == ';' || str.charAt(i) == ',' ||
			 str.charAt(i) == '\r' || str.charAt(i) == '\n'){
				return false;
		}else
	        continue;
	}
    return true;
}

function style_display_on()
{
	if (window.ActiveXObject) 	{ // IE
		return "block";
	} else if (window.XMLHttpRequest) { // Mozilla, Safari,...
		return "table-row";
	}
}
function searchArgs(search)
{
    var tups = search.substring(1).split('&');
    var args = new Array();
    for(var i = 0; i < tups.length; i++) {
        var tup = tups[i].split('=');
        if(tup.length == 2)
            args[tup[0]] = tup[1];
        else
            args[tup[0]] = 1;
    }
    return args;
}

function SetVisible(id, visible)
{
    var elm = document.getElementById(id);
    if (visible)
        elm.style.display = '';
    else
        elm.style.display = 'none';
}

function initXMLHTTP()
{
    var req = false;
    if (window.XMLHttpRequest) {
        try {
            req = new XMLHttpRequest();
        } catch(e) {
            req = false;
        }
    } else if (window.ActiveXObject) {
        try {
            req = new ActiveXObject("Msxml2.XMLHTTP");
        } catch(e) {
            try {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            } catch(e) {
                req = false;
            }
        }
    }
    return req;
}

function loadXMLDoc(method, file, callback, content)
{
    var req = initXMLHTTP();

    if (!req) {
        alert('Cannot create an XMLHTTP instance');
        return false;
    }

    req.open(method, file, true);
    req.onreadystatechange = function() {
        try {
            if (req.readyState == 4) {
                if (req.status && req.status == 200) {
                    callback(req);
                    req = null; // MSIE leak avoidance
                } else {
                    var status;
                    try {
                        status = req.statusText;
                    } catch(e) {
                        status = "Unknown error";
                    }
                    alert("There was a problem retrieving the dynamic data:\n" + status);
                    callback(req);
                    req = null; // MSIE leak avoidance
                }
            }
        } catch(e) {
            req = null; // MSIE leak avoidance
        }
    };
    req.send(content);
    return req;
}