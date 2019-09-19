function ppnm(p, ele) {
  return p.getElementsByTagName(ele)
};
function ppid(id) {
  return document.getElementById(id)
};
function ppev(o, e, f) {
  o.addEventListener ? o.addEventListener(e, f, false) :o.attachEvent('on' + e, f)
};
var ss = {};
ss.slider = function() {
  var arg, move = function() {};
  move.prototype.init = function(opt) {
    arg = this.set(opt);
    var wrap = ppid(opt.gallery),
    ctl = ppid(opt.control),
    obj = this.obj = ppnm(wrap, 'ul')[0],
    $this = this;
    this.u = ppnm(obj, 'li');
    this.cu = ppnm(ctl, 'li');
    this.uW = this.u[1].offsetWidth;
    this.uH = this.u[1].offsetHeight;
    this.len = this.u.length;
    this.old = this.cur = arg.index;
    wrap.style.cssText = 'width:' + this.uW + 'px;' + 'height:' + this.uH + 'px;' + 'overflow:hidden;';
    obj.style.cssText = 'height:' + this.uH + 'px;' + 'width:' + (arg.dir ? this.uW + 'px;':this.len * this.uW + 'px;') + (arg.dir ? 'top:' + -1 * this.cur * this.uH + 'px;':'left:' + -1 * this.cur * this.uW + 'px;');
//    this.uW = ppid("eesai1k").offsetWidth;
//    this.uH = this.u[1].offsetHeight;
//    this.len = this.u.length;
//    this.old = this.cur = arg.index;
//	//li
//    wrap.style.cssText = 'width:' + this.uW + 'px;' + 'height:' + this.uH + 'px;' + 'overflow:hidden;';
//	//ul
//    obj.style.cssText = 'height:' + this.uH + 'px;' + 'width:' + (arg.dir ? this.uW + 'px;':this.len * this.uW + 'px;') + (arg.dir ? 'top:' + -1 * this.cur * this.uH + 'px;':'left:' + -1 * this.cur * this.uW + 'px;');
//	alert(eesai1k.offsetWidth+'\nppid("eesai1k").offsetHeight'+ppid("eesai1k").offsetHeight+'\nppid("eesai1k").offsetWidth'+ppid("eesai1k").offsetWidth+'\nwrap.offsetWidth'+wrap.offsetWidth+'\nthis.obj.offsetWidth'+this.obj.offsetWidth+'\nthis.uW'+this.uW+'\nthis.uH'+this.uH+'\nthis.u[1].offsetWidth'+this.u[1].offsetWidth+'\nwrap.style.cssText'+wrap.style.cssText+'\nobj.style.cssText'+obj.style.cssText);
//	this.u.style.width = ppid("eesai1k").offsetWidth + 'px';
    this.cu[this.cur].className = 'current';
    this.event(arg.type);
    setTimeout(function() {
      $this.auto()
    },
    arg.interval);
  };
  move.prototype.set = function(opt) {
    org = {
      gallery:'eesaiAimg',
      control:"eesaiAnum",
      dir:false,
      index:0,
      speed:16,
      interval:3000,
      type:'click'
    };
    for (var p in opt) {
      org[p] = opt[p]
    }
    return org;
  };
  move.prototype.timeMgr = function() {
    var $this = this;
    this.m = setTimeout(function() {
      $this.auto();
      $this.indexMgr()
    },
    arg.interval);
  };
  move.prototype.auto = function() {
    var $this = this;
    if (this.a != undefined) clearInterval(this.a);
    this.a = setInterval(function() {
      $this.pos()
    },
    arg.speed);
  };
  move.prototype.pos = function() {
    var dir = arg.dir ? parseInt(this.obj.style.top) :parseInt(this.obj.style.left),
    area = arg.dir ? this.uH:this.uW,
    dis = (area * this.cur + dir) * .1,
    step = dis >= 0 ? Math.ceil(dis) :Math.floor(dis);
    arg.dir ? this.obj.style.top = dir - step + 'px':this.obj.style.left = dir - step + 'px';
    this.stop(dir, area);
  };
  move.prototype.stop = function(dir, area) {
    if (Math.abs(dir) == area * this.cur) {
      clearInterval(this.a);
      this.cur == this.len - 1 ? this.cur = 0 :this.cur++;
      this.timeMgr();
    }
  };
  move.prototype.indexMgr = function() {
    this.cu[this.cur].className = 'current';
    if (this.old != this.cur) {
      this.cu[this.old].className = '';
      this.old = this.cur;
    }
  };
  move.prototype.event = function(e) {
    for (var i = 0;i < this.cu.length;i++) {
      var $this = this;
      ppev(this.cu[i], e, ppnu(i, $this));
    }
    function ppnu(n, $this) {
      return function() {
        clearInterval($this.a);
        clearTimeout($this.m);
        $this.cu[n].className = 'current';
        if ($this.old != n) {
          $this.cu[$this.old].className = '';
          $this.old = $this.cur = n;
        }
        $this.c = 0;
        $this.auto();
      }
    }
  };
  return move;
} ();