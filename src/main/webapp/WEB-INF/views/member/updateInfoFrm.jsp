<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateInfo</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.update-wrap{
		width: 700px;
		margin: 0 auto;
        padding : 20px;
        margin-bottom: 100px;
        margin-top: 50px;
	}
	.update-top {
		text-align: center;
	}
	.update-top img:hover{
		cursor: pointer;
	}
	.update-top img{
	    width: 100%;
	    height: 100%;
	    object-fit: cover;	
	}
	.update-middle>form>div{
		width: 400px;
		margin: 0 auto;
	}
	.pageBtn{
		display: flex;
		justify-content: space-around;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
		  <h4 style="text-align: center; font-family: NotoBold">계정설정</h4>
			<div class="update-wrap">
			  <div class="update-top">
				<c:choose>
					<c:when test="${sessionScope.m.filepath eq null }">
						<label for="formFile" class="form-label" style="border-radius: 40%; overflow: hidden;"><img src="/resources/img/member/profile.png" id="pic" style="width: 80px; height:80px;"></label>
					</c:when>
					<c:otherwise>
						<label for="formFile" class="form-label" style="border-radius: 40%; overflow: hidden;"><img src="/resources/upload/member/${sessionScope.m.filepath }" id="pic" style="width: 100px; height:100px;"></label>
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			    <input class="form-control" type="file" id="formFile" name="files" style="display: none;" accept=".gif, .jpg, .jpeg, .png">		  
			  </div><!--update-top 끝나는 지점  -->
			  <div class="update-middle">
			    <form action="/updateMyInfo.do" method="post">
					<div class="form-group">
					  <fieldset>
					    <label class="form-label mt-4" for="memberId">아이디</label>
					    <input class="form-control" name="memberId" id="memberId" type="text" value="${sessionScope.m.memberId }" readonly="">
					  </fieldset>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="email">이메일</label>
					  <input type="text" class="form-control" name="email" id="email" value="${sessionScope.m.email }" readonly="">
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="memberName">이름</label>
					  <input type="text" class="form-control" name="memberName" id="memberName" value="${sessionScope.m.memberName }"><br>
					  <span class="expResult"></span>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="phone">전화번호</label>
					  <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.m.phone }"><br>
					  <span class="expResult"></span>
					</div>
					<div class="form-group pageBtn"  style="margin-top: 30px;">
						<a href="/changePwFrm.do">비밀번호 변경하기</a>
						<button type="submit" class="btn btn-primary" id="joinBtn">정보변경</button>	
						<button type="button" class="btn btn-danger resgin">회원탈퇴</button>		  					
					</div>
		        </form>
			  </div><!--update-middle 끝나는 지점  -->
			</div><!--update-wrap 끝나는 지점  -->
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		//사진 업로드시 확장자 제한 
		$("#formFile").change(function(){
			
			var fileVal = $(this).val();
			var pathPoint = fileVal.lastIndexOf('.');
			var filePoint = fileVal.substring(pathPoint+1, this.length);
			var fileType = filePoint.toLowerCase();
			var fileSize = 10 * 1024 * 1024; //10메가
			if(fileType == 'jpg' || fileType == 'png' || fileType == 'jpeg' || fileType == 'gif'){
			var uploadFileSize = this.files[0].size;
				if(uploadFileSize > fileSize){
					swal({
				        title: '사진 용량이 큽니다',
				        text: '프로필 사진 20mb미만 파일만 가능합니다.',
				        icon: 'warning'
				      })
					$("#formFile").val("");
					return;
				}
			}else if(fileVal == ""){
				$("#formFile").val("");
				return;
			}else{
				swal({
			        title: '확장자를 확인해주세요!',
			        text: '프로필사진은 이미지 파일만 가능합니다.',
			        icon: 'warning'
			      })
				$("#filepath").val("");
				return;
			}
			
			
			var inputfile = $("#formFile")[0].files;
			var memberId = $("#memberId").val();
			
			var formData = new FormData();
			formData.append("files",inputfile[0]);
			formData.append("memberId",memberId);
			//형식이 올바를 경우 여기서 프로필 바로 업로드 시작
			$.ajax({
				type : "POST",
				url : "/uploadProfile.do",
				processData : false,
				contentType: false,
				data : formData,
				success: function(data){
					if(data == 1){
						//성공메세지
						swal({
					        title: '프로필 변경성공!',
					        text: '',
					        icon: 'success'
					      })
					      
					}else{
						//실패메세지
						swal({
					        title: '프로필 변경 실패',
					        text: '다시 시도해 주세요',
					        icon: 'warning'
					      })
					}
					
				}
					
			});
			loadImg(this);
		});
		
		function loadImg(obj){
			var files = obj.files;	//input type="file"에서 선택한 파일을 배열로 가져옴
			if(files.length != 0){	//첨부파일 있는 경우
				var reader = new FileReader(); //파일에 대한 정보를 읽어오는 객체
				reader.readAsDataURL(files[0]);	//파일경로를 읽어옴
				//경로를 다 읽어오면 실행할 함수 설정
				reader.onload = function(e){ //e 에 읽어온 파일 정보가 들어있음
					$("#pic").attr("src", e.target.result); //읽어온 경로를 img태그의 src속성에 설정
				}
			} 
		}
	</script>
	<script type="text/javascript" src="/resources/js/member/updateMyInfo.js"></script>
</body>
</html>