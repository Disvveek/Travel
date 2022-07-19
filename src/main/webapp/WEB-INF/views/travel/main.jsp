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
</style>
<script>
jQuery(document).ready(function(){
	jQuery.ajax({          
	    url: '/travel/dataList',
	    type: 'get',
	    dataType: 'json',
	    success: function(data){
	        var datas = data.response.body.items.item;
	        
	        var dataList = "";
	        for(var i=0; i<datas.length; i++){
	            var output = '';
	            output = '<tr>';
	            output += '<td><img class="thumnail" src="'+ datas[i].firstimage2 +'"></td>';
	            output += '<td>'+ datas[i].addr1 +'</td>';
	            output += '<td><a href="javascript:void(0);" onclick="javascript:doView('+datas[i].contentid+');">'+ datas[i].title +'</a></td>';
	            output += '<td>'+ datas[i].mapx +'</td>';
	            output += '<td>'+ datas[i].mapy +'</td>';
	            output += '</tr>';
	            dataList += output;
	        }
	        jQuery("#DataTop").after(dataList);
	    }
	});    
});
function doView(contentid){
	location.href="/travel/view?contentid="+contentid;
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
</div>

<%@include file ="../footer.jsp" %>