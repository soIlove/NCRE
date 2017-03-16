define( function () {
  var $tabs = $( '.nav-tabs' ).find( 'li' );
  var $layer = $( '.mode-layer-js' );
  var $curTab, $currLayer, currIndex;

  function init () {
    $tabs.each( function ( i, item ) {
      if ( $( item ).hasClass( 'active' ) )
      {
        $curTab = $( item );
        $currLayer = $( $layer.get( i ) );
        currIndex = i;
        return false;
      }
    } );

    $tabs.each( function ( i, item ) {
      $( item ).bind( 'click', function () {
        switchTab( this, i );
        return false;
      } );
    } );
  }

  function switchTab ( _this, index ) {
    var $item = $( _this );
    var $layerItem = $( $layer.get( index ) );

    $curTab.removeClass( 'active' );
    $currLayer.hide();
    $item.addClass( 'active' );
    $layerItem.show();

    $curTab = $item;
    $currLayer = $layerItem;
  }

  return {
    init: init
  }
} );