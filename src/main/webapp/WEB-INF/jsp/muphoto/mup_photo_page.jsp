<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>


<head>
    <title>mup_photo_page</title>

     <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/mupstar_board.css">
    <link rel="stylesheet" href="/static/css/mupick_board.css">
    <link rel="stylesheet" href="/static/css/mupstar_board_detail.css">
    <link rel="stylesheet" href="/static/css/mup_photo_page.css">

</head>

    
    <div class="container">
        <header>
             <jsp:include page="../include/header.jsp" />
        </header>

        <div class="main-wrap">
            <div class="nav">
                <div id="nav-1" class="nav-wrap"><a href="/post/mupick_list_view">Mupick!</a></div>
                <div id="nav-2" class="nav-wrap"><a href="/star/movie_list_view">MupStar</a></div>
                <div id="nav-3" class="nav-wrap"><a href="/timeline/mup_photo_list_view">MupPhoto</a></div>
            </div>

            <div class="muphoto-text">
                <span>MupPhoto</span>
            </div>
            <div class="muphoto-text-detail">
                <span>MupPhoto란?<br>
                - MupE 회원들이 본 영화들을 자유롭게 인증하는 sns 개념<br>
                 의 게시판이에요. 영화표를 올려도 좋고, 영화 포스터를 올려도 좋아요!<br>
                올리면서 20자 내외의 짧은 한줄 소감도 올릴 수 있고요<br>
                다른 회원들이 올린 게시글에 추천도 누르고 댓글도 작성 할 수있답니다!</span>
            </div>

            <div class="input-text-wrap">
                <textarea id="writeTextArea" placeholder="내용을 입력해주세요"></textarea>
 
            </div>
            <div class="file-upload">
            	<div class="upload-wrap">
	                <input type="file" id="file" accept=".jpg, .jpeg, .png, .gif" class="input-box">
	
	                <img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png" id="fileUploadPhoto">
	
	                <div id="fileName"></div>
	
	                <button id="writeBtn" class="btn btn-info">업로드</button>
	            </div>
            </div>

            <div class="mup-photo-container">
            	<c:forEach items="${cardList}" var="card">
                <div class="mup-photo-wrap">
                    <div class="mup-photo-nav">
                        <p>${card.user.loginId}</p>
                        <a><img alt="" src="/static/images/cancel.png" class="cancelBtn" data-post-id="${card.post.id}"></a>
                    </div>

                    <div class="mup-photo-input">
                        <img src="${card.post.imagePath}" id="photo" alt="" width="488px" height="500px">
                    </div>

					<!-- 좋아요 -->
                    <div class="like-box">
                        <div class="like-img-box">
                        	<c:if test="${card.filledLike eq false}">
	                            <a href="#" class="like-btn" data-post-id="${card.post.id}">
	                                <img src="/static/images/icons8_tum_.png" id="like-tum" width="30px" height="30px">
	                            </a>
                            </c:if>
                            
                            <c:if test="${card.filledLike}">
								<a href="#" class="like-btn" data-post-id="${card.post.id}">
									<img src="/static/images/icons8_tum_fill.png" width="30" height="30" alt="filled tum">
								</a>
							</c:if>
                            
                        </div>
                        <p class="like-text">추천해요 ${card.likeCount}개</p>
                    </div>

                    <div class="impression-box">
                        <b>${card.user.loginId}의 한줄소감</b>
                        <b>-${card.post.content}</b>
                    </div>

                    <!-- 댓글 -->
                    <div class="comment-wrap">
                    <c:forEach items="${card.commentList}" var="commentView">
                        <div class="comment-nav">
                            <p>${commentView.comment.content}</p>
                        </div>
                        <div class="comment-box">
                            <p><b>${commentView.user.loginId}</b> - ${commentView.comment.content}</p>
                        </div>
                    </c:forEach>

                        <div class="comment-input">
                            <input type="text">
                            <button type="button" class="comment-btn" data-post-id="${card.post.id}">게시</button>
                        </div>
                        
                        <%-- 댓글 삭제 버튼-로그인 된 사람의 댓글일 때 삭제 버튼 노출 --%>
						<c:if test="${userId == commentView.comment.userId}">
						<a href="#" class="comment-del-btn" data-comment-id="${commentView.comment.id}">
							<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
						</a>
						</c:if>
                        
                    </div>
                </div>
                </c:forEach>

            </div>
        </div>
    </div>
    
<script>
$(document).ready(function() {
	// 파일이미지 클릭 -> 숨겨져있는 type="file"을 동작
	$('#fileUploadPhoto').on('click', function(e) {
		e.preventDefault();
		$('#file').click();
	});
	
	let file = null;
	let extt = null;
	// 사용자가 이미지를 선택하는 순간 유효성 확인 및 업로드 된 파일명 노출
	$('#file').on('change', function(e) {
		let fileName = e.target.files[0].name;
		file = fileName;
		console.log(fileName);
		
		let ext = fileName.split(".").pop().toLowerCase();
		extt = ext;
		if (ext != "jpg" && ext != "png" && ext != "gif" && ext != "jpeg") {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#file').val("");
			$('#fileName').text('');
			return;
		}
	
		$('#fileName').text(fileName);
	});
	
	// 글쓰기
	$('#writeBtn').on('click', function(e) {
		let content = $('#writeTextArea').val();
		console.log(content);
		if (content.length < 1) {
			alert("글 내용을 입력해주세요");
			return;
		}
		
		// 파일 확장자 체크
		/* console.log(e.target);
		let fileName = e.target.files[0].name;*/
		//let ext = fileName.split(".").pop().toLowerCase();
		if (extt != "jpg" && extt != "png" && extt != "gif" && extt != "jpeg") {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#file').val("");  // 파일 태그에 파일 제거(보이지 않지만 업로드 될 수 있으므로 주의)
			$('#fileName').text(''); // 파일 이름 비우기
			return;
		}
		
		// 폼데이터 만들기
		let formData = new FormData();
		formData.append("content", content);
		formData.append("file", $('#file')[0].files[0]);
		
		$.ajax({
			type: "post"
			, url: "/muphoto_post/create"
			, data: formData
			,enctype: "mulitpart/form-data"
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.code == 1) {
					location.reload();
				} else if (data.code == 500) {
					location.href = "/user/sign_in_view";
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("글 저장에 실패했습니다.");
			}
		});
	});
	
	// 댓글 작성
	$('.comment-btn').on('click', function() {
		let postId = $(this).data('post-id');
		console.log(postId);
		
		let comment = $(this).prev().val().trim();
		console.log(comment);
		
		$.ajax({
			type:"post"
			, url: "/comment/create"
			, data:{"postId" : postId, "content": comment}
		
			, success:function(data) {
				if (data.code == 1) {
					location.reload(true);
				}
			}
			,error: function(requset, status, error) {
				alert("댓글 쓰기 실패했습니다.");
			}
		});
	});
	
	// 좋아요/해제
	$('.like-btn').on('click', function(e) {
		e.preventDefault();
		//alert("aa");
		
		let postId = $(this).data('post-id');
		//alert(postId);
		
		$.ajax({
			url:"/like/" + postId       //     /like/3
			, success:function(data) {
				if (data.code == 1) {
					location.reload();
				} else if (data.code == 300) {
					// 비로그인 시 로그인 페이지로 이동
					alert(data.errorMessage);	
					location.href = "/user/sign_in_view";
				}
			}
			, error:function(request, status, error) {
				alert("좋아요를 하는데 실패했습니다.");
			}
		});
	});
	
	// 글 삭제
	$('.cancelBtn').on('click', function(e) {
		e.preventDefault(); // a 태그 위로 올라감 방지
		
		let postId = $(this).data('post-id');   // getting
		//alert(postId);
		
		// ajax 글 삭제
		$.ajax({
			type:"delete"
			, url:"/muphoto_post/delete"
			, data: {"postId":postId}
			, success: function(data) {
				if (data.code == 1) {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
});
</script>