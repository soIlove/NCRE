var uuid=$("#uuidhidden").val();
 getOrders();
function getOrders(){
	$.post("order/zxdgetordersbyuuid",{"uuid":uuid},function(data){
		for(var i=0;i<data.length;i++){
		$("#message_order_tr_list").append('<tr onclick="show('+data[i].oid+')" style="cursor: pointer;" class="timeline">'
				+'<td class="ordertimeline-time"><p class="ng-binding">'+data[i].otime+'</p> <i class="ordertimeline-time-icon icon-uniE65D ng-scope unreview"></i></td>'
				+'<td class="ordertimeline-handle"><label>'+data[i].otype+'</label></td>'
				+'<td class="ordertimeline-handle"><label>'+data[i].ocode+'</label></td>'
				+'<td class="ordertimeline-handle"><label>'+data[i].osize+'</label></td>'
				+'<td class="ordertimeline-handle"><label>'+data[i].oaddr+'</label></td>'
				+'<td class="ordertimeline-handle"><label>'+data[i].oprice+'</label></td>'
				+'<td class="ordertimeline-handle"><label>'+data[i].orelname+'</label></td></tr>')
		}
	},"json")
	}