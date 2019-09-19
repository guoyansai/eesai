var $ = function (id) {
    return "string" == typeof id ? document.getElementById(id) : id;
};

function addEventHandler(oTarget, sEventType, fnHandler) {
    if (oTarget.addEventListener) {
        oTarget.addEventListener(sEventType, fnHandler, false);
    } else if (oTarget.attachEvent) {
        oTarget.attachEvent("on" + sEventType, fnHandler);
    } else {
        oTarget["on" + sEventType] = fnHandler;
    }
};

function Each(arrList, fun){
    for (var i = 0, len = arrList.length; i < len; i++) { fun(arrList[i], i); }
};

function GetOption(val, txt) {
    var op = document.createElement("OPTION");
    op.value = val; op.innerHTML = txt;
    return op;
};

var Class = {
create: function() {
    return function() {
      this.initialize.apply(this, arguments);
    }
}
}

Object.extend = function(destination, source) {
    for (var property in source) {
        destination[property] = source[property];
    }
    return destination;
}


var CascadeSelect = Class.create();
CascadeSelect.prototype = {
//select集合，菜单对象
initialize: function(arrSelects, arrMenu, options) {
    if(arrSelects.length <= 0 || arrMenu.lenght <= 0) return;//菜单对象
    var oThis = this;
    this.Selects = [];//select集合
    this.Menu = arrMenu;//菜单对象
    this.SetOptions(options);
    this.Default = this.options.Default || [];
    this.ShowEmpty = !!this.options.ShowEmpty;
    this.EmptyText = this.options.EmptyText.toString();
    //设置Selects集合和change事件
    Each(arrSelects, function(o, i){
        addEventHandler((oThis.Selects[i] = $(o)), "change", function(){ oThis.Set(i); });
    });
    this.ReSet();
},
//设置默认属性
SetOptions: function(options) {
    this.options = {//默认值
        Default:    [],//默认值(按顺序)
        ShowEmpty:    asaiselectempty,//是否显示空值(位于第一个)
        EmptyText:    asaiselectmostr//空值显示文本(ShowEmpty为true时有效)
    };
    Object.extend(this.options, options || {});
},
//初始化select
ReSet: function() {

    this.SetSelect(this.Selects[0], this.Menu, this.Default.shift());
    this.Set(0);
},
//全部select设置
Set: function(index) {
    var menu = this.Menu
    //第一个select不需要处理所以从1开始
    for(var i=1, len = this.Selects.length; i < len; i++){
        if(menu.length > 0){
            //获取菜单
            var value = this.Selects[i-1].value;
            if(value!=""){
                Each(menu, function(o){ if(o.val == value){ menu = o.menu || []; } });
            } else { menu = []; }
            
            //设置菜单
            if(i > index){ this.SetSelect(this.Selects[i], menu, this.Default.shift()); }
        } else {
            //没有数据
            this.SetSelect(this.Selects[i], [], "");
        }
    }
    //清空默认值
    this.Default.length = 0;
},
//select设置
SetSelect: function(oSel, menu, value) {
    oSel.options.length = 0; oSel.disabled = false;
    if(this.ShowEmpty){ oSel.appendChild(GetOption("", this.EmptyText)); }
    if(menu.length <= 0){ oSel.disabled = true; return; }
    Each(menu, function(o){
        var op = GetOption(o.val, o.txt ? o.txt : o.val); op.selected = (value == op.value);
        oSel.appendChild(op);
    });    
}
};

function asaiselectctjs(){
    var menu = asaiselectcity;
    var sel=["CTA", "CTB", "CTC", "CTD", "CTE", "CTF"];
    var val=asaiselectvalue;
    var cs = new CascadeSelect(sel, menu, { Default: val });
//手动切换空值显示开关
//$("btnA").onclick=function(){cs.ShowEmpty=!cs.ShowEmpty;}
//<input id="btnA" type="button" value="显示/不显示空值" />
}