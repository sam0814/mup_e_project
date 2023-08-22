<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <title>로그인</title>
    
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/static/css/header_2.css">
    <link rel="stylesheet" href="/static/css/start.css">
    <link rel="stylesheet" href="/static/css/sign_in.css">

    <div class="container">
        <header>
            <jsp:include page="../include/header_2.jsp" />
        </header>
        <div class="wrap-container">
            <div class="span-box">
                <span class="span-box-span">로그인</span>
            </div>
            <div class="box-container">
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
            </div>
            <form id="loginForm" action="/user/sign_in" method="post">
                <div class="id-container">
                    <div class="id-box">
                        <span>아이디</span>
                    </div>
                </div>
                <input type="text" class="input-id" placeholder="아이디를 입력하세요." id="loginId" name="loginId">

                <div class="password-container">
                    <div class="password-box">
                        <span>비밀번호</span>
                    </div>
                </div>
                <input type="password" class="input-password" placeholder="비밀번호를 입력하세요." id="password" name="password">

                <div class="btn-box">
                    <input type="submit" id="loginBtn" class="back-Btn" value="뒤로">
                    <input type="submit" id="loginBtn" value="로그인">
                </div>

            </form>

            <div class="box-container">
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box"></div>
            </div>
        </div>
    </div>
    
 <script>
 $(document).ready(function() {
	 $(document).ready(function() {
		 	$('.back-Btn').on('click', function(e) {
		 		e.preventDefault();
		 		location.href = "/user/start/start_view";
		 	});
	 
			// 로그인
			$('#loginForm').on('submit', function(e) {
				e.preventDefault(); // form submit 중단
				
				let loginId = $('#loginId').val().trim();
				let password = $('#password').val();
				
				if (!loginId) {
					alert("아이디를 입력하세요");
					return false;
				}
				if (!password) {
					alert("비밀번호를 입력하세요");
					return false;
				} 
				
				let url = $(this).attr('action');
				console.log(url);
				let params = $(this).serialize(); // name 속성 반드시 있어야함
				console.log(params);
				
				$.post(url, params)   // request
				.done(function(data) {  // response
					if (data.code == 1) {
						// 성공
						location.href = "/post/mupick_list_view"; // 글목록으로 이동
					} else {
						// 로직 실패
						alert(data.errorMessage);
					}
				});
			});
		});
 });
 </script>
