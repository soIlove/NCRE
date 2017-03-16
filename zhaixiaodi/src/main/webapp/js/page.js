/*
 * 分页
 */
function gotopage(cpage,totalpage,pagesize)  
 {   

       if(cpage-1 == parseInt(totalpage) ){
    	   jumpPage(cpage-1);
    	   setpage(totalpage,pagesize,cpage-1);
       }else{
    	 
           jumpPage(cpage);
           setpage(totalpage,pagesize,cpage);  
       }
      
 }  
 
function setpage(totalpage,pagesize,cpage,prepage,nextpage)  
 {     outstr="";
 
       if(totalpage<=10){        //总页数小于十页  
    	
    		   outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+(parseInt((cpage-1)/10)*10)+","+totalpage+","+pagesize+","+prepage+","+nextpage+")'> << </a>&nbsp;";  
    		   outstr = outstr + "<a href='javascript:void(0)' onclick='javascript:jumpPage("+prepage+")'> < </a>&nbsp;";   
        	
         for (count=1;count<=totalpage;count++)  
         {    if(count!=cpage)  
             {  
                outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+","+totalpage+","+pagesize+","+prepage+","+nextpage+")'>"+count+"</a>&nbsp;";  
             }else{  
                outstr = outstr + "<a class='active' >"+count+"</a>&nbsp;";  
               }  
              
         }  
        
          outstr = outstr + "<a href='javascript:void(0)' onclick='javascript:jumpPage("+nextpage+")'> > </a>&nbsp;";
          outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+","+totalpage+","+pagesize+","+prepage+","+nextpage+")'> >> </a>&nbsp;";  
       }  
       if(totalpage>10){    
    	 
          outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+(parseInt((cpage-1)/10)*10)+","+totalpage+","+pagesize+","+prepage+","+nextpage+")'> << </a>&nbsp;";  
            outstr = outstr + "<a href='javascript:void(0)' onclick='javascript:jumpPage("+prepage+")'> < </a>&nbsp;";  
         
         if(parseInt((cpage-1)/10) == 0)  
         {           
              for (count=1;count<=10;count++)  
              {    if(count!=cpage)  
                  {  
                     outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+","+totalpage+","+pagesize+","+prepage+","+nextpage+")'>"+count+"</a>&nbsp;";  
                 }else{  
                      outstr = outstr + "<a class='active'>"+count+"</a>&nbsp;";  
                 }  
              }  
         }  
        else if(parseInt((cpage-1)/10) == parseInt(totalpage/10))  
          {      
           
            for (count=parseInt(totalpage/10)*10+1;count<=totalpage;count++)  
             {    if(count!=cpage)  
                  {  
                    outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+","+totalpage+","+pagesize+","+prepage+","+nextpage+")'>"+count+"</a>&nbsp;";  
                 }else{  
                     outstr = outstr + "<a class='active'>"+count+"</a>&nbsp;";  
                  }  
             }    
         }  
        else  
         {      
            for (count=parseInt((cpage-1)/10)*10+1;count<=parseInt((cpage-1)/10)*10+10;count++)  
            {          
                 if(count!=cpage)  
                {  
                   outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+","+totalpage+","+pagesize+","+prepage+","+nextpage+")'>"+count+"</a>&nbsp;";  
               }else{  
                    outstr = outstr + "<a class='active'>"+count+"</a>&nbsp;";  
               }  
           }  
           
        }  
            outstr = outstr + "<a href='javascript:void(0)' onclick='javascript:jumpPage("+nextpage+")'> > </a>&nbsp;";  
            outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+","+totalpage+","+pagesize+","+prepage+","+nextpage+")'> >> </a>&nbsp;";  
         
    }      
    displayStr ="";
    if(totalpage == 0){
     displayStr ="style='display:none'"
    }
     document.getElementById("pageList").innerHTML = "<div id='pageList' "+displayStr+">"+
      "<div class='mod_pagenav'>"+
      "<p class='mod_pagenav_main'>"+
      "<span class='mod_pagenav_count'>"+
      outstr+
      "<\/span>"+
      "<\/p>"+
      "<p class='mod_pagenav_option'>"+
      "<\/p>"+
      "<\/div>"+
      "<\/div>";
 }
 
 function jumpPage(pageNo) {
	$("#pageNo").val(pageNo);
	$("#mainForm").submit();
}

function sort(orderBy, defaultOrder) {
	if ($("#orderBy").val() == orderBy) {
		if ($("#order").val() == "") {
			$("#order").val(defaultOrder);
		}
		else if ($("#order").val() == "desc") {
			$("#order").val("asc");
		}
		else if ($("#order").val() == "asc") {
			$("#order").val("desc");
		}
	}
	else {
		$("#orderBy").val(orderBy);
		$("#order").val(defaultOrder);
	}

	$("#mainForm").submit();
}

function page(){
	$("#order").val("");
	$("#orderBy").val("");
	$("#pageNo").val("1");
}

function search() {
	page();
	$("#mainForm").submit();
}
 