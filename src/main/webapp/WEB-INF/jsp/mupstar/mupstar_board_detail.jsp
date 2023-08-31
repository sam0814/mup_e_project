<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- <script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script> -->
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


<head>
<title>mupstar_board_detail</title>

<link rel="stylesheet" href="/static/css/header.css">
<link rel="stylesheet" href="/static/css/mupstar_board.css">
<link rel="stylesheet" href="/static/css/mupick_board.css">
<link rel="stylesheet" href="/static/css/mupstar_board_detail.css">

</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="../include/header.jsp" />
		</header>


		<div class="main-wrap">
			<div class="nav">
				<div id="nav-1" class="nav-wrap">
					<a href="/post/mupick_list_view">Mupick!</a>
				</div>
				<div id="nav-2" class="nav-wrap">
					<a href="/star/movie_list_view">MupStar</a>
				</div>
				<div id="nav-3" class="nav-wrap">
					<a href="/timeline/mup_photo_list_view">MupPhoto</a>
				</div>
			</div>

					<div class="poster-wrap">
						<img src="${movie.imagePath}" alt="" width="300px" height="475px">
					</div>


					<div class="movie_title-wrap">
						<div class="movie-title">
							<span>${movie.subject}</span>
						</div>
					</div>

				<div class="movie_star-wrap">
						<div class="movie-star">
								<c:if test="${star.filledStar eq false}">
								<a href="#" class="like-btn" data-post-id="${star.post.id}">
									<img src="/static/images/icons8-star.png" id="like-star">
								</a>
								</c:if>
								
								<c:if test="${star.filledStar}">
								<a href="#" class="like-btn d-none" data-post-id="${star.post.id}">
									<img src="/static/images/icons8_star_full.png" id="like-star"
									alt="filled tum">
								</a>
								</c:if>
						</div>

						<div class="movie-star">
								<a href="#" class="like-btn" data-post-id="${star.post.id}">
									<img src="/static/images/icons8-star.png" id="like-star">
								</a>
								<a href="#" class="like-btn d-none" data-post-id="${star.post.id}">
									<img src="/static/images/icons8_star_full.png" id="like-star"
									alt="filled tum">
								</a>
						</div>


						<div class="movie-star">
								<a href="#" class="like-btn" data-post-id="${star.post.id}">
									<img src="/static/images/icons8-star.png" id="like-star">
								</a>
								<a href="#" class="like-btn d-none" data-post-id="${star.post.id}">
									<img src="/static/images/icons8_star_full.png" id="like-star"
									alt="filled tum">
								</a>
						</div>

						<div class="movie-star">
								<a href="#" class="like-btn" data-post-id="${star.post.id}">
									<img src="/static/images/icons8-star.png" id="like-star">
								</a>
								<a href="#" class="like-btn d-none" data-post-id="${star.post.id}">
									<img src="/static/images/icons8_star_full.png" id="like-star"
									alt="filled tum">
								</a>
						</div>

						<div class="movie-star">
								<a href="#" class="like-btn" data-post-id="${star.post.id}">
									<img src="/static/images/icons8-star.png" id="like-star">
								</a>
								<a href="#" class="like-btn d-none" data-post-id="${star.post.id}">
									<img src="/static/images/icons8_star_full.png" id="like-star"
									alt="filled tum">
								</a>
						</div>
				</div>


				<div class="mupstar_btn_wrap">
					<div class="mupstar_btn">
						<button type="button" class="list-btn">목록</button>
						<button type="button" class="upload-btn">업로드</button>
					</div>
				</div>

			</div>

		</div>
	</div>

	<script>
		$(document).ready(function() {

			// 목록 버튼 클릭 => mupstar_board 페이지로 이동
			$('.list-btn').on('click', function() {
				//alert("목록");
				location.href = "/star/movie_list_view";
			});

			// 별/해제
			$('.like-btn').on('click', function(e) {
				e.preventDefault();
				//alert("aa");

				let postId = $(this).data('post-id');
				//alert(postId);

				$.ajax({
					url : "/star/" + postId //     /like/3
					,
					success : function(data) {
						if (data.code == 1) {
							location.reload();
						} else if (data.code == 300) {
							// 비로그인 시 로그인 페이지로 이동
							alert(data.errorMessage);
							location.href = "/user/sign_in_view";
						}
					},
					error : function(request, status, error) {
						alert("좋아요를 하는데 실패했습니다.");
					}
				});
			});

		});
	</script>