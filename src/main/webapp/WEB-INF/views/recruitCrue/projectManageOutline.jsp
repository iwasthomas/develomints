<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Project Outline</title>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<link rel="stylesheet" href="/resources/css/projectTeam/projectManageDefault.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/projectManageOutline.css">
<script>
	$(function(){
		$("#updateLabel1").click(function(){
            $(".checkboxFlexList").css("display","flex");
            $("#updateLabel1").css("display","none");
            $("#updateLabel2").css("display","block");
        });
        $("#updateLabel2").click(function(){
            $(".checkboxFlexList").css("display","none");
            $("#updateLabel1").css("display","block");
            $("#updateLabel2").css("display","none");
        });

        $("#updateLeaderLabel1").click(function(){
            $("#selectLeaderBox").css("display","block");
            $("#updateLeaderLabel1").css("display","none");
            $("#updateLeaderLabel2").css("display","block");
        });
        $("#updateLeaderLabel2").click(function(){
            $("#selectLeaderBox").css("display","none");
            $("#updateLeaderLabel1").css("display","block");
            $("#updateLeaderLabel2").css("display","none");
        });
        
    }
	
</script>
</head>
<body>
	<div class="container" id="projectContainer">
        <div class="main">
            <div class="main-left-box">
                <h2>프로젝트 명</h2>
                <ul>
                    <li class="flexLi" style="border-bottom: 3px dashed #90d1b4;">
                        <a href="#" class="subNaviAtag" ><img src="img/recruitTeamProject/recruitPage/powerOn.png" class="subNaviImg"><span style="cursor: pointer;">프로젝트 개요</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><img src="img/recruitTeamProject/추후사용/calendar.png" class="subNaviImg"><span style="cursor: pointer;">캘린더</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><img src="img/recruitTeamProject/추후사용/makefg (8).png" class="subNaviImg"><span style="cursor: pointer;">과업 관리</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><img src="img/recruitTeamProject/추후사용/board.png" class="subNaviImg"><span style="cursor: pointer;">보드</span></a>
                    </li>
                    <c:foreach 바로가기>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><span style="cursor: pointer;">바로가기</span></a>
                    </li>
                    </c:foreach>
                    <li class="flexLi">
                        <a data-bs-toggle="modal" href="#shortcutModal" class="subNaviAtag"><img src="img/recruitTeamProject/추후사용/shortcuts.png" class="subNaviImg"><span style="cursor: pointer;">바로가기 추가</span></a>
                    </li>
                </ul>
            </div>
            <div class="main_wrap">
                <div class="titleFlexBox">
                    <p class="titleText">프로젝트 개요</p>
                    <a data-bs-toggle="modal" href="#projectEnd"><button type="button" class="btn btn-primary" id="closeProjectBtn">프로젝트 종료</button></a>
                </div>
                <div class="titleLine"></div>
                <div class="projectInfoFlexBox">
                    <div class="projectInfoLine1">
                        <form action="#" method="post">
                            <div class="form-group">
                                <label class="col-form-label col-form-label-lg mt-4" for="inputLarge" >프로젝트 이름</label>
                                <input class="form-control form-control-lg" type="text" placeholder="프로젝트명" id="inputLarge">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label col-form-label-lg mt-4" for="inputLarge" >프로젝트 목표</label>
                                <input class="form-control form-control-lg" type="text" placeholder="프로젝트명" id="inputLarge">
                            </div>
                            <div class="projectLanguageBox">
                                <div class="projectLanguageFlexBox">
                                    <p class="infoLineText1">사용 언어</p>
                                    <button type="button" class="btn btn-primary btn-sm" id="updateLabel1">수정</button>
                                    <button type="button" class="btn btn-primary btn-sm" id="updateLabel2">취소</button>
                                </div>
                                <div class="languageBox">
                                    <img src="img/recruitTeamProject/common/language/django.png" style="width: 50px; margin-right: 10px;">
                                    <img src="img/recruitTeamProject/common/language/flutter.png" style="width: 50px; margin-right: 10px;">
                                    <img src="img/recruitTeamProject/common/language/python.png" style="width: 50px; margin-right: 10px;">
                                </div>
                                <div class="checkboxFlexList">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                        <c:forEach items="${dlList }" var="dll" begin="0" end="7" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
                                        <c:forEach items="${dlList }" var="dll" begin="8" end="15" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
                                        <c:forEach items="${dlList }" var="dll" begin="16" end="23" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="projectLeader">
                                <div class="projectLanguageFlexBox">
                                    <p class="infoLineText1">프로젝트 리더</p>
                                    <button type="button" class="btn btn-primary btn-sm" id="updateLeaderLabel1">수정</button>
                                    <button type="button" class="btn btn-primary btn-sm" id="updateLeaderLabel2">취소</button>
                                </div>
                                <div class="leaderInfoBox">
                                    <img src="img/recruitTeamProject/common/user.png" class="leaderImg">
                                    <p class="leaderIdText">memberId</p>
                                    <img src="img/recruitTeamProject/common/rank/challenger.png" class="leaderGradeImg">
                                </div>
                                <div id="selectLeaderBox">
                                    <div class="form-group">
                                        <label for="exampleSelect1" class="form-label mt-4">프로젝트 리더 선택</label>
                                        <select class="form-select" id="exampleSelect1" style="width: 400px;">
                                            <option><p>memberId</p></option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="crueBox">
                                    <p class="infoLineText1">프로젝트 크루 및 역할</p>
                                    <div class="crueTwoFlexBox">
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="crueTwoFlexBox">
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="crueTwoFlexBox">
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                                <div class="taskMainFlexBox">
                                    <div class="taskInfoBox">
                                        <p class="infoLineText2">최근에 완료된 일</p>
                                        <div class="taskSubFlexBox">
                                            <p class="taskText">스프린트</p>
                                            <span class="badge rounded-pill bg-primary">완료</span>
                                        </div>
                                    </div>
                                    <div class="taskInfoBox" style="margin-right: 150px;">
                                        <p class="infoLineText2">앞으로 해야 할 일</p>
                                        <div class="taskSubFlexBox">
                                            <p class="taskText">스프린트 회고</p>
                                            <span class="badge rounded-pill bg-primary">처리중</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="areaLine"></div>
                            <div class="submitBtnArea">
                                <button type="submit" class="btn btn-primary">수정</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="shortcutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addShortcut.do" method="post">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;">바로가기 추가</p>
                        <div class="form-group" style="margin-bottom: 15px;">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">웹 주소</label>
                            <input type="text" class="form-control" placeholder="웹 주소를 넣어주세요" id="inputDefault" name="shortcutAddr" >
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">바로가기 이름</label>
                            <input type="text" class="form-control" placeholder="바로가기 이름을 입력해주세요" id="inputDefault" name="shortcutName">
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">추가</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="projectEnd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p style="font-size: 35px; font-weight: bold; color: rgb(78, 205, 196); margin-bottom: 10px; text-align: center;">프로젝트 종료</p>
                    <div class="card-body">
                        <h4 class="card-title" style="text-align: center; margin-bottom: 30px; color: #90d1b4; font-weight: 900;">프로젝트 종료 관련 안내 및 주의사항</h4>
                        <p class="card-text" style="text-align: left; margin-bottom: 20px; font-weight: 900;">
                            1. 프로젝트를 프로젝트를 종료하면 지금까지 작업한 정보는 저장되며 추후에도 마이페이지에서 확인이 가능합니다.
                            <br>
                            <br>
                            2. 종료 이후 수정이나 삭제는 불가능하오니 이 점 <br> 주의해주시기 바랍니다.
                        </p>
                        <p class="card-text" style="text-align: center; margin-bottom: 30px; margin-top: 30px; font-weight: 900; color: #FF5677;">
                            종료버튼을 누르고 모든 팀원들에 대해 후기를 작성해야  <br> 최종적으로 프로젝트가 종료되니 명심해주세요!
                        </p>
                    </div>
                    <div style="text-align: center; padding-top: 10px;">
                        <a data-bs-toggle="modal" href="#writeReview"><button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 15px;">종료</button></a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="writeReview" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/endProject.do" method="post"></form>
                        <p style="font-size: 35px; font-weight: bold; color: rgb(78, 205, 196); margin-bottom: 10px; text-align: left;">팀원에게 후기를 남겨주세요</p>
                        <p style="font-weight: 900;"> &#10004; 후기는 익명으로 등록됩니다.</p>
                        <div style="border-bottom: 1px solid #90d1b4; margin-bottom: 60px;"></div>

                        <div style="display: flex; margin-left: 50px; margin-top: 50px;">
                            <div style="display: flex; flex-direction: column; margin-right: 30px; margin-top: 10px;">
                                <img src="img/recruitTeamProject/common/user.png" style="width: 100px; height: 100px; margin-left: 10px;">
                                <p style="font-size: 26px; font-weight: 900;">memberId</p>
                            </div>
                            <div style="display: flex; flex-direction: column;">
                                <div style="display: flex;">
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/bigHappy.png" style="width: 40px; height: 40px; display: block; margin: 0px auto;">
                                        <label for="r5" style="text-align: center;">매우좋았어요</label>
                                        <input type="radio" id="r5" name="reviewRadio" value="5" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/happy.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r4">좋았어요</label>
                                        <input type="radio" id="r4" name="reviewRadio" value="4" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/common.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r3">친절해요</label>
                                        <input type="radio" id="r3" name="reviewRadio" value="3" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/bad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r2">나빠요</label>
                                        <input type="radio" id="r2" name="reviewRadio" value="2" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/superBad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r1">매우나빠요</label>
                                        <input type="radio" id="r1" name="reviewRadio" value="1" style="display: block; margin: 0px auto;">
                                    </div>
                                    
                                </div>
                                <div class="form-group" style="margin-top: 20px;">
                                    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex; margin-left: 50px; margin-top: 50px;">
                            <div style="display: flex; flex-direction: column; margin-right: 30px; margin-top: 10px;">
                                <img src="img/recruitTeamProject/common/user.png" style="width: 100px; height: 100px; margin-left: 10px;">
                                <p style="font-size: 26px; font-weight: 900;">memberId</p>
                            </div>
                            <div style="display: flex; flex-direction: column;">
                                <div style="display: flex;">
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/bigHappy.png" style="width: 40px; height: 40px; display: block; margin: 0px auto;">
                                        <label for="r5" style="text-align: center;">매우좋았어요</label>
                                        <input type="radio" id="r5" name="reviewRadio" value="5" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/happy.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r4">좋았어요</label>
                                        <input type="radio" id="r4" name="reviewRadio" value="4" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/common.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r3">친절해요</label>
                                        <input type="radio" id="r3" name="reviewRadio" value="3" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/bad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r2">나빠요</label>
                                        <input type="radio" id="r2" name="reviewRadio" value="2" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/superBad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r1">매우나빠요</label>
                                        <input type="radio" id="r1" name="reviewRadio" value="1" style="display: block; margin: 0px auto;">
                                    </div>
                                    
                                </div>
                                <div class="form-group" style="margin-top: 20px;">
                                    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex; margin-left: 50px; margin-top: 50px;">
                            <div style="display: flex; flex-direction: column; margin-right: 30px; margin-top: 10px;">
                                <img src="img/recruitTeamProject/common/user.png" style="width: 100px; height: 100px; margin-left: 10px;">
                                <p style="font-size: 26px; font-weight: 900;">memberId</p>
                            </div>
                            <div style="display: flex; flex-direction: column;">
                                <div style="display: flex;">
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/bigHappy.png" style="width: 40px; height: 40px; display: block; margin: 0px auto;">
                                        <label for="r5" style="text-align: center;">매우좋았어요</label>
                                        <input type="radio" id="r5" name="reviewRadio" value="5" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/happy.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r4">좋았어요</label>
                                        <input type="radio" id="r4" name="reviewRadio" value="4" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/common.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r3">친절해요</label>
                                        <input type="radio" id="r3" name="reviewRadio" value="3" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/bad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r2">나빠요</label>
                                        <input type="radio" id="r2" name="reviewRadio" value="2" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/superBad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r1">매우나빠요</label>
                                        <input type="radio" id="r1" name="reviewRadio" value="1" style="display: block; margin: 0px auto;">
                                    </div>
                                    
                                </div>
                                <div class="form-group" style="margin-top: 20px;">
                                    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex; margin-left: 50px; margin-top: 50px;">
                            <div style="display: flex; flex-direction: column; margin-right: 30px; margin-top: 10px;">
                                <img src="img/recruitTeamProject/common/user.png" style="width: 100px; height: 100px; margin-left: 10px;">
                                <p style="font-size: 26px; font-weight: 900;">memberId</p>
                            </div>
                            <div style="display: flex; flex-direction: column;">
                                <div style="display: flex;">
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/bigHappy.png" style="width: 40px; height: 40px; display: block; margin: 0px auto;">
                                        <label for="r5" style="text-align: center;">매우좋았어요</label>
                                        <input type="radio" id="r5" name="reviewRadio" value="5" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/happy.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r4">좋았어요</label>
                                        <input type="radio" id="r4" name="reviewRadio" value="4" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/common.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r3">친절해요</label>
                                        <input type="radio" id="r3" name="reviewRadio" value="3" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/bad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r2">나빠요</label>
                                        <input type="radio" id="r2" name="reviewRadio" value="2" style="display: block; margin: 0px auto;">
                                    </div>
                                    <div class="modalReviewSub1">
                                        <img src="img/recruitTeamProject/review/superBad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
                                        <label for="r1">매우나빠요</label>
                                        <input type="radio" id="r1" name="reviewRadio" value="1" style="display: block; margin: 0px auto;">
                                    </div>
                                    
                                </div>
                                <div class="form-group" style="margin-top: 20px;">
                                    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div style="border-bottom: 1px solid #90d1b4; margin-bottom: 10px; margin-top: 40px;"></div>
                        <div style="text-align: center; padding-top: 10px; margin-top: 40px; margin-bottom: 40px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 150px; margin-right: 15px;">후기작성 완료</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>