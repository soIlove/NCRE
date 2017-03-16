
	$('#iform').form({    
		url:"zxd/RegisterDai",   
		success:function(data){  
			if(data){
				alert("恭喜你成为小递，加油哦！");
				window.location.href("index.jsp")
			}else{
				alert(" 注册失败");
			}
		}    
	});    

function addpic(obj){
	var picStr = window.URL.createObjectURL(obj.files[0]);
	$("#upicimage").attr("src", picStr);
};
