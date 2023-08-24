<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <!-- 내가 만든 외부 스타일시트 -->
	<link rel="stylesheet" type="text/css" href="/static/css/header_2.css">
	<link rel="stylesheet" type="text/css" href="/static/images/icons8-영화-50.png">
</head>
<body>
    <div class="wrap">
        <header>
        	<div class="header-wrap">
	            <img src="/static/images/icons8-영화-50.png" alt="" width="50" height="50">
	            <h1 id="logo">www.MupE.com</h1>
	        </div>
            
        </header>
    </div>
</body>

<script>
$(document).ready(function() {
	// 글쓰기 버튼 클릭 => 글쓰기 페이지로 이동
	$('#logo').on('click', function() {
		//alert("click");
		location.href = "/user/start/start_view";
	});
});
</script>