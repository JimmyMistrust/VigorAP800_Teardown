function addNode(_id, _name) {
	if (_id == "br")
		document.write('<hr size=1>');
	else {
        var a_id = 'A_' + _id;
        var m_id = 'M_' + _id;
        var nodeName = _name;
        document.write('<li id="'+a_id+'"><a target="_self" onclick="Toggle(this.parentNode);" href="#">'+nodeName+'</a>');
        document.write('<ul class="level1" id="'+m_id+'"></ul>');
    }
}

function addSubNode(_id, _pid, _name, _url) {
	var nodeId = _id;
    var nodeName = _name;
    var nodeUrl = _url;
    
    if (_pid == null) {
        document.write('<li class="link" id="'+nodeId+'"><a href="'+nodeUrl+'" onClick=clickOnLink("'+nodeId+'")>'+nodeName+'</a></li>');
		return;
	}
	
    var parentId = 'M_' + _pid;
    var parentNode = document.getElementById(parentId);
    parentNode.innerHTML += '<li class="link" id="'+nodeId+'"><a href="'+nodeUrl+'" onClick=clickOnLink("'+nodeId+'")>'+nodeName+'</a></li>';
}

function clickOnLink(clickedId)
{
	clickedDOMObj = document.getElementById(clickedId);
	if (clickedDOMObj != null) {
        if (lastClicked != null) {
            var prevClickedDOMObj = document.getElementById(lastClicked.id);
            prevClickedDOMObj.setAttribute("className", "link");
            prevClickedDOMObj.setAttribute("class", "link");
		}
        clickedDOMObj.setAttribute("className", "clicked_link");
        clickedDOMObj.setAttribute("class", "clicked_link");		
	}    
	lastClicked = clickedDOMObj;
}

function addSupportNode(_id, _name, _url) {
	var nodeId = _id;
    var nodeName = _name;
    var nodeUrl = _url;
    
    if (nodeUrl == "#")
       document.write('<li class="support" id="'+nodeId+'"><span>'+nodeName+'</span></li>');
    else
       document.write('<li class="support" id="'+nodeId+'"><a href="'+nodeUrl+'">'+nodeName+'</a></li>');
}

function SetState(menu_ul, visible)
{
    if (visible)
        menu_ul.style.display = '';
    else
        menu_ul.style.display = 'none';
}

function Toggle(actuator)
{
    var mname = actuator.id.replace(/^A_/, "M_");
    var submenu = document.getElementById(mname);
    if(submenu) {
        var visible = submenu.style.display == "none" ? false : true;
        InitExpand();
        var tmp = document.getElementsByTagName("ul");
        for(var i=0; i<tmp.length; i++) {
        	var menu = tmp[i];
        	if(submenu.id == menu.id) {
        		if(!visible) {
    				SetState(submenu, true);
    				SetState(menu, true);
        		} else {
        			if(submenu.id != menu.id)SetState(menu, true);
        			SetState(submenu, false);
        		}
        	}
        }
    } else {
        alert("Unknown submenu: " + mname);
    }
}

function InitExpand()
{
    var submenus = document.getElementsByTagName("ul");
    var i;
    for(i = 0; i < submenus.length; i++) {
        var menu = submenus[i];
        SetState(menu, menu.className == "level0");
    }
}

function MenuLoad()
{
    InitExpand();
}

var lastClicked = null;