<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설문 게시판 글보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="columns">
        <div class="column is-2">
            <aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					이벤트
				</span>
                <ul class="menu-list">
                    <li>
                        <a href="${path1}/survey/list.do">이벤트 게시판</a>
                    </li>
                    <li>
                        <a href="${path1}/winner/list.do">이벤트 당첨자</a>
                    </li>
                    <li>
                        <a href="${path1}/survey/list.do">윜이슈</a>
                    </li>
                </ul>
            </aside>
        </div>

        <div class="column is-10">
            <div class="content" id="contents">
                <div class="row column text-center">
                    <h2 class="h1">설문 게시판 상세 보기</h2>
                    <hr>
                    <div class="card article">
                        <div class="card-content">
                            <form id="frm1" name="frm1" action="${path1 }/survey/sanswerInsert.do" method="post" onsubmit="return ckAuthor()">
                                <table id="table1">
                                    <tbody>
                                    <tr>
                                        <td class="title">${dto.title }</td>
                                        <input type="hidden" id="title" name="title" value="${dto.title }" >
                                    </tr>
                                    <tr>
                                        <td class="content">${dto.content }</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h2>총 답변 수 : ${totalSACount }건</h2>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 1.5em;">
                                            <input type="hidden" id="sno" name="sno" value="${dto.sno }">
                                            <input type="hidden" id="sid" name="sid" value="${sid }">
                                            <input type="text" id="q1" name="ans" value="1" readonly>
                                            <label for="q1">${dto.q1 }</label><br>
                                        </td>
                                        <td>
                                            <div style="width: 200px;" >
                                                <div style="width: ${rate }%; background-color: #ffdddd">${SAOneCount }</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <c:if test="${not empty dto.q2 }">
                                        <td>
                                                <input type="text" id="q2" name="ans" value="2" readonly>
                                                <label for="q2">${dto.q2 }</label><br>
                                        </td>
                                        <td>
                                            <div style="width: 200px;" >
                                                <div style="width: ${rate }%; background-color: #ffdddd">${SAOneCount }</div>
                                            </div>
                                        </td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <c:if test="${not empty dto.q3 }">
                                            <td>
                                                <input type="text" id="q3" name="ans" value="3" readonly>
                                                <label for="q3">${dto.q3 }</label><br>
                                            </td>
                                            <td>
                                                <div style="width: 200px;" >
                                                    <div style="width: ${rate }%; background-color: #fff6dd">${SAOneCount }</div>
                                                </div>
                                            </td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <c:if test="${not empty dto.q4 }">
                                            <td>
                                                <input type="text" id="q4" name="ans" value="4" readonly>
                                                <label for="q4">${dto.q4 }</label><br>
                                            </td>
                                            <td>
                                                <div style="width: 200px;" >
                                                    <div style="width: ${rate }%; background-color: #ffdddd">${SAOneCount }</div>
                                                </div>
                                            </td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <c:if test="${not empty dto.q5 }">
                                            <td>
                                                <input type="text" id="q5" name="ans" value="5" readonly>
                                                <label for="q5">${dto.q5 }</label><br>
                                            </td>
                                            <td>
                                                <div style="width: 200px;" >
                                                    <div style="width: ${rate }%; background-color: #ffdddd">${SAOneCount }</div>
                                                </div>
                                            </td>
                                        </c:if>
                                    </tr>

                                    <c:if test="${empty sid}">
                                    <br>
                                    <tr>
                                        <td>
                                            <p>설문은 로그인을 한 후에 참여할 수 있습니다.</p>
                                        </td>
                                    </tr>
                                    </c:if>
                                    <c:if test="${not empty sid && !sid.equals('admin')}">
                                        <tr>
                                            <td colspan="3">
                                                <a class="button is-info" href="${path1 }/survey/list.do">글 목록</a>
                                            </td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </form>
                            <div class="button-group">
                                <c:if test="${sid.equals('admin')}">
                                    <br>
                                    <a class="button is-primary" href="${path1 }/survey/delete.do?sno=${dto.sno}">글 삭제(관리자)</a>
                                    <a class="button is-danger" href="${path1 }/survey/edit.do?sno=${dto.sno}">글 수정(관리자)</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</div>
<script>
    function ckAuthor(){
        if(${result != null}) {
            alert("이미 답변을 작성하신 설문입니다.");
        } else {
            alert("설문 등록이 완료되었습니다.");
        }
    }
</script>
</body>
</html>