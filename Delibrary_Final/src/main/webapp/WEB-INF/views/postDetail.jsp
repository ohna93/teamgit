<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
  <title>커뮤니티 - 딜리브러리</title>
</head>

<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="#"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="#"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="#"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#">도서검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?group=20" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="lentBooks.html">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="MyPage_Folder.do">내서재</a></li>
								<li><a class="dropdown-item" href="#">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
					<li class="nav-item" v-bind:title="login">
						<a href="LoginPage.do" class="nav-link"><i class="fas fa-sign-in-alt"></i></a><p class="sr-only">로그인</p>
					</li>
					<li class="nav-item" v-bind:title="signup">
						<a href="insertCustomer.do" class="nav-link"><i class="fas fa-user-plus"></i></a><p class="sr-only">회원가입</p>
					</li>
					<li class="nav-item" v-bind:title="bookcart">
						<a href="#" class="nav-link"><i class="fas fa-book"></i></a><p class="sr-only">북카트</p>
					</li>
					<li class="nav-item" v-bind:title="sitemap">
						<a href="siteMap.do" class="nav-link"><i class="far fa-map"></i></a><p class="sr-only">사이트맵</p>
					</li>
					<script>
						var app = new Vue({
							el: '#app',	
							data: {
								login: '로그인',
								signup: '회원가입',
								bookcart: '북카트',
								sitemap: '사이트맵',
							}});
					</script>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 메인나브 -->
  
	<!-- 커뮤니티 헤더 -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <c:if test="${group eq 20}">
					<h3>창작물 게시판<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 30}">
					<h3>중고장터<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 60}">
					<h3>자유게시판<br>&nbsp;</h3>
				</c:if>
			</div>
		  </div>
		</div>
	</header>
	<!-- 커뮤니티 헤더 -->
	
	<!-- MAIN SECTION -->
	<section id="contact" class="py-3">
		<!-- 사이드바 -->
		<div class="container">
		  <div class="row">
			<div class="col-md-3">
			  <div class="sidebar">
					<div class="side-head">
						<h4 class="text-light">커뮤니티</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<li class="list-group-item active text-dark"><a href="postList.do?group=20">창작물게시판</a></li>
						<li class="list-group-item"><a href="postList.do?group=30">중고장터</a></li>
						<li class="list-group-item"><a href="#">자유게시판</a></li>
					</ul>
			  </div>
			</div>

			<!-- 메인내용 -->
			<div class="col-md-9 pb-4">
        <!-- ACTIONS -->
        <section id="actions" class="py-4">
          <div class="container">
            <div class="row">
              <div class="col-md-2">
                <a href="postList.do?group=${group}" class="btn btn-light btn-block">
                  <i class="fas fa-arrow-left"></i> 목록
                </a>
							</div>
							<div class="col-md-6">
								<span>&nbsp;</span>
							</div>
              <div class="col-md-2">
                <a href="postUpdate.do?p_id=${post.p_id}&&cust_no=${post.cust_no}&&group=${group}" class="btn btn-success btn-block">
                  <i class="fas fa-edit"></i> 수정
                </a>
              </div>
              <div class="col-md-2">
                <button id="btnDel" class="btn btn-outline-danger btn-block">
                  <i class="far fa-trash-alt"></i> 삭제
                </button>
              </div>
            </div>
          </div>
        </section>

				<!-- 글상세 -->
				<section id="details" class="pt-4">
			    <div class="container">
			      <div class="row">
			        <div class="col">
			          <div class="card">
			            <div class="card-header">
			              <h4 >[말머리]${post.p_title}</h4>
										<p class="text-muted text-small pt-2 m-0">
											게시일 <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${post.p_regdate }" /> | 작성자 ${post.p_writer} | 조회 ${post.p_hit }
										</p>
			            </div>
			            <div class="card-body">
										<p class="card-text">${post.p_content}</p>
										<a href="/img/${post.fname }"><img src="/img/${post.fname }" alt="${post.fname }" height="200"></a>
									</div>
									<input type="hidden" name="p_id" value="${post.p_id}">
									<input type="hidden" name="p_no" value="${post.p_no}">
									<input type="hidden" name="fname" value="${post.fname}">
									<input type="hidden" name="cust_no" value="${post.cust_no}">
			
									<!-- 댓글창 -->
									<div class="card-body">
										<form>
											<div class="container">
												<div class="row card-header py-2">
													<div class="p-0">
														<h5 class="m-0">댓글 <button id="btnInsertReply" class="btn btn-secondary btn-sm text-small">등록</button></h5>
													</div>
												</div>  
											</div>
			                <div class="form-group">
												<textarea name="re_content" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
												
			                </div>
										</form>
										
										<c:forEach var="r" items="${listReply }">
			              <div>
											<button id="btnDeleteReply" style="float:left" p_id="${post.p_id}" cust_no="${post.cust_no }" group="${group}">삭제</button>
											<button id="btnUpdateReply" style="float:left" p_id="${post.p_id}" cust_no="${post.cust_no }" group="${group}">수정</button>
											<p style="font-weight: bold; background-color: #eff3f8; padding: 5px;">${r.re_writer}</p>
											<p style="font-size: 13px; color: #aaa;"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${r.re_regdate }" /></p>
											<p>${r.re_content }</p>
			              </div>
										
										<!-- 
										<table class="table table-hover table-sm">
											<tbody>
												<tr>
													<td>작성자사진?</td>
													<td>${re.re_content}</td>
												</tr>
											</tbody>
										</table>
										 -->
			
			             </c:forEach>
										
									
			
			
									</div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </section>
			  </div>
			  </div>
			  </div>
			  </section>

				<!-- FOOTER -->
				<footer id="main-footer" class="text-white mt-5 p-4">
					<div class="container">
						<div class="row">
							<div class="col">
								<p class="text-center">
									Copyright &copy;
									<span id="year"></span>
									Delibrary
								</p>
							</div>
						</div>
					</div>
				</footer>



  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    // Configure Slider
    $('.carousel').carousel({
      interval: 6000,
      pause: 'hover'
    });

    // Lightbox Init
    $(document).on('click', '[data-toggle="lightbox"]', function (event) {
      event.preventDefault();
      $(this).ekkoLightbox();
    });

    // Video Play
    $(function () {
      // Auto play modal video
      $(".video").click(function () {
        var theModal = $(this).data("target"),
          videoSRC = $(this).attr("data-video"),
          videoSRCauto = videoSRC + "?modestbranding=1&rel=0&controls=0&showinfo=0&html5=1&autoplay=1";
        $(theModal + ' iframe').attr('src', videoSRCauto);
        $(theModal + ' button.close').click(function () {
          $(theModal + ' iframe').attr('src', videoSRC);
        });
      });
    });

  </script>
</body>

</html>