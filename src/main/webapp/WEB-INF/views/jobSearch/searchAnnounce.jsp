<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>
    .contain{
        width: 1200px;
        margin: 0 auto;
    }
    .jobSearchListHeader{
        overflow: hidden;
        margin-left: 100px;
    }
    .headerText1{
        margin-top: 150px;
        margin-right: 100px;
        font-weight: 900;
        font-size: 20px;
        float: left;
    }
    .headerText1>h1{
        margin: 5px 0px;
        color: black;
        font-weight: 900;
    }
    .headerText1>p{
    	margin-top: 20px;
        width: 300px;
        color: gray;
        font-size: 13px;
    }
    .resume{
        background-color: rgb(78, 205, 196);
        border: none;
        font-size: 15px;
        font-weight: 900;
        width: 200px;
        height: 50px;
        color: white;
        cursor: pointer;
    }
    .resume>a{
        text-decoration: none;
    }
    .headerImg{
        float: left;
    }
    .mainHeader{
        width: 1000px;
        margin: 0 auto;
    }
    .mainHeader>p{
        font-size: 18px;
        margin-left: 10px;
        margin-bottom: 50px;
        color: rgb(65, 65, 65);
    }
    .mainCenter{
        width: 1000px;
        margin: 0 auto;
    }
    .mainCenter>select{
        width: 310px;
        height: 50px;
        padding-left: 15px;
        margin-right: 20px;
        outline: none;
    }
    .mainCenter>input{
        width: 330px;
        height: 50px;
        padding-left: 15px;
        outline: none;
    }
    .content{
        margin-top: 50px;
        width: 995px;
        border: 1px solid gray;
        padding: 30px;
        padding-bottom: 0;
        overflow: hidden;
        padding-left: 50px;
        box-sizing: border-box;
    }
    .status{
        float: left;
        width: 70px;
        height: 30px;
        text-align: center;
        line-height: 30px;
        color: white;
        background-color: rgb(78, 205, 196);
    }
    .cpName{
        float: left;
        margin-left: 20px;
        padding-top: 3px;
        font-size: 13px;
	    }
    .cpName>a{
        color: blue;
        text-decoration: none;
    }
    .title{
        margin-top: 40px;
        margin-bottom: 15px;
    }
    .title>a{
        text-decoration: none;
        font-size: 24px;
        font-weight: 900;
        color: black;
    }
    .info{
        overflow: hidden;
    }
    .humanInfo{
        float: left;
    }
    .humanInfo>span{
        margin-right: 20px;
        color: gray;
    }
    .workInfo{
        float: left;
    }
    .workInfo>span{
        margin-left: 20px;
        color: gray;
    }
    .mainFooter{
        overflow: hidden;
        margin-top: 30px;
    }
    .tech{
        float: left;
        height: 50px;
    }
    .tech span{
        background-color: rgb(226, 226, 226);
        color: gray;
        padding: 10px;
        width: 50px;
        height: 30px;
        border-radius: 10px;
    }
    .subInfo{
        float: left;
        margin-left: 30px;
        color: rgb(100, 100, 100);
    }
    .subInfo>span{
    	font-size: 13px;
    }
    .situation{
        float: right;
        color: gray;
        padding-bottom: 30px;
        padding-right: 20px;
        font-size: 14px;
    }
    .date>span{
        color: rgb(78, 205, 196);
    }
    .apply>span{
        color: rgb(78, 205, 196);
    }
    .search{
    	position: absolute;
    }
    #searchImg{
    	width: 20px;
    	height: 20px;
    	position: relative;
    	left: 290px;
    	top: -4px;
    	cursor: pointer;
    }
    #pageNavi{
    	display: flex;
    	justify-content: center;
    	margin: 30px 0px;
    }
</style>
<body>
<script>
$(function(){
	
	$("#searchImg").click(function(){
		var placeType = $("select[name=place_type]").val();
		var workType = $("select[name=work_type]").val();
		var keyword = $("input[name=keyword]").val();
		console.log(placeType);
		console.log(workType);
		console.log(keyword);
		
		location.href = "/searchAnnounce.do?reqPage=1&keyword=" + keyword + "&placeType=" + placeType + "&workType=" + workType;
	});
});

</script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
        <div class="jobSearchListHeader">
            <div class="headerText1">
                <h1>IT???????????????</h1>
                <h1>?????????????????????</h1>
                <h1>????????? ????????????</h1>
                <p>?????????????????? ??????, ??? ??????, ?????? ??????????????? ??????, ??? ?????????, ?????????, ????????? ???</p>
                <c:choose>
                	<c:when test="${not empty sessionScope.m }">
                		<c:if test="${sessionScope.m.memberType eq 1 or sessionScope.m.memberType eq 2 }">		<!-- ??????????????? ?????? -> ????????? ???????????? ????????? -->
			                <a href="resumeManage.do?memberNo=${sessionScope.m.memberNo }&reqPage=1"><button class="resume">????????? ????????????</button></a>                		
                		</c:if>
                		<c:if test="${sessionScope.m.memberType eq 3 }">		<!-- ??????????????? ?????? -> ????????? ???????????? ????????? -->
			                <a href="announceManage.do?memberNo=${sessionScope.m.memberNo }"><button class="resume">????????? ????????????</button></a>                		
                		</c:if>
                	</c:when>
                	<c:otherwise>
                <a href="loginFrm.do"><button class="resume">????????? ????????????</button></a>                		
                	</c:otherwise>
                </c:choose>
            </div>
            <div class="headerImg">
                <img src="resources/img/jobSearch/jobSearchList.PNG">
            </div>
        </div>
        <div class="jobSearchListMain">
            <div class="mainHeader">
                <h2>????????????</h2>
                <%-- <p>${count }?????? ?????????</p> --%>
            </div>
            <div class="mainCenter">
                <select name="place_type" class="place_type">
                    <option value="0">?????? ??????</option>
                    <option value="1">??????</option>
                    <option value="2">??????</option>
                    <option value="3">??????</option>
                    <option value="4">??????</option>
                    <option value="5">??????</option>
                    <option value="6">??????</option>
                    <option value="7">??????</option>
                    <option value="8">??????</option>
                    <option value="9">??????</option>
                    <option value="10">??????</option>
                    <option value="11">??????</option>
                    <option value="12">??????</option>
                </select>
                <select name="work_type" class="work_type">
                    <option value="0">?????? ??????</option>
                    <option value="1">IT ??????</option>
                    <option value="2">??? ?????????</option>
                    <option value="3">???????????? ??????</option>
                </select>
                <input type="text" placeholder="?????? " class="search" name="keyword"><img id="searchImg" src="/resources/img/jobSearch/dot.PNG">
                
                <c:choose>
	                <c:when test="${empty list }">
	                	????????? ???????????? ????????????.
	                </c:when>
	                <c:otherwise>
	                
	                
                <c:forEach items="${list }" var="a" varStatus="i">
	                <div class="content">
	                    <div class="status">?????????</div>
	                    <div class="cpName"><a href="companyInfo.do?companyNo=${a.companyNo }">${a.companyName }</a></div>	
	                    <div class="title">
	                    <c:if test="${not empty sessionScope.m }">
	                        <a href="/announceView.do?announceNo=${a.announceNo}&memberNo=${sessionScope.m.memberNo }<%-- &memberNo=${sessionScope.m.memberNo } --%>">${a.announceTitle }</a>	
	                    </c:if>
	                    <c:if test="${empty sessionScope.m }">
	                        <a href="/announceView.do?announceNo=${a.announceNo}&memberNo=0<%-- &memberNo=${sessionScope.m.memberNo } --%>">${a.announceTitle }</a>	
	                    </c:if>
	                    </div>
	                    <div class="info">
	                        <div class="humanInfo">
	                            <span>??????</span> 
	                            <c:if test="${a.career eq 1}">
	                            	<span>??????</span>
	                            </c:if>
	                            <c:if test="${a.career eq 2}">
	                            	<span>??????</span>
	                            </c:if>
	                            <c:if test="${a.career eq 3}">
	                            	<span>????????????</span>
	                            </c:if>
	                            <br>
	                            <span>??????</span> 
	                            <c:if test="${a.school eq 1}">
		                            <span>???????????? ??????</span>
	                            </c:if>
	                            <c:if test="${a.school eq 2}">
		                            <span>????????? ??????</span>
	                            </c:if>
	                            <c:if test="${a.school eq 3}">
		                            <span>???????????? ??????</span>
	                            </c:if>
	                            <c:if test="${a.school eq 4}">
		                            <span>????????? ?????? ??????</span>
	                            </c:if>
	                            <c:if test="${a.school eq 5}">
		                            <span>????????????</span>
	                            </c:if>
	                        </div>
	                        <div class="workInfo">
	                            <span>|</span>
	                            <c:if test="${a.workForm eq 1}">
	                            	<span>?????????</span>
	                            </c:if>
	                            <c:if test="${a.workForm eq 2}">
	                            	<span>?????????</span>
	                            </c:if>
	                            <c:if test="${a.workForm eq 3}">
	                            	<span>???????????????</span>
	                            </c:if>
	                            <c:if test="${a.workForm eq 4}">
	                            	<span>??????</span>
	                            </c:if>
	                            <c:if test="${a.workForm eq 5}">
	                            	<span>????????????</span>
	                            </c:if>
	                            <br>
	                            <span>|</span>
	                            <c:if test="${a.category eq 1}">
	                            <span>IT ??????</span>	                            	
	                            </c:if>
	                            <c:if test="${a.category eq 2}">
	                            <span>??? ?????????</span>	                            	
	                            </c:if>
	                            <c:if test="${a.category eq 3}">
	                            <span>???????????? ??????</span>	                            	
	                            </c:if>
	                        </div>
	                    </div>
	                    <div class="mainFooter">
	                        <div class="tech">
	                            <span>${a.skills }</span>
	                        </div>
	                        <div class="subInfo">
	                            <span><c:if test="${a.workPlace eq 1 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 2 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 3 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 4 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 5 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 6 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 7 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 8 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 9 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 10 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 11 }">
	                            	??????
	                            </c:if>
	                            <c:if test="${a.workPlace eq 12 }">
	                            	??????
	                            </c:if></span> <span style="margin-left: 20px;">???????????? ${a.writeDate }</span>
	                        </div>
	                        <div class="situation">
	                            <div class="date">?????? <span>${a.dDay }</span>??? ???</div>		<!-- 7 -> ?????????-????????? ?????? ???????????? -->
	                            <div class="apply">??? <span>${a.count }</span>??? ??????</div>		<!-- 2 -> ????????? ????????? ?????? count  ???  -->
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
                </c:otherwise>
                </c:choose>
                <br>
                <%-- <div id="pageNavi" style="padding: 0px;">${pageNavi }</div> --%>
            </div>
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>