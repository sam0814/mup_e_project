<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>


<head>
    <title>mup_photo_page</title>

     <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
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
                <input type="file" id="file" accept=".jpg, .jpeg, .png, .gif" class="input-box">

                <a href="#" id="fileUploadBtn"><img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

                <div id="fileName" class="ml-4"></div>

                <button id="writeBtn" class="btn btn-info">업로드</button>
            </div>

            <div class="mup-photo-container">
                <div class="mup-photo-wrap">
                    <div class="mup-photo-nav">
                        <p>마블 늦덕</p>
                        <p>2023-08-02 13:19:25</p>
                    </div>

                    <div class="mup-photo-input">
                        <img src="/static/images/ticket1.jpg" alt="" width="488px" height="500px">
                    </div>

                    <div class="like-box">
                        <div class="like-img-box">
                            <a href="#">
                                <img src="/static/images/icons8_tum_.png" alt="" width="30px" height="30px">
                            </a>
                        </div>
                        <p class="like-text">추천해요 2개</p>
                    </div>

                    <div class="impression-box">
                        <b>마블늦덕의 한줄소감 </b>
                        <b>- 역시 믿고 보는 마동석</b>
                    </div>

                    <!-- 댓글 -->
                    <div class="comment-wrap">
                        <div class="comment-nav">
                            <p>댓글</p>
                        </div>
                        <div class="comment-box">
                            <p><b>송새미</b> - 저도 한번 봐야겠네요~</p>
                        </div>

                        <div class="comment-input">
                            <input type="text">
                            <button type="button">게시</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>