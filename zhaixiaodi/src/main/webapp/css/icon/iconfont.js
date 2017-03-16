;(function(window) {

  var svgSprite = '<svg>' +
    '' +
    '<symbol id="icon-xiaoxi" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M511.989333 895.997315c-32.747348 0-85.335109 0-85.335109 0L192.004007 1023.999979 192.004007 789.349762c-116.973101-82.113709-192.003996-199.961495-192.003996-341.361771C1.1e-05 200.580175 229.231448 0 511.989333 0s511.989322 200.580175 511.989322 447.98799C1023.999989 695.438474 794.768552 895.997315 511.989333 895.997315L511.989333 895.997315zM511.989333 63.979998c-247.407816 0-448.030658 171.928912-448.030658 384.007992 0 130.136042 76.524259 250.543881 192.046664 319.985326l0 142.232294 170.627551-78.209628c0 0 47.979665 0 85.335109 0 247.407816 0 448.030658-171.928912 448.030658-384.007992C960.019991 235.887576 759.397149 63.979998 511.989333 63.979998L511.989333 63.979998zM768.015995 511.989322c-35.371403 0-64.022666-28.651263-64.022666-64.022666s28.651263-64.022666 64.022666-64.022666c35.328735 0 63.979998 28.651263 63.979998 64.022666S803.34473 511.989322 768.015995 511.989322L768.015995 511.989322zM511.989333 511.989322c-35.371403 0-64.022666-28.651263-64.022666-64.022666s28.651263-64.022666 64.022666-64.022666c35.371403 0 64.022666 28.651263 64.022666 64.022666S547.360736 511.989322 511.989333 511.989322L511.989333 511.989322zM255.984005 511.989322c-35.328735 0-63.979998-28.651263-63.979998-64.001332s28.651263-64.022666 63.979998-64.022666c35.371403 0 64.022666 28.651263 64.022666 64.022666S291.334074 511.989322 255.984005 511.989322L255.984005 511.989322z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-xiaoxitishitubiao" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M187.1 852.1l23-39.5C238 769.7 245.3 719.2 247 695c-63.5-57.5-98.7-132.6-98.7-212.6C148.3 311.5 311.5 172 512 172s363.7 139.4 363.7 310.4S712.5 792.7 512 792.7c-33.9 0-67.2-4.4-99.4-11.4-18.7 4.1-36.9 12.1-60.6 21.3-29.8 12.1-66.2 26.7-118.8 42.4l-46.1 7.1z m325.6-638.5c-177 0-321.3 120-321.3 267.9 0 70.3 32.7 137 91.4 187.2l7.8 6.8-0.5 10.2c-0.5 18.9-4.4 59.4-20.6 102.3 27.4-9.2 49-18.2 67.9-25.5 26.7-10.9 48.5-19.4 71.5-25l4.8-1.2 4.8 1.2c30.3 8 61.8 11.4 94.1 11.4 177 0 321.3-120 321.3-267.9S689.7 213.6 512.7 213.6z" fill="#EBEBEB" ></path>' +
    '' +
    '<path d="M358 545.3c-35.9 0-65-29.1-65-65 0-35.6 29.1-64.7 65-64.7s65 29.1 65 64.7c0 35.9-29.1 65-65 65z m0-96.5c-17.7 0-31.5 14.1-31.5 31.5 0 17.7 13.8 31.5 31.5 31.5s31.5-14.1 31.5-31.5-14.5-31.5-31.5-31.5zM512.7 545.3c-35.9 0-65-29.1-65-65 0-35.6 29.1-64.7 65-64.7s65 29.1 65 64.7c-0.2 35.9-29.3 65-65 65z m0-96.5c-17.7 0-31.5 14.1-31.5 31.5 0 17.7 13.8 31.5 31.5 31.5s31.5-14.1 31.5-31.5-14-31.5-31.5-31.5zM667.2 545.3c-35.9 0-65-29.1-65-65 0-35.6 29.1-64.7 65-64.7s65 29.1 65 64.7c0 35.9-29.1 65-65 65z m0-96.5c-17.7 0-31.5 14.1-31.5 31.5 0 17.7 13.8 31.5 31.5 31.5s31.5-14.1 31.5-31.5-13.8-31.5-31.5-31.5z" fill="#EBEBEB" ></path>' +
    '' +
    '<path d="M702.3 750.2m-101.4 0a101.4 101.4 0 1 0 202.8 0 101.4 101.4 0 1 0-202.8 0Z" fill="#FF1F22" ></path>' +
    '' +
    '</symbol>' +
    '' +
    '</svg>'
  var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
  var shouldInjectCss = script.getAttribute("data-injectcss")

  /**
   * document ready
   */
  var ready = function(fn) {
    if (document.addEventListener) {
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
        setTimeout(fn, 0)
      } else {
        var loadFn = function() {
          document.removeEventListener("DOMContentLoaded", loadFn, false)
          fn()
        }
        document.addEventListener("DOMContentLoaded", loadFn, false)
      }
    } else if (document.attachEvent) {
      IEContentLoaded(window, fn)
    }

    function IEContentLoaded(w, fn) {
      var d = w.document,
        done = false,
        // only fire once
        init = function() {
          if (!done) {
            done = true
            fn()
          }
        }
        // polling for no errors
      var polling = function() {
        try {
          // throws errors until after ondocumentready
          d.documentElement.doScroll('left')
        } catch (e) {
          setTimeout(polling, 50)
          return
        }
        // no errors, fire

        init()
      };

      polling()
        // trying to always fire before onload
      d.onreadystatechange = function() {
        if (d.readyState == 'complete') {
          d.onreadystatechange = null
          init()
        }
      }
    }
  }

  /**
   * Insert el before target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var before = function(el, target) {
    target.parentNode.insertBefore(el, target)
  }

  /**
   * Prepend el to target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var prepend = function(el, target) {
    if (target.firstChild) {
      before(el, target.firstChild)
    } else {
      target.appendChild(el)
    }
  }

  function appendSvg() {
    var div, svg

    div = document.createElement('div')
    div.innerHTML = svgSprite
    svgSprite = null
    svg = div.getElementsByTagName('svg')[0]
    if (svg) {
      svg.setAttribute('aria-hidden', 'true')
      svg.style.position = 'absolute'
      svg.style.width = 0
      svg.style.height = 0
      svg.style.overflow = 'hidden'
      prepend(svg, document.body)
    }
  }

  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    window.__iconfont__svg__cssinject__ = true
    try {
      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    } catch (e) {
      console && console.log(e)
    }
  }

  ready(appendSvg)


})(window)