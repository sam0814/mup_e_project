<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>mupstar_board</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

 <link rel="stylesheet" href="/static/css/mupstar_board.css">
 <link rel="stylesheet" href="/static/css/mupick_board.css">
 <link rel="stylesheet" href="/static/css/header.css">


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

            <div class="mupstar-text">
                <span>Mupick!</span>
            </div>
            <div class="mupstar-text-detail">
                <span>MupStar란?<br>
                    - 매달 새로 개봉하는 영화들을 Mup회원들이 자유롭게 별점을 매겨 볼 수 있는 공간이에요.<br>
                    별점 5점 만점, 지금 바로 매겨보세요!</span>
            </div>

            <div class="wrap-container">
            	<c:forEach items="${movieList}" var="movie">
                <div class="movie-poster">
                    <img src="${movie.imagePath}" alt="" width="200px"
                    height="300px">
                    <span>${movie.subject}</span>
                </div>
                </c:forEach>

                <!-- <div class="movie-poster">
                    <img src="/static/images/be.jpg" alt="" width="200px"
                    height="300px">
                    <span>비공식 작전_2023</span>
                </div>
                <div class="movie-poster">
                    <img src="/static/images/Elemental.jpg" alt="" width="200px"
                    height="300px">
                    <span>엘리멘탈_2023</span>
                </div>
                <div class="movie-poster">
                    <img src="/static/images/Smugglers.jpg" alt="" width="200px"
                    height="300px">
                    <span>밀수_2023</span>
                </div> -->
            </div>
            <div class="goto-mupstar">
                <a href="/star/movie_star_view">MupStar 하러가기</a>
                <a href="/star/movie_star_view">MupStar 하러가기</a>
                <a href="/star/movie_star_view">MupStar 하러가기</a>
                <a href="/star/movie_star_view">MupStar 하러가기</a>
            </div>
        </div>
    </div>