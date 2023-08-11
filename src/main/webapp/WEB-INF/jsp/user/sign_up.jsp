<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <title>회원가입</title>
    
    
    <!-- bootstrap -->
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/static/css/header.css">
    <!-- <link rel="stylesheet" href="/static/css/start_view.css"> -->
    <link rel="stylesheet" href="/static/css/sign_in.css">
    <link rel="stylesheet" href="/static/css/sign_up.css">
    
<body>
    <div class="container">
        <header>
            <jsp:include page="../include/header.jsp" />
        </header>
        <div class="wrap-container">
            <div class="span-box">
                <span class="span-box-span">회원가입</span>
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
            <form id="signUpForm" method="post" action="/user/sign_up">

				<div class="name-container">
                    <div class="name-box">
                        <span>이름</span>
                    </div>
                </div>
                <input type="text" class="input-name" name="input-name" placeholder="이름을 입력하세요.">


                <div class="email-container">
                    <div class="email-box">
                        <span>이메일</span>
                    </div>
                </div>
                <input type="text" class="input-email" name="input-email" placeholder="이메일을 입력하세요.">
                <button type="button" id="emailCheckBtn" class="btn-check">중복확인</button><br>
                
                <%-- 이메일 체크 결과 --%>
				<%-- d-none 클래스: display none (보이지 않게) --%>
				<div id="emailCheckDuplicated">이미 사용중인 Email입니다.</div>
				<div id="emailCheckOk">사용 가능한 Email 입니다.</div>
                
                <div class="userId-container">
                    <div class="userId-box">
                        <span>ID</span>
                    </div>
                </div>
                <input type="text" class="input-userId" name="input-userId" placeholder="아이디를 입력하세요.">
                <button type="button" id="userIdCheckBtn" class="btn-check">중복확인</button><br>
				
				<%-- 아이디 체크 결과 --%>
				<%-- d-none 클래스: display none (보이지 않게) --%>
				<div id="idCheckDuplicated">이미 사용중인 Email입니다.</div>
				<div id="idCheckOk">사용 가능한 Email 입니다.</div>
				
                <div class="pw-container">
                    <div class="pw-box">
                        <span>Password</span>
                    </div>
                </div>
                <input type="password" class="input-pw" name="input-pw" placeholder="비밀번호를 입력하세요.">
                
                <div class="pw-check-container">
                    <div class="pw-check-box">
                        <span>confrim Password</span>
                    </div>
                </div>
                <input type="password" class="input-pw-check" name="input-pw-check" placeholder="비밀번호를 입력하세요."><br>
                <span class="pw-check-span d-none">비밀번호가 일치하지 않습니다.</span>

                <div class="btn-box">
                    <input type="submit" id="backBtn" class="back-btn" value="뒤로">
                    <input type="submit" id="signUpBtn" value="회원가입">
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
	// 뒤로 버튼 클릭 => 처음 페이지로 이동
	$('.back-Btn').on('click', function() {
		//alert("ㅁㅁㅁ");
		location.href = "/user/start/start_view";
	});
	
	// 이메일 중복확인 버튼 클릭
	$('#emailCheckBtn').on('click', function() {
		//alert("ㅇㅇㅇ");
		
		// 경고 문구 초기화
		$('#emailCheckDuplicated').addClass('display:none');
		$('#emailCheckOk').addClass('d-none');
		
		//AJAX 통신 - 중복확인
		$.ajax({
			// request
			url: "/user/is_duplicated_email"
			, data: {"email":email}
			
			//response
			, success: function(data) {
				if (data.isDuplicatedEmail) {
					// 중복
					$('#emailCheckDuplicated').removeClass('d-none');
					
				} else {
					// 중복 X => 사용 가능
					$('#emailCheckOk').removeClass('d-none');
				}
			}
			, error: function(request, status, error) {
				alert("중복확인에 실패했습니다.");
			}
		});

	});
	
	// 아이디 중복확인 버튼 클릭
	$('#idCheckBtn').on('click', function() {
		//alert("ㅇㅇㅇ");
		
		// 경고 문구 초기화
		$('#idCheckDuplicated').addClass('display:none');
		$('#idCheckOk').addClass('d-none');
		
		//AJAX 통신 - 중복확인
		$.ajax({
			// request
			url: "/user/is_duplicated_email"
			, data: {"loginId":loginId}
			
			//response
			, success: function(data) {
				if (data.isDuplicatedId) {
					// 중복
					$('#idCheckDuplicated').removeClass('d-none');
					
				} else {
					// 중복 X => 사용 가능
					$('#idCheckOk').removeClass('d-none');
				}
			}
			, error: function(request, status, error) {
				alert("중복확인에 실패했습니다.");
			}
		});

	});
	
	// 회원가입
	$("#signUpForm").on('submit', function(e) {
		e.preventDefault(); // 서브밋 기능 중단
		
		// validation
		let name = $('input[name=input-name]').val().trim();
		let email = $('input[name=input-email]').val().trim();
		let loginId = $('input[name=input-userId]').val();
		let password = $('input[name=input-pw]').val();
		let confirmPassword = $('input[name=input-pw-check]').val();
		
		if (!loginId) {
			alert("아이디를 입력하세요");
			return false;
		}
		
		if (!password || !confirmPassword) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (password != confirmPassword) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		if (!email) {
			alert("이메일을 입력하세요");
			return false;
		}
		
		if ($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 다시 해주세요");
			return false;
		}
		
		let url = $(this).attr('action');
		console.log(url);
		let params = $(this).serialize(); // 폼태그에 있는 name 속성-값들로 파라미터 구성
		console.log(params);
		
		$.post(url, params)   // request
		.done(function(data) {
			// response
			if (data.code == 1) {
				alert("가입을 환영합니다! 로그인을 해주세요.");
				location.href = "/user/sign_in_view"; // 로그인 화면으로 이동
			} else {
				// 로직 실패
				alert(data.errorMessage);
			}
		});
	});
});
</script>
