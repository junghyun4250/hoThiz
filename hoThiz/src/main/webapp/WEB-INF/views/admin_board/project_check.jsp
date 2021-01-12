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
border-collapse: collapse;
line-height: 1.5;
}
table.table thead th {
padding: 10px;
font-weight: bold;
vertical-align: top;
border-bottom: 3px solid #036;
}

table.table tbody th{
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
border-bottom: solid #ccc;
}

a{
font-decoration: none;
}
</style>
</head>
<body align="center">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ include file="/WEB-INF/views/member/default/header.jsp" %>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h3 class="mt-5">메시지</h3>
        <p class="lead">
<h1>승인대기 목록</h1>
<hr><br>
<c:choose>
<c:when test="${empty list }">
프로젝트 승인대기목록이없습니다
</c:when>
<c:otherwise>
<table align="center" class="table"><tr>
<th>
<b>작성자</b>
</th>
<th>
&nbsp;&nbsp;&nbsp;<b>프로젝트 목표일</b>&nbsp;&nbsp;&nbsp;
</th>
<th>
<b>프로젝트 이름</b>
</th>

</tr>
<c:forEach items="${list }" var="dto">
<!--  해당 프로젝트 상세페이지로감 -->


<tr>
<td>
${dto.member_email }
</td>
<td>
&nbsp;&nbsp;&nbsp;${dto.project_deadline }&nbsp;&nbsp;&nbsp;
</td>
<td>
   <a href="check_detail?project_id=${dto.project_id}">${dto.project_title }</a>  
</td>
</tr>
<br>         
</c:forEach>
</table>
</c:otherwise>
</c:choose>


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