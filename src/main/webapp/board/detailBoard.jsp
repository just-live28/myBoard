<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>게시판 글 보기</title>
<style>
    * {
        box-sizing: border-box;
        margin: 0
    }

    div {
        /* border: 1px solid black; */
        font-family: 'Noto Sans KR', sans-serif;
    }

    ul {
        list-style-type: none;
    }

    a {
        text-decoration: none;
        color: black;
    }

    .header {
        height: 62px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .navi {
        position: relative;
        width: 100%;
        height: 80px;
        background: #f8f9fb;
        border: 1px solid #e0e2ec;
        text-align: center;
        font-size: 0;
    }

    .navi a {
        display: inline-block;
        margin: 0 25px;
        color: #898c92;
        font-size: 24px;
        line-height: 77px;
    }
    
    .navi .active {
	    color: #36393f;
	    border-bottom: 2px solid #36393f;
	}

    .content {
        position: relative;
        margin: 63px auto 0 auto;
        width: 1300px;
        min-height: 500px;
    }

    .content h3 {
        color: #151518;
        font-size: 26px;
        line-height: 34px;
        font-weight: 300;
    }

    .content .titleBox {
        padding-left: 50px;
        height: 139px;
        border: 1px solid #eeedf2;
        font-size: 22px;
        line-height: 34px;
        display: flex;
        flex-direction: column;
        align-items: start;
        justify-content: center;
        margin-top: 20px;
    }

    .content .infoBox {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0 50px 0 30px;
        height: 59px;
        color: #6a6e76;
        font-weight: 500;
        border: 1px solid #eeedf2;
        border-top: 0;
    }

    .content .infoBox .name {
        padding-left: 20px;
        font-weight: 500;
    }

    #info2 {
        margin-left: auto;
    }

    .view {
        margin-left: 60px;
        padding-left: 24px;
    }
    
    .content .fileBox{
    	color: #36393f;
    	display : none;
    }
    
    .content .fileBox a{
    	color : blue;
    }

    .bookmark {
        margin-left: 60px;
        padding-left: 21px;
    }

    .content .viewCont {
        padding: 45px 0 150px 0;
        color: #36393f;
        font-size: 16px;
        line-height: 30px;
        font-weight: 400;
    }

    .content .viewCont #bookmarkBtn {
        display: block;
        margin: 115px auto 0 auto;
        width: 200px;
        height: 60px;
        background-color: #f8f9fb;
        border: 1px solid #e0e2ec;
        border-radius: 30px;
        text-align: center;
        font-size: 16px;
        font-weight: 500;
        line-height: 56px;
        cursor: pointer;
    }

    .btnBox .leftBox {
        float: left;
    }

    .btnBox .rightBox {
        float: right;
    }

    #reportBtn {
        width: 100px;
        height: 45px;
        background: rgb(243, 66, 66);
        color: #fff;
        border: 0;
        font-size: 13px;
        font-weight: bold;
        margin-right: 10px;
    }

    #delBtn {
        width: 120px;
        height: 45px;
        background: gray;
        color: #fff;
        border: 0;
        font-size: 13px;
        font-weight: bold;
        margin-right: 10px;
    }

    #corBtn {
        width: 120px;
        height: 45px;
        background: gray;
        color: #fff;
        border: 0;
        font-size: 13px;
        font-weight: bold;
        margin-right: 10px;
    }

    #goListBtn {
        width: 120px;
        height: 45px;
        background: black;
        color: #fff;
        border: 0;
        font-size: 13px;
        font-weight: bold;
        margin-right: 10px;
    }

    #writeBtn {
        width: 120px;
        height: 45px;
        background: #3392ff;
        color: #fff;
        border: 0;
        font-size: 13px;
        font-weight: bold;
        margin-right: 10px;
    }

    .commentBox {
        position: relative;
        margin: 90px auto 0 auto;
        width: 1300px;
    }

    .commentBox .commentTitle {
        height: 36px;
        position: relative;
        margin-bottom: 20px;
        width: 1300px;
        color: #6a6e76;
        font-size: 18px;
        font-weight: 400;
        line-height: 36px;
    }

    .commentBox .commentList .cmtGroup {
        padding: 35px 0 35px 30px;
        border-top: 1px solid #eeedf2;
        border-bottom: 1px solid #eeedf2;
    }

    .comment {
        position: relative;
        width: 1300px;
    }

    .cmtUser {
        font-weight: bold;
    }

    .cmtCtt {
        padding-top: 20px;
    }

    .cmtDate {
        margin-top: 30px;
        padding-bottom: 10px;
        color: #6a6e76;
    }

    .cmtDate .cmtBtnBox {
        float: right;
        padding-right: 50px;
    }

    .writeCmtBox {
        height: 200px;
        border: 1px solid rgb(236, 233, 233);
        margin-top: 20px;
        background: #f8f9fb;
    }

    .writeCmtWriter {
        height: 50px;
        padding: 25px 0 0 25px;
        font-weight: bold;
    }

    .writeCmtCttRow {
        height: 150px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .writeCmtCtt {
        font-size: 15px;
        text-indent: 10px;
        padding-top: 10px;
        width: 1150px;
        height: 120px;
        resize: none;
        margin-bottom: 10px;
    }

    .writeCmtBtn {
        width: 100px;
        height: 120px;
        margin-left: 5px;
        margin-bottom: 10px;
    }

    .footer {
        height: 300px;
        margin-top: 160px;
        padding-top: 50px;
        border-top: 1px solid #e0e2ec;
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>

<body>
    <div class="header">Header</div>
    <div class="navi">
        <a href="/list.cboard?category=0" id="viewAll">전체</a>
        <a href="/list.cboard?category=1" id="viewC1">자유</a>
        <a href="/list.cboard?category=2" id="viewC2">공략</a>
    </div>
    <div class="content">
        <h3 id="boardTitleH3">전체</h3>
        <div class="titleBox">${DTO.cBoardTitle}</div>
        <ul class="infoBox">
            <li>
                <span class="name">${DTO.userId}</span>
            </li>
            <li id=info2>
                <span class="date">
                	<fmt:formatDate value="${DTO.cBoarDate}" pattern="MM.dd" />
                </span>
                <span class="view">
                    <i class="fa-regular fa-eye" style="color: #36393f;"></i>
                    ${DTO.cBoardView}
                </span>
                <span class="bookmark">
                    <i class="fa-regular fa-bookmark" style="color: #36393f;"></i>
                    ${DTO.cBoardReport}
                </span>
            </li>
        </ul>
        <c:choose>
        	<c:when test="${fn:length(fileList) > 0}">
        		<p class="fileOn" style="cursor:pointer;">▼ 첨부파일 목록 열기 (${fn:length(fileList)})</p>
        	</c:when> 
        
        </c:choose>
        <div class="fileBox">
        	<c:forEach var="files" items="${fileList}" varStatus="status">
					<a
						href="/download.cfile?oriname=${files.cFileOriname}&sysname=${files.cFileSysname}">${status.index + 1}.
						${files.cFileSysname}</a>
			</c:forEach>
        </div>
        <div class="viewCont">
        	${DTO.cBoardContent}
            <a id="bookmarkBtn" style="clear:both;">
                <i class="fa-regular fa-bookmark" style="color: #000000;"></i>
                북마크
            </a>
        </div>
        <div class="btnBox">
            <div class="leftBox">
                <button type="button" id="reportBtn">신고하기</button>
            </div>
            <div class="rightBox">
                <button type="button" id="goListBtn">목록</button>
                <button type="button" id="delBtn">삭제</button>
                <button type="button" id="corBtn">수정</button>
                <button type="button" id="writeBtn">글쓰기</button>
            </div>
        </div>
    </div>
    <div class="commentBox">
        <div class="commentTitle">
            댓글 2
        </div>
        <div class="commentList">
            <div class="cmtGroup">
                <div class="comment">
                    <div class="cmtUser">jkh28</div>
                    <div class="cmtCtt">6%라도 올라가는게 어디야 마이너스 받고 나락 가봐야 그때서야 진짜 정신 차리지...</div>
                    <div class="cmtDate">
                        2024.06.12 22:06
                        <div class="cmtBtnBox">
                            <button type="button" class="btn btn-outline-secondary">답글쓰기</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="writeCmtBox">
                <div class="writeCmtWriter">제2경호실장</div>
                <div class="writeCmtCttRow">
                    <textarea placeholder="비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다. (글자수 최대 1000자)" class="writeCmtCtt"
                        maxlength="1000"></textarea>
                    <button type="button" class="btn btn-dark writeCmtBtn">등록</button>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">Footer</div>
    
    <script>
	    $(document).ready(function(){
			if (${category == 1}){
				$("#viewC1").addClass("active");
				$("#boardTitleH3").html("자유");
			}else if(${category == 2}){
				$("#viewC2").addClass("active");
				$("#boardTitleH3").html("공략");
			}else{
				$("#viewAll").addClass("active");
				$("#boardTitleH3").html("전체");
			}
		});
    
    	$(".content").on("click", ".fileOn", function(){
    		$(this).html("▲ 첨부파일 목록 닫기");
    		$(this).attr("class", "fileOff");
    		$(".fileBox").css("display", "block");
    	})
    	
    	$(".content").on("click", ".fileOff", function(){
    		$(this).html("▼ 첨부파일 목록 열기 (${fn:length(fileList)})");
    		$(this).attr("class", "fileOn");
    		$(".fileBox").css("display", "none");
    	})
    	
    	$("#goListBtn").on("click", function(){
    		location.href = "/list.cboard?category=${category}&cpage=${cpage}";
    	});
    
    </script>
</body>
</html>