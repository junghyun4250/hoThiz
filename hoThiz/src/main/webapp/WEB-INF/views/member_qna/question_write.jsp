<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>핫디즈 :: hoThiz</title>
  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/message/message_context/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Insert title here</title>
<style>
table.table{
border-collapse: collapse;
line-height: 1.5;
border-top: 1px solid #ccc;
border-left: 3px solid #369;
margin: 20px 10px;
}

table.table th{
width: 147px;
padding: 10px;
font-weight: bold;
vertical-align: top;
color: #153d73;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
}

table.table td{
width: 349px;
padding: 10px;
vertical-align: top;
border-right: 1px solid #ccc;
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
 <form method="post" action="write_save" style="text-align: center;">
 <h1>문의사항 작성</h1>

      <table class="table" style="text-align: center;">
         <tr>
         	<th>아이디</th>
         		<td>
         		<input type="text" size="20" maxlength="20" name="member_email" value="${userId}" disabled/><br>
         		</td>
         </tr>
             
         <tr>
            <th>제목</th>
            <td> 
               <input type="text" size="48" maxlength="100" name="qna_board_title" />
            </td>
         </tr>
         
         <tr>
            <th>내용</th>
            <td>
               <textarea name="qna_board_content" rows="10" cols="50" maxlength="100"></textarea>
            </td>
         </tr>
         
         <tr>
            <td colspan="2" align="right">
               <input type="submit" value="글쓰기" />
               <input type=button value="목록보기" 
                        onClick="location.href='question_list'" >
            </td>
         </tr>
      </table>
   </form>
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