var Message = ( function () {
  var $tooltip = $( '#tooltip' );
  var $root = $tooltip.parent();

  function success ( _this, key, cl ) {
    var $clone, $msg, $_this, $pos;
    var cl = cl || 'success';

    _this.tooltip && _this.tooltip.remove();

    $_this = $( _this );
    $clone = getCloneTooltip();
    $pos = $_this.position();
    _this.tooltip = $clone.clone;

    setPos( $_this, $clone.clone, $pos );
    $clone.clone.addClass( cl );
    $clone.msg.html( State[ key ].msg );
    $root.append( $clone.clone );
  }

  function prompt ( _this, key, cl ) {
    var $clone, $msg, $_this, $pos;
    var cl = cl || 'prompt';

    _this.tooltip && _this.tooltip.remove();

    $_this = $( _this );
    $clone = getCloneTooltip();
    $pos = $_this.position();
    _this.tooltip = $clone.clone;

    setPos( $_this, $clone.clone, $pos );
    $clone.clone.addClass( cl );
    $clone.msg.html( State[ key ].msg );
    $root.append( $clone.clone );
  }

  function waring ( _this, key ) {}

  function error ( _this, key, cl, mess ) {
    var $clone, $msg, $_this, $pos;
    var cl = cl || 'error';

    _this.tooltip && _this.tooltip.remove();

    $_this = $( _this );
    $clone = getCloneTooltip();
    $pos = $_this.position();
    _this.tooltip = $clone.clone;

    setPos( $_this, $clone.clone, $pos );
    $clone.clone.addClass( cl );
    $clone.msg.html( mess || State[ key ].msg );
    $root.append( $clone.clone );
  }

  function getCloneTooltip () {
    var $clone, $msg;

    $clone = $tooltip.clone();
    $msg = $clone.find( '.mess' );

    return {
      clone: $clone,
      msg: $msg
    }
  }

  function setPos ( _this, tooltip, pos ) {
    var inching = 30;

    tooltip.css( {
      left: pos.left + _this.width() + inching + 'px',
      top: pos.top + 'px'
    } );
  }

  function clearTip ( _this ) {
    _this.tooltip && _this.tooltip.remove();
  }

  return {
    success: success,
    prompt: prompt,
    waring: waring,
    error: error,
    clearTip: clearTip
  }
} )();