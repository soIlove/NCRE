var uuid=$("#uuidhidden").val();

getOrders();
function getOrders(){
$.post("order/getzordersByuuid",{"uuid":uuid},function(data){
	for(var i=0;i<data.length;i++){
	$("#message_order_tr_list").append('<tr onclick="show('+data[i].oid+')" style="cursor: pointer;" class="timeline">'
			+'<td class="ordertimeline-time"><p class="ng-binding">'+data[i].otime+'</p> <i class="ordertimeline-time-icon icon-uniE65D ng-scope unreview"></i></td>'
			+'<td class="ordertimeline-handle"><label>'+data[i].otype+'</label></td>'
			+'<td class="ordertimeline-handle"><label>'+data[i].ocode+'</label></td>'
			+'<td class="ordertimeline-handle"><label>'+data[i].osize+'</label></td>'
			+'<td class="ordertimeline-handle"><label>'+data[i].oaddr+'</label></td>'
			+'<td class="ordertimeline-handle"><label>'+data[i].oprice+'</label></td>'
			+'<td class="ordertimeline-handle"><label>'+data[i].uremain1+'&nbsp;('+data[i].uremain2+')</label></td></tr>')
	}
},"json")
}




$('#zxdmsg_mess').window({    
		   width:770,    
		    height:660,    
		    modal:true,   
		    minimizable:false,
		    maximizable:false,
		    collapsible:false,
		    title:'请选择代递员',
		    closed:true
	});  

function show(oid){
	$('#zxdmsg_mess').window('open');
	$("#expressList").html("");
	$.post("order/getapporderbyoid",{"oid":oid},function(data){
		if(data!=null){
			for(var i=0;i<data.length;i++){
			
			$("#expressList").append('<li class="topic"><div class="u_photo"><img src="'+data[i].upicture+'" height="48" width="48"></div>'
								+'	<div class="u_post"><input type="button" id="btn-order_agr" class="btn_order" name="btn-order_agr" value="同意领取" onclick="addorder('+data[i].aid+','+oid+')">'
									+'	<div class="li_1" style="line-height: 12px;"><a style="font-size: 13px; font-family: "微软雅黑";"class="i_title" href="javascript:void(0)">'+data[i].uname+'</a>'
									+'	</div><div class="li_2" style="margin-top: 15px;"><em class="li_s">信誉度：'+data[i].dscore+'</em><em class="readNum li_s">抢单时间：'+data[i].ztime+'</em>'
									+'	</div><div class="li_3" style="font-size: 14px; font-family: "微软雅黑"; padding-top: 10px;">小递捎话：'+data[i].adesc+'</div></div></li>')			
		}
		
		}
	},"json")
	
}
function addorder(aid,oid){
	$.post("order/addorder",{"aid":aid},function(data){
		if(data){
			updatezac(aid,oid);
		}
	},"json")
}

function updatezac(aid,oid){
	$.post("order/updatezac",{"aid":aid},function(data){
		if(data){
			deletezac(aid,oid);
		}
	},"json")
}

function deletezac(aid,oid){
	$.post("order/deletezac",{"oid":oid},function(data){
			alert("通知已发送，要静心等待小递到来哦");
			$("#zxdmsg_mess").window('close');
		     	updateorder(oid);
			
	},"json")
}

function updateorder(oid){
	$.post("order/updateorder",{"oid":oid},function(data){
				if(data){
					$("#message_order_tr_list").html("");
					getOrders();
				}
	})	
}
