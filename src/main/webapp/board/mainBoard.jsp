<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
        /* color: #898c92; */
        color: black;
        font-size: 24px;
        line-height: 77px;
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

    .boardList ul li.category {
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
        <a href="mainboard.html" data-category="category_0">전체</a>
        <a href="mainboard.html" data-category="category_1">자유</a>
        <a href="mainboard.html" data-category="category_2">공략</a>
    </div>
    <div class="content">
        <h3>전체</h3>
        <div class="community_header">
            <form id="searchForm">
                <select name="type" class="typeBox">
                    <option value="">검색 유형</option>
                    <option value="title">제목</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="text" id="searchInput" name="searchInput" autocomplete="off">
                <button id="searchBtn"><i class="fa-solid fa-magnifying-glass" style="color: #6a6e76;"></i></button>
            </form>
        </div>
        <div class="boardList">
            <ul class="post">
                <li class="category">자유</li>
                <li class="title" data-no="1224">
                    <a href="#">이것은 테스트용 글입니다.</a>
                </li>
                <li class="author">jkh28</li>
                <li class="date">2024.06.11</li>
                <li class="view"><i class="fa-regular fa-eye" style="color: #000000;"></i> 12,228</li>
                <li class="bookmark"><i class="fa-regular fa-bookmark" style="color: #000000;"></i> 15</li>
            </ul>
        </div>
        <div class="btnBox">
            <button type="button" id="writeBtn">글쓰기</button>
        </div>
        <div class="pageNavi">1 2 3 4 5 6 7 8 9</div>
    </div>
    <div class="footer">Footer</div>
    <script>
		$("#writeBtn").on("click", function(){
			location.href = "/board/writeBoard.jsp";
		});
    </script>
</body>
</html>