<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>답글쓰기</title>
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
<h1 align="center">답글쓰기</h1>
<form method="get" action="questionReply" > 
   <table border="0" align="center">
   <input type="hidden" value="${qna_board_id}" name="qna_board_id">
      <tr>
         <td>
            <hr> <b>작성자</b> <br> 
            <input type="text" size="60" value="${sessionScope.userId}" name="reply_id"  readonly>
         </td>
      </tr>
      <tr>
         <td>
            <hr> <b>제목</b> <br> <input type="text" size="60" name="reply_title">
         </td>
      </tr>
      <tr>
         <td>
            <hr> <b>내용</b> <br>
            <textarea name="reply_content" rows="10" cols="63" maxlength="300"></textarea>
         </td>
      </tr>
      <tr>
         <td>
            <input type=submit value="답글쓰기" /> 
            <input type=button value="취소" onClick = 
                        "location.href='question_list'">
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