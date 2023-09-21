<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이벤트 게시판 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
	<style>
		.eventbox { clear:both; margin: 0; padding: 0; width: 1320px; height: auto;  position:relative; }
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
	<jsp:include page="../include/hd.jsp"></jsp:include>
	<div class="columns">
		<div class="column is-2">
			<aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					이벤트
				</span>
				<ul class="menu-list">
					<li>
						<a href="${path1}/event/list.do">이벤트 게시판</a>
					</li>
					<li>
						<a href="${path1}/winner/list.do">이벤트 당첨자</a>
					</li>
					<li>
						<a href="${path1}/survey/list.do">윜이슈(설문)</a>
					</li>
				</ul>
			</aside>
		</div>
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<%--<h6>이벤트 게시판</h6>--%>
					<span class="title">이벤트 게시판</span>
				</div>

				<div class="columns">
					<div class="column is-6">
						<div class="card events-card">
							<header class="card-header">
								<p class="card-header-title">추천 많은 글</p>
							</header>
                            <c:forEach items="${freeRecList }" var="free" varStatus="status">
                                <div class="card-table">
                                    <div class="content">
                                        <table class="table is-fullwidth">
                                            <tbody>
                                            <tr>
                                                <%--<td width="1%"><i class="fa fa-bell-o"></i></td>--%>
                                                <td>
                                                    &#${9311+status.count} <a href="${path1}/free/detail.do?bno=${free.bno }">${free.title }</a>
                                                </td>
                                                <%--<td class="level-right"><a class="button is-small is-primary" href="#">Action</a></td>--%>
                                                <td class="level-right">
                                                    &#x1F44D; ${free.rec }
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:forEach>

						</div>
					</div>

					<div class="column is-6">
						<div class="card events-card">
							<header class="card-header">
								<p class="card-header-title">댓글 많은 글</p>
							</header>
							<div class="card-table">
								<div class="content">
									<table class="table is-fullwidth is-striped">
										<tbody>
										<tr>
											<td width="5%"><i class="fa fa-bell-o"></i></td>
											<td>Lorum ipsum dolem aire</td>
											<td class="level-right"><a class="button is-small is-primary" href="#">Action</a></td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="box content">

				<div class="content" id="contents">
					<div class="row column text-center">
						<div class="container">
							<section class="eventbox">
								<div class="button-group">
									<c:if test="${sid.equals('admin')}">
										<a class="button post-btn" href="${path1 }/event/insert.do">이벤트 등록</a>
									</c:if>
								</div>
								<div class="box_wrap">
									<ul class="lst">
										<c:forEach var="event" items="${eventList }" varStatus="status">
											<li style="overflow: hidden">
												<a href="${path1}/event/detail.do?bno=${event.bno }">
													<div style="width: 600px;">
														<div>
															<h3 style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${event.title }</h3>
														</div>
														<div style="width:600px;">
																${event.content}
														</div>
													</div>
												</a>
											</li>
										</c:forEach>
										<c:if test="${empty eventList}">
											<li class="col-12">이벤트가 존재하지 않습니다.</li>
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
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>

<script>
    function checkLogin() {
        var confirmLogin = confirm("글 작성은 로그인이 필요합니다. 로그인하시겠습니까?");
        if (confirmLogin) {
            location.href = '${path1 }/member/login.do';
        }
    }
</script>
</body>
</html>