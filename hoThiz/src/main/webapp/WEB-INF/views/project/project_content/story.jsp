

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  

  <title>hoThiz :: 핫디즈</title>

  <!-- Bootstrap core CSS -->
  <link href="/fund/resources/vendor/bootstrap5/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/fund/resources/css/blog-post.css" rel="stylesheet">
<style type="text/css">

.likeBtn{
    border: none;
    outline:none;
    background-color: white;
    margin-top: 0;
    padding-top: 0;
}

.kakao-link-btn
{
    border: none;
    outline:none;
    background-color: white;
    margin-top: 0;
    padding-top: 0;
}




.img-fluid rounded{
   float:left;
}





.bigLetter{
   font-size: 3em;


}

.batch{
   float:left;
}





.col-md-4{
   position: sticky; 
   top: 0; 
}

.hig{
float:left;
}


.modalWrap{
   display: none;
   width:600px;
   height:350px;
   position: absolute;
   top:50%;
   left:50%;
   margin: -250px 0 0 -250px;
   background:#eee;
   z-index:2;
}
   .blackBg{
      display:none;
      position:absolute;
      content:"";
      width:100%;
      height:100%;
      background-color:rgba(0, 0,0, 0.5);
      top:0;
      left:0;
      z-index: 1;
      
   }
.modalClose{
   position:fixed;
   width: 26px;
   height: 26px;
   position: absolute;
   top: -30px;
   right: 0;
}
.modalClose> a{
   display: block;
   width: 100%;
   height: 100%;
   background:url(https://img.icons8.com/metro/26/000000/close-window.png);
   text-indent: -9999px;
}


</style>
</head>

<body onload="setTag()">

  <!-- Navigation -->
<%@include file="/WEB-INF/views/member/default/header.jsp" %>


<c:set var="path" value="/fund/resources/img" />

<c:set var="mem" value="${memberInfo}"/>
<c:set var="prj" value="${projectInfo}" />
<c:set var="day" value="${dDayInfo}"/>
<c:set var="userId" value="${sessionScope.userId}"/>


  <!-- Page Content -->
 
   <div class="blackBg"></div>
   <div class="modalWrap">
         <div class="modalClose"><a herf="#">close</a></div>
         <div class="shredContent">      
         <h3 align="center">창작자에게 문의하기</h3>
         <form id="qForm" method="post" action="/fund/discover/sendMessage?project_id=${prj.project_id}">
         <input type="hidden" name="member_email" value="${userId}">
         <input type="hidden" name="message_send_member" value="${userId}">
         <input type="hidden" name="message_receive_member" value="${mem.member_email}">
         
         
         <table align="center" border="1">
         <tr>
         <td colspan="2">받는 사람 ${mem.member_name}님<br></td>
         </tr>
         <tr>
         <td colspan="2">문의 내용 
         <select name="message_type" id="message_type">
               <option name="none" value="문의유형" selected disabled>문의유형</option>
               <option value="선물/후원">선물/후원</option>
               <option value="프로젝트">프로젝트</option>
               <option value="수령자 정보">수령자 정보</option>
               <option value="교환/환불">교환/환불</option>
               <option value="배송">배송</option>
               <option value="기타">기타</option>
            </select></td>
         
         </tr>
         <tr>
            <td colspan="2">            
            <textarea id="message_content" name="message_content" rows="10" cols="40" placeholder="프로젝트 진행자에게 문의하고 싶은 내용을 적으세요.">

            </textarea></td>
         </tr>
         <tr>
            <td colspan="2" align="right"><input type="button" id="questionSubmit" type="button" value="전송"></td>
         </tr>
         
         </table>
         </form>   
         </div>
   </div>




  <div class="container">
  

    <div class="row">
   <c:if test="${day.chk>='0' and day.d_day>'0'}"><%--진행중인 경우 --%>

      <!-- Post Content Column -->
      <div class="col-lg-8">
      
      
      

      
        <!-- Title -->
        <h1 class="mt-4">${prj.project_title}</h1>
        <!-- Author -->
        <p class="lead">
        <img class="d-flex mr-3 rounded-circle" width="80px" width="80px" src="${path}/${mem.member_email}/${mem.member_profile_pic}"> &nbsp;         
        <button class="btn btn-default" onclick="location.href='/fund/discover?category=${prj.project_sub_category}'">      
      <div id="subCategory">${prj.project_sub_category}</div>
      </button> | <button class="btn btn-default" onclick="location.href='/fund/search?member_email=${mem.member_email}'"><div id="subCategory">${mem.member_name}</div>
      </button>
        </p>
        
        
      


        <hr>
        <!-- Preview Image -->

           <img class="img-fluid rounded" src="${path}/project/title/${prj.member_email}/${prj.project_id}/${prj.project_main_image}" alt="">
      <hr>
      
   
         <div class="textBox">
               <p>
                  모인금액<br>
                  <span class="bigLetter">${prj.project_current_donated}</span>원 <font style="font-weight: bold">${prj.project_current_percent}%</font><br>
               </p>
               <p>
                  남은시간<br>
                  <span class="bigLetter">${day.d_day}</span>일<br>
               </p>
               <p>
                  후원자<br>
                  <span class="bigLetter">${donatedMemberCnt}</span>원 <br>
               </p>
         </div>
   
      <blockquote class="blockquote">
          <p class="mb-0">펀딩 진행중
          <footer class="blockquote-footer">
          <p>목표 금액인 ${prj.project_target_price } 원이 모여야만 결제됩니다.
            <br>결제는 ${prj.project_date_string}에 다함께 진행됩니다.</p>
          </footer>
        </blockquote>   
         
        
      
      
         <%----------------- --%>
      <button id="pushPrj" class="btn btn-secondary my-2 my-sm-0">프로젝트 밀어주기</button>
      
      
      
      <button class="kakao-link-btn" onclick="sendLink('${prj.project_id}','${prj.member_email}','${prj.project_main_image}')">
      <img src="https://www.flaticon.com/svg/static/icons/svg/2111/2111466.svg" width="32px" height="32px">
      </button>
      
      
     <%--좋아요 버튼 --%>
         <c:set var="flag" value="false" />
                   <c:forEach var="likeId" items="${likeList}">
                  <c:if test="${likeId eq prj.project_id}">
                     <c:set var="flag" value="true" />
                  </c:if>      
               </c:forEach>
               
               
      <c:if test="${flag}">
         <button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}','${userId}')">
            <img class="likeImg" src="/fund/resources/img/fullHeart.png">
         </button>
              
      </c:if>
      <c:if test="${not flag}">
         <button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}','${userId}')">
            <img class="likeImg" src="/fund/resources/img/blankHeart.png">
         </button>      
      </c:if>   
         
         
         
         
            <hr>
           <a href="/fund/discover/${prj.project_id}">스토리</a> | 
           <a href="/fund/discover/${prj.project_id}/community">커뮤니티</a> | 
    
           <hr>
            <p class="lead">
           ${prj.project_video}
           ${prj.project_story} </p>
      <hr>
       
      </div>
      
      

      

      <!-- Sidebar Widgets Column -->
     
   
   <div class="col-md-4">
          <div class="card my-4">
          <h5 class="card-header">창작자 소개</h5>
          <div class="card-body">
           <img class="d-flex mr-3 rounded-circle" width="60px" width="60px" src="${path}/${mem.member_email}/${mem.member_profile_pic}"> &nbsp;
                <a href="/fund/search?member_email=${mem.member_email}">${mem.member_name}</a>
                 <p>${member.member_introduce}</p>
              <hr>

              <button id="modalBtn" class="btn btn-secondary my-2 my-sm-0">창작자에게 문의하기</button>
          </div>
        </div>

        
        
        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">선물 선택</h5>
          <div class="card-body">
          
      <div id="giftForm">

      <div class="aGift">
         <button style="width:100%;height:auto" class="btn btn-default hiddenBtn0" onclick="showOrView(0)"><h3>1,000원+</h3> 선물을 선택하지 않고 밀어만 줍니다</button>
               <div style="width:100%;margin:1.8em;"></div>
               <div class="hiddenList" id="gift0" style="display:none;">
                  추가 후원금(선택)<br> 
                  <input type="text" id="input0" maxlength="16" oninput="numSet(this,0)"><br>
                  <span class="blockquote-footer">더 후원해주시면 프로젝트 성사가 앞당겨집니다.</span>
                  <div style="width:100%;margin:0.2em;"></div>
                  <button class="btn btn-default" id="5000" onclick="plusMoney(this,0,1000)" >+ 5천원</button>
                  <button class="btn btn-default" id="10000" onclick="plusMoney(this,0,1000)" >+ 1만원</button>
                  <button class="btn btn-default" id="50000" onclick="plusMoney(this,0,1000)" >+ 5만원</button>
                  <button class="btn btn-default" id="100000" onclick="plusMoney(this,0,1000)" >+ 10만원</button><br>
                  <div style="width:100%;margin:1.8em;"></div>
                  <button class="btn btn-secondary my-2 my-sm-0" id="payMoney0" onclick="pay(0,1000)">1000원 밀어주기</button>
               </div>
      </div>
      <hr>
      
   
         <c:forEach var="gift" items="${projectGift}" varStatus="status">
         
            <div class="aGift">
               <button style="width:100%;height:auto" class="btn btn-default hiddenBtn${gift.gift_id}" onClick="showOrView('${gift.gift_id}')" >
                  <h3>${gift.price}원+</h3>${gift.gift}
               </button>
               <div style="width:100%;margin:1.8em;"></div>
               <div class="hiddenList" id="gift${gift.gift_id}" style="display:none;">
                  추가 후원금(선택)<br>
                  <input type="text" id="input${gift.gift_id}" maxlength="16" oninput="numSet(this,'${gift.price}')"><br>
                  <span class="blockquote-footer">더 후원해주시면 프로젝트 성사가 앞당겨집니다.</span>
                  <div style="width:100%;margin:0.2em;"></div>
                  <button class="btn btn-default" id="5000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5천원</button>
                  <button class="btn btn-default" id="10000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 1만원</button>
                  <button class="btn btn-default" id="50000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5만원</button>
                  <button class="btn btn-default" id="100000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 10만원</button><br>
                  <div style="width:100%;margin:1.8em;"></div>
                  <button class="btn btn-secondary my-2 my-sm-0" id="payMoney${gift.gift_id}" onclick="pay('${gift.gift_id}','${gift.price}')">${gift.price}원 밀어주기</button>
               </div>   
            <hr>
            </div>
            
            
         </c:forEach>
   
         </div>
          </div>
        </div>

      </div>







</c:if>
    
    
<%--공개예정 --%>
<c:if test="${day.chk<'0' and day.d_day>'0' and prj.project_prelaunching_check eq '1'}">
    <!-- Post Content Column -->
      <div class="col-lg-8">
      <button class="btn btn-default">
      <a href="/fund/discover?category=${prj.project_sub_category}">
      <div id="subCategory">${prj.project_sub_category}</div></a></button>
        <!-- Title -->
        <h1 class="mt-4">${prj.project_title}</h1>

        <!-- Author -->
         <!-- Author -->
        <p class="lead">
         <img class="d-flex mr-3 rounded-circle" width="30px" width="30px" src="${path}/${mem.member_email}/${mem.member_profile_pic}"> &nbsp;
         <a href="/fund/search?member_email=${mem.member_email}">${mem.member_name}</a>
        </p>


        <hr>

        <!-- Preview Image -->

           <img class="img-fluid rounded" src="${path}/project/title/${prj.member_email}/${prj.project_id}/${prj.project_main_image}" alt="">
      <hr>
      ${prj.project_summary}
   
   <p class="launchingDay" style="color:red;">${day.prelaunching_day}</p>
   
   <%--이거 알람 나타나는거 자바 스크립트로 띄우셈...안그러면 잘 안됨.. --%>
       <%--좋아요 버튼 --%>
         <c:set var="msg" value="알림신청" />
                   <c:forEach var="alarmId" items="${alarmList}">
                  <c:if test="${alarmId eq prj.project_id}">
                     <c:set var="msg" value="알림신청완료" />
                  </c:if>      
               </c:forEach>
    
      
            <button class="btn btn-secondary my-2 my-sm-0" id="notificationBtn" onClick="MyAlarmProject('${prj.project_id}','${userId}')">
               <p id="notiBtn${prj.project_id}">${msg}</p>
            </button>
      <button class="kakao-link-btn" onclick="sendLink('${prj.project_id}','${prj.member_email}','${prj.project_main_image}')">
      <img src="https://www.flaticon.com/svg/static/icons/svg/2111/2111466.svg" width="32px" height="32px">
      </button>
      </div>
<hr>
</c:if><%--공개예정 뷰 --%>












<c:if test="${day.d_day<='0'}"><%--------------끝남 --%>
   
     <!-- Post Content Column -->
      <div class="col-lg-8">
      <button class="btn btn-default">
      <a href="/fund/discover?category=${prj.project_sub_category}">
      <div id="subCategory">${prj.project_sub_category}</div></a></button>
        <!-- Title -->
        <h1 class="mt-4">${prj.project_title}</h1>

           <p class="lead">
         <img class="d-flex mr-3 rounded-circle" width="30px" width="30px" src="${path}/${mem.member_email}/${mem.member_profile_pic}"> &nbsp;
          <a href="/fund/search?member_email=${mem.member_email}">${mem.member_name}</a>
        </p>



        <!-- Preview Image -->

           <img class="img-fluid rounded" src="${path}/project/title/${mem.member_email}/${prj.project_id}/${prj.project_main_image}" alt="">
      <hr>
      
   
         <div class="textBox">
               <p>
                  모인금액<br>
                  <span class="bigLetter">${prj.project_current_donated}</span>원 <font style="font-weight: bold">${prj.project_current_percent}%</font><br>
               </p>
               <p>
                  남은시간<br>
                  <span class="bigLetter">${day.chk}</span>일<br>
               </p>
               <p>
                  후원자<br>
                  <span class="bigLetter">${donatedMemberCnt}</span>원 <br>
               </p>
         </div>
   
   
      <blockquote class="blockquote">
          <p class="mb-0">펀딩 진행중
          <footer class="blockquote-footer">
          <p>목표 금액인 ${prj.project_target_price } 원이 모여야만 결제됩니다.
            <br>결제는 ${prj.project_date_string }에 다함께 진행됩니다.</p>
          </footer>
        </blockquote>   
         
         <%--좋아요 버튼 --%>
         <c:set var="flag" value="false" />
                   <c:forEach var="likeId" items="${likeList}">
                  <c:if test="${likeId eq prj.project_id}">
                     <c:set var="flag" value="true" />
                  </c:if>      
               </c:forEach>
               
               
      <c:if test="${flag}">
         <button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}','${userId}')">
            <img class="likeImg" src="/fund/resources/img/fullHeart.png">
         </button>
            
      </c:if>
      <c:if test="${not flag}">
         <button id="likeBtn${prj.project_id}" class="likeBtn" onClick="MyFavoritProject('${prj.project_id}','${userId}')">
            <img class="likeImg" src="/fund/resources/img/blankHeart.png">
         </button>      
      </c:if>
      
      
         <%----------------- --%>
      <button id="pushPrj" class="btn btn-secondary my-2 my-sm-0" style="'style:opacity:0.5" disabled>밀어주기가 마감되었습니다</button>
     <button class="kakao-link-btn" onclick="sendLink('${prj.project_id}','${prj.member_email}','${prj.project_main_image}')">
      <img src="https://www.flaticon.com/svg/static/icons/svg/2111/2111466.svg" width="32px" height="32px">
      </button>
      
        <hr>

        <!-- Post Content -->
        <p class="lead">
        ${prj.project_video}
        
        ${prj.project_story}
        
        </p>

        <hr>


       
</div>
        <div class="col-md-4">
          <div class="card my-4">
          <h5 class="card-header">창작자 소개</h5>
          <div class="card-body">
           <img class="d-flex mr-3 rounded-circle" width="30px" width="30px" src="${path}/${mem.member_email}/${mem.member_profile_pic}"> &nbsp;
               <a href="/fund/search?member_email=${mem.member_email}">${mem.member_name}</a>
                 <p>${member.member_introduce}</p>
              <hr>

              <button id="modalBtn" class="btn btn-secondary my-2 my-sm-0">창작자에게 문의하기</button>
          </div>
        </div>

        
        
        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">선물 선택</h5>
          <div class="card-body">
          
      <div id="giftForm">

      <div class="aGift">
         <button disabled style="width:100%;height:auto" class="btn btn-default hiddenBtn0" onclick="showOrView(0)"><h3>1,000원+</h3> 선물을 선택하지 않고 밀어만 줍니다</button>
               <div style="width:100%;margin:1.8em;"></div>
               <div class="hiddenList" id="gift0" style="display:none;">
                  추가 후원금(선택)<br> 
                  <input type="text" id="input0" maxlength="16" oninput="numSet(this,0)"><br>
                  <span class="blockquote-footer">더 후원해주시면 프로젝트 성사가 앞당겨집니다.</span>
                  <div style="width:100%;margin:0.2em;"></div>
                  <button class="btn btn-default" id="5000" onclick="plusMoney(this,0,1000)" >+ 5천원</button>
                  <button class="btn btn-default" id="10000" onclick="plusMoney(this,0,1000)" >+ 1만원</button>
                  <button class="btn btn-default" id="50000" onclick="plusMoney(this,0,1000)" >+ 5만원</button>
                  <button class="btn btn-default" id="100000" onclick="plusMoney(this,0,1000)" >+ 10만원</button><br>
                  <div style="width:100%;margin:1.8em;"></div>
                  <button class="btn btn-secondary my-2 my-sm-0" id="payMoney0" onclick="pay(0,1000)">1000원 밀어주기</button>
               </div>
      </div>
      <hr>
      
   
         <c:forEach var="gift" items="${projectGift}" varStatus="status">
         
            <div class="aGift">
               <button disabled style="width:100%;height:auto" class="btn btn-default hiddenBtn${gift.gift_id}" onClick="showOrView('${gift.gift_id}')" >
                  <h3>${gift.price}원+</h3>${gift.gift}
               </button>
               <div style="width:100%;margin:1.8em;"></div>
               <div class="hiddenList" id="gift${gift.gift_id}" style="display:none;">
                  추가 후원금(선택)<br>
                  <input type="text" id="input${gift.gift_id}" maxlength="16" oninput="numSet(this,'${gift.price}')"><br>
                  <span class="blockquote-footer">더 후원해주시면 프로젝트 성사가 앞당겨집니다.</span>
                  <div style="width:100%;margin:0.2em;"></div>
                  <button class="btn btn-default" id="5000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5천원</button>
                  <button class="btn btn-default" id="10000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 1만원</button>
                  <button class="btn btn-default" id="50000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 5만원</button>
                  <button class="btn btn-default" id="100000" onclick="plusMoney(this,'${gift.gift_id}','${gift.price}')" >+ 10만원</button><br>
                  <div style="width:100%;margin:1.8em;"></div>
                  <button class="btn btn-secondary my-2 my-sm-0" id="payMoney${gift.gift_id}" onclick="pay('${gift.gift_id}','${gift.price}')">${gift.price}원 밀어주기</button>
               </div>   
   
            </div>
            
            
         </c:forEach>
   
         </div>
          </div>
        </div>

      </div>

</c:if>


<!-- 공유 버튼은 둘다 있음~ -->
   
    </div>
    <!-- /.row -->
    
<c:set var="path" value="/fund/resources/img" />
<div style="width:100%;margin:3em;"></div>
<h2>이런 프로젝트 어떠세요?</h2><br>
    <div class="row text-center">
<c:forEach var="morePrj" items="${morePrjList}">

       <div class="col-md-3">
           <div class="card">
               <div class="card-img">
                   <img class="card-img-top" src="${path}/project/title/${morePrj.value.member_email}/${morePrj.value.project_id}/${morePrj.value.project_main_image}" onclick="goProject('${morePrj.value.project_id}')" style="height: 150px;">
               </div>

   <c:set var="flag" value="false" />
                   <c:forEach var="likeId" items="${likeList}">
                  <c:if test="${likeId eq morePrj.value.project_id}">
                     <c:set var="flag" value="true" />
                  </c:if>      
               </c:forEach>
               
               
      <c:if test="${flag}">
         <button id="likeBtn${morePrj.value.project_id}" class="likeBtn" onClick="MyFavoritProject('${morePrj.value.project_id}','${userId}')">
            <img class="likeImg" src="/fund/resources/img/fullHeart.png">
         </button>
            
      </c:if>
      <c:if test="${not flag}">
         <button id="likeBtn${morePrj.value.project_id}" class="likeBtn" onClick="MyFavoritProject('${morePrj.value.project_id}','${userId}')">
            <img class="likeImg" src="/fund/resources/img/blankHeart.png">
         </button>      
      </c:if>   
      
      
      
      
    <div class="card-block">
                  <div class="card-title">
                       <small><a href="/fund/discover?category=${morePrj.value.project_sub_cateogry}">${morePrj.value.project_sub_cateogry}</a> | <a href="/fund/search?member_email=${mem.member_email}">${morePrj.value.member_name}</a></small>
                       <h4><a href="/fund/discover/${morePrj.value.project_id}">${morePrj.value.project_title }</a></h4>
                       <p>${morePrj.value.project_summary }<br>
                      ${morePrj.value.project_current_percent} %달성</p>
                   </div>
            
      
            </div>
            
         
            
         </div>
         
      </div>

</c:forEach>
  </div>     
    
    
    
    
    
    

  </div>
  <!-- /.container -->



    <div style="width:100%;margin:5em;"></div>
    
    
    

 

    
    
    
    
 
<%@include file="/WEB-INF/views/member/default/main_footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script src="/fund/resources/myjsFunction/projectFunction.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="/fund/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">





$("#questionSubmit").click(function(){
   
   var q = $("#message_content").val();
   if(q.replace(/\s| /gi, "").length==0){
      alert("내용을 입력하세요.");
   } else if($('select[name=none]').val()=='문의유형'){
      
     alert("문의 유형을 선택하세요.");
      
   } else{
      alert("메시지 전송을 완료했습니다.");
      $('#qForm').submit();
      $('.modalWrap').hide();
      $('.blackBg').hide();
   }
   
});

$(document).ready(function(){
   $('#modalBtn').click(function(){
      console.log("안녕하삼");
      $('.modalWrap').show();
      $('.blackBg').show();
      
      $('.modalClose').click(function(){
         $('.modalWrap').hide();
         $('.blackBg').hide();
         
      });
      
   });   
});
$(window).scroll(function(event){
   
   var winTop = $(window).scrollTop();
   var bgTop = $(".blackBg").offset().top;
   
   if(winTop > bgTop){
      
      $(".blackBg").css("position", "fixed");
      $(".modalWrap").css("position", "fixed");
   }
   else if(winTop < bgTop){
      $(".blackBg").css("position", "static");
      $(".modalWrap").css("position", "static");
   }
   
   
});






Kakao.init("4a910cfb1ef1434f4c361ae507d1375a");

function sendLink(prjId,email,image){
   console.log("샌드링크 들어옴");
   var like = '${prj.project_like}';
   console.log(like);
   var id = prjId;
   var path='http://localhost:8086/fund/resources/img/projcet/title/'+email+'/'+prjId+'/'+image;
   console.log(path);
  // ${path}/project/title/${prj.member_email}/${prj.project_id}/${prj.project_main_image}" 
   
   var url = 'http://localhost:8086/fund/discover/'+id;
   console.log(id);
   Kakao.Link.sendDefault({
      
       
        objectType: 'feed',
        content: {
          title: '${prj.project_title}',
          description: '${prj.project_summary}',
          imageUrl:'http://localhost:8086/fund/resources/img/projcet/title/crk333@naver.com/15/test.jpg',
          link: {
            mobileWebUrl: url,
           
          },
        },
        social: {
          likeCount: Number(like),

        },
        buttons: [
          {
            title: '웹으로 이동',
            link: {
              webUrl: url,
            },
          },
          
        ]
      });
   
}




$("#pushPrj").click(function(){
   console.log("푸쉬");
   var giftLocation = $("#giftForm").offset().top;

   $("html,body").animate({scrollTop : giftLocation}, 500);
});







function pay(id, price){
   let path = '';
   let money = Number($("#input"+id).val());
   money += Number(price);
   let prjId = '${prj.project_id}';
   let title = '${prj.project_title}';
   
   path += '/fund/paymethod?money='+money+'&project_id='+prjId+'&project_title='+title;
   location.href=path;
   
}


function setTag(){
   
   var  category = [
       { 
             '게임' : 'game',
            '모바일 게임' : 'mobile-game', 
            '비디오 게임':'video-game',
            '보드 게임':'board-game'
    },
    
    {
             '공연' : 'show',
            '무용' : 'dance', 
            '뮤지컬':'musical',
            '공연':'theater'
    },
    
    {
              '디자인' : 'design',
             '건축, 공간' : 'architecture', 
             '그래픽 디자인':'graphic-design',
             '제품 디자인':'product-design'
    },
    
    {
              '만화' : 'comics',
            '웹툰' : 'web-comics', 
            '만화책':'comic-books'
            
  },
    {         
            '예술' : 'art',
            '전시' : 'exhibitions',
           '웹툰' : 'sculpture-and-action-figures', 
           '일러스트레이션':'illustration'
         
    },      
  
       {         
               '공예' : 'crafts',
               '캔들&조향&비누' : 'candles-and-diffusers-and-soaps',
               '가죽&금속&목 공예' : 'leather-and-metal-and-woodworking',
               '도예' : 'pottery'
              
            
       },
       
      {         
                  '사진' : 'photography',
                  '인물' : 'people-photography',
                  '배경' : 'space-and-urban-photography',
                  '동물' : 'animals-photography'            
       
    },

   {            
                  '영상' : 'video',
                  '영화' : 'film',
                  '다큐멘터리' : 'documentary',
                  '애니메이션' : 'animation',
                  '뮤직비디오' : 'music-videos'
                 
      

   },
      {
               
                  '모든' : 'food',
                  '에피타이저' : 'appetizer',
                  '메인디쉬' : 'main-dish',
                  '디저트' : 'dessert'
                 
          
      },
      
      {
               '음악' : 'music',
               '클래식' : 'classical-music',
               '대중음악' : 'popular-music',
               '인디음악' : 'independent-music'
              
      },
      
      {
                '출판' : 'publication',
                '잡지' : 'zines',
                '문학&에세이' : 'literature-and-essay',
                '그림책' : 'picture-books'                        
       },
       
      {
      
                  '모든테크' : 'technology',
                  '소프트웨어' : 'software',
                  '하드웨어' : 'hardware',
                  '앱' : 'apps',
                  '웹' : 'web'
                 
      
      },
   
      {
                  '패션' : 'fashion',
                  '의류' : 'apparels',
                  '악세서리' : 'accessories',
                  '뷰티' : 'beauty'
             
      },

      {
                  '저널' : 'journalism',
                  '오디오 저널' : 'audio-journals',
                  '비디오 저널' : 'video-journals',
                  '웹 저널' : 'web-journals'

      }   
   ];
   
   
   $.each(category,function(idx,map){
      $.each(map,function(key,value){
         if(value=='${prj.project_sub_category}'){
            $("#subCategory").html(key);
         }
         
      })
   })

   
   
}



 
function showOrView(id){
   
   var str = '${giftIdList}'; //gift id만 들어가있는 리스트. 문자열로 들어옴
   str=str.replace('[',''); //배열의 앞뒤 제거, 공백 제거
   str=str.replace(']','');
   str=str.replace(' ','');

   var spList = str.split(','); //,로 스플릿해서 해당 id값만 배열에 받는다.
   spList.push("0"); //기본 목록도 나타나도록.
   
    //index와 비교할 것
   console.log(spList);
   console.log(id);
   $.each(spList,function(idx,value){
      //리스트 안의 아이템만큼 반복한다. 
      //지금은 리스트가 4개임,.
      //value는 id리스트임. id는 클릭한 객체.
      
      if($("#gift"+id).is(":visible")){ //목록이 보이는 상황..그럼 굳이 누를건 없고..다른거 올려
         if(id!=value){ //누른 id를 제외한 다른 목록을 올려야 함.
            $("#gift"+value).slideUp();
         
         } else{ //만약 
            $("#gift"+value).slideDown();
         }
      
      } else{ //목록이 안보이는 상황이면 =>여기에 3만 안들어옴.
         if(id==value){
            console.log(id)
            console.log(value)
            $("#gift"+value).slideDown(); //누르것만 내림
         } else{
            $("#gift"+value).slideUp()
         }
      }

   });
   


   
}






//가격 플러스 버튼클릭할시 실행
function plusMoney(info,id,price){
   var plus = Number(info.id);
   var money = Number($("#input"+id).val());
   var price = Number(price)
   var plusMoney = plus+money;
   
   console.log(price);
   
   price += plusMoney
   price = price+'원 밀어주기';
   
   
   $('#input'+id).val(plusMoney);
   $('#payMoney'+id).html(price);

}



function numSet(info,price){
   console.log("numSet들옴");   
   var id = info.id;
   
   id = id.replace('input','');

   var price = Number(price);
   var inputDonate = Number(info.value);
   
   info.value = info.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');   
   if(info.value.length > info.maxLength){
      info.value = info.value.slice(0, info.maxLength);

   }

   console.log("id:"+id);
   console.log("price:"+price);
   console.log("input:"+inputDonate);
   
   
   price +=inputDonate;
   price = price+'원 밀어주기';

   $('#payMoney'+id).html(price);

}   


   
</script>







</body>

</html>