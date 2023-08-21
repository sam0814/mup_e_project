<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>start_view</title>
    
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
   
   <!-- 내가 만든 외부 스타일시트 -->
	<link rel="stylesheet" type="text/css" href="/static/css/start.css">

    <div class="container">
        <header>
            <jsp:include page="../include/header_2.jsp" />
        </header>
        <div class="wrap">
            <div class="wrap-box">
                <div class="span-box">
                    <span class="span-box-span">MupE 입장권</span>
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
                <div class="issue-box">
                    <div class="issue-span-box">
                        <span>2023-08-01 23:00(kst) [전체발권]</span>
                    </div>
                </div>
                <div class="age-of-use-container">
                    <div class="age-of-use-box">
                        <span>8D 전체이용가</span><br>
                        <span>주제에 따라 사용연령이 제한 될 수 있습니다.</span>
                    </div>
                </div>
                <div class="introduce-container">
                    <div class="introduce-box">
                        <span>영화추천..영화 평점..포토무비 한줄 평가..</span>
                    </div>
                </div>
                <div class="text-container">
                    <div class="text-box-1">
                        <p class="text-1">입장권</p>
                        <p class="text-2">필요하세요?</p>
                    </div>
                    <div class="text-box-2">
                        <p class="text-3">지금</p>
                        <p class="text-3">바로</p>
                        <p class="text-2">가입하세요!</p>
                    </div>
                </div>
                <div class="seat-container">
                    <div class="seat-box">
                        <span>M관 u층 p열 E번</span>
                    </div>
                </div>
                <div class="personnel-container">
                    <div class="personnel-box">
                        <span>총인원 1명 (MupE)</span>
                    </div>
                </div>

                <div class="btn-box">
                    <input type="button" id="signUpBtn" class="btn btn-block btn-primary" value="회원가입">
                    <input type="button" id="loginBtn" class="btn btn-block btn-primary" value="로그인">
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
            </div>
        </div>
    </div>


<script>
$(document).ready(function() {
	// 회원가입 버튼 클릭 => 회원가입 페이지로 이동
	$('#signUpBtn').on('click', function() {
		location.href = "/user/sign_up_view";
	});
	
	$('#loginBtn').on('click', function() {
		location.href = "/user/sign_in_view";
	});
});
</script>