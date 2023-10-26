<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuoCAR 정비</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/common.css" />
<link rel="icon" type="image/x-icon" href="/img/head.png">
<script>

	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						// 펼쳐보기 버튼을 클릭할 때 추가 내용을 토글하는 코드
						const expandButtons = document
								.querySelectorAll(".FeedView-module__btn_more___zGfeT");

						expandButtons
								.forEach(function(button) {
									button
											.addEventListener(
													"click",
													function() {
														// 현재 버튼의 부모 요소에서 추가 내용을 찾아서 토글
														const parent = button.parentElement;
														const additionalContents = parent
																.querySelectorAll(".additional-content, .additional-content2, .additional-content3");

														additionalContents
																.forEach(function(
																		additionalContent) {
																	if (additionalContent.style.display === "none"
																			|| additionalContent.style.display === "") {
																		additionalContent.style.display = "block";
																		button.innerHTML = "접기 ➖";
																	} else {
																		additionalContent.style.display = "none";
																		button.innerHTML = "펼쳐보기 ➕";
																	}

																});
													});
								});
					});

	//	   

	document.addEventListener("DOMContentLoaded", function() {
		const thumbnailImages = document.querySelectorAll(".thumbnail-image");

		thumbnailImages.forEach(function(image) {
			image.addEventListener("mouseenter", function() {
				// 호버 시 확대 효과 적용
				image.style.transform = "scale(1.1)";
			});

			image.addEventListener("mouseleave", function() {
				// 호버 해제 시 원래 크기로 돌아가기
				image.style.transform = "scale(1)";
			});

		});
	});

	// 슬라이드 컨텐츠
	var slideIndex = 0;
	showSlides();

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");

		if (slideIndex >= slides.length) {
			slideIndex = 0;
		}
		if (slideIndex < 0) {
			slideIndex = slides.length - 2;
		}

		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}

		for (i = slideIndex; i < slideIndex + 2; i++) {
			if (slides[i]) {
				slides[i].style.display = "block";
			}
		}
	}

	showSlides();
	
	function loadModels() {
		var manufactureSelect = document.getElementById("manufacture");
		var modelSelect = document.getElementById("model");

		// 모든 차량명 옵션을 삭제합니다.
		while (modelSelect.options.length > 0) {
			modelSelect.remove(0);
		}

		// 선택한 제조사에 따라 차량명 옵션을 추가합니다.
		var selectedManufacture = manufactureSelect.value;
		if (selectedManufacture === "Hyundai") {
			addModelOption("아반떼", modelSelect);
			addModelOption("소나타", modelSelect);
		} else if (selectedManufacture === "Kia") {
			addModelOption("K3", modelSelect);
			addModelOption("K5", modelSelect);
		} else if (selectedManufacture === "KG") {
			addModelOption("티볼리", modelSelect);
			addModelOption("토레스", modelSelect);
		}
		
		// 모델 선택이 변경되었을 때 이미지와 링크 업데이트
	    modelSelect.addEventListener("change", showImageAndLink);
		
	    // 자동으로 첫 번째 차량명 선택
	    if (modelSelect.options.length > 0) {
	        modelSelect.selectedIndex = 0;
	        showImageAndLink();
	    }
	}
		
	function addModelOption(modelName, selectElement) {
		var option = document.createElement("option");
		option.text = modelName;
		option.value = modelName;
		selectElement.add(option);
	}
	
	function showImageAndLink() {
	    var modelSelect = document.getElementById("model");
	    var carImage = document.getElementById("carImage");
	    var carLink = document.getElementById("carLink");
	    var manufactureSelect = document.getElementById("manufacture");

	    var selectedModel = modelSelect.value;
	    var selectedManufacture = manufactureSelect.value;

	    // 이미지와 링크를 설정
	    var imageSrc = ""; // 이미지 경로
	    var linkText = ""; // 링크 텍스트
	    
	    var imageSrc2 = ""; // 이미지 경로
	    var linkText2 = ""; // 링크 텍스트
	    
	    var imageSrc3 = ""; // 이미지 경로
	    var linkText3 = ""; // 링크 텍스트
	    
        if (selectedModel === "소나타") {
        	 imageSrc = "/img/skzicls5w30.jpg";
        	 linkText = "<a href='https://www.coupang.com/vp/products/39134602?itemId=144009417&vendorItemId=70402517845&src=1042503&spec=10304984&addtag=400&ctag=39134602&lptag=10304984I144009417V70402517845&itime=20231010191904&pageType=PRODUCT&pageValue=39134602&wPcid=16931844610411795492268&wRef=&wTime=20231010191904&redirect=landing&gclid=Cj0KCQjw7JOpBhCfARIsAL3bobcy7GsCfhVZ5BGD2I6jNRZNa_uwjSEhxqT3-uOGmtz7AJpoGgtj1yoaAvLYEALw_wcB&mcid=cea2895073b642ee9d83a4ae58873641&campaignid=20594956462&adgroupid=&network=&isAddedCart='>➡ 순정오일 구매하기</a>";
        	
        	 imageSrc2 = "/img/brake1.jpg";
        	 linkText2 = "<a href='https://prod.danawa.com/list/?cate=14247498&utm_source=google&utm_medium=cpc&utm_campaign=keyword&gad=1&gclid=Cj0KCQjwj5mpBhDJARIsAOVjBdr_VRZX9tDkA7aEZTD6mYgoREinYEm18fBU5rx9C99dcqLAfIAGprcaAhxKEALw_wcB'>➡ 브레이크 구매하기</a>";
        	
        	 imageSrc3 = "/img/sotire.jpg";
        	 linkText3 = "<a href='https://prod.danawa.com/list/?cate=1423887&15main_14_02'>➡ 타이어 구매하기</a>";
        	 
        } else if (selectedModel === "아반떼") {
        	 imageSrc = "/img/avante0il2.jpg";
        	 linkText = "<a href='https://example.com/elantra'>➡ 아반떼 순정 엔진오일 구매하기</a>";
        	 
        	 imageSrc2 = "/img/brake1.jpg";
        	 linkText2 = "<a href='https://prod.danawa.com/list/?cate=14247498&utm_source=google&utm_medium=cpc&utm_campaign=keyword&gad=1&gclid=Cj0KCQjwj5mpBhDJARIsAOVjBdr_VRZX9tDkA7aEZTD6mYgoREinYEm18fBU5rx9C99dcqLAfIAGprcaAhxKEALw_wcB'>➡ 브레이크 구매하기</a>";
        	
        	 imageSrc3 = "/img/sotire.jpg";
        	 linkText3 = "<a href='https://prod.danawa.com/list/?cate=1423887&15main_14_02'>➡ 타이어 구매하기</a>";
        	 
        } else if (selectedModel === "K3") {
        	 imageSrc = "/img/k3oil.jpg";
        	 linkText = "<a href='https://prod.danawa.com/info/?pcode=12172508'>➡ K3 순정 엔진오일 구매하기</a>";
        	 
        	 imageSrc2 = "/img/brake1.jpg";
        	 linkText2 = "<a href='https://prod.danawa.com/list/?cate=14247498&utm_source=google&utm_medium=cpc&utm_campaign=keyword&gad=1&gclid=Cj0KCQjwj5mpBhDJARIsAOVjBdr_VRZX9tDkA7aEZTD6mYgoREinYEm18fBU5rx9C99dcqLAfIAGprcaAhxKEALw_wcB'>➡ 브레이크 구매하기</a>";
        	
        	 imageSrc3 = "/img/sotire.jpg";
        	 linkText3 = "<a href='https://prod.danawa.com/list/?cate=1423887&15main_14_02'>➡ 타이어 구매하기</a>";
        	 
        } else if (selectedModel === "K5") {
        	 imageSrc = "/img/k3oil.jpg";
        	 linkText = "<a href='https://prod.danawa.com/info/?pcode=12172508'>➡ K5 엔진오일 구매하기</a>";
        	 
        	 imageSrc2 = "/img/brake1.jpg";
        	 linkText2 = "<a href='https://prod.danawa.com/list/?cate=14247498&utm_source=google&utm_medium=cpc&utm_campaign=keyword&gad=1&gclid=Cj0KCQjwj5mpBhDJARIsAOVjBdr_VRZX9tDkA7aEZTD6mYgoREinYEm18fBU5rx9C99dcqLAfIAGprcaAhxKEALw_wcB'>➡ 브레이크 구매하기</a>";
        	
        	 imageSrc3 = "/img/sotire.jpg";
        	 linkText3 = "<a href='https://prod.danawa.com/list/?cate=1423887&15main_14_02'>➡ 타이어 구매하기</a>";
        	 
        } else if (selectedModel === "티볼리") {
        	 imageSrc = "/img/tibolioil.jpg";
        	 linkText = "<a href='http://www.11st.co.kr/products/2262363035'>➡ 티볼리 엔진오일 구매하기</a>";
        	 
        	 imageSrc2 = "/img/brake1.jpg";
        	 linkText2 = "<a href='https://prod.danawa.com/list/?cate=14247498&utm_source=google&utm_medium=cpc&utm_campaign=keyword&gad=1&gclid=Cj0KCQjwj5mpBhDJARIsAOVjBdr_VRZX9tDkA7aEZTD6mYgoREinYEm18fBU5rx9C99dcqLAfIAGprcaAhxKEALw_wcB'>➡ 브레이크 구매하기</a>";
        	
        	 imageSrc3 = "/img/sotire.jpg";
        	 linkText3 = "<a href='https://prod.danawa.com/list/?cate=1423887&15main_14_02'>➡ 타이어 구매하기</a>";
        	 
        } else if (selectedModel === "토레스") {
        	 imageSrc = "/img/torresoil.jpg";
        	 linkText = "<a href='http://m.11st.co.kr/products/m/5359675792?trTypeCd=21&trCtgrNo=585021'>➡ 토레스 엔진오일 구매하기</a>";
        	
        	 imageSrc2 = "/img/brake1.jpg";
        	 linkText2 = "<a href='https://prod.danawa.com/list/?cate=14247498&utm_source=google&utm_medium=cpc&utm_campaign=keyword&gad=1&gclid=Cj0KCQjwj5mpBhDJARIsAOVjBdr_VRZX9tDkA7aEZTD6mYgoREinYEm18fBU5rx9C99dcqLAfIAGprcaAhxKEALw_wcB'>➡ 브레이크 구매하기</a>";
        	
        	 imageSrc3 = "/img/sotire.jpg";
        	 linkText3 = "<a href='https://prod.danawa.com/list/?cate=1423887&15main_14_02'>➡ 타이어 구매하기</a>";
        }
        
        // 이미지와 링크 업데이트
        carImage.src = imageSrc;
        carImage2.src = imageSrc2;
        carImage3.src = imageSrc3;
        
        carImage2.style.width = carImage.width + "px"; // 크기를 carImage와 일치하게 설정
        carImage2.style.height = carImage.height + "px"; // 크기를 carImage와 일치하게 설정

        carImage3.style.width = carImage.width + "px"; // 크기를 carImage와 일치하게 설정
        carImage3.style.height = carImage.height + "px"; // 크기를 carImage와 일치하게 설정
      
        carLink.innerHTML = linkText;
        carLink2.innerHTML = linkText2;
        carLink3.innerHTML = linkText3;
        
        // 이미지와 링크 표시
        carImage.style.display = "block";
        carLink.style.display = "block";
       
        carImage2.style.display = "block";
        carLink2.style.display = "block";

        carImage3.style.display = "block";
        carLink3.style.display = "block";

    }

    // 페이지 로드 시 초기화
    loadModels();
    
</script>

<style>
body {
	margin-bottom: 300px; /* footer와 겹치지 않도록 페이지 하단 여백 추가 */
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

br {
	border-bottom: 1px dashed #ccc; /* 연한 회색 점선 선으로 설정 */
}

.container {
	display: flex;
	background-color: #F5F5F7;
	justify-content: center; /* 가운데 위치시킴 */
}

.carnews {
	display: flex;
	background-color: #EFF2F6;
	justify-content: center; /* 가운데 위치시킴 */
}

.content {
	width: 18%; /* 각 컨텐츠 영역의 너비를 조정하여 반으로 나눕니다. */
	padding: 10px;
	border-radius: 10px;
	border: 1px solid #ccc;
	margin: 10px;
}

.content1 {
	max-width: 20%; /* 최대 너비 설정 */
	min-width: 10%; /* 최소 너비 설정 */
	max-height: 860px; /* 최대 세로 길이 설정 */
	padding: 5px;
	border-radius: 10px;
	border: 1px solid #ccc;
	margin: 10px;
	display: inline-block; /* 내용에 따라 자동으로 너비 조정 */
	background-color: white; /* 배경색을 흰색으로 설정 */
}

.content2 {
    max-height: 1080px;
    text-align: center;
    background-color: #f5f5f5;
    padding: 10px;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    margin-left: 5px 20px 5px 5px; /* 왼쪽 마진을 줄이기 위해 수정 (위, 오른쪽, 아래, 왼쪽) */
    display: inline-block;
    width: 400px;
    transition: transform 0.3s;
}

.content3 {
    max-height: 800px;
    text-align: center;
    background-color: #f5f5f5;
    padding: 10px;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    margin: 5px 20px 5px 5px; /* 왼쪽 마진을 줄이기 위해 수정 (위, 오른쪽, 아래, 왼쪽) */
    display: inline-block;
    width: 400px;
    transition: transform 0.3s;
}

select {
    padding: 10px;
    font-size: 16px;
    border: 2px solid #ccc;
    border-radius: 10px;
    width: 100%;
    transition: border-color 0.3s;
    font-family: 'Poppins', sans-serif; /* 'Poppins' 웹 폰트를 사용합니다 */
    outline: none;
}

select:focus {
    border-color: #007bff;
}

.car-info {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
}

.car-box {
    margin: 10px;
    padding: 10px; /* 이미지와 내용 간격을 조절 */
    background-color: #ffffff;
    border: 2px solid #e5e5e5;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    text-align: center;
    transition: transform 0.3s;
    font-family: 'Poppins', sans-serif; /* 'Poppins' 웹 폰트를 사용합니다 */
}

.car-box:hover {
    transform: scale(1.05);
}

.car-image img {
    max-width: 60%; /* 이미지 크기를 줄입니다 */
    border: 2px solid #fff;
    border-radius: 15px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* 그림자 효과 증가 */
}

.card {
	display: flex;
	justify-content: center;
	align-items: center;
}

.food-image-container {
  width: 150px; /* 이미지의 폭 조정 */
  height: 150px; /* 이미지의 높이 조정 */
  border-radius: 10px; /* 가장자리를 둥글게 만들기 */
  overflow: hidden; /* 이미지가 가장자리를 벗어나지 않도록 숨기기 */
  margin: 0 auto; /* 이미지를 수평 중앙에 정렬 */
  display: flex;
  justify-content: center;
  align-items: center;
}

.food-title {
  text-align: center; /* 글자를 중앙 정렬 */
}

.content new car {
	max-width: 800px; /* 원하는 최대 너비로 조절합니다 */
	margin: 0 auto; /* 가운데 정렬합니다 */
	padding: 20px; /* 내용 주변의 간격을 추가합니다 */
}

h2 {
	margin: 10px; /* 상단과 하단의 마진을 10px로 설정 */
	mergin-left: 10px;
	color: #000; /* 흰색으로 설정 */
	font-size: 24px; /* 텍스트 크기를 조정하여 더 강조합니다. */
}

h3 {
	text-align: center;
}

.half-width {
	width: 50%; /* 이미지의 너비를 50%로 설정 */
}

/* P 태그 스타일 */
.content a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: black;
}

.content p {
	font-size: 28px; /* 글자 크기를 원하는 크기로 조절 */
	font-weight: bold; /* 볼드체로 설정 */
	margin: 0; /* 기본 마진 제거 */
}

.shopping {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.item {
  display: flex;
  align-items: center;
}

input[type="radio"] {
  margin-right: 10px;
}

label {
  cursor: pointer;
}

/* 선택된 항목 스타일 */
input[type="radio"]:checked + label {
  font-weight: bold;
  color: #007bff; /* 원하는 색상으로 변경하세요 */
}

.card-news {
	border: 1px solid #ccc;
	border-radius: 8px;
	margin: 10px;
	margin-bottom: 0;
	padding: 10px;
	width: 400px;
	background-color: #fff;
	padding: 10px;
}

.card-news a {
	text-decoration: none;
	color: #000;
}

.card-news-image img {
	width: 100%;
	height: auto;
	border-radius: 8px;
}

.card-news-content p {
	font-size: 14px;
}

.card-news-source {
	display: flex;
	align-items: center;
	margin-top: 10px;
}

.source-icon {
	width: 30px;
	height: 30px;
	margin-right: 10px;
}

.source-name {
	font-size: 12px;
}

.card-link {
	text-decoration: none;
	color: #333;
	display: inline-block;
}

.card-link:hover {
	text-decoration: underline;
}

.card-img:hover {
	transform: scale(1.1);
}

/* 이미지 스타일 수정 (left-image 클래스에만 적용) */
.left-image {
	float: left;
	margin-right: 20px; /* 이미지 사이 간격을 더 넓게 설정 */
}

/* 텍스트 스타일 수정 */
.news-text {
	margin: 0;
	padding: 10px; /* 텍스트 주위에 패딩을 추가 */
}

/* 자동차 매물 스타일 */
.supercar {
	position: relative;
	display: inline-block;
	overflow: hidden;
	width: 200px;
	height: 200px;
	margin-left: 10px;
	border-radius: 10px; /* 보다 더 둥근 테두리를 추가합니다. */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과를 추가합니다. */
	transition: transform 0.3s, box-shadow 0.3s;
	/* 호버 효과 및 그림자 변화에 애니메이션을 적용합니다. */
}

.supercar img {
	width: 100%; /* 이미지를 부모 컨테이너에 맞게 크기 조정합니다. */
	height: auto;
	object-fit: cover; /* 이미지가 컨테이너에 맞게 잘리지 않도록 합니다. */
	transition: transform 0.3s; /* 호버 효과를 위한 이미지 변환 애니메이션을 설정합니다. */
}

.image-caption {
	display: none;
	position: absolute;
	bottom: 10px;
	left: 10px;
	background-color: rgba(0, 0, 0, 0.7);
	color: #fff;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 16px; /* 글꼴 크기를 크게 만들어 고급스러움을 강조합니다. */
}

.supercar:hover img {
	transform: scale(1.05); /* 호버 시 이미지를 약간 확대합니다. */
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.3);
	/* 그림자를 더 강화하여 고급스러운 느낌을 줍니다. */
}

.supercar:hover .image-caption {
	display: block;
}

  /* 부모 컨테이너 스타일 (가운데 정렬) */
  .center-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

/* 카드 뉴스 컨테이너 스타일 */
.card-news1 {
  background-color: #f7f7f7;
  border: 1px solid #dcdcdc;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s;
  width: 355px;
  margin: 20px;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
}

/* 호버 효과 */
.card-news1:hover {
  transform: scale(1.05);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

/* 카드 이미지 스타일 */
.card-news1-image img {
  max-width: 100%;
  border: 3px solid #fff;
  border-radius: 12px;
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

/* 카드 콘텐츠 스타일 */
.card-news1-content p {
  font-family: 'Arial', sans-serif;
  color: #444;
  font-size: 18px;
  margin: 15px 0;
  line-height: 1.4;
}

/* 소스 아이콘 스타일 */
.source-icon1 {
  width: 20px;
  height: 20px;
  margin-right: 8px;
  vertical-align: middle;
}

.source-name {
  font-weight: bold;
  font-size: 24px;
  color: #333;
  margin-top: 10px;
}

</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="content">
			<h2>엔진오일</h2>
			<!-- 자동차 뉴스 내용을 이곳에 추가하세요 -->
			<h3></h3>
			<div class="card-news">
				<a href="https://brunch.co.kr/@hmgjournal/392">
					<div class="card-news-image">
						<img src="/img/engin1.jpg" alt="엔진오일 설명">
					</div>
					<div class="card-news-content">
						<p>➡ 엔진오일의 규격과 점도</p>
						<div class="card-news-source">
							<img src="/img/tistory.png" alt="Tistory" class="source-icon">
							<span class="source-name">티스토리: brunch.co.kr</span>
						</div>
					</div>
				</a>
			</div>

			&nbsp;

			<div class="card-news">
				<a
					href="https://allways.kg-mobility.com/%EC%9E%90%EB%8F%99%EC%B0%A8-%EC%98%A4%EC%9D%BC-%EA%B5%90%EC%B2%B4/"">
					<div class="card-news-image">
						<img src="/img/engineheart.jpg" alt="교체">
					</div>
					<div class="card-news-content">
						<p>➡ 엔진오일 교체주기</p>
						<div class="card-news-source">
							<img src="/img/kg.png" alt="KG" class="source-icon"> <span
								class="source-name">KG 모빌리티</span>
						</div>
					</div>
				</a>
			</div>

			&nbsp;

			<div class="card-news">
				<a href="https://www.hyundai.co.kr/story/CONT0000000000115744">
					<div class="card-news-image">
						<img src="/img/hyndengine.jpg" alt="현대차">
					</div>
					<div class="card-news-content">
						<p>➡ 엔진오일의 모든 것</p>
						<div class="card-news-source">
							<img src="/img/hlogo.png" alt="Hyundai" class="source-icon">
							<span class="source-name">현대자동차</span>
						</div>
					</div>
				</a>
			</div>
			<br>
			<h2>엔진오일 이모저모</h2>
			<div class="card-news1">
				<a href="https://plan.danawa.com/info/?nPlanSeq=2240">
					<div class="card-news1-image">
						<img src="/img/dda.jpg" alt="엔진오일 순위">
					</div>
					<div class="card-news1-content">
						<p>다나와 베스트 엔진오일 선정</p>
						<div class="card-news1-source">
							<img src="/img/danawa.jpg" alt="다나와" class="source-icon1">
							<span class="source-name">다나와</span>
						</div>
					</div>
				</a>
			</div>
			<div class="card-news1">
				<a href="https://plan.danawa.com/info/?nPlanSeq=2240">
					<div class="card-news1-image">
						<img src="/img/parkengine.jpg" alt="엔진오일 순위">
					</div>
					<div class="card-news1-content">
						<p>박병일 자동차명장 유튜브</p>
						<div class="card-news1-source">
							<img src="/img/utube.png" alt="유튜브" class="source-icon1"> <span
								class="source-name">유튜브</span>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div class="content new car">
			<h2>브레이크</h2>
			<!-- 자동차 정보 내용을 이곳에 추가하세요 -->
			<h3></h3>
			<div class="card-news">
				<a href="https://www.motoya.co.kr/news/articleView.html?idxno=17974">
					<div class="card-news-image">
						<img src="/img/brembo.png" alt="브렘보 브레이크">
					</div>
					<div class="card-news-content">
						<p>➡ 고성능 브레이크의 대명사</p>
						<div class="card-news-source">
							<img src="/img/brembo.png" alt="Brembo" class="source-icon1">
							<span class="source-name">Brembo Brake</span>
						</div>
					</div>
				</a>
			</div>

			&nbsp;

			<div class="card-news">
				<a
					href="https://post.naver.com/viewer/postView.naver?volumeNo=6387737&memberNo=30135833">
					<div class="card-news-image">
						<img src="/img/bareum.png" alt="바름">
					</div>
					<div class="card-news-content">
						<p>➡ 브레이크 패드 정비상식 3가지</p>
						<div class="card-news-source">
							<img src="/img/bar.png" alt="바름정비" class="source-icon"> <span
								class="source-name">바름정비</span>
						</div>
					</div>
				</a>
			</div>

			&nbsp;

			<div class="card-news">
				<a href="https://www.hyundai.co.kr/story/CONT0000000000072139">
					<div class="card-news-image">
						<img src="/img/hyundai.jpg" alt="현대 브레이크">
					</div>
					<div class="card-news-content">
						<p>➡ 자동차 브레이크, 무조건 클 수록 좋을까?</p>
						<div class="card-news-source">
							<img src="/img/hlogo.png" alt="현대" class="source-icon"> <span
								class="source-name">현대자동차</span>
						</div>
					</div>
				</a>
			</div>
			<br>
			<h2>브레이크 이모저모</h2>
			<div class="card-news1">
				<a href="https://plan.danawa.com/info/?nPlanSeq=2240">
					<div class="card-news1-image">
						<img src="/img/pickp.jpg" alt="브레이크">
					</div>
					<div class="card-news1-content">
						<p>브레이크 피스톤 수에 따른 제동거리 차이</p>
						<div class="card-news1-source">
							<img src="/img/utube.png" alt="유튜브" class="source-icon1"> <span
								class="source-name">유튜브</span>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="content new car">
			<h2>타이어</h2>
			<!-- 자동차 정보 내용을 이곳에 추가하세요 -->
			<h3></h3>
			<div class="card-news">
				<a href="https://plan.danawa.com/info/?nPlanSeq=428">
					<div class="card-news-image">
						<img src="/img/danawat.jpg" alt="다나와 브레이크">
					</div>
					<div class="card-news-content">
						<p>➡ 국산타이어 계급도</p>
						<div class="card-news-source">
							<img src="/img/danawa.jpg" alt="다나와" class="source-icon1">
							<span class="source-name">다나와</span>
						</div>
					</div>
				</a>
			</div>

			&nbsp;

			<div class="card-news">
				<a
					href="https://ko.wikihow.com/%ED%83%80%EC%9D%B4%EC%96%B4-%EA%B5%90%EC%B2%B4-%EC%8B%9C%EA%B8%B0-%EC%95%84%EB%8A%94-%EB%B2%95">
					<div class="card-news-image">
						<img src="/img/tiremamo.jpg" alt="타이어 마모 확인법">
					</div>
					<div class="card-news-content">
						<p>➡ 타이어 교체 시기 아는 법</p>
						<div class="card-news-source">
							<img src="/img/wikihow.jpg" alt="타이어" class="source-icon1">
							<span class="source-name">위키하우</span>
						</div>
					</div>
				</a>
			</div>

			&nbsp;

			<div class="card-news">
				<a href="https://www.tire-pick.com/promotions/10">
					<div class="card-news-image">
						<img src="/img/tire5.png" alt="타이어">
					</div>
					<div class="card-news-content">
						<p>➡ 오래 탈 수 있는 타이어</p>
						<div class="card-news-source">
							<img src="/img/tirepick.jpg" alt="타이어픽" class="source-icon1">
							<span class="source-name">타이어픽</span>
						</div>
					</div>
				</a>
			</div>
			<br>
			<h2>타이어 이모저모</h2>
			<div class="card-news1">
				<a href="https://www.youtube.com/watch?v=zU5Tes71tds">
					<div class="card-news1-image">
						<img src="/img/tire6.jpg" alt="타이어">
					</div>
					<div class="card-news1-content">
						<p>타이어 구분법 4가지</p>
						<div class="card-news1-source">
							<img src="/img/utube.png" alt="유튜브" class="source-icon1"> <span
								class="source-name">유튜브</span>
						</div>
					</div>
				</a>
			</div>
			<div class="card-news1">
				<a href="https://www.youtube.com/watch?v=BtnxfNFWT7k">
					<div class="card-news1-image">
						<img src="/img/tire7.jpg" alt="타이어">
					</div>
					<div class="card-news1-content">
						<p>여름철 타이어 바람은 많이 넣는게 정말 더 좋은걸까?</p>
						<div class="card-news1-source">
							<img src="/img/utube.png" alt="유튜브" class="source-icon1"> <span
								class="source-name">유튜브</span>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div class="content3" style="clear: both;">
			<h2>추천 정비소</h2>
			<br>
			<h3>수도권</h3>

			<br>
			<div class="food">
				<a
					href="https://map.naver.com/p/entry/place/1303040819?lng=126.6230419&lat=37.6295962&placePath=%2Fhome%3Fentry%3Dplt&c=15.00,0,0,0,dh"
					class="card-link">
					<div class="food-image-container">
						<img src="/img/jservice.jpg" class="card-img" alt="">
					</div>
					<div class="food-text">
						<h4 class="food-title">제이특공대 김포점</h4>
					</div> <a
					href="https://map.naver.com/p/entry/place/1608927255?lng=126.8235453&lat=37.6174323&placePath=%2Fhome%3Fentry%3Dplt&c=15.00,0,0,0,dh"
					class="card-link" style="margin-left: 40px;">
						<div class="food-image-container">
							<img src="/img/merkaba.jpg" class="card-img" alt="메르카바">
						</div>
						<div class="food-text">
							<h4 class="food-title">메르카바 고양점</h4>
						</div>
				</a>
			</div>

			<h3>경상권</h3>

			<br>
			<div class="food">
				<a
					href="https://map.naver.com/p/entry/place/21503577?lng=129.1256231&lat=35.1595821&placePath=%2Fhome%3Fentry%3Dplt&c=15.00,0,0,0,dh"
					class="card-link">
					<div class="food-image-container">
						<img src="/img/meister.jpg" class="card-img" alt="마이스터">
					</div>
					<div class="food-text">
						<h4 class="food-title">마이스터 부산점</h4>
					</div> <a
					href="https://map.naver.com/p/entry/place/1733404993?lng=129.3053754&lat=35.4397899&placePath=%2Fhome%3Fentry%3Dplt&c=15.00,0,0,0,dh"
					class="card-link" style="margin-left: 40px;">
						<div class="food-image-container">
							<img src="/img/nabi.jpg" class="card-img" alt="나비">
						</div>
						<div class="food-text">
							<h4 class="food-title">나비모터스 울산점</h4>
						</div>
				</a>
			</div>

			<h3>전라권</h3>

			<br>
			<div class="food">
				<a
					href="https://map.naver.com/p/entry/place/1928265804?lng=126.5329784&lat=35.9424226&placePath=%2Fhome%3Fentry%3Dplt&c=15.00,0,0,0,dh"
					class="card-link">
					<div class="food-image-container">
						<img src="/img/marine.jpg" class="card-img" alt="마린">
					</div>
					<div class="food-text">
						<h4 class="food-title">마린모터스 군산점</h4>
					</div> <a
					href="https://map.naver.com/p/entry/place/36046960?lng=126.8616386&lat=35.1666878&placePath=%2Fhome%3Fentry%3Dplt&c=15.00,0,0,0,dh"
					class="card-link" style="margin-left: 40px;">
						<div class="food-image-container">
							<img src="/img/hmotors.jpg" class="card-img" alt="h">
						</div>
						<div class="food-text">
							<h4 class="food-title">H모터스 쌍촌점</h4>
						</div>
				</a>
			</div>
		<br>
		<br>
		<br>
		<br>
		<div class="content2" id="content">
			<h2>자동차 소모품 추천</h2>
			<h3></h3>
			<form>
				<label for="manufacture">제조사: </label> <select id="manufacture"
					onchange="loadModels()">
					<option value="Hyundai">현대</option>
					<option value="Kia">기아</option>
					<option value="KG">쌍용 (KG)</option>
				</select> <label for="model">차량명: </label> <select id="model"
					onchange="showImageAndLink()"></select>
			</form>
			<br>
			<hr>
			<br>
			<div class="car-box">
				<img id="carImage" src="" alt=""> <a id="carLink" href=""
					class="buy-link"></a>
			</div>
			<div class="car-box">
				<img id="carImage2" src="" alt=""> <a id="carLink2" href=""
					class="buy-link"></a>
			</div>
			<div class="car-box">
				<img id="carImage3" src="" alt=""> <a id="carLink3" href=""
					class="buy-link"></a>
			</div>
		</div>
	</div>
	<a href="/Chat/List3?model_id=MD01" class="fixed-button">
	<img src="/img/	bot.png" alt="Q 봇" style="width: 100px; height: 100px;"></a>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>s