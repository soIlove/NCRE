'use strict';

~(function (w, $) {
  if (!document.addEventListener) return 'IE8 sucks';

  var TRACKER = 'https://perf.ele.me/_.gif?';
  var ERROR = {
    id: function id(ev) {
      return 'You need a "project/id", like perf-' + ev + '="project/id"';
    },
    data: '`perf-data` show be a json string'
  };
  var img = new Image();
  var errorCache = {};

  // by default: log errors
  errorHandler();

  // save performance
  var isLoad = 0;
  if (w.performance) {
    w.addEventListener('beforeunload', savePerf);
    w.addEventListener('load', savePerf);
  }

  // auto save use `perf-EVENT`
  ['click', 'contextmenu', 'dblclick', 'mousedown', 'mouseenter', 'mouseleave', 'mousemove', 'mouseover', 'mouseout', 'mouseup', 'keydown', 'keypress', 'keyup', 'abort', 'beforeunload', 'error', 'hashchange', 'load', 'pageshow', 'pagehide', 'resize', 'scroll', 'unload', 'blur', 'change', 'focus', 'focusin', 'focusout', 'input', 'invalid', 'reset', 'search', 'select', 'submit', 'drag', 'dragend', 'dragenter', 'dragleave', 'dragover', 'dragstart', 'drop', 'copy', 'cut', 'paste', 'afterprint', 'beforeprint', 'abort', 'canplay', 'canplaythrough', 'durationchange', 'ended', 'error', 'loadeddata', 'loadedmetadata', 'loadstart', 'pause', 'play', 'playing', 'progress', 'ratechange', 'seeked', 'seeking', 'stalled', 'suspend', 'timeupdate', 'volumechange', 'waiting', 'animationend', 'animationiteration', 'animationstart', 'transitionend'].forEach(function (ev) {
    var els = $('[perf-' + ev + ']');
    if (!els.length) return;
    [].slice.call(els).forEach(function (el) {
      return el.addEventListener(ev, eventHandler);
    });
  });

  // expose for access
  w.perf = { send: send, stat: caculatePerf };

  function send(message) {
    if (!message.id) {
      if (w.PERF_DEBUG) throw new Error(ERROR.id('click'));
      console.log(ERROR.id(click));
    }

    img.src = TRACKER + obj2Query(message) + ('&time=' + Date.now());

    // for debug
    if (typeof w.PERF_DEBUG === 'function') w.PERF_DEBUG(message);

    return perf;
  }

  function errorHandler() {
    w.addEventListener('error', function (e) {
      var key = e.filename + e.lineno + e.colno + w.location.href;
      if (errorCache[key]) return;
      errorCache[key] = true;
      send({
        id: w.location.href,
        line: e.lineno + ':' + e.colno,
        file: e.filename,
        error: e.message
      });
    });
  }

  function eventHandler(e) {
    var ev = e.type;
    var raw = {};
    var message = {
      id: this.getAttribute('perf-' + ev),
      event: ev
    };

    if (!message.id) {
      if (w.PERF_DEBUG) throw new Error(ERROR.id(ev));
      return console.log(ERROR.id(ev));
    }

    if (this.getAttribute('perf-route')) message.route = this.getAttribute('perf-route');

    var err = null;
    if (this.getAttribute('perf-data')) {
      raw = this.getAttribute('perf-data');
      try {
        raw = JSON.parse(raw);
      } catch (e) {
        err = 1;
        if (w.PERF_DEBUG) throw new Error(ERROR.data);
        console.log(err);
      }
    }

    if (!err) send(asign(raw, message));
  }

  function type(obj) {
    return Object.prototype.toString.call(obj).slice(8, -1);
  }

  function caculatePerf() {
    var table = [['lookup', ['requestStart', 'navigationStart']], ['waiting', ['responseStart', 'requestStart']], ['receiving', ['responseEnd', 'responseStart']], ['parsing', ['domComplete', 'domLoading']], ['contentLoaded', ['domContentLoadedEventStart', 'navigationStart']], ['pageLoaded', ['loadEventStart', 'navigationStart']]];

    var detail = {};
    table.forEach(function (item) {
      return detail[item[0]] = time.apply(w.performance, item[1]);
    });
    return detail;

    function time(end, start) {
      return this.timing[end] - this.timing[start];
    }
  }

  function savePerf() {
    if (isLoad) return;
    isLoad = 1;
    send({ id: w.location.href, perf: caculatePerf() });
  }

  function obj2Query(obj) {
    var str = '';

    var _loop = function _loop() {
      if (!obj.hasOwnProperty(p)) return 'continue';
      var encodedP = encodeURIComponent(p);
      if (type(obj[p]) === 'Array') {
        str += obj[p].map(function (item) {
          return encodedP + '[]=' + encodeURIComponent(item);
        }).join('&');
        str += '&';
      } else if (type(obj[p]) === 'Object') {
        var cur = obj[p];
        for (k in cur) {
          str += cur[k] ? encodedP + '[' + k + ']=' + encodeURIComponent(cur[k]) + '&' : '';
        }
      } else {
        str += encodedP + '=' + encodeURIComponent(obj[p]) + '&';
      }
    };

    for (var p in obj) {
      var k;

      var _ret = _loop();

      if (_ret === 'continue') continue;
    }
    return str.slice(0, -1);
  }

  function asign(dist, src) {
    for (var p in src) {
      dist[p] = src[p];
    }return dist;
  }
})(window, function (selector, parent) {
  parent = document || parent;
  return parent.querySelectorAll(selector);
});
