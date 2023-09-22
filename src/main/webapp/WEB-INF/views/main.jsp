<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>티스푼 메인 페이지</title>
    <!-- head.jsp와 chat.jsp 인클루드 -->
    <jsp:include page="./include/head.jsp" />
    <jsp:include page="./include/chat.jsp" />

    <style>
        .edumag {
            margin-top: 20px;
            font-size: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container is-fullhd">
    <!-- hd.jsp 인클루드 -->
    <jsp:include page="./include/hd.jsp" />
    <!-- main_banner.jsp 인클루드 -->
    <jsp:include page="./include/main_banner.jsp" />
    <br>
    <br>
    <div class="tile is-ancestor">
        <!-- 최신 공지사항 표시 -->
        <div class="tile is-ancestor">
            <div class="tile is-vertical is-8">
                <div class="tile">
                    <div class="tile is-parent is-vertical">
                        <article class="tile is-child notification is-primary" style="background: #ABDEE6">
                            <p class="title">공지사항</p>
                            <p class="subtitle">최근 공지사항</p>
                            <div class="table is-fullwidth is-striped" style="background: none">
                                <c:choose>
                                    <c:when test="${empty newNotice}">
                                        <p>최신 공지사항이 없습니다.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${newNotice}" var="notice" varStatus="status">
                                            <!-- 첫 5개 공지사항만 표시 -->
                                            <c:if test="${status.index < 3}">
                                                <a href="${path1}/notice/detail.do?nno=${notice.nno}" style="text-decoration-line: none;">
                                                    <div>
                                                        <i class="fa fa-solid fa-seedling" style="color: #2B3A55; margin: 11px 11px;"></i>
                                                            ${notice.title}
                                                    </div>
                                                </a>
                                            </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </article>
                        <article class="tile is-child notification is-warning" style="background: #FEE1E8;">
                            <p class="title">자유게시판</p>
                            <p class="subtitle">Best 게시물</p>
                            <c:choose>
                                <c:when test="${empty freeRecList}">
                                    <p>Best 게시물이 없습니다.</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${freeRecList}" var="free" varStatus="status">
                                        <!-- 첫 5개 Best 게시물만 표시 -->
                                        <c:if test="${status.index < 5}">
                                            <a href="${path1}/free/detail.do?fno=${free.fno}">
                                                <div>
                                                        ${free.title}
                                                </div>
                                            </a>
                                            <hr style="margin: 0.5rem 0;"/>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </article>
                    </div>
                    <div class="tile is-parent">
                        <article class="tile is-child notification is-info" style="background: #CBAACB;">
                            <p class="title" style="margin-left: 110px; margin-top: 13px;">교육 매거진</p>
                            <div class="content">
                                <!-- 1개만 표시 -->
                                <a href="${path1 }/edumag/detail.do?no=${newEdumag.no }" style="text-decoration-line: none;">
                                    <div>
                                        <img src=" ${newEdumag.imagesLink }">
                                        <p class="edumag">
                                            「 ${newEdumag.title } 」
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </article>
                    </div>
                </div>
                <div class="tile is-parent">
                    <article class="tile is-child notification is-danger" style="background: #FFCCB6;">
                        <p class="title">슬로건</p>
                        <p class="subtitle">윜 캔 두잇! Week Can Do It!!!!</p>
                        <div class="content">
                            <!-- Content -->
                        </div>
                    </article>
                </div>
            </div>
            <div class="tile is-parent">
                <article class="tile is-child notification is-success" style="background: #F3B0C3;">
                    <div class="content">
                        <p class="title">교재 신간</p>
                        <p class="subtitle">이번 달 출시된 교재</p>
                        <div class="content">
                            <!-- Content -->
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<!-- ft.jsp 인클루드 -->
<jsp:include page="./include/ft.jsp" />
</body>
</html>
