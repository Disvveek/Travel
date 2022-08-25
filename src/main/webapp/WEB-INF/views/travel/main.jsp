<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../header.jsp" %>
<style>

table{
border:1px solid black;
border-collapse: collapse;
display:inline-block;
}
th, td{
border:1px solid black;
}
.thumnail{
width:100px;
height:100px;
}
#pageDIV{
padding: 20px 0 0 10px;
}
.pageCont{
padding:20px 5px 20px 5px;
}

</style>
<script>
jQuery(document).ready(function(){
	getList('new');
});
var pageList = [];
var page = 0;
var epage = 1183;

function getList(page){
	if(page=='new'){
		page = '1';
	}
	jQuery.ajax({          
	    url: '/travel/dataList',
	    type: 'get',
	    data: {'pageNo':page},
	    dataType: 'json',
	    success: function(data){
	    	
    		$(".dataTr").empty(); //테이블 초기화
    		$(".dataTr").remove(); //테이블 초기화
    		$("#pageDIV").empty();
    		
	        var datas = data.response.body.items.item;
	        var sPage = data.response.body.pageNo;
	        ePage = data.response.body.totalCount/10+1;
	        
	        getPages(sPage);
	        
	        for(var i=0; i<pages+1; i++){
	        	var output = '';
	        	output = '<a class="pageCont" href="javascript:getList('+pageList[i]+');';
	        	if(page==pageList[i]){
	        		output += '"style="text-decoration:underline;color:red;';
	        	}
	        	output += '">'+pageList[i]+'</a>'
	        	jQuery("#pageDIV").append(output);
	        }
	        
	        
	        
	        var dataList = "";
	        for(var i=0; i<datas.length; i++){
	            var output = '';
	            output = '<tr class="dataTr">';
	            output += '<td><img class="thumnail" src="'+ datas[i].firstimage2 +'"></td>';
	            output += '<td>'+ datas[i].addr1 +'</td>';
	            output += '<td><a href="javascript:void(0);" onclick="javascript:doView('+datas[i].contentid+');">'+ datas[i].title +'</a></td>';
	            output += '<td>'+ datas[i].mapx +'</td>';
	            output += '<td>'+ datas[i].mapy +'</td>';
	            output += '</tr>';
	            dataList += output;
	        }
	        jQuery("#DataTop").after(dataList);
	    },
	    error: function(request, error){
	    	alert("code : "+request.status+"\nmessage : "+request.responseText+"\nerror : "+error);
	    }
	});
}

function doView(contentid){
	location.href="/travel/view?contentid="+contentid;
}

function getPages(num){
	pages = 0;
	pageList = [];

	if(num-5>0){
		pages+=1;
		pageList.push(num-5);
	}
	if(num-4>0){
		pages+=1;
		pageList.push(num-4);
	}
	if(num-3>0){
		pages+=1;
		pageList.push(num-3);
	}
	if(num-2>0){
		pages+=1;
		pageList.push(num-2);
	}
	if(num-1>0){
		pages+=1;
		pageList.push(num-1);
	}
	pageList.push(num);
	if(num+1<epage){
		pages+=1;
		pageList.push(num+1);
	}
	if(num+2<epage){
		pages+=1;
		pageList.push(num+2);
	}
	if(num+3<epage){
		pages+=1;
		pageList.push(num+3);
	}
	if(num+4<epage){
		pages+=1;
		pageList.push(num+4);
	}
	if(num+5<epage){
		pages+=1;
		pageList.push(num+5);
	}
}
</script>

<div class="body">
<table class="DataTbl" style="align:center;">
	<tr id="DataTop">
		<th>썸네일</th>
		<th>주소</th>
		<th>제목</th>
		<th>mapx</th>
		<th>mapy</th>
	</tr>
</table>

<div id="pageDIV"></div>

</div>

<%@include file ="../footer.jsp" %>