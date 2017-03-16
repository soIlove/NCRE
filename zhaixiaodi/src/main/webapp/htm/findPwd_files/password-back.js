define( function () {
  var $username = $( '.user-name' );
  var $code = $( '.code' );
  var $answer = $( '.answer' );
  var $form = $( '.form' );
  var $validateCode = $( '.change-code' );
  var $phonenumber = $('.phone_number');
  var $sendCode = $('.send_phone_code');
  var $resendCode = $('.resend-code');
  var urls = {
    username: 'register?action=validateUsernameOrEmailExists&username=',
    code: 'register?action=validateCode&validateCode=',
    answer: '../account/fpwd?action=checkQuestionAnswerCorrect&username='+$("#username").val()+'&questionIndex='+$("#questionIndex").val()+'&answer=',
  	getnextquestion: '../account/fpwd?action=getNextQuestion&username='+$("#username").val()+'&questionIndex=',
  	mobile: '../account/fpwd?action=checkMobile&username='+$("#mobileuser").val()+'&mobile=',
  	mobcode: '../account/fpwd?action=sendMobileCode&username='+$("#mobileuser").val()+'&mobile='
  };

  function init () {
    $username && $username.bind( 'blur', function () {
      checker( this, 'username' );
    } );

    $code && $code.bind( 'blur', function () {
      checker( this, 'code' );
    } );

    $answer && $answer.bind( 'blur', function () {
      checker( this, 'answer' );
    } );

    $form.bind( 'submit', function () {
      return submit( this );
    } );
    
    $validateCode.bind( 'click', function () {
        $("#yanzheng").attr( "src", "../ajax/verifyhandler.ashx?rand=" + new Date()/100 );
        return false;
      } );
    
    $( '#getNextQuestion' ).bind( 'click', function () {
      	getNextQuestion('getnextquestion' );
      } );
    
    $phonenumber && $phonenumber.bind( 'blur', function () {
    	var regMob = /^\d{11}$/;
    	if (regMob.test(this.value)){
    		hideErrorLayer ( this );
    		checker( this, 'mobile' );
    	}
    	else{
    		var $parent = $phonenumber.parent();
  	        var $errorLayer = $parent.find( '.prompt-answer' );
  	        $errorLayer.html("<span class='alert alert-danger alert-answer'><strong></strong>您输入的手机号错误，请重新输入！</span>");
  	        $errorLayer.show();
    	}
      } );
    
    $sendCode.bind('click', function() {
        var $countDown, _this;
        $countDown = $('.countdown');
        _this = this;
        var regMob = /^\d{11}$/;
    	if (!regMob.test($("#phonenumber").val())){
    		var $parent = $( _this ).parent();
  	        var $errorLayer = $parent.find( '.prompt-answer' );
  	        $errorLayer.html("<span class='alert alert-danger alert-answer'><strong></strong>手机号码有误，请重新填写！</span>");
  	        $errorLayer.show();
  	        return false;
    	}
      	$(this).html('发送中……');
          asyQuery({
            url: urls[ 'mobcode' ]+$("#phonenumber").val(),
            data: {
            },
            success: function(dt) {
              if (dt.err === 0) {
                hideErrorLayer ( _this );
                isOK = true;
                $(_this).hide();
                $resendCode.css("display","inline-block");
                $countDown.css("display","inline-block");
                countDown($countDown.find('i'), function() {
                	$resendCode.hide();
                	$countDown.hide();
                    $(_this).show();
                  return $(_this).html('发送验证码');
                });
              } else {
            	  var $parent = $( _this ).parent();
        	      var $errorLayer = $parent.find( '.prompt-answer' );
        	      $errorLayer.html("<span class='alert alert-danger alert-answer'><strong></strong>"+dt.msg+"</span>");
        	      $errorLayer.show();
                $(_this).html('发送验证码');
                isOK = false;
              }
            }
          });
        return false;
      });
  }

  // 妫�煡閭楠岃瘉鐮侊紝鎵嬫満楠岃瘉鐮侊紝瀵嗕繚绛旀
  function checker ( _this, st ) {
    var url = urls[ st ];

    if ( _this.value != '' )
      {
        $.get( url + _this.value, function( result ) {
          if( result == "true" ) {
        	hideErrorLayer( _this);
            _this.isSubmit = true;
          }
          else if( result == "false" )
          {
            showErrorLayer( _this );
            _this.isSubmit = false;
          }
          else{
        	  var $parent = $( _this ).parent();
    	      var $errorLayer = $parent.find( '.prompt-answer' );
    	      $errorLayer.html("<span class='alert alert-danger alert-answer'><strong></strong>"+result+"</span>");
    	      $errorLayer.show();
          }
        } );
      }
      else
      {
          showErrorLayer( _this );
          _this.isSubmit = false;
      }
  }
  
  function getNextQuestion(st ){
	  var url = urls[ st ];
	  $.get( url + $("#questionIndex").val(), function( result ) {
		  var data = eval("(" + result + ")");
		  $("#questionIndex").val(data.questionIndex);
		  $(".answer-info").html(data.question);
	  } );
  }

  function submit ( _this ) {
    var $elems = $( _this ).find( 'input[type="text"]' );
    var isSubmit = false;

    $elems.each( function ( i, item ) {
      if ( item.isSubmit )
      {
        isSubmit = true;
      }
      else
      {
        isSubmit = false;
        return false;
      }
    } );

    return isSubmit;
  }

  function showErrorLayer ( _this ) {
    var $parent = $( _this ).parent();
    var $errorLayer = $parent.find( '.prompt-answer' );
    $errorLayer.show();
  }
  
  function hideErrorLayer ( _this ) {
    var $parent = $( _this ).parent();
    var $errorLayer = $parent.find( '.prompt-answer' );
    $errorLayer.hide();
  }
  
  countDown = function($target, cb) {
	    var time;
	    return time = setInterval(function() {
	      var NUM;
	      NUM = parseInt($target.html());
	      NUM--;
	      if (NUM >= 0) {
	        return $target.html(NUM);
	      } else {
	        clearInterval(time);
	        $target.html(60);
	        return typeof cb === "function" ? cb('') : void 0;
	      }
	    }, 1000);
	  };

  asyQuery = function(conf) {
	    return $.ajax({
	      url: conf.url,
	      type: conf.type || 'GET',
	      data: conf.data || {},
	      dataType: 'json',
	      success: function(dt) {
	        if (typeof conf.success === "function") {
	          conf.success(dt);
	        }
	      }
	    });
	  };
  return {
    init: init
  }
} );