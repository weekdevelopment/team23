<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="/pro3_war" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>파일 자료 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../include/hd.jsp"></jsp:include>
	<figure class="visual" id="vs1">
		<ul class="imgbox">
			<li class="hero is-medium is-link">
				<div class="hero-body">
					<p class="title">
						Medium hero
					</p>
					<p class="subtitle">
						Medium subtitle
					</p>
				</div>
			</li>
		</ul>
	</figure>
	<div class="content" id="contents">
	    <div class="row column text-center">
	      <h2 class="h1">자료실 목록</h2>
	      <hr>
	      <div class="container">
				  <table class="table table-active">
				  <thead>
				  	<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>읽은횟수</th>
					</tr>
				  </thead>
				  <tbody>
				  <c:if test="${not empty fileboardList}">
				  <c:forEach var="board" items="${fileboardList}">
						  <tr class="table-info">
							  <td>${board.fileBoard.postNo}</td>
							  <td><a href="${path1}/file/getFileboard.do?postNo=${board.fileBoard.postNo}">${board.fileBoard.title}</a></td>
							  <td>${board.fileBoard.regdate}</td>
							  <td>${board.fileBoard.visited}
								  <c:if test="${not empty board.fileList}">
									<img src="${path1}/resources/icon/disk.png" alt="디스크이미지" style="width:24px;height:24px;"/>
								  </c:if>
							  </td>
						  </tr>
				  </c:forEach>
				  </c:if>
				  <c:if test="${empty fileboardList}">
					  <tr>
						  <td colspan="4">아직 게시된 자료글이 없습니다.</td>
					  </tr>
				  </c:if>
				  </tbody>
			  </table>
			  <c:if test="${sid.equals('admin')}">
			  	<a href="${path1}/file/fileupload1.do" class="button is-primary">파일 자료 등록</a>
			  </c:if>
		  </div>
	    </div>
	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/ft.jsp"></jsp:include>
</div>
</body>
</html>