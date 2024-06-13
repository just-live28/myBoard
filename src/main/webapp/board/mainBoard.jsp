<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Insert title here</title>
<style>
    * {
        box-sizing: border-box;
        margin: 0
    }

    div {
        /* border: 1px solid black; */
        font-family: 'Noto Sans KR', sans-serif;
    }

    a {
        text-decoration: none;
        color: black;
    }

    input[type="text" i] {
        padding-block: 1px;
        padding-inline: 2px;
    }

    .header {
        height: 100px;
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
        font-weight: 500;
    }

    .community_header {
        position: relative;
        margin-top: 23px;
        width: 1300px;
        height: 58px;
        border-bottom: 1px solid #eeedf2;
    }

    .community_header select {
        width: 120px;
        height: 42px;
        background: #f8f9fb;
        border: 1px solid #e7e8ed;
        color: #6a6e76;
        line-height: 39px;
        cursor: pointer;
        padding: 0 0 0 10px;
    }

    .community_header #searchInput {
        padding: 0;
        margin: 0;
        width: 200px;
        height: 42px;
        border: none;
        background: #f8f9fb;
        color: #6a6e76;
        border: 1px solid #e7e8ed;
        border-right: 0;
        font-size: 14px;
        line-height: 53px;
        text-indent: 20px;
    }

    .community_header #searchForm {
        display: flex;
        justify-content: end;
        align-items: center;
    }

    .community_header #searchBtn {
        height: 42px;
        background: #f8f9fb;
        color: #6a6e76;
        border: 1px solid #e7e8ed;
        border-left: 0;
    }

    .boardList {
        position: relative;
        width: 1300px;
        border-top: 1px solid #eeedf2;
        clear: both;
    }

    .boardList ul {
        display: flex;
        align-items: center;
        padding: 17px 0 16px 0;
        border-bottom: 1px solid #eeedf2;
        list-style-type: none;
        margin-bottom:0;
    }

    .board_list ul li {
        color: #898c92;
        font-size: 14px;
        font-weight: 400;
    }

    .boardList ul li.category_type {
        margin: 0;
        width: 100px;
        font-weight: 500;
        text-align: center;
    }

    .boardList ul li.title {
        width: 680px;
        text-align: left;
        color: #36393f;
        font-size: 15px;
        cursor: pointer;
    }

    .boardList ul li.author {
        width: 160px;
    }

    .boardList ul li.date {
        width: 160px;
    }

    .boardList ul li.view {
        width: 110px;
        padding-left: 24px;
        text-align: left;
    }

    .boardList ul li.bookmark {
        width: 90px;
        padding-left: 21px;
        text-align: left;
    }

    .btnBox {
        margin-top: 30px;
        display: flex;
        justify-content: end;
    }

    .btnBox #writeBtn {
        width: 160px;
        height: 45px;
        background: #3392ff;
        color: #fff;
        border: 0;
        font-size: 13px;
        font-weight: bold;
    }

    .pageNavi {
        margin-top: 40px;
        display: flex;
        justify-content: center;
        font-size: 20px;
    }
    
    .pageNavi a{
	    display: inline-block;
	    padding: 0 10px;
	    min-width: 38px;
	    height: 36px;
	    line-height: 35px;
	    font-size: 14px;
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
</head>

<body>
    <div class="header">Header</div>
    <div class="navi">
        <a href="/list.cboard?category=0" id="viewAll">전체</a>
        <a href="/list.cboard?category=1" id="viewC1">자유</a>
        <a href="/list.cboard?category=2" id="viewC2">공략</a>
    </div>
    <div class="content">
        <h3 id="boardTitleH3">전체</h3>
        <div class="community_header">
            <form action="/searchList.cboard" id="searchForm">
                <select name="type" class="typeBox" id="searchType">
                    <option value="">검색 유형</option>
                    <option value="title">제목</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="text" id="searchInput" name="searchInput" autocomplete="off">
                <button id="searchBtn"><i class="fa-solid fa-magnifying-glass" style="color: #6a6e76;"></i></button>
                <input type="hidden" name="category" id="srcCategoryInput">
            </form>
        </div>
        <div class="boardList" data-category="${category}">
            <c:choose>
            	<c:when test="${fn:length(list) == 0}">
            		<p style="text-align:center; margin-top : 10px;">표시될 내용이 없습니다.</p>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="DTO" items="${list}">
            			<ul class="post">
                			<c:choose>
                				<c:when test="${DTO.cBoardCategory == 1}">
                					<li class="category_type">자유</li>
                				</c:when>
                				<c:otherwise>
                					<li class="category_type">공략</li>
                				</c:otherwise>
                			</c:choose>
                			<li class="title" data-no="1224">
                    			<a href="/detail.cboard?category=${category}&cpage=${cpage}&seq=${DTO.cBoardSeq}">${DTO.cBoardTitle}</a>
                			</li>
                			<li class="author">${DTO.userId}</li>
                			<li class="date">
                				<fmt:formatDate value="${DTO.cBoarDate}" pattern="yy. MM. dd" />
                			</li>
                			<li class="view"><i class="fa-regular fa-eye" style="color: #000000;"></i> ${DTO.cBoardView}</li>
                			<li class="bookmark"><i class="fa-regular fa-bookmark" style="color: #000000;"></i> ${DTO.cBoardReport}</li>
            			</ul>
            		</c:forEach>
            	</c:otherwise>
            </c:choose>
        </div>
        <div class="btnBox">
            <button type="button" id="writeBtn">글쓰기</button>
        </div>
        <div class="pageNavi"></div>
    </div>
    <div class="footer">Footer</div>
    <script>
		$("#writeBtn").on("click", function(){
			location.href = "/board/writeBoard.jsp";
		});
		
		$("#searchForm").on("submit", function(e){
			if($("#searchType").val() == ""){
				alert("검색 유형을 선택해주세요!");
				e.preventDefault();
			}else if($("#searchInput").val() == ""){
				alert("검색어를 입력해주세요!");
				e.preventDefault();
			}else{
				$("#srcCategoryInput").val($(".boardList").attr("data-category"));
			}
		});
		
		function getNaviString() {
			console.log($(".boardList").attr("data-category"));
			let currentPage = ${cpage}
			let recordTotalCount = ${record_total_count}
			let recordCountPerPage = ${record_count_per_page}
			let naviCountPerPage = ${navi_count_per_page}
			
			let pageTotalCount = 0;
			if (recordTotalCount % recordCountPerPage == 0) {
				pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage);
			} else {
				pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage) + 1;
			}
			console.log(pageTotalCount);
			
			let startNavi = Math.floor((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
			let endNavi = startNavi + naviCountPerPage - 1;
			if (endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			
			let needNext = true;
			let needPrev = true;
			
			if(pageTotalCount <= naviCountPerPage) {
				needPrev = false;
				needNext = false;
			}else if (startNavi == 1) {
				needPrev = false;
			} else if (endNavi == pageTotalCount) {
				needNext = false;
			}
			
			let naviString = "";
			if (needPrev) {
				if(${isSearchedList == 1}){
					naviString = naviString + "<a href = '/searchList.cboard?type=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=1'>《</a>";
					naviString = naviString + "<a href = '/searchList.cboard?type=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + (startNavi - 1) + "'>〈</a>";
				}else{
					naviString = naviString + "<a href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=1'>《</a>";
					naviString = naviString + "<a href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + (startNavi - 1) + "'>〈</a>";
				}				
			}
			for (let i = startNavi; i <= endNavi; i++) {
				if(${isSearchedList == 1}){
					if(i == currentPage){
						naviString = naviString + "<a class='fw-bold' href = '/searchList.cboard?type=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + i + "'>" + i + "</a> ";
					}else{
						naviString = naviString + "<a class='text-muted' href = '/searchList.cboard?type=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + i + "'>" + i + "</a> ";
					}
				}else{
					if(i == currentPage){
						naviString = naviString + "<a class='fw-bold' href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + i + "'>" + i + "</a> ";
					}else{
						naviString = naviString + "<a class='text-muted' href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + i + "'>" + i + "</a> ";
					}
				}
				
			}
			if (needNext) {
				if(${isSearchedList == 1}){
					naviString = naviString + "<a href = '/searchList.cboard?type=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + (endNavi + 1) + "'>〉</a>";
					naviString = naviString + "<a href = '/searchList.cboard?type=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + pageTotalCount + "'>》</a>";
				}else{
					naviString = naviString + "<a href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + (endNavi + 1) + "'>〉</a>";
					naviString = naviString + "<a href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + pageTotalCount + "'>》</a>";
				}
			}
			
			return naviString;
		};
		
		$(document).ready(function(){
			let naviString = getNaviString();
			$(".pageNavi").html(naviString);
			
			if ($(".boardList").attr("data-category") == 1){
				$("#viewC1").addClass("active");
				$("#boardTitleH3").html("자유");
			}else if($(".boardList").attr("data-category") == 2){
				$("#viewC2").addClass("active");
				$("#boardTitleH3").html("공략");
			}else{
				$("#viewAll").addClass("active");
				$("#boardTitleH3").html("전체");
			}
		});
    </script>
</body>
</html>