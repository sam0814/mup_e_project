<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- bootstrap CDN link -->
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> -->

  <link rel="stylesheet" href="/static/css/header.css">
  <link rel="stylesheet" href="/static/css/mupick_board_writing.css">

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
            <input type="text" id="title" name="title" placeholder="제목을 입력하세요">

            <div class="insert-text">
                <span>내용</span>
            </div>
            <div class="insert-box">
                <div class="left-box">
                    <img src="/static/images/the_moon_movie.jpg" alt="" width="250" height="322">
                </div>
                <div class="right-box">
                    <textarea name="input-text" id="input-text" cols="45" rows="22"></textarea>
                </div>
            </div>

            <div class="file-btn-box">
                <span>the_moon_movie.jpg</span>
                <button type="button" class="file-btn">file</button>
            </div>

            <div class="btn-box">
            <button type="button" class="list-btn1">목록</button>
            <button type="button" class="list-btn2">모두 지우기</button>
            <button type="button" class="list-btn3">업로드</button>
            </div>
        </div>

    </div>
