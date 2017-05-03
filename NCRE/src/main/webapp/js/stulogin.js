var Login = function () {
    
    return {
        //main function to initiate the module
        init: function () {
        	
           $('.login-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	                sxid: {
	                    required: true
	                },
	                spwd: {
	                    required: true
	                },
	                vcode: {
	                	 required: true
	                },
	                remember: {
	                    required: false
	                }
	            },

	            messages: {
	                sxid: {
	                    required: "学号不能为空"
	                },
	                spwd: {
	                    required: "密码不能为空"
	                },
	                vcode: {
	                	required: "验证码不能为空"
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-error', $('.login-form')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                /*window.location.href = "user/login";*/
	            	
	            }
	        });

	        $('.login-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.login-form').validate().form()) {
	                    window.location.href = "index.jsp";
	                }
	                return false;
	            }
	        });

	        $('.forget-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                semail: {
	                    required: true,
	                    email: true
	                }
	            },

	            messages: {
	                semail: {
	                    required: "邮箱地址不能为空"
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	               /* window.location.href = "index.jsp";*/
	            }
	        });

	        $('.forget-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.forget-form').validate().form()) {
	                  /*  window.location.href = "index.jsp";*/
	                }
	                return false;
	            }
	        });

	        jQuery('#forget-password').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.forget-form').show();
	        });

	        jQuery('#back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.forget-form').hide();
	        });

	        $('.register-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                sxid: {
	                    required: true
	                },
	                spwd: {
	                    required: true
	                },
	                rpassword: {
	                    equalTo: "#register_password"
	                },
	                sname: {
	                    required: true
	                },
	                sacademy: {
	                    required: true
	                },
	                aclass: {
	                    required: true
	                },
	                semail: {
	                    required: true,
	                    email: true
	                },
	                tnc: {
	                    required: true
	                }
	            },

	            messages: { // custom messages for radio buttons and checkboxes
	                tnc: {
	                    required: ""
	                },
	                sxid:{
	                	required:"学号不能为空"
	                },
	                spwd:{
	                	required:"请输入密码"
	                },
	                rpassword:{
	                	required:"两次密码输入不一致"
	                },
	                school:{
	                	required:"请选择学校"
	                },
	                sname:{
	                	required:"请输入姓名"
	                },
	                sacademy:{
	                	required:"请选择学院"
	                },
	                aclass:{
	                	required:"请选择班级"
	                },
	                semail:{
	                	required:"邮箱不能为空"
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
	                    error.addClass('help-small no-left-padding').insertAfter($('#register_tnc_error'));
	                } else {
	                    error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	                }
	            },

	            submitHandler: function (form) {
	            	$.post("user/register",{sname:$("#sname").val(),spwd:$("#register_password").val(),semail:$("#semail").val(),
	        			sacademy:$("#academy option:selected").val(),sclass:$("#classes option:selected").val()},function(data){
	        			if(data!=null){
	        				alert("注册成功！您的账号为"+data+"请妥善保管！")
	        				jQuery('.login-form').show();
	        	            jQuery('.register-form').hide();
	        	            $("#sxid").val(data);
	        			}
	        		})
	            }
	        });

	        jQuery('#register-btn').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.register-form').show();
	        });

	        jQuery('#register-back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.register-form').hide();
	        });
        }

    };

}();
