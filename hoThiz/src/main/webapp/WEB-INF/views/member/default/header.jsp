<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
/*********드롭다운***********/

.dropdown-submenu {
    position: relative;
}

.dropdown-submenu>.dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -6px;
    margin-left: -1px;
    -webkit-border-radius: 0 6px 6px 6px;
    -moz-border-radius: 0 6px 6px;
    border-radius: 0 6px 6px 6px;
    
    position:absolute;
}

.dropdown-submenu:hover>.dropdown-menu {
    display: block;
    position:absolute;
}

.dropdown-submenu>a:after {
    display: block;
    content: " ";
    float: right;
    width: 0;
    height: 0;
    border-color: transparent;
    border-style: solid;
    border-width: 5px 0 5px 5px;
    border-left-color: #ccc;
    margin-top: 5px;
    margin-right: -10px;

}

.dropdown-submenu:hover>a:after {
    border-left-color: #fff;
}

.dropdown-submenu.pull-left {
    float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
    left: -100%;
    margin-left: 10px;
    -webkit-border-radius: 6px 0 6px 6px;
    -moz-border-radius: 6px 0 6px 6px;
    border-radius: 6px 0 6px 6px;
}


.show-on-hover:hover > ul.dropdown-menu {
    display: block;    
}


.conForm > input[type=text] {
width: 30%; 

}
.dropdown-item{
 list-style:none;

}
@media (min-width: 768px) {

   #banner{
      display:flex;
      
   }
   
   .bannerTitle{
   width:40%;
   background-color: pink;
   height:auto;
   position: relative;
   
}
.img-fluid {
  max-width: 60%;
  height: auto;
  object-fit: fill;
  cursor:pointer;
}
.jumbotron {
  width : 100%;
  padding: 0 0 0 0;
  background-color: white;
  border-radius: 0.3rem;
  margin:0 0 0 0;
}

}


</style>
<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/login/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/fund/">hoThiz</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <c:choose>
             <c:when test="${empty sessionScope.userId && sessionScope.userId == null}"><a class="nav-link" href="/fund/login">로그인</a></c:when>
             <c:otherwise><a class="nav-link" href="/fund/logout">로그아웃</a></c:otherwise>
             </c:choose>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="/fund/agreements">프로젝트 올리기
          <span class="sr-only">(current)</span>
        </a>
      </li>
      
      
    <c:choose>
             <c:when test="${empty sessionScope.userId && sessionScope.userId == null}">                  
          </c:when>
             <c:otherwise>   
   <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
        프로젝트 둘러보기</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="/fund/discover">모든 프로젝트</a>
          <a class="dropdown-item" href="/fund/discover?sort=popular">인기 프로젝트</a>
          <a class="dropdown-item" href="/fund/discover?ongoing=ongoing&maxAchieveRate=99&minAchieveRate=80">성공 임박 프로젝트</a>
          <a class="dropdown-item" href="/fund/discover?sort=publishedAt&ongoing=ongoing">신규 추천 프로젝트</a>
          <a class="dropdown-item" href="/fund/discover?ongoing=prelaunching">공개예정 프로젝트</a>
          
          
          <div class="dropdown-divider"></div>

     <ul class="dropdown-item" role="menu"> 
       <li class="dropdown-submenu"> 
         <a class="dropdown-item">게임</a>
         
          <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=game">모든 게임</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=mobile-game">모바일 게임</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=video-game">비디오 게임</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=board-game">보드 게임</a></li>
          </ul>       
       
       
       </li>
   
    </ul>
      
          
      <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">공연</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=show">모든 공연</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=dance">무용</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=musical">뮤지컬</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=theater">공연</a></li>
          </ul>   
      </li>
      </ul>

          
             
               
      <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">디자인</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=design">모든 디자인</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=architecture">건축, 공간</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=graphic-design">그래픽 디자인</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=product-design">제품 디자인</a></li>
          </ul>   
      </li>
      </ul>
  

          <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">만화</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=comics">모든 만화</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=web-comics">웹툰</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=comic-books">만화책</a></li>
                
          </ul>   
        </li>
      </ul>
          
          
          <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">예술</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=art">모든 예술</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=exhibitions">전시</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=sculpture-and-action-figures">조소&피규어</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=illustration">일러스트레이션</a></li>
          </ul>   
        </li>
      </ul>
          
          
          
          
          
              <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">공예</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=crafts">모든 공예</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=ecandles-and-diffusers-and-soaps">캔들&조향&비누</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=leather-and-metal-and-woodworking">가죽&금속&목 공예</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=pottery">도예</a></li>
          </ul>   
        </li>
      </ul>
          
          
              <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">사진</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=photography">모든 사진</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=people-photography">인물</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=space-and-urban-photography">배경</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=animals-photography">동물</a></li>
          </ul>   
        </li>
      </ul>
      
      
         <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">영상</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=video">모든 영상</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=film">영화</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=documentary">다큐멘터리</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=animation">애니메이션</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=music-videos">뮤직비디오</a></li>
          </ul>   
        </li>
      </ul>
      
      
         <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">음식</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=food">모든 음식</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=appetizer">에피타이저</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=main-dish">메인디쉬</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=dessert">디저트</a></li>
          </ul>   
        </li>
      </ul>
      
      
             <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">음악</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=music">모든 음악</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=classical-music">클래식</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=popular-music">대중음악</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=independent-music">인디음악</a></li>
          </ul>   
        </li>
      </ul>
          
 
             <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">출판</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=publication">모든 출판</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=zines">잡지</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=literature-and-essay">문학&에세이</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=picture-books">그림책</a></li>
          </ul>   
        </li>
      </ul>
 
 
 
       <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">테크</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=technology">모든 테크</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=software">소프트웨어</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=hardware">하드웨어</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=apps">앱</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=web">웹</a></li>
          </ul>   
        </li>
      </ul>
 
 
        <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">패션</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=fashion">모든 테크</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=apparels">소프트웨어</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=accessories">하드웨어</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=beauty">앱</a></li>

          </ul>   
        </li>
      </ul>
      
      
      
              <ul class="dropdown-item" role="menu">
        <li class="dropdown-submenu">
         <a class="dropdown-item">저널</a>
         
         <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/fund/discover?category=journalism">모든 테크</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=audio-journals">오디오 저널</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=video-journals">비디오 저널</a></li>
                <li><a class="dropdown-item" href="/fund/discover?category=web-journals">웹 저널</a></li>

          </ul>   
        </li>
      </ul>
        </div>
        </c:otherwise>
             </c:choose>  
          
		          
            <c:choose>
             <c:when test="${empty sessionScope.userId && sessionScope.userId == null}">                  
          </c:when>
             <c:otherwise><li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
        계정</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="/fund/my_message">메시지</a>
          <a class="dropdown-item" href="/fund/my_donate">후원현황</a>
          <a class="dropdown-item" href="/fund/my_likeproject">좋아요한 프로젝트</a>
          <a class="dropdown-item" href="/fund/my_project">내 프로젝트</a>
          <a class="dropdown-item" href="/fund/setting">설정</a>
          </div>
          </li></c:otherwise>
             </c:choose>
          
         
        </ul>
        <form class="form-inline my-2 my-lg-0" action="/fund/discover" >
      <input class="form-control mr-sm-2" type="text" placeholder="Search" name="query">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
      </div>
      
    </div>
    
  </nav>
</body>
</html>