/*
 * en: english
 * zhcn: Simple Chinese
 * zhtw: Traditional Chinese
 * de: German
 * fr: French
 * pl: polish
 * ru: Russian
 */
var language_define = "en";

// "Butterfat internationalization" (b28n.js)
//  Released under the GNU GPL  by bmuller@buttterfat.net- http://www.gnu.org/licenses/gpl.txt
//  Modified by winfred_lu@ralinktech.com.tw for our need

var Butterlate = new Butterlation();
window._ = function(key) { return Butterlate.gettext(key); };
window.__ = function(key,replacements) { return Butterlate.vgettext(key,replacements); };

function Butterlation() {
  this.dict = new ButterDictionary();
  this.getLang = function() {
  	return language_define;  // for translation
    var one, two, end;
    if((one=document.cookie.indexOf("language"))==-1) {
      return "en";
    }
    end = (document.cookie.indexOf(';',one)!=-1) ? document.cookie.indexOf(';',one) : document.cookie.length;
    return unescape(document.cookie.substring(one+9,end));
  };
  this.lang = this.getLang();
  this.setTextDomain = function(domain) { this.po=window.location.protocol+"//"+window.location.host+"/lang/"+this.lang+"/"+domain+".xml"; this.initializeDictionary(); }
  this.initializeDictionary = function() {
    var request;
    try { request = new XMLHttpRequest(); } catch(e1) {
      try { request = new ActiveXObject("Msxml2.XMLHTTP"); } catch(e2) {
        try { request = new ActiveXObject("Microsoft.XMLHTTP"); } catch(e3) { return; }}};
    request.open("GET",this.po,false); 
    request.send(null);
    if(request.status==200) { 
      var pos = request.responseXML.documentElement.getElementsByTagName("message");
        
		for(var i=0; i<pos.length; i++) {
			if(pos[0].getAttribute("msgstr_"+this.lang) == null){
				this.dict.set(pos[i].getAttribute("msgid"),pos[i].getAttribute("msgstr"));
			} else {
				this.dict.set(pos[i].getAttribute("msgid"),pos[i].getAttribute("msgstr_"+this.lang));
			}
		}
	    
    }
  };
  this.gettext = function(key) { return this.dict.get(key); };
  this.vgettext = function(key,replacements) { 
    var nkey=this.gettext(key); var index; var count=0;
    if(replacements.length==0) return nkey;
    while((index=nkey.indexOf('%s'))!=-1) { 
      nkey=nkey.substring(0,index)+replacements[count]+nkey.substring(index+2,nkey.length); 
      count = ((count+1)==replacements.length) ? count : (count+1);
    }
    return nkey;
  };
}
      
function ButterDictionary() {
  this.keys = new Array();
  this.values = new Array();
  this.set = function(key,value) { 
    var index = this.getIndex(key);
    if(index==-1) { this.keys.push(key); this.values.push(value); }
    else this.values[index]=value;
  };
  this.get = function(key) {
    var index;
    if((index=this.getIndex(key))!=-1) return this.values[index];
    return key;
  };
  this.getIndex = function(key) {
    var index=-1;
    for(var i=0; i<this.keys.length; i++) if(this.keys[i]==key) { index=i; break; }
    return index;
  };
  this.keyExists = function(key) { return (this.getIndex(key)!=1); };
  this.deleteKey = function(key) { 
    var index = getIndex(key);
    if(index!=-1) { this.keys.splice(index,1); this.values.splice(index,1); }
  };
}


