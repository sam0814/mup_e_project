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
						<input type="text" class="input-star" placeholder="별점 개수를 입력해주세요 예) 5">
				</div>


				<div class="mupstar_btn_wrap">
					<div class="mupstar_btn">
						<button type="button" class="list-btn">목록</button>
						<button type="button" class="upload-btn" data-movie-id="${movie.id}">업로드</button>
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
			
			// 별 업로드
			$('.upload-btn').on('click', function() {
				let star = $('.input-star').val().trim();
				let movieId = $(this).data('movieId');
				//let starCount = $('startCount');
				
				//validation check
				if (!star) {
					alert("별점을 매겨주세요.");
					return;
				}
				
				if (star < 1) {
					alert("별점은 최소 1점부터 매길 수 있습니다.");
					return;
				}
				
				if (star > 5) {
					alert("별점은 최대 5점까지 매길 수 있습니다.");
					return;
				}
				//alert(movieId);
				//alert(star);
				
				$.ajax({
					//request
					type:"post"
					, url: "/star/create"
					, data: {"movieId": movieId, "startCount": star}
				
					// reponse
					, success:function(data) {
						if (data.code == 1) {
							alert("별점 평가 완료!");
							location.href = "/star/movie_star_result_view?movieId=" + movieId;
						} else {
							alert(data.errorMessage);
						}
					}
					,error:function(request, status, error) {
						alert("별점 평가 실패");
					}
					
				});
			});

		});
	</script>