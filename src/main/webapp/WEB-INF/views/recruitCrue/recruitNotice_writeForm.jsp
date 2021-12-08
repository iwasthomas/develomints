<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>RecruitCrue WriteForm</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="/resources/js/projectTeam/plugin/bootstrap-datepicker.js"></script>
	<script src="/resources/js/projectTeam/plugin/bootstrap-datepicker.ko.min.js"></script>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/writePage.css">

<script>
	$(function(){
		
		var resultArr = [false, false, false, false, false, false, false, false];
		$("input[type='checkbox']").on("click", function(){
			var count = $(".btn-check:checked").length;
			if(count>3){
				$(this).prop("checked", false);
				swal("선택 값 초과", "최대 3개 까지 선택이 가능합니다.", "warning");
			}
		});
		
		
	
		$(".return_img").click(function(){
			$(".return_img").css("cursor", "pointer");
			history.back();
		});
		
	});
	
	function checkValue(){
        if(!($(".btn-check:checked").length == 0) && ($("#datePicker").val() == "") && ($("#inputLarge").val() == "") && ($("input[name=projectTitle]").val() == "")
        		&& ($("input[name=projectGoal]").val() == "")) && ($("input[name=boardContent]").val() == ""))) {
        	swal("체크하지 않거나 입력되지 않은 값이 있습니다.", "비어있는 입력값이 있는지 다시 한번 확인해주세요!", "warning");
        	return false;
        } 
        
        if($('#maxContentPost').text < 0){
        	swal("입력값 초과", "모집설명에서 입력값이 허용치를 초과하였습니다, 다시 작성해주세요.", "warning");
        	return false;
        }
        
    }
	
</script>
	
	<div class="container" id="projectContainer">
		<div class="main">
            <div class="returnPage">
                <img class="return_img" src="/resources/img/recruitTeamProject/writePage/left.png">
            </div>
            <div class="main_content">
	            <form action="/writeRecruitTeam.do" method="post" enctype="multipart/form-data" onsubmit="return checkValue();">
		            <div class="writeBox">
	                    <div class="form-group">
	                        <input class="form-control form-control-lg" type="text" placeholder="모집공고 제목을 입력해주세요." id="inputLarge" name="boardTitle" maxlength="30">
	                    </div>
	                    <div class="writeLine">
	                        <div class="titleFlexBox">
	                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/code.png">
	                            <p class="titleText">사용 언어(최대 3개 까지 선택 가능)</p>
	                        </div>
	                        <div class="checkboxFlexList">
	                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	                                <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" name="chk" value="javascript">
	                                <label class="btn btn-primary" for="btncheck1">javascript</label>
	                                <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" name="chk" value="typescript">
	                                <label class="btn btn-primary" for="btncheck2">typescript</label>
	                                <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" name="chk" value="react">
	                                <label class="btn btn-primary" for="btncheck3">react</label>
	                                <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off" name="chk" value="vue">
	                                <label class="btn btn-primary" for="btncheck4">vue</label>
	                                <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off" name="chk" value="node.js">
	                                <label class="btn btn-primary" for="btncheck5">node.js</label>
	                                <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off" name="chk" value="java">
	                                <label class="btn btn-primary" for="btncheck6">java</label>
	                                <input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off" name="chk" value="spring">
	                                <label class="btn btn-primary" for="btncheck7">spring</label>
	                            </div>
	                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
	                                <input type="checkbox" class="btn-check" id="btncheck8" autocomplete="off" name="chk" value="swift">
	                                <label class="btn btn-primary" for="btncheck8">swift</label>
	                                <input type="checkbox" class="btn-check" id="btncheck9" autocomplete="off" name="chk" value="kotlin">
	                                <label class="btn btn-primary" for="btncheck9">kotlin</label>
	                                <input type="checkbox" class="btn-check" id="btncheck10" autocomplete="off" name="chk" value="c++">
	                                <label class="btn btn-primary" for="btncheck10">c++</label>
	                                <input type="checkbox" class="btn-check" id="btncheck11" autocomplete="off" name="chk" value="go">
	                                <label class="btn btn-primary" for="btncheck10">go</label>
	                                <input type="checkbox" class="btn-check" id="btncheck12" autocomplete="off" name="chk" value="python">
	                                <label class="btn btn-primary" for="btncheck12">python</label>
	                                <input type="checkbox" class="btn-check" id="btncheck13" autocomplete="off" name="chk" value="django">
	                                <label class="btn btn-primary" for="btncheck13">django</label>
	                                <input type="checkbox" class="btn-check" id="btncheck14" autocomplete="off" name="chk" value="flutter">
	                                <label class="btn btn-primary" for="btncheck14">flutter</label>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="writeLine">
	                        <div class="titleFlexBox">
	                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/pending.png">
	                            <p class="titleText">모집마감일(모집일부터 최대 14일)</p>
	                        </div>
	                        <input type="text" id="datePicker" class="form-control" placeholder="마감일을 선택해주세요" name="boardDeadLine">
	                       <!--  <ul class="nav nav-pills">
	                            <li class="nav-item dropdown">
	                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">날짜를 선택하세요</a>
	                                <div class="dropdown-menu">
	                                    <a class="dropdown-item">2021년 12월 23일</a>
	                                    <a class="dropdown-item">2021년 12월 24일</a>
	                                    <a class="dropdown-item">2021년 12월 25일</a>
	                                    <a class="dropdown-item">2021년 12월 26일</a>
	                                </div>
	                            </li>
	                        </ul> -->
	                    </div>
	                    <div class="line"></div>
	                    <div class="writeLine">
	                        <div class="titleFlexBox">
	                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/title.png">
	                            <p class="titleText">프로젝트명</p>
	                        </div>
	                        <div class="form-group">
	                            <input type="text" class="form-control" placeholder="내용을 입력해주세요" id="inputDefault" name="projectTitle" maxlength="40">
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="writeLine">
	                        <div class="titleFlexBox">
	                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/goal.png">
	                            <p class="titleText">프로젝트 목표(ex. 웹 페이지 정복)</p>
	                        </div>
	                        <div class="form-group">
	                            <input type="text" class="form-control" placeholder="내용을 입력해주세요" id="inputDefault" name="projectGoal" maxlength="60">
	                        </div>
	                    </div>
	                    <div class="line"></div>
	                    <div class="writeLine">
	                        <div class="titleFlexBox">
	                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/content-creator.png">
	                            <p class="titleText">모집설명</p>
	                        </div>
	                        <h4 id="maxContentPost" style="text-align:left"></h4>
	                        
	                        <div class="form-group">
	                            <textarea class="form-control" id="summernote" rows="3" name="boardContent"></textarea>
	                        </div>
	                    </div>
	                    <div class="finalLine"></div>
	                    <div class="submitBtnBox">
	                    	<input type="hidden" name="memberNo" value="${memberNo }">
	                        <button type="submit" class="btn btn-primary btn-lg" onclick="return checkValue();">제출</button>
	                    </div>
	                </div>
		        </form>
            </div>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	$(function(){
		 
		$("#summernote").summernote({
			height : 700,
			lang : "ko-KR",
			focus: false,
			placeholder: '프로젝트 공고내용을 자세히 작성해주세요..!',
			toolbar:[ 
						['fontname', ['fontname']],
						['fontsize', ['fontsize']], 
						['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], 
						['color', ['forecolor','color']], 
						['table', ['table']], 
						['para', ['ul', 'ol', 'paragraph']], 
						['height', ['height']], 
						['insert',['picture','link']], 
						['view', ['fullscreen', 'codeview', 'help']] 
					], 
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'], 
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks:{
				onImageUpload : function(files){
 					uploadImage(files[0], this);
 				},
				onKeydown: function (e) { 
                     var t = e.currentTarget.innerText; 
                     if (t.trim().length >= 1000) {
                         //delete keys, arrow keys, copy, cut, select all
                         if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey) && !(e.keyCode == 65 && e.ctrlKey))
                         e.preventDefault(); 
                     } 
                 },
                 onKeyup: function (e) {
                     var t = e.currentTarget.innerText;
                     
                 },
                 onPaste: function (e) {
                     var t = e.currentTarget.innerText;
                     var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                     e.preventDefault();
                     var maxPaste = bufferText.length;
                     if(t.length + bufferText.length > 1000){
                         maxPaste = 1000 - t.length;
                     }
                     if(maxPaste > 0){
                         document.execCommand('insertText', false, bufferText.substring(0, maxPaste));
                     }
                     $('#maxContentPost').text(1000 - t.length);
                 },
                 
			}
		});
	});
	
	function uploadImage(file, editor){
		data = new FormData();
		data.append("file",file);
		$.ajax({
			url : "/rUploadImage.do",
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
	
	$(function() {	
		$('#datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+14d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    /* datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. */
		    /* daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정 */
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    title: "마감일 선택",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		});//datepicker end
	});//ready end
	</script>
	
</body>
</html>