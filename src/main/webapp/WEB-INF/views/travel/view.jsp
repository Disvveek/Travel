<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../header.jsp" %>
<style>

table{
border:1px solid black;
border-collapse: collapse;
display:inline-block;
width:80%;
}
th, td{
border:1px solid black;
}
.viewImage{
width:100%;
}
</style>
<script>
var contentid = <%=request.getParameter("contentid")%>;
jQuery(document).ready(function(){
	jQuery.ajax({          
	    url: '/travel/dataView',
	    type: 'get',
	    data: {"contentid":contentid},
	    dataType: 'json',
	    success: function(data){
			var datas = data.response.body.items.item;
            var output = '';
            output += '<tr>';
            output += '<td>제목</td>';
            output += '<td>'+ datas.title +'</td>';
            output += '</tr>';
            output += '<tr>';
            output += '<td>썸네일</td>';
            output += '<td><img class="viewImage" src="'+ datas.firstimage2 +'"></td>';
            output += '</tr>';
            output += '<tr>';
            output += '<td>주소</td>';
            output += '<td>'+ datas.addr1 +'</td>';
            output += '</tr>';
            output += '<tr>';
            output += '<td>내용</td>';
            output += '<td>'+ datas.overview +'</td>';
            output += '</tr>';
            output += '<tr>';
            output += '<td>전화번호</td>';
            output += '<td>'+ datas.tel +'</td>';
            output += '</tr>';
            output += '<tr>';
            output += '<td>좌표</td>';
            output += '<td>['+ datas.mapx+'/'+datas.mapy +'"]</td>';
            output += '</tr>';
	        jQuery("#DataTbl").append(output);
	    }
	});   
});

</script>

<div class="body">
<table class="DataTbl" id="DataTbl" style="align:center;">
	<colgroup>
		<col width="20%">
		<col width="80%">
	</colgroup>
</table>
</div>

<%@include file ="../footer.jsp" %>