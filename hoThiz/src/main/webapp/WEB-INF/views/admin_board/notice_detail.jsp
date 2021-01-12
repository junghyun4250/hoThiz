<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Insert title here</title>
<style>
table.table{
 border-collapse: sollapse;
line-height: 1.5;
}

table.table thead th{
padding: 10px;
font-weight: bold;
vertical-align: top;
color: #369;
border-bottom: 3px solid #036;
}

table.table tbody th {
width: 150px;
padding: 10px;
font-weight: bold;
vertical-align: top;
border-bottom: 1px solid #ccc;
background: #f3f6f7;
}

table.table td{
width: 350px;
padding: 10px;
vertical-align: top;
border-bottom: 1px solid #ccc;
}


</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ include file="/WEB-INF/views/member/default/header.jsp" %>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h3 class="mt-5">메시지</h3>
        <p class="lead">
<h1 align="center">공지사항 상세보기</h1>
<table  align="center" class="table">
<tr>
<th scope="row">
작성날짜</th>
<td>
${noticelist.notice_board_date }
</td>
</tr>

<tr>
<th scope="row">
제목
</th>
<td>
${noticelist.notice_board_title}
</td>
</tr>

<tr>
<th scope="row">
내용
</th>
<td>
${noticelist.notice_board_content }
</td>
</tr>

<tr >
<th colspan="2">
<!-- 승인버튼 -->
<button onclick="location.href='notice_AllList'">공지사항 목록</button>&nbsp;
</th>
</tr>
</table>


</table>

	        </p>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/message/message_context/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/message/message_context/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%@ include file="/WEB-INF/views/member/default/footer.jsp" %>
</body>
</html>