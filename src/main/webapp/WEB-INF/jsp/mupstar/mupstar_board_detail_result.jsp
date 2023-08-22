<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>


<head>

<title>mupstar_board_detail_result</title>

	<link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/mupstar_board.css">
    <link rel="stylesheet" href="/static/css/mupick_board.css">
    <link rel="stylesheet" href="/static/css/mupstar_board_detail.css">
    <link rel="stylesheet" href="/static/css/mupstar_board_detail_result.css">
    
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

            <div class="result-title-wrap">
                <div class="my-star">
                    <p class="my-name">송새미님의</p>
                    <p class="mupstar">MupStar</p>
                </div>
                <div class="user-star">
                    <p class="user-name">다른 MupE의</p>
                    <p class="mupstar">MupStar</p>
                </div>
            </div>
            <div class="result-main-wrap">
                <div class="my-star-result">
                    <div class="poster-wrap">
                        <img src="/static/images/the_moon_movie.jpg" alt="영화 더 문" width="300px" height="445px">
                    </div>
        
                    <div class="movie_title-wrap">
                        <div class="movie-title">
                            <span>더 문_2023</span>
                        </div>
                    </div>
        
                    <div class="movie_star-wrap">
                        <div class="movie-star">
                            <img src="/static/images/icons8-star.png" alt="">
                        </div>
                        <div class="movie-star">
                            <img src="/static/images/icons8-star.png" alt="">
                        </div>
                        <div class="movie-star">
                            <img src="/static/images/icons8-star.png" alt="">
                        </div>
                        <div class="movie-star">
                            <img src="/static/images/icons8-star.png" alt="">
                        </div>
                        <div class="movie-star">
                            <img src="/static/images/icons8-star.png" alt="">
                        </div>
                    </div>
        
                </div>

                <!-- user 별점-->
                <div class="user-star-result-box">
                    <div class="user-star-result-1">
                        <b class="user-name">무비평론가A님의</b>
                        <b class="mupstar">MupStar</b>

                        <div class="user-movie_star-wrap">
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="user-star-result-2">
                        <b class="user-name">한국영화좋아님의</b>
                        <b class="mupstar">MupStar</b>

                        <div class="user-movie_star-wrap">
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                            <div class="movie-star">
                                <img src="/static/images/icons8-star.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="mupstar_btn_wrap">
                        <div class="mupstar_btn">
                            <button type="button" class="list-btn">목록</button>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>