<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

    <!-- bootstrap CDN link -->
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> -->

  <link rel="stylesheet" href="/static/css/header.css">
  <link rel="stylesheet" href="/static/css/mupick_board_writing.css">
  <link rel="stylesheet" href="/static/css/mupick_board_detail.css">

    <div class="container">
        <header>
            <jsp:include page="../include/header.jsp" />
        </header>

        <div class="main-wrap">
            <div class="mupick-text">
                <span>Mupick!</span>
            </div>
            <div class="mupick-text-detail">
                <span>Mupick!이란?<br>
                      -Mup 회원들이 추천하는 영화를 자유롭게 볼 수 있는 공간입니다.<br>
                    보는것 뿐만 아니라 직접 영화를 추천 할 수도 있어요!</span>
            </div>

            <div class="title-text">
                <span>제목</span>
            </div>
            <input type="text" id="subject" name="subject" placeholder="제목을 입력하세요" value="${mupick.subject}">

            <div class="insert-text">
                <span>내용</span>
            </div>
            <div class="insert-box">
                <div class="left-box">
                    <%-- 이미지가 있을 때만 이미지 영역 추가 --%>
				<c:if test="${not empty mupick.imagePath}">
					<div class="my-3">
						<img src="${mupick.imagePath}" alt="업로드 된 이미지" width="250" height="319">
					</div>
				</c:if>
			</div>
                <div class="right-box">
                    <textarea name="input-text" id="content" cols="45" rows="22">${mupick.content}</textarea>
                </div>
            </div>

            <div class="file-btn-box">
                <input type="file" id="file" accept=".jpg, .jpeg, .png, .gif" class="file-btn">
                <div id="fileName" class="ml-4"></div>
                <button type="button" class="fileBtn">file</button>
            </div>

            <div class="btn-box">
            <button type="button" class="list-btn1">목록</button>
            <button type="button" class="list-btn2" data-post-id="${mupick.id}">삭제</button>
            <button type="button" class="list-btn3" data-post-id="${mupick.id}">수정</button>
            </div>
        </div>

    </div>
    
<script>
	$(document).ready(function() {
		
		$('.list-btn1').on('click', function() {
			//alert("click");
			location.href = "/post/mupick_list_view";
		});
		
		
		
		// 파일이미지 클릭 -> 숨겨져있는 type="file"을 동작
		$('.fileBtn').on('click', function(e) {
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
		
		
		
		// 수정 버튼 클릭
		$('.list-btn3').on('click', function() {
			//alert(1122222);
			
			let subject = $('#subject').val().trim();
			let content = $('#content').val();
			let file = $('#file').val();
			
			if (!subject) {
				alert("제목을 입력해주세요.");
				return;
			}
			if (!content) {
				alert("내용을 입력하세요.");
				return;
			}
			console.log(file);
			
			// 파일이 업로드 된 경우 확장자 체크
			if (file) {
				let ext = file.split(".").pop().toLowerCase();
				//alert(ext);
				if ($.inArray(ext, ['jpg', 'jpeg', 'gif', 'png']) == -1) {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val(""); //파일을 비운다.
					return;
				}
			}
			
			// 폼태그를 스크립트에서 만든다.
			let postId = $(this).data('post-id');
			//alert(postId);
			let formData = new FormData();
			formData.append("postId", postId);
			formData.append("subject", subject);
			formData.append("content", content);
			formData.append("file", $('#file')[0].files[0]);
			
			//ajax
			$.ajax({
				//request
				type:"put"
				, url:"/post/update"
				, data:formData
				, enctype:"multipart/form-data"		// 파일 업로드를 위한 필수 설정
				, processData:false					// 파일 업로드를 위한 필수 설정
				, contentType:false					// 파일 업로드를 위한 필수 설정
				
				// response
				, success:function(data) {
					if (data.code == 1) {
						alert("메모가 수정되었습니다");
						location.reload(true);
					} else {
						alert(data.errorMessage);
					}
				}
			, error:function(request, status, error) {
				alert("메모 수정 실패했습니다.");
				}
			
			});
		});
		
		// 삭제
		$('.list-btn2').on('click', function() {
			//alert("삭제");
			let postId = $(this).data('postId');
			//alert(postId);
			
			$.ajax({
				type:"delete"
				, url:"/post/delete"
				, data: {"postId": postId}
				, success:function(data) {
					if (data.code == 1) {
						alert("삭제 되었습니다.");
						location.href = "/post/mupick_list_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(request, status, error) {
					alert("메모를 삭제하는데 실패했습니다.");
				}
			
			});
		});
	});
</script>