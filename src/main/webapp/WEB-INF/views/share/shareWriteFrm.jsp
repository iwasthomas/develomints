<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico"/>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<meta charset="UTF-8">
<title>Develomints</title>
<style>
	.bi{
		color: #4ecdc4;
		font-size: 2rem;
	}
	#page-head{
		font-size: 30px;
		font-family: NotoBold;
		margin-right: 25px;
		margin-left: 200px;
	}
	.page-wrap{
		width: 900px;
		margin: 0 auto;
		margin-top:50px;
		margin-bottom: 100px;
   		border-radius: 10px;
   		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
   		padding: 40px;
	}
	.categorys{
		display: flex;
		align-items: center;
	}
	.cateImg{
		width: 25px;
		height: 25px;
		margin-top: 17px;
		margin-left: 15px;
	}
	.summerContentTop{
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-top: 20px;
	}
	label{
		font-family: NotoBold;
	}
	.submitDiv{
		margin-top: 20px;
		text-align: right;
	}
	#submitBtn{
		width: 150px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container">
        <span id="page-head">글작성하기</span><i class="bi bi-pen"></i>
        <div class="page-wrap">
            <form action="/insertShareBoard.do" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="categorys">
                        <label for="boardType" class="form-label mt-4">상세 유형</label><img
                            src="/resources/img/shareBoard/options-lines.png" class="cateImg">
                    </div>
                    <select class="form-select" id="boardType" name="boardType">
                        <option value="1">사는 얘기</option>
                        <option value="2">Tech Q&A</option>
                        <option value="3">Tips & 강좌</option>
                        <option value="4">IT NEWS & 정보</option>
                    </select>
                </div>
                <div class="form-group">
                    <div class="categorys">
                        <label class="form-label mt-4" for="boardTitle">글 제목</label><img src="/resources/img/shareBoard/title.png" class="cateImg">
                    </div>
                    <input type="text" class="form-control" id="boardTitle" name="boardTitle">
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <div class="categorys">
                            <label for="filepath" class="form-label mt-4">첨부 파일</label><img
                                src="/resources/img/shareBoard/upload.png" class="cateImg">
                        </div>
                        <input class="form-control" type="file" id="filepath">
                    </div>
                    <div class="summerContentTop">
                        <div>
                            <label for="boardContent" class="form-label mt-4">글 내용</label>
                        </div>
                        <div style="margin-top: 20px;">
                            <span class="text-info">남은 글자 수 - </span><span class="text-muted"
                                id="maxContentPost">3000</span>
                        </div>
                    </div>
                    <textarea class="form-control" id="boardContent" name="boardContent" rows="3"></textarea>
                </div>
            </form>
            <div class="submitDiv">
	            <button class="btn btn-outline-primary" id="submitBtn">글작성</button>            
            </div>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- Jquery 먼저 불러고오고, summerNote가 돌아야함 -->
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script>
	  $(function(){
		
		$("#boardContent").summernote({
			height: 500,
			minHeight: 500,
			maxHeight: 500,
			lang : "ko-KR",
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks :{
				onImageUpload : function(files){
					uploadImage(files[0],this);	
				},
				onKeydown: function (e) { 
                    var t = e.currentTarget.innerText; 
                    if (t.trim().length >= 3000) {
                        //delete keys, arrow keys, copy, cut, select all
                        if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey) && !(e.keyCode == 65 && e.ctrlKey))
                        e.preventDefault(); 
                    } 
                },
                onKeyup: function (e) {
                    var t = e.currentTarget.innerText;
                    $('#maxContentPost').text(3000 - t.trim().length);
                },
                onPaste: function (e) {
                    var t = e.currentTarget.innerText;
                    var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                    e.preventDefault();
                    var maxPaste = bufferText.length;
                    if(t.length + bufferText.length > 3000){
                        maxPaste = 3000 - t.length;
                    }
                    if(maxPaste > 0){
                        document.execCommand('insertText', false, bufferText.substring(0, maxPaste));
                    }
                    $('#maxContentPost').text(3000 - t.length);
                }
				
			}
		}); // 썸머노트 입력문 종료
		function uploadImage(file,editor){
			data = new FormData();
			data.append("file",file);
			$.ajax({
				url : "/boardSummerImage.do",
				type :"post",		//file전송을 위해 ajax를 할떄는 type을 post로 해줘야한다
				data : data,
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				success : function(data){					
					$(editor).summernote("insertImage",data);
				}
			});
		 }
		//제출 버튼 눌렀을때, 유효성 검사
		$("#submitBtn").click(function(){
			//submit 전에 비어있는지 확인하기 위한 변수
			var typeVal = $("#boardType").val();
			var titleVal = $("#boardTitle").val();
			var contentVal = $("#boardContent").val();
			
			
			console.log(typeVal);
			console.log(titleVal);
			console.log(contentVal);
			console.log(contentVal.length);
			
			if(typeVal==""||titleVal==""||contentVal.length==0){
				 swal({
					   title: "등록실패",
					   text: "입력값을  다시 확인해주세요.",
					   icon: "warning", //"info,success,warning,error" 중 택1
					   button: "돌아가기",
					})
				 return false;				
			}else{
				$("form").submit();
			}
		});
	  });
	</script>	
</body>
</html>