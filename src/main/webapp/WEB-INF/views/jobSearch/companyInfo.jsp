<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업소개</title>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b0b0a9f222f0ab356e278f15c5fdc64&libraries=services"></script>
</head>
<style>
.contain {
	width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
}

.companyInfoHeader {
	width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
	display: flex;
	justify-content: center;
}

.companyImg {
	display: inline-block;
	line-height: 32px;
}

.companyImg>img {
	width: 120px;
	height: 36px;
}

.companyTitle {
	display: inline-block;
	margin-left: 15px;
	font-size: 24px;
	font-weight: 900;
}

.companyTitle>p {
	margin-bottom: 0px;
}

.intro {
	margin-left: 20px;
	color: rgb(78, 205, 196);
	font-weight: 900;
}

.announce>p {
	font-size: 11px;
	margin-left: 30px;
}

.announceBox {
	width: 800px;
	margin: 0 auto;
	padding: 20px;
	padding-left: 35px;
	border: 1px solid rgb(108, 108, 108);
}

.status {
	display: inline-block;
}

.status>p {
	display: inline-block;
	width: 70px;
	color: white;
	padding: 3px 5px;
	background-color: rgb(78, 205, 196);
	text-align: center;
}

.companyName, .companyName>p {
	display: inline-block;
	font-size: 14px;
	color: blue;
	margin-left: 10px;
	position: relative;
	top: -1px;
}
em {
	font-style: normal;
	font-weight: 900;
	font-size: 20px;
	margin-bottom: 15px;
}
b {
	font-style: normal;
	font-weight: 900;
	font-size: 20px;
	margin-bottom: 15px;
	margin: 30px 0px;
	display: block;
}

.resumeInfo1 {
	margin-bottom: 0;
}

.resumeInfo1, .resumeInfo2 {
	width: 900px;
	overflow: hidden;
}

.resumeInfo1>li, .resumeInfo2>li {
	color: rgb(158, 158, 158);
	list-style: none;
	overflow: hidden;
}

.resumeInfo1>li>div, .resumeInfo2>li>div {
	float: left;
}

.resumeInfoImg {
	width: 40px;
}

.resumeInfoImg>img {
	width: 20px;
}

.resumeInfoData {
	margin-left: 30px;
}

.money, .career {
	width: 280px;
	display: inline-block;
}

.workForm {
	width: 280px;
	display: inline-block;
}

.workPlace {
	width: 280px;
	display: inline-block;
}

.announceTitle {
	margin-left: 20px;
	margin-bottom: 15px;
}

.announceTitle>a {
	text-decoration: none;
	font-size: 24px;
	font-weight: 900;
	color: black;
}

.announcing {
	font-size: 13px;
	background-color: rgb(78, 205, 196);
	color: white;
	border-radius: 10px;
	margin-left: 30px;
	width: 70px;
	text-align: center;
	padding: 3px 5px;
}
.info{
	overflow: hidden;
	float: left;
	list-style: none;
}
.info>li{
	height: 50px;
}
.info1{
	color: #888888;
}
.info2{
	margin-left: 30px;
	color: #222222;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<div class="companyInfoHeader">
			<div class="companyImg">
				<!-- 공고 1개만 가능하면 걍 두고 여러개 가능하면 forEach로 여러개 해줘야댐 -->
				${com.filepath }
			</div>
			<div class="companyTitle">
				<p>${com.companyName }</p>
			</div>
		</div>
		<div class="intro">
			<p>기업소개</p>
		</div>
		<hr>
		<div class="announce">
			<c:choose>
				<c:when test="${empty com }">
					<div class="emptyResume">
						<p>등록된 채용공고가 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>

					<p class="announcing">채용중 공고</p>
					<div class="announceBox">
						<%-- <c:choose>
					<c:when test="${현재날짜 > a.endDate }" var="a">	<!-- 현재날짜보다 길면 모집마감으로 변경 이거 어캐하지 -->
						<p>모집마감</p>
					</c:when>
					<c:otherwise>
						<div class="status">
							<p>모집중</p>
						</div>
					</c:otherwise>
				</c:choose> --%>
						<div class="status">
							<p>모집중</p>
						</div>

						<div class="companyName">
							<p>${com.companyName }</p>
							<i
								style="color: #999999; font-style: normal; margin-left: 15px; font-size: 12px;">${com.writeDate }</i>
						</div>
						<div class="announceTitle">
							<a href="/announceView.do?announceNo=${com.announceNo }">${com.announceTitle }</a>
						</div>

						<ul class="resumeInfo1">
							<li class="career">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/career.PNG"
										style="height: 22px; margin-left: 2px;">
								</div>
								<div class="resumeInfoData">
									<em style="font-size: 16px; font-weight: normal;">경력 : </em>
									<c:if test="${com.career eq 1 }">
										<!-- 1 -> 신입 -->
										<span>신입</span>
									</c:if>
									<c:if test="${com.career eq 2 }">
										<!-- 2 -> 경력 -->
										<span>경력</span>
									</c:if>
								</div>
							</li>
							<li class="money">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/workPlace.png">
								</div>
								<div class="resumeInfoData">
									<em style="font-size: 16px; font-weight: normal;">희망지역 : </em>
									<c:if test="${com.workPlace eq 1 }">
										<span>서울</span>
									</c:if>
									<c:if test="${com.workPlace eq 2 }">
										<span>경기</span>
									</c:if>
									<c:if test="${com.workPlace eq 3 }">
										<span>인천</span>
									</c:if>
									<c:if test="${com.workPlace eq 4 }">
										<span>강원</span>
									</c:if>
									<c:if test="${com.workPlace eq 5 }">
										<span>충남</span>
									</c:if>
									<c:if test="${com.workPlace eq 6 }">
										<span>충북</span>
									</c:if>
									<c:if test="${com.workPlace eq 7 }">
										<span>경북</span>
									</c:if>
									<c:if test="${com.workPlace eq 8 }">
										<span>부산</span>
									</c:if>
									<c:if test="${com.workPlace eq 9 }">
										<span>경남</span>
									</c:if>
									<c:if test="${com.workPlace eq 10 }">
										<span>전북</span>
									</c:if>
									<c:if test="${com.workPlace eq 11 }">
										<span>전남</span>
									</c:if>
									<c:if test="${com.workPlace eq 12 }">
										<span>제주</span>
									</c:if>
								</div>
							</li>
						</ul>
						<ul class="resumeInfo2">
							<li class="workPlace">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/school.PNG"
										style="width: 18px; height: 23px; margin-left: 2px;">
								</div>
								<div class="resumeInfoData">
									<em style="font-size: 16px; font-weight: normal;">학력 : </em>
									<c:if test="${com.school eq 1 }">
										<span>초졸 이상</span>
									</c:if>
									<c:if test="${com.school eq 2 }">
										<span>중졸 이상</span>
									</c:if>
									<c:if test="${com.school eq 3 }">
										<span>고졸 이상</span>
									</c:if>
									<c:if test="${com.school eq 4 }">
										<span>대졸 이상</span>
									</c:if>
									<c:if test="${com.school eq 5 }">
										<span>학력무관</span>
									</c:if>
								</div>
							</li>
							<li class="workForm">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/workFromWhite.PNG">
								</div>
								<div class="resumeInfoData">
									<!-- r.resumeWorkForm -->
									<em style="font-size: 16px; font-weight: normal;">희망 근무형태 : </em>
									<c:if test="${com.workForm eq 1 }">
										<!-- 1 -> 정규직 -->
										<span>정규직</span>
									</c:if>
									<c:if test="${com.workForm eq 2 }">
										<!-- 2 -> 계약직 -->
										<span>계약직</span>
									</c:if>
									<c:if test="${com.workForm eq 3 }">
										<!-- 3 -> 아르바이트 -->
										<span>아르바이트</span>
									</c:if>
									<c:if test="${com.workForm eq 4 }">
										<!-- 4 -> 인턴 -->
										<span>인턴</span>
									</c:if>
									<c:if test="${com.workForm eq 5 }">
										<!-- 5 -> 프리랜서 -->
										<span>프리랜서</span>
									</c:if>
								</div>
							</li>
						</ul>
					</div>
					<b>기업개요</b>
					<!-- 사진같은거 넣을지말지 고민좀 -->
					<ul class="info info1">
						<li>업종</li>
						<li>대표자명</li>
						<li>홈페이지</li>
						<li>사업내용</li>
						<li>기업주소</li>
					</ul>
					<ul class="info info2">
						<li>${com.category }</li>
						<li>${com.ceo }</li>
						<li><a href="#" style="text-decoration: none; color: #222222;">http://www.homepage.co.kr</a></li>
						<li>내용내용</li>
						<li>
							${com.address }
						</li>
						<div id="map" style="width:500px;height:400px;"></div>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
<script>
	/* 카카오맵 API */
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
</body>
</html>