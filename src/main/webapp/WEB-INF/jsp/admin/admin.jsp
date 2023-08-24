<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
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
					<a href="#">Mupick!</a>
				</div>
				<div id="nav-2" class="nav-wrap">MupStar</div>
				<div id="nav-3" class="nav-wrap">MupPhoto</div>
			</div>

			<div class="admin-content-wrap">
				<div class="delete-wrap">
					<div class="mg-box"></div>

					<div class="delete-main-wrap">
						<h2>관리자(영화삭제)</h2>
						<h3>현재 업로드 영화</h3>

						<div class="movie-list-wrap">
							<div class="movie-wrap">
								<span>더 문_2023</span>
								<button type="button" id="deleteBtn">삭제</button>
							</div>

							<div class="movie-wrap">
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
							</div>
						</div>

					</div>

					<div class="mg-box"></div>
				</div>
				<div class="upload-wrap">
					<div class="upload-mg-box"></div>

					<div class="admin-movie-upload">
						<h2>관리자 (영화업로드)</h2>

						<input type="text" class="input-title"
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
			$('#file').on('change', function(e) {
				let fileName = e.target.files[0].name;
				file = fileName;
				console.log(fileName);
				
				let ext = fileName.split(".").pop().toLowerCase();
				//extt = ext;
				if (ext != "jpg" && ext != "png" && ext != "gif" && ext != "jpeg") {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val("");
					$('#fileName').text('');
					return;
				}
			
				$('#fileName').text(fileName);
			});
		});
	</script>