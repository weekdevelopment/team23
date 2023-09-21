<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자유게시판 글 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="container is-fullhd">
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="columns">
        <div class="column is-2">
            <aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					커뮤니티
				</span>
                <ul class="menu-list">
                    <li>
                        <a href="${path1}/free/list.do">자유게시판</a>
                    </li>
                    <li>
                        <a href="#">교재게시판</a>
                    </li>
                </ul>
            </aside>
        </div>
        <div class="column is-10">
            <div class="conwrap">
                <div class="box">
                    <%--<h6>자유게시판</h6>--%>
                    <span class="title">자유게시판</span>
                </div>
            </div>

            <div class="card article">
                <div class="card-content">
                    <div class="media">
                        <div class="media-content has-text-centered">
                            <h1 class="title article-title">${freeDTO.title }</h1>
                            <h6 class="subtitle is-6 article-subtitle">
                                ${freeDTO.id } | ${freeDTO.regdate } | 조회수:${freeDTO.visited }
                            </h6>
                        </div>
                    </div>
                    <hr>

                    <div class="content article-body">
                        <p>
                            ${freeDTO.content }
                        </p>
                    </div>
                </div>

                <div class="img-container">
                    <input type="hidden" id="rec_check" value="${recoDTO.flag }">
                    <%--<h1>${recoDTO.flag } </h1>--%>
                    <img src="${path1}/resources/img/before_rec.png" id="recimg" width="70px" height="70px">
                </div>
                <p class="has-text-centered has-text-info has-text-weight-bold is-size-5 is-large" id='thumbCnt'>
                    ${freeDTO.rec }
                </p>

                <div class="columns mt-5">
                    <div class="column is-3"></div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-info" href="${path1 }/free/list.do">글 목록</a>
                    </div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-primary" href="${path1 }/free/edit.do?bno=${freeDTO.bno}">글 수정</a>
                    </div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-danger" href="${path1 }/free/delete.do?bno=${freeDTO.bno}">글 삭제</a>
                    </div>
                    <div class="column is-3"></div>
                </div>
            </div>

            <div class="cmtwrap">
                <form action="/" method="post" class="columns mt-5">
                    <div class="column is-10">
                        <textarea class="textarea" name="content" id="content" placeholder="댓글을 입력해주세요."  rows="2" cols="30" maxlength="800" required></textarea>
                    </div>
                    <div class="column is-2">
                        <button type="submit" class="button is-fullwidth submission">등록</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>

<script>
    $(document).ready(function () {
        const bno = '${freeDTO.bno }';
        const id = "${sid }";
        let recoCnt = Number("${freeDTO.rec }"); // 임시

        console.log('bno:'+bno);
        console.log('id:'+id);
        const recImage = document.getElementById("recimg")



        console.log('recImage:'+recImage.src);
        let recval = document.getElementById('rec_check').value;
        if (recval > 0) {
            recimg.src = "${path1}/resources/img/after_rec.png";
        } else {
            recimg.src = "${path1}/resources/img/before_rec.png";
        }
        // 좋아요 버튼을 클릭 시 실행되는 코드
        $("#recimg").on("click", function () {
            console.log('id:'+id);

            if (!id) {
                alert("추천은 로그인 후에 가능합니다."); // 로그인되어 있지 않으면 경고창 표시
                return; // 함수 종료
            }

            $.ajax({
                url: '${path1}/free/rec',
                type: 'POST',
                data: { 'bno': bno, 'id': id, 'recoCnt': recoCnt},
                success: function (data) {
                    if (data == 1) {
                        $("#recimg").attr("src", "${path1}/resources/img/after_rec.png");
                        $("#thumbCnt").html(recoCnt + 1);
                        //location.reload();
                    } else {
                        //$("#recimg").attr("src", "${path1}/resources/img/before_rec.png");
                        alert("이미 추천한 게시물입니다.");
                        //location.reload();
                    }
                }, error: function () {
                    $("#recimg").attr("src", "${path1}/resources/img/after_rec.png");
                    console.log('오타 찾으세요')
                }
            });
        });
    });
</script>
</body>
</html>