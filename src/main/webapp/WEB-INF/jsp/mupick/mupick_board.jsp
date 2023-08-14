<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <!-- bootstrap CDN link -->
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> -->

    <link rel="stylesheet" href="/static/css/mupick_board.css">
    <link rel="stylesheet" href="/static/css/header.css">
    
    <div class="container">
        <header>
            <jsp:include page="../include/header.jsp" />
        </header>

        <div class="main-wrap">
            <div class="nav">
                <div id="nav-1" class="nav-wrap"><a href="#">Mupick!</a></div>
                <div id="nav-2" class="nav-wrap">MupStar</div>
                <div id="nav-3" class="nav-wrap">MupPhoto</div>
            </div>

            <div class="wrap">
                <div class="wrap-list">
                    <div class="span-wrap">
                        <span>Mupick!</span>
                    </div>
                    <ul class="li-list">
                        <li>제 인생 영화 추천드립니다!</li>
                        <span>무비평론가A</span>
                        <span>2023.08.01</span>
                    </ul>
                    <ul class="li-list">
                        <li>봉준호 폼 미쳤다</li>
                        <span>한국영화좋아</span>
                        <span>2023.07.31</span>
                    </ul>
                    <ul class="li-list">
                        <li>마블 영화의 최대 단점</li>
                        <span>마블늦덕</span>
                        <span>2023.07.29</span>
                    </ul>
                </div>

                <div class="write-btn-wrap">
                    <div class="write-btn">
                        <input type="button" name="write-btn" value="글쓰기">
                    </div>
                </div>
            </div>
        </div>
    </div>
