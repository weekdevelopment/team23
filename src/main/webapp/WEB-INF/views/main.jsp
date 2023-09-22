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

<%-- 데이터베이스 연결 설정 --%>
<%
    String dbUrl = "jdbc:mariadb://localhost:3306/teaspoon";
    String dbUser = "root";
    String dbPassword = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver"); // MariaDB JDBC 드라이버 클래스 로드
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword); // 데이터베이스 연결
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
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
</head>
<body>
<div class="container is-fullhd">
    <!-- hd.jsp 인클루드 -->
    <jsp:include page="./include/hd.jsp" />
    <!-- main_banner.jsp 인클루드 -->
    <jsp:include page="./include/main_banner.jsp" />
    <jsp:include page="main/section1.jsp" />
    <jsp:include page="main/section2.jsp" />
    <br>
<br>
<br>
<!-- ft.jsp 인클루드 -->
<jsp:include page="./include/ft.jsp" />
</body>
</html>
