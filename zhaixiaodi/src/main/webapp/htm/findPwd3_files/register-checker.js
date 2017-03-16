define( ['apps/register-message', 'apps/register-checker-password'], function ( mess, password ) {
  function init () {
    var $user = $( '.user-name' );
    var $email = $( '.email' );
    var $password = $( '.main-password' );
    var $password_agin = $( '.password-agin' );
    var $code = $( '.code' );

    var $next = $( '.next-step' );
    var $form = $( '#fm1' );
    var $third_login = $( '.logging' );
    var $thirdLogin_from = $( '#credentials' );
    var code_result;

    $third_login.bind( 'click', function () {
      var _this = this;

      if ( $( this ).attr( 'belong' ) == 'third_login' )
      {
        var $username = $thirdLogin_from.find( '.user-name' );
        var $password = $thirdLogin_from.find( '.pass-word' );
        var url = '../check/login';

        $.getJSON( url, {
          userNameOrEmail: $username.val(),
          password: $password.val()
        }, function ( data ) {
          ( data.status == true )
            ? $thirdLogin_from.submit()
            : mess.error( $username.get( 0 ), 'empty', '', data.error );
        } );
      }
    } );

    $user.bind( 'focus', function () {
      if ( $( this ).attr( 'ischecked' ) == 'false' )
      {
        return false;
      }

      mess.prompt( this, 'prompt' );
    } );

    $user.bind( 'blur', function () {
      var _this = this;

      if ( $( this ).attr( 'ischecked' ) == 'false' )
      {
        return false;
      }

      if ( checkEmpty( this ) || this.value == '' )
      {
        mess.error( this, 'empty' );
        $( this ).addClass( 'error' );
        this.isSubmit = false;
      }
      else if ( /^\d/.test( this.value ) )
      {
    	  mess.error( this, 'userFormat' );
    	  $( this ).addClass( 'error' );
    	  this.isSubmit = false;
      }
      else
      {
        this.value = trimSpace( this );
        if(checkUserName( this )){
          $.get("register?action=validateUsername&username="+this.value , function(result){
            if(result=="true"){
              mess.success( _this, 'success' );
              _this.isSubmit = true;
              $( _this ).removeClass( 'error' );
            }else{
              $( _this ).addClass( 'error' );
              mess.error( _this, 'hasUser' );
              _this.isSubmit = false;
            }
          });
        }
        else
        {
          $( this ).addClass( 'error' );
          mess.error( this, 'userError' );
          this.isSubmit = false;
        }
      }
    } );

    $email.bind( 'focus', function () {

        mess.prompt( this, 'emailInfo' );
      } );
    $email.bind( 'blur', function () {
      var _this = this;

      if ( checkEmpty( this ) || this.value == '' )
      {
        mess.error( this, 'empty' );
        $( this ).addClass( 'error' );
        this.isSubmit = false;
      }
      else
      {
        this.value = trimSpace( this );
        if( checkMailFormat( this ) )
        {
          $.get( "register?action=validateEmail&email=" + this.value , function( result ) {
          if( result == "true" )
          {
            mess.success( _this, 'success' );
            _this.isSubmit = true;
            $( _this ).removeClass( 'error' );
          }
          else
          {
        	$( _this ).addClass( 'error' );
            mess.error( _this, 'hasEmail' );
            _this.isSubmit = false;
          }
        });

        }
        else
        {
          $( this ).addClass( 'error' );
          mess.error( this, 'emailError' );
          this.isSubmit = false;
        }
      }
    } );

    $password.bind( 'focus', function () {
      mess.prompt( this, 'passwordStrength', 'pass-word-strength' );
      $password_agin.get( 0 ).tooltip && $password_agin.get( 0 ).tooltip.remove();
      checkPassword( this );
    } );

    $password.bind( 'keyup', function () {
      checkPassword( this );
    } );

    $password.bind( 'blur', function () {
      this.tooltip && this.tooltip.remove();
      if ( this.value == '' )
      {
        mess.error( this, 'empty' );
        $( this ).addClass( 'error' );
      }
      else if ( this.value.length < 6 )
      {
        mess.error( this, 'pwless' );
        $( this ).addClass( 'error' );
        this.isSubmit = false;
      }
      else if ( this.value.length > 20 )
      {
        $( this ).addClass( 'error' );
        this.isSubmit = false;
      }
      else
      {
    	mess.success(  this, 'success' );
        $( this ).removeClass( 'error' );
      }
    } );

    $password_agin.bind( 'blur', function () {
      var _this = this;
      checkPassWordTwice( this, $password, function () {
    	mess.success( _this, 'success' );
        $( _this ).removeClass( 'error' );
      }, function () {
        $( _this ).addClass( 'error' );
      } );
    } );

    $( '.change-code' ).bind( 'click', function () {
      $("#yanzheng").attr( "src", "../ajax/verifyhandler.ashx?rand=" + new Date()/100 );
      return false;
    } );
  
    $code.bind( 'blur', function () {
        var _this = this;
        var $parent = $( this ).parent();
        var messTo = $parent.find( '.change-code' )
        var codeImg = $parent.find( '.code-img' );

        if ( !code_result )
        {
          mess.error( this, 'codeError' );
          // 针对验证码的提示信息进行重新定位
          this.tooltip.css( {
            left: this.tooltip.position().left + codeImg.width() + messTo.width() + 20.96875 + 'px'
          } );
          $( _this ).addClass( 'error' );
          _this.isSubmit = false;
        }
      } );

    $code.bind( 'keyup', function () {
      var _this = this;
      var $parent = $( this ).parent();
      var messTo = $parent.find( '.change-code' )
      var codeImg = $parent.find( '.code-img' );
      
      if ( this.value != '' )
      {
        $.get("register?action=validateCode&validateCode="+this.value , function( result ) {
          if ( result == "true" )
	  {
            mess.success( _this, 'success' );
            _this.tooltip.css( {
                left: _this.tooltip.position().left + codeImg.width() + messTo.width() + 20.96875 + 'px'
              } );
            $( _this ).removeClass( 'error' );
            _this.isSubmit = true;
	    code_result = true;
          }else{
      	    _this.tooltip && _this.tooltip.remove();
	    code_result = false;
          }
        } );
      }
      else
      {
          mess.error( this, 'empty' );
          this.tooltip.css( {
              left: this.tooltip.position().left + codeImg.width() + messTo.width() + 20.96875 + 'px'
            } );
          this.isSubmit = false;
      }
    } );

    $( '#agree' ).bind( 'click', function () {
      if ( this.checked )
      {
    	  var m = $( this ).parent().find( '#tooltip_arg' );
    	  m.hide();
      }
    } );


    $next.bind( 'click', function () {
      //var userUrl = "/check/username";
      //var emailUrl = "/check/email";
      var userUrl = "register?action=validateUsername&username="+$user.val();
      var emailUrl = "register?action=validateEmail&email=" + $email.val();
      var user = $user.get( 0 );
      var email = $email.get( 0 );
      var isNext = true;

      // 用户名检测
      $.getJSON( userUrl, {
        val: $user.val()
      } ).done( function ( success ) {
    	  //if ( !success.status )
    	  if(success=="false")
          {
    		mess.error( user, 'error', '', "用户名已被占用" );
            isNext = false;
          }
          else
          {
            // 邮箱检测
            $.getJSON( emailUrl, {
              val: $email.val()
            } ).done( function ( success ) {
            	//if ( !success.status )
                if(success=="false")
                {
                  mess.error( email, 'error', '', "邮箱已被占用" );
                  isNext = false;
                }

                isNext && $form.submit();
            } );
          }
      } );
    } );


    $form.bind( 'submit', function () {
      var isSubmit = submit();
      
      if ( !isSubmit )
      {
        var $elems = $( this ).find( 'input' ).filter( 'input[type!=submit][type!=hidden]' );
        $elems.each( function ( i, item ) {
          if ( item.value == '' )
          {
            mess.error( item, 'empty' );
            $( item ).addClass( 'error' );
          }
        } );
      }

      return isSubmit;
    } );
  }

  function checkEmpty ( _this ) {
    var reg = /^\s+$/;
    return reg.test( _this.value );
  }

  function trimSpace ( _this ) {
    var reg = /^\s+|\s+$/g;

    _this.value = _this.value.replace( reg, '' );
    return _this.value;
  }

  function checkUserName ( _this ) {
    var reg = /^[a-zA-Z0-9_]{2,20}$/;
    return reg.test( _this.value );
  }

  function checkMailFormat ( _this ) {
    var reg = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i;
    return reg.test( _this.value );
  }

  function checkPassWordLevel ( _this ) {
    // 如果有空格则删除
    if ( /\s+/g.test( _this.value ) )
    {
      _this.value = _this.value.replace( /\s+/g, '' );
    }

    var checked = password.checker( _this );
    var level = 0;
    var len = _this.value.length;
    var Length = {
      lowerLen: 6,
      ten: 10,
      fifteen: 15,
      maxLen: 20
    };

    if ( len == 0 )
    {
      level = 0;
      return level;
    }

    if ( len > Length.maxLen )
    {
      mess.error( _this, 'overPasswordMaxLength' );
      $( _this ).addClass( 'error' );
      _this.isSubmit = false;
      level = 3;
      return level;
    }
    else
    {
      $( _this ).removeClass( 'error' );
      mess.prompt( _this, 'passwordStrength', 'pass-word-strength' );
    }

    if ( len >= Length.lowerLen && len < Length.ten )
    {
      // 纯字母，纯字符大于等于6位且小于10位为低级
      if ( checked == 'number' || checked == 'letter' || checked == 'symbol' )
      {
        level = 1;
      }

      // 混排长度大于等于6位且小于10位为中级
      if ( checked == 'mix' )
      {
        level = 2;
      }
    }

    if ( len >= Length.ten && len <= Length.maxLen )
    {
      // 纯数字大于等于10位，小于等于20位为中级
      if ( checked == 'number' )
      {
        level = 2;
      }

      // 纯字母，纯字符, 大于等于10位且小于15位为中级
      if ( len >= Length.ten && len < Length.fifteen )
      {
        if ( checked == 'letter' || checked == 'symbol' )
        {
          level = 2;
        }
      }

      // 混排长度大于等于6位且小于10位为中级
      if ( len >= Length.lowerLen && len < Length.ten )
      {
        if ( checked == 'mix' )
        {
          level = 2;
        }
      }
    }

    // 混排大于等于10位且小于20位为高级
    if ( len >= Length.ten && len <= Length.maxLen )
    {
      if ( checked == 'mix' )
      {
        level = 3;
      }
    }

    // 纯字母，纯字符大于等于15位且小于20位为高级
    if ( len >= Length.fifteen && len <= Length.maxLen )
    {
      if ( checked == 'letter' || checked == 'symbol' )
      {
        level = 3;
      }
    }

    $( _this ).removeClass( 'error' );
    _this.isSubmit = true;

    return level;
  }

  function checkPassWordTwice ( _this, password, success, error ) {
    if ( _this.value != password.val() )
    {
      mess.error( _this, 'passwordError' );
      _this.isSubmit = false;
      password.get( 0 ).isSubmit = false;
      typeof error == 'function' && error();
    }
    else
    {
      if ( _this.tooltip )
      {
        _this.tooltip.remove();
      }
      _this.isSubmit = true;
      password.get( 0 ).isSubmit = true;
      typeof success == 'function' && success();

    }
  }

  function checkPassword ( _this ) {
    var level = checkPassWordLevel( _this );
    var tooltip = _this.tooltip;
    var $password_strength = tooltip.find( '.strength' ).find( 'span' );
    var $password_level = tooltip.find( '.level' );

    $password_level.html( State.passwordStrength[ level ] );

    $password_strength.removeClass();
    if ( level > 0 )
    {
      for ( var i = 0; i < level; i++ )
      {
        var span = $password_strength[ i ];
        $( span ).addClass( 'green' );
      }
    }
  }

  function submit () {
	var $arg = $( '#agree' );
    var $form = $( '#fm1' );
    var $elems = $form.find( 'input' );
    var isSubmit = false;

    $elems.each( function ( i, v ) {
      var item = $( v );
      if ( !item.hasClass( 'next-step' ) && item.attr( 'type' ) != 'hidden' )
      {
        if ( !v.isSubmit )
        {
          isSubmit = false;
          return false;
        }
        else
        {
          isSubmit = true;
        }
      }
    } );
    
    if ( $arg.length > 0 )
    {
      var arg = $arg.get( 0 );
            
      if ( !arg.checked )
      {
          var $m = $arg.parent();
          var $tip = $m.find( '#tooltip_arg' );
          
          $tip.show();
      }
      else
      {
    	  isSubmit = true;
      }
    }
    
    return isSubmit;
  }

  return {
    init: init
  };
} );
