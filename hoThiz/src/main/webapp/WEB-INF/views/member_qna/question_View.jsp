<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>상세정보</title>
<style>
table.table{
border-collapse: collapse;
text-align: left;
line-height: 1.5;
border-top: 1px solid #ccc;
border-left: 3px solid #369;
margin : 20px 10px;
}

table.table th{
width: 70px;
padding: 10px;
font-weight: bold;
vertical-align: top;
color: #153d73;
border-right: 1px solid #ccc;
}

table.table td{
width: 349px;
padding: 10px;
vertical-align: top;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
}
input.input{
border:none;
border-right:0px; 
border-top:0px; 
boder-left:0px; 
boder-bottom:0px;
}
textarea{
border:none;
border-right:0px; 
border-top:0px; 
boder-left:0px; 
boder-bottom:0px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function userCheck(userId, contentId){
       if(userId == contentId){
          document.getElementById("V_title").disabled=false;
          document.getElementById("V_content").disabled=false;
       }
    }
   
   function replyData(qna_board_id){
         console.log("qna_board_id : "+qna_board_id);
         $.ajax({
            url:"replyData/"+qna_board_id,            
            type:"GET",        
            success:function(rep){                  
               let html = ""                  
               rep.forEach(function(data){
                  var w_date = new Date(data.write_date);
                  var write_date = w_date.getFullYear()+"년";
                  write_date+=w_date.getMonth()+1+"월"                  
                  write_date+=w_date.getDate()+"일"                  
                  write_date+=w_date.getHours()+"시"                  
                  write_date+=w_date.getMinutes()+"분"                 
                  write_date+=w_date.getSeconds()+"초"
                  html += "<b>아이디 : </b>"+data.reply_id+" 님";
                  html += " | <b>작성일 : </b>"+write_date+"<br>";
                  html += "<b>제 목 : </b>"+data.reply_title+"<br>"
                  html += "<b>내용 : </b>"+data.reply_content+"<hr>"
               });
               $("#reply").html(html);
            },error:function(){ alert("문제가 발생했습니다.") }
         })
      }
</script>
</head>
<body  onload="userCheck('${userId}','${question_View.member_email}'), replyData(${question_View.qna_board_id})">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ include file="/WEB-INF/views/member/default/header.jsp" %>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h3 class="mt-5">메시지</h3>
        <p class="lead">
   <h1 align="center" >상세정보</h1>
    <form method="post" action="question_modify">
 
      <table class="table" align="center" >
         <tr>
            <th colspan="2">
               아이디</th>
               <td>
               <input type="hidden" name="qna_board_id" value="${question_View.qna_board_id} ">
               <input class="input" type="text" size="20" maxlength="20" name="member_email" value="${question_View.member_email }" readonly><br>
            </td>
         </tr>
   
         <tr>
            <th colspan="2" scope="row">
                  제목</th> 
               <td>
               <input class="input" type="text" size="48" maxlength="100" name="qna_board_title" id="V_title" value="${question_View.qna_board_title }" readonly/>
            </td>
         </tr>
         
         <tr>
            <th colspan="2" scope="row">
                  내용</th>
               <td>
               <textarea name="qna_board_content" rows="10" cols="50" maxlength="100" id="V_content">${question_View.qna_board_content }</textarea>
               <div id="reply"></div>
            </td>
         </tr>
         
         <tr>
            <td colspan="3" align="right">
               <c:if test="${userId == question_View.member_email }">
                  <input type="submit" value="수정하기">
                  <input type="button" value="삭제하기" onclick=
                  "location.href='delete?qna_board_id=${question_View.qna_board_id}'">
                  <input type="button" value="답글쓰기" onclick=
               "location.href='questionReplyView?qna_board_id=${question_View.qna_board_id}'">
               
               </c:if>
               
               <input type=button value="목록보기" onClick="location.href='question_list'" >
               <c:when test="${dto.member_email eq sessionScope.userId }">
               <input type="button" value="관리자페이지" onclick="location.href='admin_board/admin'">
               </c:when>
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