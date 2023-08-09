<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/start_view.css">
    <link rel="stylesheet" href="/static/css/sign_in.css">
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
            <form id="loginForm" action="/user/sign_in" method="post">
                <div class="id-container">
                    <div class="id-box">
                        <span>아이디</span>
                    </div>
                </div>
                <input type="text" class="input-id" value="아이디를 입력하세요." id="loginId" name="loginId">

                <div class="password-container">
                    <div class="password-box">
                        <span>비밀번호</span>
                    </div>
                </div>
                <input type="text" class="input-password" value="비밀번호를 입력하세요." id="password" name="password">

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