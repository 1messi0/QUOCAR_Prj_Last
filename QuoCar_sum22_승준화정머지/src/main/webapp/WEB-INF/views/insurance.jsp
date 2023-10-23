<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insurance</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/insurance.css" />
<link rel="icon" type="image/x-icon" href="/img/쿼카얼굴.png">
<script>
	function openModal(type) {
		var modalId = type === 'individual' ? 'individualModal'
				: 'corporateModal';
		var modal = document.getElementById(modalId);
		modal.style.display = "block";
	}

	function closeModal(type) {
		var modalId = type === 'individual' ? 'individualModal'
				: 'corporateModal';
		var modal = document.getElementById(modalId);
		modal.style.display = "none";
	}

	function submitIndividualInfo() {
		// 이 부분에서 개인 정보를 처리하는 코드를 작성합니다.
		// 정보를 저장하고 모달을 닫을 수 있습니다.
		closeModal('individual');
	}

	function submitCorporateInfo() {
		// 이 부분에서 법인 정보를 처리하는 코드를 작성합니다.
		// 정보를 저장하고 모달을 닫을 수 있습니다.
		closeModal('corporate');
	}

	// 사용자가 모달 외부를 클릭하면 모달을 닫을 수 있도록
	window.onclick = function(event) {
		var individualModal = document.getElementById('individualModal');
		var corporateModal = document.getElementById('corporateModal');

		if (event.target === individualModal) {
			individualModal.style.display = "none";
		} else if (event.target === corporateModal) {
			corporateModal.style.display = "none";
		}
	}

	function maskSSN(inputField) {
		// Get the value of the second SSN input field
		var ssn2Value = inputField.value;

		// Replace all characters in the input field with "*"
		var maskedSSN = ssn2Value.replace(/./g, '*');

		// Set the value of the input field to the masked value
		inputField.value = maskedSSN;
	}

	function submitIndividualInfo() {
		// 여기에서 개인 정보를 저장하고 다음 화면으로 넘어가는 로직을 추가하세요.

		// 모달을 닫음
		closeModal('individual');

		// 보험료 계산 중 모달을 표시
		showLoadingModal();
	}

	function submitCorporateInfo() {
		// 여기에서 법인 정보를 저장하고 다음 화면으로 넘어가는 로직을 추가하세요.

		// 모달을 닫음
		closeModal('corporate');

		// 보험료 계산 중 모달을 표시
		showLoadingModal();
	}

	function showLoadingModal() {
		document.getElementById('loadingModal').style.display = 'block';
	}

	// 이전과 동일한 closeModal 함수 정의 (모달을 닫는 역할)
	function closeModal(modalId) {
		var modal = document.getElementById(modalId + 'Modal');
		modal.style.display = 'none';
	}

	function startIndividualCalculation() {
	    // 여기에서 개인 정보를 저장하고 "보험료 계산 중..." 모달을 표시합니다.
	    // 이 과정을 시뮬레이션하기 위해 setTimeout을 사용합니다.
	    showLoadingModal();

	    // 시뮬레이션을 위해 3초 후에 "보험료 계산 완료" 모달을 표시합니다.
	    setTimeout(function() {
	        closeLoadingModal();
	        showCalculationCompleteModal();
	    }, 3000);
	}

	function showLoadingModal() {
	    document.getElementById('loadingModal').style.display = 'block';
	}

	function closeLoadingModal() {
	    document.getElementById('loadingModal').style.display = 'none';
	}

	function showCalculationCompleteModal() {
	    var userName = document.getElementById('name').value; // 입력받은 이름
	    var insuranceAmount = 5000; // 예시로 5000원의 보험금 설정, 실제로는 계산해야 합니다

	    document.getElementById('userName').textContent = userName;
	    document.getElementById('insuranceAmount').textContent = insuranceAmount;
	    document.getElementById('calculationCompleteModal').style.display = 'block';
	}

	// 이전과 동일한 closeModal 함수 정의 (모달을 닫는 역할)
	function closeModal(modalId) {
	    var modal = document.getElementById(modalId + 'Modal');
	    modal.style.display = 'none';
	}
</script>


<style>

body {
    margin: 0;
    padding: 0;
}

/* h3 {
	font-size: 28px;
	color: #333;
	text-align: center;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 10px;
/* 	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
 } */
 
h2 {
	font-size: 28px;
	color: #fff;
	text-align: center;
	padding: 20px;
	background-color: #334F4F;
	border: 1px solid #ddd;
	border-radius: 10px;
 	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
 } 

.insurance-details {
	font-size: 30px; /* 원하는 글자 크기로 변경하세요 */
}

.detail-label {
	font-size: 26px; /* 원하는 글자 크기로 변경하세요 */
}

/* CSS 스타일 수정 */
.form-container {
	text-align: center;
	margin: 0 auto; /* 가운데 정렬 */
	width: 1000px; /* 너비 조정 */
}

.radio-group {
	display: inline-block;
	border: 2px solid #d1d1d1;
	border-radius: 15px;
	padding: 20px; /* 내부 여백 늘림 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

.radio-group label {
	display: inline-block;
	padding: 120px 130px; /* 내부 여백 늘림, 버튼 크기 더 크게 조정 */
	border: 3px solid #007bff; /* 두께를 더 크게 조정 */
	border-radius: 20px; /* 더 라운드한 모서리로 만듦 */
	cursor: pointer;
	margin: 5px;
	font-size: 24px; /* 폰트 크기 조정 */
	font-weight: bold;
	transition: background-color 0.3s, color 0.3s; /* 호버 효과 부드럽게 변경 */
}

.radio-group label:hover {
	background-color: #007bff;
	color: #fff;
}

.radio-group input[type="radio"] {
	display: none;
}

.radio-group input[type="radio"]:checked+label {
	background-color: #0056b3;
	color: #fff;
}

.radio-group input[type="radio"]:checked+label:hover {
	background-color: #003a75;
}

label {
	display: inline-block;
	margin: 0 10px;
	font-size: 20px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

/* 스타일된 버튼 */
button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 3px;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.2s; /* 부드러운 hover 효과를 추가 */
}

button:hover {
	background-color: #0056b3;
}

/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px; /* 내부 폭 조정 */
	background: #fff; /* 배경색 흰색 */
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
	text-align: center;
	color: #333; /* 글자색 어두운 회색 */
}

/* 모달 내부 폼 스타일 */
.modal form {
	text-align: left;
	padding: 20px;
}

/* 모달 레이블 스타일 */
.modal label {
	display: block;
	margin-top: 10px;
	font-weight: bold;
}

/* 모달 인풋 필드 스타일 */
.modal input[type="text"] {
	width: 90%; /* 칸의 가로 넓이를 조정 */
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 20px;
}

/* 주민등록번호 입력 칸을 나란히 가로로 배치 */
.modal #ssn1, .modal #ssn2 {
	width: 20%; /* 칸의 가로 넓이를 조정 */
	display: inline-block;
}

/* 모달 버튼 스타일 */
.modal button {
	padding: 20px 30px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	margin: 10px 5px; /* 내부 버튼 간격 조정 */
}

/* 보험료 조회 버튼 스타일 끝 */
.content-container {
	font-family: 'Noto Sans KR', sans-serif;
	white-space: nowrap;
	width: 100%; /* .content-container의 너비 100% 설정 */
	display: flex;
	flex-wrap: nowrap;
	justify-content: center; /* 가운데 정렬 */
	align-items: center;
}

.centered-image {
    display: block;
    margin: 0 auto;
    border-radius: 10px;
    max-width: 30%;
    text-align: center;
    transition: transform 0.2s, box-shadow 0.2s;
}

.centered-image:hover {
    transform: scale(1.1); /* 이미지 확대 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 그림자 효과 추가 */
}

.centered-image img {
	width: 100%; /* Set the width to 100% to fit within the container */
	height: auto;
	/* Automatically adjust the height to maintain aspect ratio */
}

p1 {
	font-size: 18px;
	margin-top: 10px;
	text-align: center;
}

.content-container>div {
	flex: 0 0 auto;
	max-width: 40%;
	margin-right: 50px; /* 각 요소 사이의 간격을 조절할 수 있습니다. */
	text-align: center;
}

table tr td input[name=tel] {
	width: 40px;
}

table tr td input[name=addr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}

.ui-datepicker select {
	vertical-align: middle;
	height: 32px;
}

.valid, .invalid {
	font-size: 18px;
	font-weight: bold;
}

.valid {
	color: green;
}

.invalid {
	color: red;
}

}
a:link, a:visited {
	text-decoration: none;
	color: #000;
}

#content {
	padding: 20px 0;
	min-width: 1024px; /* 창의 최소 크기 지정 */
}

img {
	vertical-align: middle; /* 세로축 가운데 정렬 */
}

table {
	width: 80%;
	margin: 0 auto;
	border: 1px solid;
	border-collapse: collapse; /* 테두리 겹침 설정 collapse: 겹치지 않게 처리 */
}

table th, table td {
	border: 1px solid;
	padding: 5px 10px;
}

table td a:hover {
	font-weight: bold;
}

.btnSet {
	margin-top: 20px;
}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 3px 10px;
	border: 1px solid #3367d6;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill {
	background-color: #3367d6;
	color: #fff;
}

a.btn-empty {
	background-color: #fff;
	color: #3367d6
}

a.btn-fill-s, a.btn-empty-s {
	text-align: center;
	padding: 1px 10px;
	border: 1px solid #c4dafc border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	font-size: 13px;
}

a.btn-fill-s {
	background-color: #bacdfa;
}

a.btn-empty-s {
	background-color: #fff;
}

.btnSet a:not(:first-child) {
	margin-left: 3px;
}

a:hover {
	cursor: pointer;
}

input {
	height: 22px;
	padding: 3px 5px;
	font-size: 15px;
}

input[type=radio] {
	width: 30px;
	margin: 0 5px 3px;
	vertical-align: middle;
}

input[type="submit"] {
	display: block;
	margin: 0 auto;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

table tr td label:not(:last-child) {
	margin-right: 20px;
}

.w-pct60 {
	width: 15%
}

.w-px160 {
	width: 100px
}

.font-img {
	cursor: pointer;
}

/* 스피너 애니메이션 스타일 */
.loading-spinner {
	border: 6px solid #f3f3f3;
	border-top: 6px solid #3498db;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	animation: spin 3s linear infinite;
	margin: 0 auto 20px auto;
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<br>
	<br>
	<br>
	<div class="content-container">
		<div style="max-width: 30%;">
			<a href="https://www.axa.co.kr/index_email_relay.jsp"> <img
				src="/img/악사.jpg" alt="axa" class="centered-image"> <br>
				<p1>AXA 다이렉트 자동차보험</p1>
			</a>
		</div>
		<div style="max-width: 30%;">
			<a
				href="https://store.meritzfire.com/auto-and-driver/direct-auto.do#!/contractPopup">
				<img src="/img/메리츠.jpg" alt="meritz" class="centered-image"> <br>
				<p1>메리츠 다이렉트 자동차보험</p1>
			</a>
		</div>
		<div style="max-width: 30%;">
			<a href="https://direct.samsungfire.com/"> <img
				src="/img/삼성화재.png" alt="samsung" class="centered-image"> <br>
				<p1>삼성화재 다이렉트 자동차보험</p1>
			</a>
		</div>
		<div style="max-width: 30%;">
			<a
				href="https://www.carrotins.com/desktop/calculation/car/personal/?utm_campaign=car&utm_source=google_main_pc&utm_medium=search_keyword&utm_content=company-k&utm_term=%EC%BA%90%EB%A1%AF%EB%B3%B4%ED%97%98&afccd=PA00459&afcDtcd=GOOGLE1_SA_B_PC_EXACT&afcDtFlgcd=%EC%BA%90%EB%A1%AF%EB%B3%B4%ED%97%98&main=y&gad=1&gclid=CjwKCAjw4P6oBhBsEiwAKYVkqz6-aRy-Kl-4a_AD_6QJOvuB9tLiKn6swQKpd-G1WtrHZpwLuZvMlhoCoHgQAvD_BwE">
				<img src="/img/carr.jpg" alt="samsung" class="centered-image">
				<br> <p1>캐롯 다이렉트 자동차보험</p1>
			</a>
		</div>
		<div style="max-width: 30%;">
			<a
				href="https://direct.kbinsure.co.kr/home/#/MAIN_0001M?pid=1090041&code=0022&utm_source=Google&utm_medium=google%20CPC(%EC%9D%BC%EB%B0%98_%EB%B8%8C%EB%9E%9C%EB%93%9CKW)&utm_term=KB%EB%8B%A4%EC%9D%B4%EB%A0%89%ED%8A%B8%EC%9E%90%EB%8F%99%EC%B0%A8%EB%B3%B4%ED%97%98&utm_campaign=0706_1231_google_sa&utm_content=10900410022&gclid=CjwKCAjwyY6pBhA9EiwAMzmfwWKBFftNu7lPPonI3C64BYD5TFinjOkjxZv5HuFrFFifc82G7RZEfxoCBq4QAvD_BwE">
				<img src="/img/KB.png" alt="kb" class="centered-image"> <br>
				<p1>KB 다이렉트 자동차보험</p1>
			</a>
		</div>
		<div style="max-width: 30%;">
			<a
				href="https://www.directdb.co.kr/product/at/pvuatarc/step1/formStepPre.do?src=adwords&kw=07C618&partner_code=C457&keyword=KGM964776&utm_source=google_pc&utm_medium=cpc&utm_campaign=nhnad&utm_term=DB%EB%8B%A4%EC%9D%B4%EB%A0%89%ED%8A%B8%EB%B3%B4%ED%97%98%28%EA%B5%AC%EB%AC%B8%29&nbsrc=adwords_g&nbkw=db%EB%8B%A4%EC%9D%B4%EB%A0%89%ED%8A%B8%EB%B3%B4%ED%97%98&gad=1&gclid=CjwKCAjwyY6pBhA9EiwAMzmfwcY4g4HltcX1YMhTq9cKaQgpJJdL0yFCqHtpFnZQbAoyThxre1OnjRoC8X4QAvD_BwE">
				<img src="/img/db.jpg" alt="db" class="centered-image"> <br>
				<p1>DB 다이렉트 자동차보험</p1>
			</a>
		</div>
	</div>
	<br>
	<br>
	<br>

	<h2>내 보험료 조회</h2>
	<br>
	<br>
	<div class="form-container">
		<div class="radio-group">
			<label> <input type="radio" name="insuranceType"
				value="individual" onclick="openModal('individual')"> 개인
			</label> <label> <input type="radio" name="insuranceType"
				value="corporate" onclick="openModal('corporate')"> 법인
			</label>
		</div>
	</div>

	<!-- 개인 정보 입력 모달 -->
	<div id="individualModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('individual')">&times;</span>
			<h2>개인 정보 입력</h2>
			<form>
				<label for="name">이름:</label> <input type="text" id="name"
					name="name" required><br> <label for="ssn">주민번호:</label>
				<input type="text" id="ssn1" name="ssn1" required> - <input
					type="text" id="ssn2" name="ssn2" required oninput="maskSSN(this)"><br>
				<label for="carNumber">차대번호:</label> <input type="text"
					id="carNumber" name="carNumber" required><br> <br>

				<button type="button" onclick="startIndividualCalculation()">확인</button>
				<button type="button" onclick="closeModal('individual')">닫기</button>
			</form>
		</div>
	</div>

	&nbsp; &nbsp;

	<!-- 법인 정보 입력 모달 -->
	<div id="corporateModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('corporate')">&times;</span>
			<h2>법인 정보 입력</h2>
			<form>
				<label for="businessName">사업자명:</label> <input type="text"
					id="businessName" name="businessName" required><br>
				<label for="businessNumber">사업자번호:</label> <input type="text"
					id="businessNumber" name="businessNumber" required> <br>
				<label for="carNumber">차대번호:</label> <input type="text"
					id="carNumber" name="carNumber" required> <br> <br>

				<button type="button" onclick="startCorporateCalculation()">확인</button>
				<button type="button" onclick="closeModal('corporate')">닫기</button>
			</form>
		</div>
	</div>

	<!-- 보험료 계산 중 모달 -->
	<div id="loadingModal" class="modal" style="display: none;">
		<div class="modal-content">
			<div class="loading-spinner"></div>
			<h2>보험료 계산 중...</h2>
		</div>
	</div>

	<div id="calculationCompleteModal" class="modal" style="display: none;">
	    <div class="modal-content">
	        <div class="modal-header">
	            <h2>보험료 계산 완료</h2>
	            <br>
	        </div>
	        <div class="modal-body">
	            <p class="insurance-details">
	                <span class="detail-label">보험 계약자:</span>
	                <span class="detail-value" id="userName"></span>
	            </p>
	            <br>
	            <p class="insurance-details">
	                <span class="detail-label">보험금:</span>
	                <span class="detail-value" id="insuranceAmount"></span> 원
	            </p>
	            <br>
	            <p class="insurance-details">
	                <span class="detail-label">보험 기간:</span>
	                <span class="detail-value" id="insurancePeriod">1 년</span>
	            </p>
	            <br>
	        </div>
	        <div class="modal-footer">
	            <button type="button" onclick="closeModal('calculationComplete')">닫기</button>
	        </div>
	    </div>
	</div>

	<!-- <br>
	<br>
	<form>
		<table class="w-pct60">
			<tr>
				<th class="w-px160">성명</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="남" checked/>남</label>
					<label><input type="radio" name="gender" value="여" />여</label>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="birth" readonly />
					<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
					fontawesome에서 가져온 무료 아이콘
				</td>
			</tr>
			<tr>
				<th>차대번호</th>
				<td>
					<input type="text" name="tel" /> - 
					<input type="text" name="tel" /> - 
					<input type="text" name="tel" />
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="제출" />
	</form> -->

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>