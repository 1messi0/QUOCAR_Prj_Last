<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuoCar</title>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="shortcut icon" href="/img/쿼카얼굴.ico">
<link rel="stylesheet" href="/css/common.css" />
<style>
body {
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	margin: 0;
	padding: 0;
}

h2 {
	font-size: 24px;
	font-weight: bold;
	text-align: center;
	margin-top: 20px;
}

/* 전체 폼 스타일 수정 */
form {
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width: 1000px;
	margin: 20px auto;
	padding: 40px;
	background-color: #f5f5f5;
	border: 1px solid #ccc;
	border-radius: 15px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	text-align: center;
}

/* 입력 필드 및 텍스트 영역 스타일 수정 */
input, textarea {
	width: 100%;
	padding: 15px;
	margin: 10px 0;
	border: 2px solid #ccc;
	border-radius: 10px;
	background-color: #f8f8f8;
	transition: border-color 0.3s, box-shadow 0.3s;
}

/* 내부 정렬을 중앙에 맞추기 */
form>* {
	text-align: center;
}

/* 제목 스타일 수정 */
#title {
	font-size: 25px; /* 큰 제목 폰트 크기 */
	font-weight: 600; /* 더 진한 폰트 두께 */
	color: #333;
	margin: 20px 0;
	text-transform: uppercase; /* 대문자 변환 추가 */
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* 텍스트 그림자 추가 */
}

/* 텍스트 영역 스타일 수정 */
#content {
	resize: vertical;
	min-height: 300px; /* 높이를 늘림 */
	padding: 40px; /* 패딩을 늘림 */
	font-size: 20px; /* 본문 폰트 크기 조정 */
	line-height: 1.5; /* 줄 간격을 늘림 */
}

/* 버튼 스타일 수정 */
#btnSave, button[type="reset"] {
	padding: 15px 40px;
	background: linear-gradient(45deg, #333, #000);
	color: #fff;
	border: none;
	border-radius: 10px;
	margin: 20px 0;
	cursor: pointer;
	text-transform: uppercase;
	font-weight: bold;
	font-size: 20px; /* 버튼 폰트 크기 조정 */
	transition: background-color 0.3s, transform 0.2s;
	/* Added transform property for animation */
}

#btnSave:hover, button[type="reset"]:hover {
	background-color: #0056b3;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transform: scale(1.05); /* Scale the button on hover for animation */
}

/* 고정 버튼 스타일 수정 */
.fixed-button {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: #ff4d00; /* 애플스러운 색상 사용 */
	color: #fff;
	border: none;
	border-radius: 50%;
	padding: 18px;
	text-decoration: none;
	transition: background-color 0.3s;
}

.fixed-button img {
	width: 80px;
	height: 80px;
}

.fixed-button:hover {
	background-color: #ff3a00; /* 호버 시 색상 변경 */
}

.title-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 20px 0;
	text-align: center;
}

/* 제목 스타일 수정 */
#title {
	width: 100%;
	padding: 15px;
	border: 2px solid #ccc;
	border-radius: 10px;
	background-color: #f8f8f8;
	transition: border-color 0.3s, box-shadow 0.3s;
}

/* 내용 텍스트 영역 스타일 수정 */
#content {
	resize: vertical;
	min-height: 200px;
	padding: 1px;
	text-align: center; /* 수평 중앙 정렬 */
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	font-size: 22px; /* 폰트 크기를 28px로 조정 */
}

#content textarea {
	width: 100%;
	text-align: left; /* 내용은 왼쪽 정렬 */
	margin: 0 auto; /* 가운데 정렬 추가 */
}

/* 파일 업로드 버튼 컨테이너 스타일 */
.file-upload-container {
	display: flex;
	align-items: center;
	justify-content: center;
	border: 2px solid #3498db;
	border-radius: 5px;
	padding: 10px;
	background-color: #f0f0f0;
	cursor: pointer;
	transition: background-color 0.3s;
    cursor: pointer;
}

.file-label {
	display: flex;
	flex-direction: column;
	align-items: center;
	color: #3498db;
}

.file-icon {
	font-size: 24px;
}

.file-text {
	font-size: 16px;
}

.file-input {
	display: none;
}

footer {
	position: fixed; /* 화면 아래에 고정 */
	left: 0;
	bottom: 0;
	width: 100%; /* 전체 너비로 확장 */
	background-color: #333; /* 배경색 지정 (원하는 색상으로 변경) */
	color: #fff; /* 글자색 지정 (원하는 색상으로 변경) */
	text-align: center; /* 텍스트 가운데 정렬 */
	padding: 10px 0; /* 상하 여백 설정 */
}

</style>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnSave").click(function() {
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;
			var title   = $("#title").val();
			var content = $("#content").val();
			//var writer  = $("#writer").val();

			if (title === null || title == "") {
				alert("제목을 입력하세요.");
				document.form1.title.focus();
				return;
			}
			if (content === null || content == "") {
				alert("내용을 입력하세요.");
				document.form1.content.focus();
				return;
			}
			/* if (writer === null || writer == "") {
				alert("닉네임을 입력하세요.");
				document.form1.writer.focus();
				return;
			} */
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
	});

	document.getElementById('uploadButton').addEventListener('click',
			function() {
				var fileInput = document.getElementById('file');
				if (fileInput.files.length > 0) {
					var formData = new FormData();
					formData.append('file', fileInput.files[0]);

					// AJAX를 사용하여 파일 업로드 처리
					var xhr = new XMLHttpRequest();
					xhr.open('POST', '/upload-endpoint'); // 실제 업로드 처리 URL로 변경
					xhr.send(formData);

					xhr.onreadystatechange = function() {
						if (xhr.readyState === 4 && xhr.status === 200) {
							// 파일 업로드 완료 후 처리할 로직
							alert('파일이 업로드되었습니다.');
						}
					};
				} else {
					alert('파일을 선택하세요.');
				}
			});

	$(document).ready(function() {
		$("#uploadButton").click(function() {
			$("#file").click(); // 파일 선택 입력 필드 클릭
		});

		// 파일 선택 입력 필드의 값이 변경되었을 때 파일 업로드를 처리
		$("#file").change(function() {
			var fileInput = $(this)[0];
			if (fileInput.files.length > 0) {
				var formData = new FormData();
				formData.append('file', fileInput.files[0]);

				// AJAX를 사용하여 파일 업로드 처리
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '/upload-endpoint'); // 실제 업로드 처리 URL로 변경
				xhr.send(formData);

				xhr.onreadystatechange = function() {
					if (xhr.readyState === 4 && xhr.status === 200) {
						// 파일 업로드 완료 후 처리할 로직
						alert('파일이 업로드되었습니다.');
					}
				};
			} else {
				alert('파일을 선택하세요.');
			}
		});
	});
</script>
</head>

<body>
	<h2   style="font-size: 15px; font-weight: bold;">게시글 작성</h2>
	<form name="form1" method="post" action="${path}/board/insert.do">
		<div class="form-container">
			<input name="title" id="title" size="100" placeholder="제목을 입력해주세요">
			<label for="file" class="file-label"> <span class="file-icon">📂</span>
				<span class="file-text">파일 선택</span>
			</label> <input type="file" name="file" id="file" class="file-input">
		</div>
		<div>
			<textarea name="content" id="content" rows="4" cols="80"
				      placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div style="width: 650px; text-align: center;">
			<button type="button" id="btnSave">확인</button>
			&nbsp;
			<button type="reset">삭제</button>
		</div>
	</form>
	<a href="/Chat/List3?model_id=MD01" class="fixed-button"> <img
	src="/img/bot.png" alt="Q 봇" style="width: 70px; height: 70px;">
	</a>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>

