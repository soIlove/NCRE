define( function () {
  function init () {
    var $bindCsdn = $( '.bind-csdn' ).find( 'a' );
    var $item, $parent, $noCurrent, $noCurrentLayer;

    $bindCsdn.each( function ( i, item ) {
      $item = $( item );
      $noCurrent = !$item.hasClass( 'current' ) ? $item.parent() : $noCurrent;
      $noCurrentLayer = !$item.hasClass( 'current' ) ? $( '.' + $item.attr( 'tag' ) + '-third-part' ) : $noCurrentLayer;

      $item.bind( 'click', function () {
        $parent = $( this ).parent();
        $parent.hide();
        $( '.' + $( this ).attr( 'tag' ) + '-third-part' ).hide();

        $noCurrent.show();
        $noCurrentLayer.show();
        $noCurrent = $parent;
        $noCurrentLayer = $( '.' + $( this ).attr( 'tag' ) + '-third-part' );
	resetUserInfo();
        return false;
      } );
    } );
  }

  function resetUserInfo () {
    var $user = $( '.user-info' );
    var $login = $( '.logining' );
    var $inputs_user = $user.find( 'input' );
    var $inputs_login = $login.find( 'input' );
    var type;

    $inputs_user.each( function ( i, item ) {
      type = item.type;
      
      if ( type == 'text' || type == 'password' )
      {
        item.value = '';
        item.isSubmit = false;
        item.tooltip && item.tooltip.remove();
        $( item ).removeClass( 'error' );
      }
    } );

    $inputs_login.each( function ( i, item ) {
      type = item.type;
    	
      if ( type == 'text' || type == 'password' )
      {
        item.value = '';
        item.isSubmit = false;
        item.tooltip && item.tooltip.remove();
        $( item ).removeClass( 'error' );
      }
    } );
  }

  return {
    init: init
  }
} );
