/*ie7,8不支持indexof方法解决办法*/
if (!Array.prototype.indexOf) {
	Array.prototype.indexOf = function(elt /*, from*/) {
		var len = this.length >>> 0;
		var from = Number(arguments[1]) || 0;
		from = (from < 0) ? Math.ceil(from) : Math.floor(from);
		if (from < 0)
			from += len;
		for (; from < len; from++) {
			if ( from in this && this[from] === elt)
				return from;
		}
		return -1;
	};
}

$(function() {
	/*头部 QQsina*/
	var timer;
	$(".h-qq em,.h-sina em,.qq-tanchu,.sina-tanchu").hover(function() {
		clearTimeout(timer);
		$(this).parent().siblings().removeClass("hover");
		$(this).parent().addClass("hover");
	}, function() {
		var _this = $(this);
		timer = setTimeout(function() {
			_this.parent().removeClass("hover");
		}, 30);
	});
	$(".sina-followed").hover(function() {
		$(this).parent().addClass("hover");
	}, function() {
		$(this).parent().removeClass("hover");
	});
	$(".adRight a").click(function() {
		$(this).parent().hide();
	});
	/*简单生活*/
	$(".lifeEasy li:last").css("margin-right", "0px");
	/*关注我们*/
	$(".f-aboutUs li:last").css("margin-right", "0px");
	/*媒体新闻*/
	$(".news-scroll .scroll-cons div").hide();
	$(".news-scroll .scroll-cons div:first").show();
	$(".scroll-point b").click(function() {
		var index_ = $(this).index();
		$(this).siblings().removeClass("on");
		// $(".news-scroll .scroll-cons div").hide();
		$(this).addClass("on");
		// $(".scroll-con" + $(this).index()).show();
		$('.scroll-cons').animate({
			marginLeft : -308 * index_,
			transition : 'all 1s ease 0s'
		}, 1000)
	});
	/*表单*/
	$(".login-form label").click(function() {
		$(this).toggleClass("on");
	});
	/*介绍*/
	$(".aboutus li:last img").css("background", "none");

	/***add   js***/
	$('li.h-sina').hover(function() {
		var l = $(this).offset().left - 57;
		$('div.sina-tanchu').css({
			left : l
		}).show();
	}, function() {
		$('div.sina-tanchu').hide();
	})
	/*定义全局变量*/
	var o = {
		bl : true,
		w : '',
		id : '',
		id1 : '',
		l : $('div.banner>ul li').length,
		i : 0,
		t : $('div.banner'),
		s : $('<span></span>'),
		tabs : $('div.slidetabs'),
		width : $(window).width(),
		sbl : true,
		src : $('div.banner > ul li:eq(0)').find('img').attr('src'),
		banner : $('.banner').length,
		scroll : '',
		arr : ['#FB8917','#FF6030','#1DC091']
	}
	/*平板，手机导航效果函数*/
	function navReHide(t,c,show) {
		if (o.bl) {
			c.addClass("on");
			t.animate({
				top : show,
				transition : 'all 0.5s ease 0s'
			}, 500);
			if(c[0].tagName.toLowerCase()=="b"){
				$(".sub-shadow").show();
				$(".sub-shadow").css("top",$(".header-mid").height()+$(".siderLeft").height());
			}
			o.bl = false;
		} else {
			c.removeClass("on");
			t.animate({
				top : -500,
				transition : 'all 0.5s ease 0s'
			}, 500);
			if(c[0].tagName.toLowerCase()=="b"){
				$(".sub-shadow").hide();
				$(".sub-shadow").css("top","-500px");
			}
			o.bl = true;
		}
	}
	$('.navShow').click(function(){
		navReHide($('.menu'),$('.navShow'), $(".header-mid").height());
		});
	
	$('.sub-tab').click(function(){
			navReHide($('.sub-menu'),$('.sub-tab'), $(".siderLeft").height());
			})
	/*插入tabs*/
	for (var a = 0; a < o.l; a++) {
		if (a === 0) {
			o.tabs.append(o.s.clone().addClass('current'));
		} else {
			o.tabs.append(o.s.clone());
		}
	}
    o.t.find('li:eq(0)').css({background:o.arr[0]});
	/*首页slider 函数*/
	function sliderIndex() {

		if (o.i > o.l - 2) {
			o.i = 0;
			o.t.find('ul').animate({
				marginLeft : 0,
				transition : 'all 0.5s ease 0s'
			}, 500)
		} else {
			o.i++;
			o.t.children('ul').animate({
				marginLeft : -o.i * o.w,
				transition : 'all 0.5s ease 0s'
			}, 500)
		}

		o.tabs.find('span').removeClass('current').css({
			transition : 'all 0.5s ease 0s'
		});
        o.t.css({background:o.arr[o.i]});
		o.tabs.find('span').eq(o.i).addClass('current').css({
			transition : 'all 0.5s ease 0s'
		});

		o.id = window.setTimeout(sliderIndex, 5000)

	}


	o.id = window.setTimeout(sliderIndex, 5000)

	/*点击切换slider*/
	o.tabs.find('span').each(function() {
		var that = $(this)
		$(this).touchwipe({
			wipe : function() {
				o.i = that.index();
				o.t.children('ul').animate({
					marginLeft : -o.i * o.w,
					transition : 'all 0.5s ease 0s'
				}, 500)
				o.tabs.find('span').removeClass('current').css({
					transition : 'all 0.5s ease 0s'
				});
				o.tabs.find('span').eq(o.i).addClass('current').css({
					transition : 'all 0.5s ease 0s'
				});
				o.t.css({background:o.arr[o.i]});
			}
		})
	})
	/*jj*/
	function mobileScroll() {
		o.t.touchwipe({
			wipeLeft : function() {

				clearTimeout(o.id);
				//clearTimeout(o.id1);
				setTimeout(function() {

					if (o.i == 0) {
						o.i = o.l - 1;
						o.t.find('ul').animate({
							marginLeft : -o.i * o.w,
							transition : 'all 0.5s ease 0s'
						}, 500)
					} else {
						o.i--;
						o.t.children('ul').animate({
							marginLeft : -o.i * o.w,
							transition : 'all 0.5s ease 0s'
						}, 500)
					}
					o.tabs.find('span').removeClass('current').css({
						transition : 'all 0.5s ease 0s'
					});
					o.tabs.find('span').eq(o.i).addClass('current').css({
						transition : 'all 0.5s ease 0s'
					});
					o.id = window.setTimeout(sliderIndex, 5000);
				}, 500)

			},
			wipeRight : function() {

				clearTimeout(o.id);
				//clearTimeout(o.id1);
				setTimeout(function() {

					if (o.i > o.l - 2) {
						o.i = 0;
						o.t.children('ul').animate({
							marginLeft : 0,
							transition : 'all 0.5s ease 0s'
						}, 500)
					} else {
						o.i++;
						o.t.children('ul').animate({
							marginLeft : -o.i * o.w,
							transition : 'all 0.5s ease 0s'
						}, 500)
					}
					o.tabs.find('span').removeClass('current').css({
						transition : 'all 0.5s ease 0s'
					});
					o.tabs.find('span').eq(o.i).addClass('current').css({
						transition : 'all 0.5s ease 0s'
					});
					o.id = window.setTimeout(sliderIndex, 5000)
				}, 500)

			}
		})
	}

	var tabsBl = true, wbl = true;
	function tabs() {
		if (wbl) {
			if (tabsBl) {
				
				$('.news-scroll > .scroll-cons').animate({
					marginLeft : -308,
					transition : ' 1s ease 0s'
				}, 500);
				$('.scroll-point b').removeClass('on');
				$('.scroll-point b').eq(1).addClass('on');
				tabsBl = false;
			} else {
				
				$('.news-scroll > .scroll-cons').animate({
					marginLeft : 0,
					transition : ' 1s ease 0s'
				}, 500);
				$('.scroll-point b').removeClass('on');
				$('.scroll-point b').eq(0).addClass('on');
				tabsBl = true;
			}
		}
        //console.log(tabsBl)
		
	}

	setInterval(tabs, 5000);

	if (o.width > 971) {
		$('.news-scroll').unbind('hover').hover(function() {
			wbl = false;
		}, function() {
			wbl = true;
		})
		$('.content .com-w > .com-title').html('我们可以为你');
		o.scroll = true;
	} else {
		$('.news-scroll').unbind('hover');
		wbl = false;
		mobileScroll();
		$('.content .com-w > .com-title').html('让生活更简单');
		o.scroll = false;
	}
	/*根据屏幕大小   修改slider图片的src*/
	/*
	 *pc.jpg   后缀的为电脑版图片
	 * ipad.jpg   后缀的为平板图片
	 * mobile.jpg  后缀的为手机图片
	 */
	function screenWidth() {
		o.w = $(window).width();
		if (o.width > 971) {
			wbl = true;
			/*判断为电脑版*/
			
			if(o.w>1600){
				o.w = 1600;
				$('.banner ul li').css({padding:'0 170px'});
			}else if(o.w>1260&&o.w<1600){
				o.w = $(window).width();
				var ll = (o.w - 1260)*0.5;
				$('.banner ul li').css({paddingLeft:ll,paddingRight:ll});
			}else{
				o.w = 1260;
				$('.banner ul li').css({padding:0});
			}
			
			$('div.scroll-con1').show();
			$(".login-form").show();
			$('.content .com-w > .com-title').html('让生活更简单');
			/*电脑版   切换到 电脑版的图片*/
			if (o.banner !== 0) {
				if (o.src.indexOf('pc.jpg') < 0 && o.src.indexOf('ipad.jpg') > 0) {
					$('div.banner > ul li').find('img').each(function() {
						var src = $(this).attr('src');
						src = src.replace('ipad.jpg', 'pc.jpg');
						$(this).attr('src', src);
					})
				} else if (o.src.indexOf('pc.jpg') < 0 && o.src.indexOf('mobile.jpg') > 0) {
					$('div.banner > ul li').find('img').each(function() {
						var src = $(this).attr('src');
						src = src.replace('mobile.jpg', 'pc.jpg');
						$(this).attr('src', src);
					})
				}

				/*鼠标放上去暂停slider*/
				o.t.unbind('hover').hover(function() {
					$('.banner b').show();
					clearTimeout(o.id);
					//clearTimeout(o.id1);
				}, function() {
					$('.banner b').hide();
					o.id = window.setTimeout(sliderIndex, 5000)
				})
				/*上一张*/
				$('.banner b.prevSlider').unbind('click').click(function() {
					//clearTimeout(o.id);
					// clearTimeout(o.id1);
					if (o.i === 0) {
						o.i = o.l - 1;
					} else {
						o.i--;
					}
					o.t.children('ul').animate({
						marginLeft : -o.i * o.w,
						transition : 'all 0.5s ease 0s'
					}, 500)
					o.tabs.find('span').removeClass('current').css({
						transition : 'all 0.5s ease 0s'
					});
					o.tabs.find('span').eq(o.i).addClass('current').css({
						transition : 'all 0.5s ease 0s'
					});
					o.t.css({background:o.arr[o.i]});
				})
				/*下一张*/
				$('.banner b.nextSlider').unbind('click').click(function() {
					//clearTimeout(o.id);
					// clearTimeout(o.id1);
					if (o.i > o.l - 2) {
						o.i = 0;
					} else {
						o.i++;
					}
					o.t.children('ul').animate({
						marginLeft : -o.i * o.w,
						transition : 'all 0.5s ease 0s'
					}, 500)
					o.tabs.find('span').removeClass('current').css({
						transition : 'all 0.5s ease 0s'
					});
					o.tabs.find('span').eq(o.i).addClass('current').css({
						transition : 'all 0.5s ease 0s'
					});
					o.t.css({background:o.arr[o.i]});
				})
			}

		} else if (o.width < 971 && o.width > 656) {
			wbl = false;
			/*判断为平板版*/
			$('div.scroll-con1').show();
			$('div.scroll-con0').show();
			o.w = 656;
			$('.banner ul li').css({padding:0});
			$('.content .com-w > .com-title').html('我们可以为你');
			/*平板电脑版   切换到 平板电脑版的图片*/
			if (o.banner !== 0) {
				if (o.src.indexOf('ipad.jpg') < 0 && o.src.indexOf('pc.jpg') > 0) {
					$('div.banner > ul li').find('img').each(function() {
						var src = $(this).attr('src');
						src = src.replace('pc.jpg', 'ipad.jpg');
						$(this).attr('src', src);
					})
				} else if (o.src.indexOf('ipad.jpg') < 0 && o.src.indexOf('mobile.jpg') > 0) {
					$('div.banner > ul li').find('img').each(function() {
						var src = $(this).attr('src');
						src = src.replace('mobile.jpg', 'ipad.jpg');
						$(this).attr('src', src);
					})
				}
			}
			o.t.unbind('hover');
		} else {
			wbl = false;
			/*判断为手机版*/
			$('div.scroll-con1').hide();
			o.w = 328;
			$('.banner ul li').css({padding:0});
			$('.content .com-w > .com-title').html('我们可以为你');
			/*手机版   切换到 平板手机版的图片*/
			if (o.banner !== 0) {
				if (o.src.indexOf('mobile.jpg') < 0 && o.src.indexOf('pc.jpg') > 0) {
					$('div.banner > ul li').find('img').each(function() {
						var src = $(this).attr('src');
						src = src.replace('pc.jpg', 'mobile.jpg');
						$(this).attr('src', src);
					})
				} else if (o.src.indexOf('mobile.jpg') < 0 && o.src.indexOf('ipad.jpg') > 0) {
					$('div.banner > ul li').find('img').each(function() {
						var src = $(this).attr('src');
						src = src.replace('ipad.jpg', 'mobile.jpg');
						$(this).attr('src', src);
					})
				}
			}
			o.t.unbind('hover');
		}
	}

	screenWidth();
    
    function scrollT(){
    	if(o.scroll){
    		var top = $('body').scrollTop() || $('html').scrollTop();
    		if(top>900){
    			$('.back ').show();
    		}else{
    			$('.back ').hide();
    		}
    	}else{
    		$('.back ').hide();
    	}
    }
    
    /*置顶按钮*/
    $(window).scroll(function(){
    	scrollT();
    })
    $('.back ').click(function(){
    	
    	if(navigator.userAgent.toLocaleLowerCase().indexOf('chrome') > -1){
			$('body').animate({scrollTop:0},500);
		}else if(navigator.userAgent.toLocaleLowerCase().indexOf('firefox') > -1 ||navigator.userAgent.toLocaleLowerCase().indexOf('microsoft') > -1 || navigator.userAgent.toLocaleLowerCase().indexOf('media center') > -1){
			$('html').animate({scrollTop:0},500);
		}else if(navigator.userAgent.toLocaleLowerCase().indexOf('safari') > -1){
			$('html').animate({scrollTop:0},500);
		}
    })
    
    
	$(window).resize(function() {

		o.src = $('div.banner > ul li:eq(0)').find('img').attr('src');
		o.i = 0;
		o.t.children('ul').css({
			marginLeft : 0
		})
		
		o.tabs.find('span').removeClass('current').css({
			transition : 'all 0.5s ease 0s'
		});
		o.tabs.find('span').eq(o.i).addClass('current').css({
			transition : 'all 0.5s ease 0s'
		});

		setTimeout(function() {
			o.width = $(window).width();

			if (o.width > 971 && !o.bl) {
				
				$('div.navShow').find('img').attr('src', 'images/navShow.jpg');
				$('div.banner div.menu').animate({
					top : -500,
					transition : 'all 0.5s ease 0s'
				}, 500);
				$('div.bread div.menu').animate({
					top : -500,
					transition : 'all 0.5s ease 0s'
				}, 500);
				o.bl = true;
			}
			if (o.width < 971) {
				
				wbl = false;
				o.scroll = false;
				$('.news-scroll').unbind('hover');
				$('.scroll-cons').animate({
					marginLeft : 0
				})
				$('.scroll-con0').show();
				$('.scroll-con1').show();
			} else {
				clearTimeout(o.id1);
				
				o.scroll = true;
				o.id1 = setTimeout(tabs, 5000)
				wbl = true;
				$('.news-scroll').unbind('hover').hover(function() {
					wbl = false;
				}, function() {
					wbl = true;
				})
				$('.news-scroll').trigger('hover');
				//$('.news-scroll').trigger('mouseout');
			}
			screenWidth();
			scrollT();
		}, 800)
	})
});

/*插件名称 ：mobile slider
 *作者：cash
 * 时间：2015-02-01
 * /
 */
$.fn.mobileSlider = function(options) {
	//var opt =
}

