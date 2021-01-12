<%@ page language="java"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<style type="text/css">
.col-md-3{
 margin-bottom: 2em;
}

.img-responsive {
   width: 100%;
}

</style>

</head>


<body>




<%-- 
{userId} 세션 없으면 -> 좋아요 누르면 로그인창으로 보낸다.
--%>




<c:set var="userId" value="${sessionScope.userId}"/>
<%@include file="/WEB-INF/views/member/default/main_header.jsp" %>




  <%--------------------------------배너----------------------------------------------%>

  <!-- Page Content -->
  <div class="container">

    <!-- 배너요 -->
    <header class="jumbotron my-4">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">


            
                  <div class="carousel-item active">
                     <div id="banner">

                          <img class="d-block img-fluid" src="resources/img/project/title/${bannerMap.banner0.member_email}/${bannerMap.banner0.project_id}/${bannerMap.banner0.project_main_image}" style="height: 450px; width: 100%;" alt="First slide" onclick="goProject('${bannerMap.banner0.project_id}')">
                             <div class="bannerTitle">
                                <br><br><br><br><br><br><br><br>
                             <h1>${bannerMap.banner0.project_title }</h1>
                             <br><br><br><br><br><br><br><br><br><br>
                             <h3>${bannerMap.banner0.project_summary }</h3>
                          </div>
                    
                    </div>
                </div>
               
               
               <div class="carousel-item">
                 <div id="banner">

                       <img class="d-block img-fluid" src="resources/img/project/title/${bannerMap.banner1.member_email}/${bannerMap.banner1.project_id}/${bannerMap.banner1.project_main_image}" style="height: 450px; width: 100%;" alt="Second slide" onclick="goProject('${bannerMap.banner1.project_id}')">
                           <div class="bannerTitle">
                           <br><br><br><br><br><br><br><br>
                             <h1>${bannerMap.banner1.project_title }</h1>
                             <br><br><br><br><br><br><br><br><br><br>
                             <h3>${bannerMap.banner1.project_summary }</h3>
                          </div>
              
                 </div>
               </div>


             <div class="carousel-item">
                 <div id="banner">
         
                       <img class="d-block img-fluid" src="resources/img/project/title/${bannerMap.banner2.member_email}/${bannerMap.banner2.project_id}/${bannerMap.banner2.project_main_image}" style="height: 450px; width: 100%;" alt="Second slide" onclick="goProject('${bannerMap.banner2.project_id}')">
                           <div class="bannerTitle">
                           <br><br><br><br><br><br><br><br>
                             <h1>${bannerMap.banner2.project_title }</h1>
                             <br><br><br><br><br><br><br><br><br><br>
                             <h3>${bannerMap.banner2.project_summary }</h3>
                          </div>
                    
                 </div>
               </div>

          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        
        
</div>

    </header>
   
   
   
   
   

  <%--------------------------------리스트---------------------------------------%>


<c:set var="path" value="/fund/resources/img" />


<h2><a href="/fund/discover?sort=popular">인기 프로젝트</a></h2>

 <div class="row text-center">



<c:forEach var="popular" items="${popularList}">


       <div class="col-md-3">
           <div class="card">
               <div class="card-img">
                   <img class="card-img-top" src="${path}/project/title/${memberMap[popular.project_id].member_email}/${popular.project_id}/${popular.project_main_image}" onclick="goProject('${popular.project_id}')" style="height: 150px;">
               </div>
               
               
               <%--좋아요  --%>
                  <c:set var="flag1" value="false" />
                   <c:forEach var="likeId" items="${likeList}">
                  <c:if test="${likeId eq popular.project_id}">
                     <c:set var="flag1" value="true" />
                  </c:if>      
               </c:forEach>
               
               
      <c:if test="${flag1}">
         <button id="likeBtn${popular.project_id}" class="likeBtn" onClick="MyFavoritProject('${popular.project_id}','${userId}')">
            <img class="likeImg" src="resources/img/fullHeart.png" >
         </button>
            
      </c:if>
      <c:if test="${not flag1}">
         <button id="likeBtn${popular.project_id}" class="likeBtn" onClick="MyFavoritProject('${popular.project_id}','${userId}')">
            <img class="likeImg" src="resources/img/blankHeart.png" >
         </button>      
      </c:if>
      
      
      
               <div class="card-block">
                  <div class="card-title">
                       <small><a href="/fund/discover?category=${popular.project_sub_category}">${popular.category_trans}</a> | <a href="search?member_email=${memberMap[popular.project_id].member_email}">${memberMap[popular.project_id].member_name}</a></small>
                       <h4><a href="/fund/discover/${popular.project_id}">${popular.project_title}</a></h4>
                       <p>${popular.project_summary}<br>
                       ${popular.project_current_percent}% 달성</p>
                   </div>
            
            
            </div>
            
            
         </div>
      </div>

   


</c:forEach>





</div>   

<div style="width:100%;margin:1em;"></div>


  <%--인기 프로젝트끝 --%>



                  
<div style="width:100%;margin:3em;"></div>




<h2><a href="/fund/discover?ongoing=prelaunching">공개예정 프로젝트</a></h2>

 <div class="row text-center">



<c:forEach var="pre" items="${prelaunchingList}" varStatus="var">

<c:if test="${pre.project_prelaunching_check eq '1' }">


       <div class="col-md-3">
           <div class="card">
               <div class="card-img">
                   <img class="card-img-top" src="${path}/project/title/${pre.member_email}/${pre.project_id}/${pre.project_main_image}" onclick="goProject('${pre.project_id}')" style="height: 150px;">
               </div>
               <div class="card-block">
                   <div class="card-title">
                   
                       <small>
                       <a href="/fund/discover?category=${pre.project_sub_category}">
                          ${pre.category_trans}</a> 
                       | <a href="/fund/search?member_email=${pre.member_email}">${pre.member_name}</a></small>
                       <h4><a href="/fund/discover/${pre.project_id}">${pre.project_title}</a></h4>
                       <p>${pre.project_summary}</p>
                
                   </div>
                   
                   <div class="card-footer">  
                      <ul class="list-inline">
                            <c:choose>
                            <c:when test="${empty alarmCntMap[pre.project_id]}">
                            <li class="margin-t-10">0 명 알람 신청중</li>
                            </c:when>
                            <c:otherwise>
                            <li class="margin-t-10">${alarmCntMap[pre.project_id]} 명 알람 신청중</li>
                     </c:otherwise>
                     </c:choose>   
                  </ul>
            
                </div>
                   
                   
            </div>
         </div>
      </div>
   
</c:if>   

</c:forEach>

</div>   

<div style="width:100%;margin:1em;"></div>

 <%-------------공개예정 끝-------- --%> 


<div style="width:100%;margin:3em;"></div>




<h3><a href="/fund/discover?sort=publishedAt">최신 프로젝트</a></h3>

<div class="row text-center">


<c:forEach var="pub" items="${publishedAtList}" varStatus="var">

   
       <div class="col-md-3">
           <div class="card">
               <div class="card-img">
                   <img class="card-img-top" src="${path}/project/title/${pub.member_email}/${pub.project_id}/${pub.project_main_image}" onclick="goProject('${pub.project_id}')" style="height: 150px;">
               </div>
               
               
                    <%--좋아요  --%>
                  <c:set var="flag2" value="false" />
                   <c:forEach var="likeId" items="${likeList}">
                  <c:if test="${likeId eq pub.project_id}">
                     <c:set var="flag2" value="true" />
                  </c:if>      
               </c:forEach>
               
               
      <c:if test="${flag2}">
         <button id="likeBtn${pub.project_id}" class="likeBtn" onClick="MyFavoritProject('${pub.project_id}','${userId}')">
            <img class="likeImg" src="resources/img/fullHeart.png" >
         </button>
            
      </c:if>
      <c:if test="${not flag2}">
         <button id="likeBtn${pub.project_id}" class="likeBtn" onClick="MyFavoritProject('${pub.project_id}','${userId}')">
            <img class="likeImg" src="resources/img/blankHeart.png" >
         </button>      
      </c:if>
      
      
      
               <div class="card-block">
                  <div class="card-title">
                       <small><a href="/fund/discover?category=${pub.project_sub_category}">${pub.category_trans}</a> | <a href="/fund/search?member_email=${pub.member_email}">${pub.member_name}</a></small>
                       <h4><a href="/fund/discover/${pub.project_id}">${pub.project_title}</a></h4>
                       <p>${pub.project_summary}<br>
                       ${pub.project_current_percent}% 달성</p>
                   </div>
            
            
            </div>
            
            
         </div>
      </div>

   
   

</c:forEach>
</div>







                  
<div style="width:100%;margin:3em;"></div>






<h3><a href="/fund/discover?minAchieveRate=80&maxAchieveRate=99&sort=endedAt&ongoing=ongoing">성공임박 프로젝트</a></h3>

<div class="row text-center">

<c:forEach var="end" items="${endedAtList}" varStatus="var">

       <div class="col-md-3">
           <div class="card">
               <div class="card-img">
                   <img class="card-img-top" src="${path}/project/title/${end.member_email}/${end.project_id}/${end.project_main_image}" onclick="goProject('${end.project_id}')" style="height: 150px;">
               </div>
               
               
               <%--좋아요  --%>
                  <c:set var="flag3" value="false" />
                   <c:forEach var="likeId" items="${likeList}">
                  <c:if test="${likeId eq end.project_id}">
                     <c:set var="flag3" value="true" />
                  </c:if>      
               </c:forEach>
               
               
      <c:if test="${flag3}">
         <button id="likeBtn${end.project_id}" class="likeBtn" onClick="MyFavoritProject('${end.project_id}','${userId}')">
            <img class="likeImg" src="resources/img/fullHeart.png">
         </button>
            
      </c:if>
      <c:if test="${not flag3}">
         <button id="likeBtn${end.project_id}" class="likeBtn" onClick="MyFavoritProject('${end.project_id}','${userId}')">
            <img class="likeImg" src="resources/img/blankHeart.png">
         </button>      
      </c:if>
      
      
      
               <div class="card-block">
                  <div class="card-title">
                       <small><a href="/fund/discover?category=${end.project_sub_category}">${end.category_trans}</a> | <a href="search?member_email=${end.member_email}">${end.member_name}</a></small>
                       <h4><a href="/fund/discover/${end.project_id}">${end.project_title}</a></h4>
                       <p>${end.project_summary}<br>
                       ${end.project_current_percent}% 달성</p>
                   </div>
            
            
            </div>
            
            
         </div>
      </div>

   

</c:forEach>
</div>   <%--성공임박 --%>




<div style="width:100%;margin:1em;"></div>


      
<div style="width:100%;margin:3em;"></div>
<div style="width:100%;margin:3em;"></div>
<div style="width:100%;margin:3em;"></div>       
       
</div>       
       
       

  
  
  
  


<%@include file="/WEB-INF/views/member/default/main_footer.jsp" %>

  
    <!-- Bootstrap core JavaScript -->
  <script src="/fund/resources/myjsFunction/projectFunction.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script type="text/javascript">
  function goProject(id){
     location.href='/fund/discover/'+id;
      
  }


      
      


  function setTag(e,sub){
     
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
           if(value==sub){
              console.log($(".subCategory"+id).text());
              $(this).html(key);
           }
           
        })
     })

     
     
  };






</script>

</body>

</html>
