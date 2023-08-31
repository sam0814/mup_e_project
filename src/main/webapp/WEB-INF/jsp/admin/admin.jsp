<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- <script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script> -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>


<title>admin</title>

<link rel="stylesheet" href="/static/css/mupstar_board.css">
<link rel="stylesheet" href="/static/css/header.css">
<link rel="stylesheet" href="/static/css/mupick_board.css">
<link rel="stylesheet" href="/static/css/admin.css">

</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="../include/header_3.jsp" />
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

			<div class="admin-content-wrap">
				<div class="delete-wrap">
					<div class="mg-box"></div>

					<div class="delete-main-wrap">
						<h2>관리자(영화삭제)</h2>
						<h3>현재 업로드 영화</h3>

						<div class="movie-list-wrap">
							<c:forEach items="${movieList}" var="movie">
								<div class="movie-wrap">
									<span>${movie.subject}</span>
									<button type="button" id="deleteBtn"
										data-id-movie="${movie.id}">숨기기</button>
								</div>
							</c:forEach>


							<!-- <div class="movie-wrap">
								<span>비공식 작전_2023</span>
								<button type="button" id="deleteBtn">삭제</button>
							</div>

							<div class="movie-wrap">
								<span>엘리멘탈_2023</span>
								<button type="button" id="deleteBtn">삭제</button>
							</div>

							<div class="movie-wrap">
								<span>밀수_2023</span>
								<button type="button" id="deleteBtn">삭제</button>
							</div> -->
						</div>
					</div>

					<div class="mg-box"></div>
				</div>
				<div class="upload-wrap">
					<div class="upload-mg-box"></div>

					<div class="admin-movie-upload">
						<h2>관리자 (영화업로드)</h2>

						<input type="text" class="input-title" id="subject"
							placeholder="영화 제목을 입력해주세요."> <br>
						<textarea name="input-text" id="input-text" cols="40" rows="20"></textarea>
						<br>
						<div class="file-btn-wrap">
							<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif"
								class="file-btn">
							<div id="fileName" class="ml-4"></div>
							<button type="button" id="fileUploadBtn">file</button>
						</div>

						<div class="otherBtn">
							<button type="button" id="uploadBtn">업로드</button>
							<button type="button" id="cancelBtn">취소</button>
						</div>
					</div>

					<div class="upload-mg-box"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {

			// 취소 버튼 클릭 => mupick_board 페이지로 이동
			$('#cancelBtn').on('click', function() {
				//alert("목록");
				location.href = "/star/movie_list_view";
			});

			$('#fileUploadBtn').on('click', function(e) {
				e.preventDefault();
				$('#file').click();
			});

			// 사용자가 이미지를 선택하는 순간 유효성 확인 및 업로드 된 파일명 노출
			$('#file').on('change',function(e) {
				let fileName = e.target.files[0].name;
				file = fileName;
				console.log(fileName);

				let ext = fileName.split(".").pop().toLowerCase();
				//extt = ext;
				if (ext != "jpg" && ext != "png"&& ext != "gif" && ext != "jpeg") {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val("");
					$('#fileName').text('');
					return;
				}

				$('#fileName').text(fileName);
			});

					// 글 저장 
					$('#uploadBtn').on('click',function() {
						let subject = $('#subject').val()/* .trim() */;
						let file = $('#file').val();

					// validation check
						if (!subject) {
							alert("제목을 입력해주세요");
							return;
						}

						if (!file) {alert("파일을 넣어주셔야합니다!");
							return;
						}

						// 파일이 업로드 된 경우에만 확장자 체크
							if (file != "") {
							// 확장자만 뽑은 후 소문자로 변경
							let ext = file.split(".").pop().toLowerCase();
							//alert(ext);

							if ($.inArray(ext, [ 'jpg','jpeg', 'png','gif' ]) == -1) {
								alert("이미지 파일만 업로드 할 수 있습니다.");
								$('#file').val(''); // 파일을 비운다.
									return;
							}
						}

						// AJAX 통신
						// 이미지를 업로드 할 때는 반드시 form 태그가 있어야함
							let formData = new FormData();
								formData.append("subject",subject);
								formData.append("file",
								$('#file')[0].files[0]);

						$.ajax({
								// request
								type : "post"
								,url : "/admin/create"
								,data : formData
								,enctype : "multipart/form-data" //파일 업로드를 위한 필수 설정
								,processData : false //파일 업로드를 위한 필수 설정
								,contentType : false //파일 업로드를 위한 필수 설정

								// response
								,success : function(data) {
									if (data.code == 1) {
										// 성공
										alert("글이 저장되었습니다.");
										location.href = "/star/movie_list_view"
									} else {
											alert(data.errorMessage);
									}
								}
									,error : function(request,stataus,error) {
										alert("글을 저장하는데 실패했습니다.");
									}
								});
							});
							
							// 글 수정
							$('#deleteBtn').on('click',function() {
								alert("숨기기");
							
							});
		});
							
	</script>