// * -*- Mode: java; c-basic-offset: 4; tab-width: 8; c-comment-only-line-offset: 0; -*-
/*
 
 Vitesse Switch Software.
 
 Copyright (c) 2002-2008 Vitesse Semiconductor Corporation "Vitesse". All
 Rights Reserved.
 
 Unpublished rights reserved under the copyright laws of the United States of
 America, other countries and international treaties. Permission to use, copy,
 store and modify, the software and its source code is granted. Permission to
 integrate into other products, disclose, transmit and distribute the software
 in an absolute machine readable format (e.g. HEX file) is also granted.  The
 source code of the software may not be disclosed, transmitted or distributed
 without the written permission of Vitesse. The software and its source code
 may only be used in products utilizing the Vitesse switch products.
 
 This copyright notice must appear in any copy, modification, disclosure,
 transmission or distribution of the software. Vitesse retains all ownership,
 copyright, trade secret and proprietary rights in the software.
 
 THIS SOFTWARE HAS BEEN PROVIDED "AS IS," WITHOUT EXPRESS OR IMPLIED WARRANTY
 INCLUDING, WITHOUT LIMITATION, IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR USE AND NON-INFRINGEMENT.
 
*/
// **********************************  AJAX.JS  ********************************
// *
// * Author: Lars Povlsen
// *
// * --------------------------------------------------------------------------
// *
// * Description:  Client-side JavaScript functions.
// *
// * To include in HTML file use:
// *
// * <script language="javascript" type="text/javascript" src="lib/ajax.js"></script>
// *
// * --------------------------------------------------------------------------

function initXMLHTTP() {
    // branch for native XMLHttpRequest object
    var req = false;
    if(window.XMLHttpRequest) {
    	try {
            req = new XMLHttpRequest();
        } catch(e) {
            req = false;
        }
    // branch for IE/Windows ActiveX version
    } else if(window.ActiveXObject) {
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

function loadXMLDoc(file,callback,ref)
{
    var req = initXMLHTTP();
    req.open("GET", file, true);
    req.onreadystatechange = function () {
        try {
            if (req.readyState == 4) {
                if (req.status && req.status == 200) {
                    callback(req, ref);
                    req = null; // MSIE leak avoidance
                } else {
                    var status;
                    try{
                        status = req.statusText;
                    }
                    catch(e){
                        status = "Unknown error";
                    }
                    alert("There was a problem retrieving the dynamic data:\n" +
                          status);
                    callback(req, ref);
                    req = null; // MSIE leak avoidance
                }
            }
        }
        catch(e){
            req = null; // MSIE leak avoidance
        }
    };
    req.send("n/a");
    return req;
}

function redirectOnErrorExtract(req, def_url)
{
    var str = req.responseText;
    var url = false;
    if(req.responseText) {
        if(str.match(/^Error:\s+/)) {
            url = str.replace(/^Error:\s+/, "");
        }
    } else {
        // Use default error URL, if any!
        if(def_url)
            url = def_url;
    }
    return url;
}

function redirectOnError(req, def_url)
{
    var url = redirectOnErrorExtract(req, def_url);
    if(url) {
        if(typeof(top.setErrorReferrer) == "function")
            top.setErrorReferrer(window.location.pathname);
        window.location.pathname = url;
    }
    return url;
}
