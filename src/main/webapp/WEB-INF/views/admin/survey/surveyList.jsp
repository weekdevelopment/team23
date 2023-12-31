<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>윜이슈 게시판 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
	<style>
		.surveybox { clear:both; margin: 0; padding: 0; width: 1320px; height: auto;  position:relative; }
		.lst { list-style: none; clear:both; width: 1290px; margin-bottom: 30px; }

		.lst:after { content:""; display:block; width: 100%; clear:both; }
		.lst li { list-style: none; width: 400px; height: 340px; background-color:#fff; float:left; box-sizing:border-box; margin-top: 0.25em;
			margin-left: 30px; margin-right: 30px; }
		.lst li:nth-child(2n) { margin-right: 0; }

		.box_wrap .list .row li { width:1200px; list-style:none; margin:20px auto;  }
	</style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="container is-fullhd">
	<jsp:include page="../../include/hd.jsp"></jsp:include>
	<div class="columns">
		<jsp:include page="../include/admin_eventSideMenu.jsp" />
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<%--<h6>이벤트 게시판</h6>--%>
					<span class="title">윜이슈 게시판</span>
				</div>
				<br>
				<br>
			<div class="box content">
				<div class="content" id="contents">
					<div class="row column text-center">
						<div class="container">
							<div class="button-group">
								<c:if test="${sid.equals('admin')}">
									<a class="button post-btn" href="${path1 }/admin/surveyInsert.do">설문 등록</a>
								</c:if>
							</div>
							<%-- </c:if> --%>
							<section class="surveybox">
								<div class="box_wrap">
									<ul class="lst">
										<c:forEach var="survey" items="${surveyList }" varStatus="status">
											<li style="overflow: hidden">
												<a href="${path1}/admin/surveyDetail.do?sno=${survey.sno }">
													<div style="width: 600px;">
														<div>
															<div>
																${survey.content }
															</div>
														</div>
													</div>
												</a>
												<!-- 수정 및 삭제 버튼 -->
												<c:if test="${sid.equals('admin')}">
													<div class="button-group" style="float: right;">
														<a href="${path1}/admin/surveyDelete.do?sno=${survey.sno}" class="button is-danger">삭제</a>
													</div>
												</c:if>
											</li>
										</c:forEach>
										<c:if test="${empty surveyList}">
											<li class="col-12">설문이 존재하지 않습니다.</li>
										</c:if>
									</ul>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../../include/ft.jsp"></jsp:include>
</body>
</html>