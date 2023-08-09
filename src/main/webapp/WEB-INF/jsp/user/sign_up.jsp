<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/start_view.css">
    <link rel="stylesheet" href="/static/css/sign_in.css">
    <link rel="stylesheet" href="/static/css/sign_up.css">
    
</head>
<body>
    <div class="container">
        <header>
            <jsp:include page="../include/header.jsp" />
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
            <form id="signUpForm" method="post" action="/user/sign_up">
                <div class="id-container">
                    <div class="id-box">
                        <span>아이디</span>
                    </div>
                </div>
                <input type="text" class="input-id" value="아이디를 입력하세요.">

                <div class="email-container">
                    <div class="email-box">
                        <span>이메일</span>
                    </div>
                </div>
                <input type="text" class="input-email" value="이메일을 입력하세요.">
                <button type="button" id="emailCheckBtn" class="btn-check btn-success">중복확인</button><br>
                <span class="email-span">사용중인 이메일 입니다.</span>
                
                <div class="userId-container">
                    <div class="userId-box">
                        <span>ID</span>
                    </div>
                </div>
                <input type="text" class="input-userId" value="아이디를 입력하세요.">
                <button type="button" id="userIdCheckBtn" class="btn-check btn-success">중복확인</button><br>
                <span class="userId-span">사용중인 아이디 입니다.</span>

                <div class="pw-container">
                    <div class="pw-box">
                        <span>Password</span>
                    </div>
                </div>
                <input type="text" class="input-pw" value="비밀번호를 입력하세요.">
                
                <div class="pw-check-container">
                    <div class="pw-check-box">
                        <span>confrim Password</span>
                    </div>
                </div>
                <input type="text" class="input-pw-check" value="비밀번호를 입력하세요."><br>
                <span class="pw-check-span">비밀번호가 일치하지 않습니다.</span>

                <div class="btn-box">
                    <input type="submit" id="loginBtn" class="btn btn-block btn-primary" value="회원가입">
                    <input type="submit" id="loginBtn" class="btn btn-block btn-primary" value="로그인">
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
</body>
</html>