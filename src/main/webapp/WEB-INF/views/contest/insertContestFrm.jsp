<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모 등록 페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<style>
.titleBox{
		font-size: 30px;
		font-weight: bold;
		margin-bottom: 80px;
		margin-top:50px;
	}

.dateInput{
	float: left;
}
#dateTd{
	overflow: hidden;
}
#dateTd>span{
	float: left;
}
.submitBtn{
	width: 990px;
}
.prize{
	float: left;
}
#won{
	line-height: 35px;
	margin-left: 5px;
	font-size: 18px;
	font-weight: bold;
}


.insertForm>p{
	font-size: 20px;
	font-weight: bold;
	margin-right: 10px;
	margin-top: 15px;
}

.flexBox>p{
	font-size: 20px;
	font-weight: bold;
	margin-right: 10px;
	margin-top: 10px;

}
.flexBox{
	display:flex;
	align-items: center;
	margin-top: 20px;
}

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom: 100px; margin-left: 400px;">
		<div class="titleBox">
			<a href="/contestMain.do"><i class="bi bi-chevron-left"></i></a><span>공모전 등록</span>
		</div>
		<form action="/insertContest.do" method="post" enctype="multipart/form-data" class="insertForm">
			<div class="flexBox">
				<p><i class="bi bi-award" style="color:#4ECDC4"></i> 공모유형</p>
				<label style="margin-right:20px; font-weight: bold"><input type="radio" name="contestType" value="1" class="form-check-input" style="margin-right:5px;">기획</label> 
				<label style="margin-right:20px; font-weight: bold"><input type="radio" name="contestType" value="2" class="form-check-input" style="margin-right:5px;">개발</label> 
				<label  style="font-weight: bold"><input type="radio" name="contestType" value="3" class="form-check-input" style="margin-right:5px;">디자인</label>
				<p style="margin-left: 120px;"><i class="bi bi-check-lg" style="color:#4ECDC4"></i> 참가자격</p>
				<label style="margin-right:20px; font-weight: bold"><input type="checkbox" name="contestQualify" value="대학생" class="form-check-input" style="margin-right:5px;">대학생</label>
				<label style="margin-right:20px; font-weight: bold"><input type="checkbox" name="contestQualify" value="대학원생" class="form-check-input" style="margin-right:5px;">대학원생</label> 
				<label style="margin-right:20px; font-weight: bold"><input type="checkbox" name="contestQualify" value="고등학생"class="form-check-input" style="margin-right:5px;">고등학생</label> 
				<label style="margin-right:20px; font-weight: bold"><input type="checkbox" name="contestQualify" value="일반인" class="form-check-input" style="margin-right:5px;">일반인</label> 
				<label style="font-weight: bold"><input type="checkbox" name="contestQualify" value="제한없음" class="form-check-input" style="margin-right:5px;">제한없음</label>
			</div>
			<p><i class="bi bi-building" style="color:#4ECDC4"></i> 주최사</p><input type="text" name="contestHost" class="form-control" style="width:1000px;">
			<p><i class="bi bi-calendar-week" style="color:#4ECDC4"></i> 공모마감</p><input type="date" class="form-control" id="mindate" min="" name="contestDeadline" style="width: 1000px; height: 38px;">
			<p><i class="bi bi-trophy" style="color:#4ECDC4"></i> 1등 시상금</p><input type="text" name="contestPrize" class="form-control prize" style="width: 960px;" placeholder="숫자만 입력해주세요"><span id="won">만원</span>
			<p><i class="bi bi-envelope" style="color:#4ECDC4"></i> 담당자 이메일</p><input type="email" name="email" class="form-control" style="width:1000px;">
			<p><i class="bi bi-telephone" style="color:#4ECDC4"></i> 담당자 전화번호</p><input type="text" name="phone" class="form-control" placeholder="010-XXXX-XXXX" style="width:1000px;">
			<p><i class="bi bi-chat-square-quote" style="color:#4ECDC4"></i> 공모명</p><input type="text" name="contestTitle" class="form-control" style="width:1000px;">
			<p><i class="bi bi-pencil-square" style="color:#4ECDC4"></i> 공모요강</p>
			<textarea id="contestContent" name="contestContent" class="form-control" style="width:1000px; height: 600px;resize: none;"></textarea>
			<p><i class="bi bi-card-image" style="color:#4ECDC4"></i> 포스터 이미지</p>
			<input type="file" id="formFile" name="upFile" class="form-control" style="width:1000px;">
			<p style="font-size: 16px;">공모전은 관리자 승인 후 등록됩니다.</p>
			<input type="button" class="btn btn-primary submitBtn" value="등록하기" style="width:1000px;">
		
			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
<script>

	//접수기간 데드라인 선택은 오늘날짜부터 선택 가능
	$(function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 
		today = yyyy+'-'+mm+'-'+dd;
		document.getElementById("mindate").setAttribute("min", today);
	});

	//모두 입력해야 등록가능
	$(".submitBtn").click(function(){
		var radioCheck = $('input[name=contestType]').is(":checked");
		if(!radioCheck){
			alert("공모유형을 체크해주세요.");
			return;
		}
		var checkBoxCheck = $('input[name=contestQualify]').is(":checked");
		if(!checkBoxCheck){
			alert("공모자격을 체크해주세요.");
			return;
		}
		if($('input[name=contestHost]').val() == ""){
			alert("주최사를 입력해주세요.");
			return;
		}
		if($('input[name=contestDeadline]').val() == ""){
			alert("공모 마감 날짜를 입력해주세요.");
			return;
		}
		if($('input[name=contestPrize]').val() == ""){
			alert("시상금을 입력해주세요.");
			return;
		}
		
		//1등 시상금 유효성검사
		var numCheck = /^[0-9]*$/;
		if(!numCheck.test($('input[name=contestPrize]').val())){
			alert("시상금은 숫자만 입력가능합니다.");
			return;
		}
		
		if($('input[name=email]').val() == ""){
			alert("담당자 이메일을 입력해주세요.");
			return;
		}
		if($('input[name=phone]').val() == ""){
			alert("담당자 전화번호를 입력해주세요.");
			return;
		}
		
		if($('input[name=contestTitle]').val() == ""){
			alert("공모명을 입력해주세요.");
			return;
		}
		
		if($('input[name=contestContent]').val() == ""){
			alert("공모요강을 입력해주세요.");
			return;
		}
		if($('input[name=files]').val() == ""){
			alert("공모전 포스터를 등록해주세요.");
			return;
		}
		
		//전부 입력됐으면 form data 전송
		$("form").submit();
	})
</script>
</body>
</html>