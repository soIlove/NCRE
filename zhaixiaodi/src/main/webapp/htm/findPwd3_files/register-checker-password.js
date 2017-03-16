define( function () {
  var Regs = {
    letter: /^[a-zA-Z]+$/,
    digit: /^\d+$/,
    symbol: /^[^\d\w\s]+$/
  };

  function checker ( _this ) {
    var checked;

    if ( letter( _this ) )
    {
      checked = 'letter';
    }
    else if ( number( _this ) )
    {
      checked = 'number';
    }
    else if ( symbol( _this ) )
    {
      checked = 'symbol';
    }
    else if ( mix( _this ) )
    {
      checked = 'mix';
    }
    return checked;
  }

  function number ( _this ) {
    return Regs.digit.test( _this.value );
  }

  function letter ( _this ) {
    return Regs.letter.test( _this.value );
  }

  function symbol ( _this ) {
    return Regs.symbol.test( _this.value );
  }

  function mix ( _this ) {
    return ( !number( _this ) && !letter( _this ) && !symbol( _this ) ) ? true : false;
  }

  return {
    checker: checker
  }
} );