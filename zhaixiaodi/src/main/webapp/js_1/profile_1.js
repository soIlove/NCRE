var parameuuid=$("#uuidhidden").val();
getOrders(1,parameuuid)

function getOrders(pageNum,uuid){
	//alert(pageNum+","+uuid);
	$.post("zxd/orderlist?page="+pageNum+"&uuid="+uuid,function(data){
		$("#orderlist").empty();
		var orders=data.rows;
		for(var i=0;i<orders.length;i++){
			$("#orderlist").append("<tr  class='timeline' order-timeline=''ng-repeat='item in orderList'>"+
								"<td class='ordertimeline-time'><h3>"+orders[i].ooid+
								"</h3><i class='ordertimeline-time-icon icon-uniE65D ng-scope unreview'ng-if='item.realStatus !== 5'"+
								"ng-class='{'unfinish': item.realStatus !== 4, 'unreview': item.realStatus === 4}'></i>"+
								"</td><td class='ordertimeline-avatar'><img src='"+orders[i].upicture+"'></td>"+
								"<td class='ordertimeline-info'><h3 class='ordertimeline-title'>"+
								"<a ng-href='/shop/562286' ng-bind='item.restaurant.name'"+
								"class='ng-binding' href='javascript:void(0)'>"+orders[i].otype+"</a>"+
								"</h3><p class='ordertimeline-info-food'><span"+
								"class='ordertimeline-food ng-binding' ng-bind='item.product'>"+
								orders[i].osize+"</span>&nbsp;&nbsp;<span class='ordertimeline-info-productnum ng-binding'"+
								"ng-bind='item.productnum'>"+orders[i].zaddr+"</span>&nbsp;&nbsp;<span>"+orders[i].otime+"</span>"+
								"</p><p>订单描述：<a ng-href='order/id/1202435690561146071'"+
								"ng-bind='item.unique_id' class='ng-binding'"+
								"href='javascript:void(0)'>"+orders[i].odesc+"</a></p></td>"+
								"<td class='ordertimeline-amount'><h3 class='ordertimeline-title ordertimeline-price ui-arial ng-binding'"+
								"ng-bind='item.total_amount.toFixed(2)'>￥"+orders[i].oprice+".00</h3>"+
								"</td><td class='ordertimeline-status'><a href='javascript:void(0)' onclick='showDU("+orders[i].did+")'><h3 ng-bind='item.statusText'"+
								"ng-class='{'waitpay': (item.realStatus === 1), 'end': (item.realStatus === 5)}'"+
								"class='ng-binding'>"+orders[i].did+"</h3></a></td>"+
								"<td class='ordertimeline-handle'>"+
								"<span ng-if='item.realStatus === 4'"+
								"class='ordertimeline-handle-group ng-scope'><a"+
								"ng-href='order/rate/1202435690561146071'"+
								"href='https://www.ele.me/profile/order/rate/1202435690561146071'>"+orders[i].ostatus+
								"</span></td></tr>");

			
		}
		
		$("#orderPage").empty();
		$("#orderPage").append("<li class='current'>1</li><li>2</li><li>3</li><li>4</li><li>5</li>")
		
	},"json");
	
}

function showDU(did){
	$.post("zxd/findDU?did="+did,function(data){
		//alert(data.uuid+data.uname+data.usex+data.uphone+data.uemail+data.uaddr);
		//$.messager.show(data.uuid,data.uname);
		$('#win').window('open');
		$("#uuid").html(data.uuid);
	    $("#uname").html(data.uname);
	    $("#usex").html(data.usex);
	    $("#uphone").html(data.uphone);
	    $("#uemail").html(data.email);
	    $("#uaddr").html(data.uaddr);
	},"json");
	
}
$('#win').window({    
    width:250,    
    height:350,    
    modal:true,
    title:'接单人信息',
    maximizable:false,
    minimizable:false,
    collapsible:false,
    closed:true,
    
}); 

function getWaitOrders(pageNum,uuid){
	alert(pageNum+","+uuid);
	$.post("zxd/worderlist?page="+pageNum+"&uuid="+uuid,function(data){
		$("#orderlist").empty();
		var orders=data.rows;
		for(var i=0;i<orders.length;i++){
			$("#orderlist").append("<tr  class='timeline' order-timeline=''ng-repeat='item in orderList'>"+
								"<td class='ordertimeline-time'><h3>"+orders[i].ooid+
								"</h3><i class='ordertimeline-time-icon icon-uniE65D ng-scope unreview'ng-if='item.realStatus !== 5'"+
								"ng-class='{'unfinish': item.realStatus !== 4, 'unreview': item.realStatus === 4}'></i>"+
								"</td><td class='ordertimeline-avatar'><img src='"+orders[i].upicture+"'></td>"+
								"<td class='ordertimeline-info'><h3 class='ordertimeline-title'>"+
								"<a ng-href='/shop/562286' ng-bind='item.restaurant.name'"+
								"class='ng-binding' href='javascript:void(0)'>"+orders[i].otype+"</a>"+
								"</h3><p class='ordertimeline-info-food'><span"+
								"class='ordertimeline-food ng-binding' ng-bind='item.product'>"+
								orders[i].osize+"</span>&nbsp;&nbsp;<span class='ordertimeline-info-productnum ng-binding'"+
								"ng-bind='item.productnum'>"+orders[i].zaddr+"</span>&nbsp;&nbsp;<span>"+orders[i].otime+"</span>"+
								"</p><p>订单描述：<a ng-href='order/id/1202435690561146071'"+
								"ng-bind='item.unique_id' class='ng-binding'"+
								"href='javascript:void(0)'>"+orders[i].odesc+"</a></p></td>"+
								"<td class='ordertimeline-amount'><h3 class='ordertimeline-title ordertimeline-price ui-arial ng-binding'"+
								"ng-bind='item.total_amount.toFixed(2)'>￥"+orders[i].oprice+".00</h3>"+
								"</td><td class='ordertimeline-status'><a href='javascript:void(0)' onclick='showDU("+orders[i].did+")'><h3 ng-bind='item.statusText'"+
								"ng-class='{'waitpay': (item.realStatus === 1), 'end': (item.realStatus === 5)}'"+
								"class='ng-binding'>"+orders[i].did+"</h3></a></td>"+
								"<td class='ordertimeline-handle'>"+
								"<span ng-if='item.realStatus === 4'"+
								"class='ordertimeline-handle-group ng-scope'><a"+
								"ng-href='order/rate/1202435690561146071'"+
								"href='https://www.ele.me/profile/order/rate/1202435690561146071'>"+orders[i].ostatus+
								"</span></td></tr>");

			
		}
		
		$("#orderPage").empty();
		$("#orderPage").append("<li class='current'>1</li><li>2</li><li>3</li><li>4</li><li>5</li>")
		
	},"json");
	
}
	


