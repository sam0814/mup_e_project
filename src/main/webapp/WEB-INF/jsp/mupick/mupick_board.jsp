<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

	<title>Mupick_board</title>

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
                <div id="nav-1" class="nav-wrap"><a href="/post/mupick_list_view">Mupick!</a></div>
                <div id="nav-2" class="nav-wrap"><a href="/star/movie_list_view">MupStar</a></div>
                <div id="nav-3" class="nav-wrap"><a href="/timeline/mup_photo_list_view">MupPhoto</a></div>
            </div>

            <div class="wrap">
                <div class="wrap-list">
                    <div class="span-wrap">
                        <span>Mupick!</span>
                    </div>
                    <c:forEach items="${postList}" var="mupick">
                    <ul class="li-list">
                        <a href="/post/mupick_detail_view?postId=${mupick.id}" class="title-box">${mupick.subject}</a>
                        <span class="userId-span">${mupick.userId}</span>
                        <%-- ZonedDateTime -> Date -> String 변환 --%>
						<fmt:parseDate value="${mupick.createdAt}" pattern="yyyy-MM-dd HH:mm:ss.S" var="parsedCreatedAt" />
						<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss.S" />
                    </ul>
                 </c:forEach>
                </div>

                <div class="write-btn-wrap">
                    <div class="write-btn">
                        <input type="button" id="write-btn" name="write-btn" value="글쓰기">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<script>
$(document).ready(function() {
	// 글쓰기 버튼 클릭 => 글쓰기 페이지로 이동
	$('#write-btn').on('click', function() {
		//alert("click");
		location.href = "/post/mupick_create_view";
	});
});
</script>
