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
<script src="summernote/summernote-lite.js"></script>
<script src="summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="summernote/summernote-lite.css">
<title>글 작성 페이지</title>
<style>
        * {
            box-sizing: border-box;
            margin: 0
        }
		
		.dropdown-toggle::after { display: none; }
		
        input[type="text" i] {
            padding-block: 1px;
            padding-inline: 2px;
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
        
        .navi #naviAnker{
        	color: #36393f;
	    	border-bottom: 2px solid #36393f;
        }

        .writeBoard {
            position: relative;
            margin: 63px auto 0 auto;
            width: 1300px;
            min-height: 500px;
        }

        .writeBoard h3 {
            color: #151518;
            font-size: 26px;
            line-height: 34px;
            font-weight: 300;
            padding-bottom: 20px;
            padding-left: 10px;
        }

        .writeBoard .category {
            position: relative;
            padding-left: 9px;
            border-top: 1px solid #eeedf2;
            height: 70px;
            display: flex;
            align-items: center;
        }

        .writeBoard .title {
            border-top: 1px solid #eeedf2;
        }

        .writeBoard .title input {
            width: 100%;
            height: 70px;
            line-height: 70px;
            border: none;
            font-size: 16px;
            color: #6a6e76;
            text-indent: 20px;
        }

        .writeBoard .fileBox {
            height: auto;
            width: 100%;
            border-top: 1px solid #eeedf2;
            border-bottom: 1px solid #eeedf2;
            display: flex;
            flex-direction: column;
            padding: 10px 0;
        }

        .writeBoard .fileBox .uploadCol {
            display: flex;
            align-items: center;
            padding: 1px;
            flex: 1;
        }

        .writeBoard .fileBox .uploadCol input {
            margin-right: 10px;
        }

        .writeBoard .fileBox .uploadCol button {
            width: 37px;
        }


        .writeBoard .fileBox .uploadCol #removeFileBtn {
            display: none;
            margin-right: 5px;
        }
		
		.note-editable{
			height : 500px;
		}

        .btnBox {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }

        .btnBox #writeNoBtn {
            width: 160px;
            height: 45px;
            background: gray;
            color: #fff;
            border: 0;
            font-size: 13px;
            font-weight: bold;
            margin-right : 10px;
        }
        .btnBox #writeYesBtn {
            width: 160px;
            height: 45px;
            background: #3392ff;
            color: #fff;
            border: 0;
            font-size: 13px;
            font-weight: bold;
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
        <a href="/list.cboard?category=0" data-category="category_0" id="naviAnker">전체</a>
        <a href="/list.cboard?category=1" data-category="category_1">자유</a>
        <a href="/list.cboard?category=2" data-category="category_2">공략</a>
    </div>
    <form action="/write.cboard" method="post" id="writeForm" enctype="multipart/form-data">
	    <div class="writeBoard">
	        <h3>jkh28님의 글</h3>
	        <div class="category">
	            <div class="form-check form-check-inline">
	                <input class="form-check-input" type="radio" name="category" id="category1"
	                    value="option1">
	                <label class="form-check-label" for="inlineRadio1">자유</label>
	            </div>
	            <div class="form-check form-check-inline">
	                <input class="form-check-input" type="radio" name="category" id="category2"
	                    value="option2">
	                <label class="form-check-label" for="inlineRadio2">공략</label>
	            </div>
	        </div>
	        <div class="title">
	            <input type="text" placeholder="제목을 입력해 주세요" name="title" id="titleInput" maxlength="100">
	        </div>
	        <div class="fileBox">
	            <div class="col-12 uploadCol">
	                <input class="form-control" type="file" id="formFileMultiple" name="file">
	                <button class="btn btn-danger" id="removeFileBtn" type="button">C</button>
	                <button class="btn btn-primary" id="addFileTab" type="button">+</button>
	            </div>
	        </div>
	        <div class="editorBox">
	        	<div id="summernote"></div>
	        </div>
	        <div class="btnBox">
	        	<button type="button" id="writeNoBtn">취소</button>
	        	<button id="writeYesBtn">등록</button>
	    	</div>
	    </div>
	    <input type="hidden" name="content" id="contentInput">
    </form>
    <div class="footer">Footer</div>
    

    <script>
    	$("#writeNoBtn").on("click", function(){
			let isCancel = confirm("작성중인 글은 사라집니다. 계속하시겠습니까?");
			
			if(isCancel){
				location.href = "/list.cboard";
			}
    	});
    
	    $(document).ready(function(){
	    	let maxLength = 3000;
	    	function updateCharCount() {
		        let textLength = $('#summernote').next('.note-editor').find('.note-editable').text().length;
		        $('#charCount').text(textLength + '/' + maxLength + '자');
		      }
	    	
	    	$('#summernote').summernote({
	    	height : '500px', // 에디터 높이
	    	focus: true, // 에디터 로딩후 포커스를 맞출지 여부
	    	lang: "ko-KR", // 한글 설정
	    	toolbar: [ // 툴바 설정
	    	['fontname', ['fontname']],
	    	['fontsize', ['fontsize']],
	    	['color', ['color']],
	    	['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    	['para', ['ul', 'ol', 'paragraph']],
	    	['height', ['height']]
	    	],
	    	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	    	fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','32','36','48','60'],
	    	callbacks: {
		          onKeydown: function(e) {
		            let textLength = $('#summernote').next('.note-editor').find('.note-editable').text().length;
		            if (textLength >= maxLength && e.keyCode !== 8 && e.keyCode !== 46) {
		              e.preventDefault();
		            }
		          },
		          onKeyup: function() {
		            updateCharCount();
		          },
		          onPaste: function(e) {
		            let clipboardData = e.originalEvent.clipboardData || window.clipboardData;
		            let pastedData = clipboardData.getData('Text');
		            let textLength = $('#summernote').next('.note-editor').find('.note-editable').text().length;
		            if (textLength + pastedData.length > maxLength) {
		              e.preventDefault();
		              let allowedData = pastedData.substring(0, maxLength - textLength);
		              document.execCommand('insertText', false, allowedData);
		            }
		            setTimeout(updateCharCount, 100); // 붙여넣기 후 글자 수 업데이트
		          }
		        }
		      }).on('summernote.change', function() {
		        updateCharCount();
		      });
	    	$('#summernote').summernote('fontSize', '16');
	        $('#summernote').summernote('fontSizeUnit', 'pt');
	    	});
	    
	    
    
        $("#formFileMultiple").on("input", function () {
            $("#removeFileBtn").css("display", "block");
        });

        $("#removeFileBtn").on("click", function () {
            $("#formFileMultiple").val("");
            $("#removeFileBtn").css("display", "none");
        });

        let count = 1;
        $("#addFileTab").on("click", function () {
            if (count > 4) {
                return;
            }

            let uploadCol = $("<div>");
            uploadCol.attr("class", "uploadCol");

            let uploadInput = $("<input>");
            uploadInput.attr("class", "form-control");
            uploadInput.attr("type", "file");
            uploadInput.attr("name", "file" + count);
            uploadCol.append(uploadInput);

            let uploadDelButton = $("<button>");
            uploadDelButton.html("-");
            uploadDelButton.attr("class", "btn btn-danger delUploadRow");
            uploadDelButton.attr("type", "button");
            uploadCol.append(uploadDelButton);

            $(".fileBox").append(uploadCol);
            count = count + 1;
        });

        $(".fileBox").on("click", ".delUploadRow", function () {
            $(this).closest(".uploadCol").remove();
            count = count - 1;
        });
        
        $("#writeForm").on("submit", function(e) {
        	if ( !$('input:radio[name=category]').is(':checked') ){
        		alert("카테고리를 선택해주세요!");
				e.preventDefault();
        	}else if ($("#titleInput").val() == "") {
				alert("제목을 입력해주세요!");
				console.log($('#category1').prop('disabled'));
        		console.log($('#category2').prop('disabled'));
				e.preventDefault();
﻿			} else {
				$("#contentInput").val($('#summernote').summernote('code'));
			}
		});
        
        $(".navi a").on("click", function(e){
			let isCancelWrite = confirm("작성중인 글은 사라집니다. 계속하시겠습니까?");
			
			if(!isCancelWrite){
				e.preventDefault();
			}
			
		});
    </script>
</body>
</html>