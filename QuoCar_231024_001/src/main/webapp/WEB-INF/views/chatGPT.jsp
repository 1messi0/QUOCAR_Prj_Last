<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>chatGPT API</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	font-family: "Arial, sans-serif";
	background-color: #f5f5f5;
	text-align: center;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 0;
}

h1 {
	background-color: #334F4F;
	color: #fff;
	padding: 80px;
	width: 100%;
	font-size: 80px;
	font-weight: bold;
	margin: 0;
}

.chat-container {
	width: 100%;
	text-align: left;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.chat-box {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 10px 0;
}

input[type="text"] {
	width: 50%;
	padding: 30px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 24px;
}

button {
	background-color: #007bff;
	color: #fff;
	font-size: 20px;
	font-weight: bold;
	border: none;
	border-radius: 3px;
	padding: 15px 25px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

#result {
	margin: 20px 0;
}

.jun {
	font-weight: bold;
	font-size: 32px;
	color: #000000;
	padding: 15px;
	border-radius: 10px;
}

#result {
    font-color: #000000;
    font-size: 24px;
    font-weight: bold;
    line-height: 1.6;
    max-width: 100%;
    word-wrap: break-word;
}

/* page-loading */
#loading {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: flex;
	justify-content: center;
	align-items: center;
	opacity: 0.6;
	background: #e4e4e4;
	z-index: 99;
	text-align: center;
}

#loading>img {
	z-index: 100;
}

#loading>p {
	z-index: 101;
}
</style>
</head>
<body>
	<h1>QuoGPT</h1>
	<br>
	<br>
	<div class="jun">무엇이든 질문하세요</div>
	<br>
	<input type="text" id="keywords" name="keywords" required />
	<br>
	<button onclick="chatGPT()">전송</button>
	<div id="result">답변내용:  <hr></div>

	<div id="loading">
		<img src="https://studentrights.sen.go.kr/images/common/loading.gif">
	</div>
	<script>
		$(document).ready(function() {
			$('#loading').hide();
		});

		function chatGPT() {
			const api_key = "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" // <- API KEY 입력
			const keywords = document.getElementById('keywords').value
			$('#loading').show();

			const messages = [ {
				role : 'system',
				content : 'You are a helpful assistant.'
			}, {
				role : 'user',
				content : keywords + '에 대하여 최대한 도움이 되는 답변을 해줘.'
			}, ]

			const data = {
				model : 'gpt-3.5-turbo',
				temperature : 0.5,
				n : 1,
				messages : messages,
			}

			$.ajax({
				url : "https://api.openai.com/v1/chat/completions",
				method : 'POST',
				headers : {
					Authorization : "Bearer " + api_key,
					'Content-Type' : 'application/json',
				},
				data : JSON.stringify(data),
			}).then(function(response) {
				$('#loading').hide();
				console.log(response)
				let result = document.getElementById('result')
				let pre = document.createElement('pre')

				pre.innerHTML = "\n\n" + response.choices[0].message.content
				result.appendChild(pre)

				document.getElementById('keywords').value = ''
			});
		}
	</script>
</body>
</html>