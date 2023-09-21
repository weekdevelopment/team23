<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path0" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="./include/head.jsp"/>
    <link rel="stylesheet" href="${path0}/resources/css/fullpage.min.css">
    <style>
        a:hover {
            text-decoration: none;
            color: inherit;
        }
        .title.is-1 {
            font-size: 5rem;
        }
        /* 첫 번째 섹션을 화면에 꽉 차게 만듭니다. */
        .main-text-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            opacity: 0.8;
        }

        .section {
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 100%;
            margin: 0 auto;
            padding: 0;
        }
    </style>
</head>
<body>
<div id="fullpage">
    <div class="section">
        <section class="hero main_hero is-fullheight">
            <div class="hero-body" onclick="goMain()">
                <div class="container has-text-centered">
                    <div class="slider-content animated zoomIn pb-6">
                        <div>
                            <p class="title is-1 main-text">Welcome to Weekitalk</p>
                            <p class="subtitle is-4 main-text">Experience The Our Community</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div class="section">
        <section class="section">
            <div class="container">
                <div class="columns is-centered">
                    <div class="column is-half">
                        <div class="main-text-container">
                            <p class="is-size-4">소중한 내 자녀의 교육을 위해서 지금 바로 시작 할 때 입니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script src="${path0}/resources/js/fullpage.min.js"></script>
<script>
    new fullpage('#fullpage', {
        // fullPage.js 옵션 설정
        autoScrolling: true, // 자동 스크롤 활성화
        navigation: true, // 페이지 네비게이션 활성화
    });

    function goMain() {
        location.href = "${path0}/main";
    }
</script>
</body>
</html>
