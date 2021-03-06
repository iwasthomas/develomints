<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<style>
	.contain{
		width: 1000px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.grayBox{
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 20px;
	}
	.resumeHeader{
		overflow: hidden;
	}
	.ceoResume>p{
		color: rgb(78, 205, 196);
		float: left;
	}
	.writeDate{
		color: rgb(108, 108, 108);
		float: left;
		margin-left: 20px;
		font-size: 12px;
		padding-top: 3px;
		
	}
	em{
		font-style: normal;
		font-weight: 900;
		font-size: 20px;
		margin-bottom: 15px;
	}
	.resumeInfo1{
		margin-bottom: 0;
	}
	.resumeInfo1, .resumeInfo2{
		width: 900px;
		overflow: hidden;
	}
	.resumeInfo2{
		margin-bottom: 30px;
	}
	.resumeInfo1>li, .resumeInfo2>li{
		color: rgb(158, 158, 158);
		list-style: none;
		overflow: hidden;
	}
	.resumeInfo1>li>div, .resumeInfo2>li>div{
		float: left;
	}
	.resumeInfoImg{
		width: 40px;
	}
	.resumeInfoImg>img{
		width: 20px;
	}
	.resumeInfoData{
		margin-left: 30px;
	}
	.money, .career{
		width: 280px;
		display: inline-block;
	}
	.workForm{
		width: 280px;
		display: inline-block;
		
	}
	.workPlace{
		width: 280px;
		display: inline-block;
	}
	.message{
		float: left;
	}
	.companyMessage{
		margin-left: 30px;
		border: none;
		width: 250px;
		height: 30px;
		border: none;
		border-radius: 20px;
		color: rgb(80, 80, 80);
		font-size: 14px;
		font-weight: 900;
		background-color: white;
		position: relative;
	}
	.requestCount{
		display: inline-block;
		padding: 5px 10px;
		background-color: rgb(78, 205, 196);
		color: white;
		border-radius: 100px;
		font-size: 12px;
		position: relative;
		left: -25px; 
		top: -10px;
	}
	.update{
		overflow: hidden;
		float: right;	
	}
	.updateResume, .ceoResumeView{
		border: none;
		width: 100px;
		height: 45px;
		border: 2px solid rgb(78, 205, 196);
		border-radius: 10px;
		color: rgb(78, 205, 196);
		background-color: white;
		margin-right: 10px;
		transition: background-color 1s;
	}
	.updateResume:hover{
		background-color: rgb(78, 205, 196);
		color: white;
	}
	.ceoResumeView:hover{
		background-color: rgb(78, 205, 196);
		color: white;
	}
	.resumeBtn{
        background-color: rgb(78, 205, 196);
        border: none;
        font-size: 15px;
        font-weight: 900;
        width: 200px;
        height: 50px;
        color: white;
        cursor: pointer;
    }
    .resumeExplain{
    	margin-top: 20px;
    	margin-bottom: 80px;
    }
    .resumeExplain>p{
    	margin-bottom: 0px;
    	color: rgb(108,108,108);
    	font-size: 12px;
    }
    .resumeCount{
    	margin-left: 20px;
    }
    .myResume{
    	overflow: hidden;
    	margin-left: 15px;
    	margin-bottom: 50px;
    }
    .register{
    	margin-left: 20px;
    	font-size: 13px;
    	font-weight: 900;
    	float: right;
    	position: relative;
    	top: -40px;
    	left: -50px;
    }
    
    input[type="checkbox"] { 
    	display: none; 
    } 
    .label__on-off {
    	overflow: hidden; 
    	position: relative; 
    	display: inline-block; 
    	width: 50px; height: 20px; 
    	-webkit-border-radius: 13px; 
    	-moz-border-radius: 13px; 
    	border-radius: 13px; 
    	background-color: #ed4956; 
    	color: #fff; 
    	font-weight: bold; 
    	cursor: pointer; 
    	-webkit-transition: all .3s; 
    	-moz-transition: all .3s; 
    	-ms-transition: all .3s; 
    	-o-transition: all .3s; 
    	transition: all .3s; 
    } 
    .label__on-off > * {
    	vertical-align: middle; 
    	-webkit-transition: all .3s; 
    	-moz-transition: all .3s; 
    	-ms-transition: all .3s; 
    	-o-transition: all .3s; 
    	transition: all .3s; 
    	font-size: 13px; 
    } 
    .label__on-off .marble { 
    	position: absolute; 
    	left: -1.5px; 
    	display: block;
    	width: 20px; 
    	height: 20px; 
    	background-color: #fff; 
    	-webkit-border-radius: 50%; 
    	-moz-border-radius: 50%; 
    	border-radius: 50%; 
    	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    	box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    } 
    .label__on-off .on { 
    	display: none; 
    	padding-left: 12px; 
    } 
    .label__on-off .off { 
    	padding-left: 25px; line-height: 10px; 
    }
    .on, .off{
    	position: relative;
    	top: -3px;
    }
    .input__on-off:checked + .label__on-off { 
    	background-color: #0bba82; 
    } 
    .input__on-off:checked + .label__on-off .on { 
    	display: inline-block; 
    } 
    .input__on-off{
    	display: none;
    }
    .input__on-off:checked + .label__on-off .off { 
    	display: none;
    } 
    .input__on-off:checked + .label__on-off .marble { 
    	left: 33px; 
    }
    .register>p{
    	width: 100px;
    	margin: 0;
    	/* display: inline-block; */
    }
    /* .ceoResumeChk{
    	display: inline-block;
    } */
	.noResume{
		width: 800px;
		height: 200px;
		margin: 0 auto;
		margin-top: 100px;
		text-align: center;
	}
    .wd{
    	margin-top: 20px;
    	margin-left: 30px;
    }
    .resumeTitle{
    	margin-left: 30px;    	
    }
    .wrap{
    	margin: 50px 0px;
    	height: 230px;
    	border: 1px solid #dfdfdf;
    	overflow: hidden;
    }
    .resumeTitle>a{
    	color: black;
    	text-decoration: none;
    }
    .deleteBtn{
    	float: right;
    }
    .deleteBtn>a{
    	color: #888;
    	font-size: 12px;
    	text-decoration: none;
    	position: relative;
    	top: -30px;
    	margin-right: 20px;
    }
    #pageNavi{
    	display: flex;
    	justify-content: center;
    	margin: 30px 0px;
    }
</style>
<script>
	$(function(){
		
		
		
		
		$(".resumeBtn").click(function(e){
			var count = $(".count").html();
			if($(".count").html() > 10) {
				alert("???????????? 10???????????? ????????? ???????????????.");
				e.preventDefault();
				console.log(count);
			}
		});
		
		$(".input__on-off").click(function(){
			var resumeNo = $(this).siblings(".resumeNo").val();
			var memberNo = $(this).siblings(".memberNo").val();
			console.log("resumeNo : " + resumeNo);
			console.log("memberNo : " + memberNo);
			$.ajax({
				url : "/ceoResume.do",
				data : {
					resumeNo : resumeNo,
					memberNo : memberNo
				},
				success : function(data) {		/* ?????????????????? ?????? ??? ???????????? ??????????????? ?????? ???????????? ?????? ??????????????? */
					$(".writeDate").eq(0).find("span").html(data.writeDate);
					$(".resumeTitle").eq(0).find("em").html(data.resumeTitle);
					if(data.career == 1) {
						$(".car").eq(0).find("span").html("??????");						
					} else if(data.career == 2) {
						$(".car").eq(0).find("span").html("??????");												
					}
					if(data.money == 1) {
					$(".mon").eq(0).find("span").html("??????????????? ??????");
					} else if (data.money == 2) {
					$(".mon").eq(0).find("span").html("2000??? ~ 2400???");
					} else if (data.money == 3) {
					$(".mon").eq(0).find("span").html("2400??? ~ 2800???");
					} else if (data.money == 4) {
					$(".mon").eq(0).find("span").html("2800??? ~ 3200???");
					} else if (data.money == 5) {
					$(".mon").eq(0).find("span").html("3200??? ~ 3600???");	
					} else if (data.money == 6) {
					$(".mon").eq(0).find("span").html("3600??? ~ 4000???");
					} else if (data.money == 7) {
					$(".mon").eq(0).find("span").html("4000??? ??????");
					}
					$(".wp").eq(0).find("span").html(data.workPlace);
					if(data.workForm == 1) {
						$(".wf").eq(0).find("span").html("?????????");						
					}
					else if(data.workForm == 2) {
						$(".wf").eq(0).find("span").html("?????????");						
					}
					else if(data.workForm == 3) {
						$(".wf").eq(0).find("span").html("???????????????");						
					}
					else if(data.workForm == 4) {
						$(".wf").eq(0).find("span").html("??????");						
					}
					else if(data.workForm == 5) {
						$(".wf").eq(0).find("span").html("????????????");						
					}
					
					/* 1. ?????????????????? ???????????? ???????????? ???????????? ?????? ?????????????????? ?????????????????? ?????????????????? ???????????? */
					/* or 2. ??????????????? ???????????????????????? switch css on?????? ??????????????? */
				}
			});
		});
		
		
	});
</script>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<em>????????? ??????</em>				<!-- if ????????? ????????? ????????? ???????????? ????????????. -->
		<!-- ??????????????? ceoResume == 1 -->
		<c:if test="${empty list }">
			<div class="grayBox">
						<div class="resumeHeader">
							<div class="ceoResume">
								<p style="margin-bottom: 10px;">???????????????</p>
							</div><br><br>
							<div class="resumeTitle" style="margin-bottom: 30px;">
								<em style="font-size:20px; color: #666;">?????? ???????????? ????????????.</em><br>
								<em style="font-size:20px; color: #666;">???????????? ??????????????? ?????? ????????? ????????? on?????? ??????????????? ?????? ???????????? ???????????????.</em>
							</div>
						</div>
					</div>
		</c:if>
		<c:forEach items="${list }" var="r" varStatus="i">
			<c:choose>
				<c:when test="${r.ceoResume eq 0 }">
					
				</c:when>
				<c:otherwise>
					
					<div class="grayBox">
						<div class="resumeHeader">
							<div class="ceoResume">
								<p>???????????????</p>
							</div>
							<div class="writeDate">
								<span>${r.writeDate }</span>	
							</div>
						</div>
							<div class="resumeTitle" style="margin-bottom: 30px;">
								<a href="/resumeView.do?resumeNo=${r.resumeNo }"><em>${r.resumeTitle }</em></a>	<!-- r.resumeTitle -->
							</div>
							<ul class="resumeInfo1">
				            	<li class="career">
				            		<div class="resumeInfoImg">
				            			<img src="resources/img/resume/career.PNG">
				            		</div>
				            		<div class="resumeInfoData car">
				            			<em style="font-size: 16px;">?????? : </em>
				            			<c:if test="${r.career eq 1 }">
											<span>??????</span>
										</c:if>
										<c:if test="${r.career eq 2 }">
											<span>??????</span>
										</c:if>
				            		</div>
				            	</li>   
				            	<li class="money">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/income.PNG">					
									</div>
									<div class="resumeInfoData mon">
										<em style="font-size: 16px;">?????? : </em>
										<c:if test="${r.money eq 1 }">		<!-- 1 -> ??????????????? ?????? -->
				            				<span>??????????????? ??????</span>
						            	</c:if>
						            	<c:if test="${r.money eq 2 }">		<!-- 2 -> 2000??? ~ 2400??? -->
						            		<span>2000??? ~ 2400???</span>
						            	</c:if>
						            	<c:if test="${r.money eq 3 }">		<!-- 3 -> 2400??? ~ 2800??? -->
						            		<span>2400??? ~ 2800???</span>
						            	</c:if>
						            	<c:if test="${r.money eq 4 }">		<!-- 4 -> 2800??? ~ 3200??? -->
						            		<span>2800??? ~ 3200???</span>
						            	</c:if>
						            	<c:if test="${r.money eq 5 }">		<!-- 5 -> 3200??? ~ 3600??? -->
						            		<span>3200??? ~ 3600???</span>
						            	</c:if>
						            	<c:if test="${r.money eq 6 }">		<!-- 6 -> 3600??? ~ 4000??? -->
						            		<span>3600??? ~ 4000???</span>
						            	</c:if>
						            	<c:if test="${r.money eq 7 }">		<!-- 7 -> 4000??? ?????? -->
						            		<span>4000??? ??????</span>
						            	</c:if>
									</div>
								</li>  
							</ul>
							<ul	class="resumeInfo2">  
							<li class="workPlace">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/workPlace.png">
									</div>
									<div class="resumeInfoData wp">
										<em style="font-size: 16px;">???????????? :</em>
										<span>${r.workPlace }</span>	<!-- r.workPlace -->
									</div>
								</li>    					           
								<li class="workForm">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/workForm.PNG">
									</div>
									<div class="resumeInfoData wf">
										<em style="font-size: 16px;">?????? ???????????? : </em>
										<c:if test="${r.workForm eq 1 }">			
				            			<span>?????????</span>
					            		</c:if>
					            		<c:if test="${r.workForm eq 2 }">			
					            			<span>?????????</span>
					            		</c:if>
					            		<c:if test="${r.workForm eq 3 }">			
					            			<span>???????????????</span>
					            		</c:if>
					            		<c:if test="${r.workForm eq 4 }">			
					            			<span>??????</span>
					            		</c:if>
					            		<c:if test="${r.workForm eq 5 }">			
					            			<span>????????????</span>
					            		</c:if>
									</div>
								</li>               
							</ul>
						<div class="message">
							<a href="applicationCompany.do?memberNo=${sessionScope.m.memberNo }&reqPage=1"><button class="companyMessage">????????? ?????? ??????</button></a>		<!-- ??????????????? ????????? ????????? ?????? ??? ???????????? ?????? ???????????? ????????? -->
							<span class="requestCount">${appCount }</span>
						</div>
						<div class="update">
							
							<a href="/resumeView.do?resumeNo=${r.resumeNo }"><button class="ceoResumeView">????????? ??????</button></a>
							<a href="updateResumeFrm.do?memberNo=${sessionScope.m.memberNo}&ceoResume=${r.ceoResume }"><button class="updateResume">????????????</button></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<div class="resume">
			<a href="resumeFrm.do"><button class="resumeBtn">????????? ????????????</button></a>
		</div>
		<div class="resumeExplain">
			<p>???????????? ?????? 10????????? ?????? ???????????????.</p>
			<p>??????????????? ????????? 1?????? ???????????? ???????????????.</p>
		</div>
		<div class="allResume">
		<div class="resumeCount">
		<c:choose>
			<c:when test="${count eq null }">
			??? 0???
			</c:when>
			<c:otherwise>
			??? <p class="count" style="margin: 0; display: inline; color: rgb(78, 205, 196)">${count }</p>???		
			</c:otherwise>
		</c:choose>
		</div>
		<hr>
		<c:choose>
			<c:when test="${empty list }">
				<div class="noResume">
					<img src="/resources/img/resume/no.JPG" style="width: 50px; height: 50px;"><br><br>
				????????? ???????????? ????????????.
				</div>
			</c:when>
			<c:otherwise>
				<div class="myResume">
						<div class="smallBox" style="width: 800px; margin: 0 auto;">
				<c:forEach items="${list }" var="rs" varStatus="i">
					<%-- <c:if test="${rs.ceoResume eq 0 }"> --%>		<!-- ?????????????????? ??????????????? ????????? ??????????????? ?????? -->
					<div class="wrap">
							<div class="wd">
								<span style="font-size: 13px; color: gray;">${rs.writeDate }</span>	
							</div>
							<div class="resumeTitle">
								<a href="resumeView.do?resumeNo=${rs.resumeNo }"><em>${rs.resumeTitle }</em></a>	
							</div>
							<div class="register">
								<p>??????????????? ??????</p>
								<div class="ceoResumeChk">
									<input type="hidden" class="ceoResume" id="ceoResume" value="${rs.ceoResume }" name="ceoResume">
									<input type="hidden" name="memberNo" class="memberNo" value="${sessionScope.m.memberNo }">
									<input type="hidden" value="${rs.resumeNo }" class="resumeNo" name="resumeNo">
									<c:choose>
										<c:when test="${rs.ceoResume eq 1 }">
											<input type="radio" id="switch${i.count }" name="switch1" class="input__on-off" checked="">
										</c:when>
										<c:otherwise>
											<input type="radio" id="switch${i.count }" name="switch1" class="input__on-off">
										</c:otherwise>
									</c:choose>
									<label for="switch${i.count }" class="label__on-off"> 
										<span class="marble"></span> 
										<span class="on">on</span> 
										<span class="off">off</span> 
									</label>
								</div>
							</div>	
							<ul class="resumeInfo1">
					           	<li class="career">
					            	<div class="resumeInfoImg">
					            		<img src="resources/img/resume/career.PNG">
					            	</div>
					            	<div class="resumeInfoData">
					            	<em style="font-size: 16px; font-weight: normal;">?????? : </em>
					            	<c:if test="${rs.career eq 1 }">		<!-- 1 -> ?????? -->
					            		<span>??????</span>
					            	</c:if>
					            	<c:if test="${rs.career eq 2 }">		<!-- 2 -> ?????? -->
					            		<span>??????</span>
					            	</c:if>
					            		
					            	</div>
					            </li>
					            <li class="money">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/money.PNG" style="width:16px; height: 23px; margin-left: 2px;">					
									</div>
									<div class="resumeInfoData">
										<em style="font-size: 16px; font-weight: normal;">?????? : </em>			<!-- r.money -->
										<c:if test="${rs.money eq 1 }">		<!-- 1 -> ??????????????? ?????? -->
					            			<span>??????????????? ??????</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 2 }">		<!-- 2 -> 2000??? ~ 2400??? -->
						            		<span>2000??? ~ 2400???</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 3 }">		<!-- 3 -> 2400??? ~ 2800??? -->
						            		<span>2400??? ~ 2800???</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 4 }">		<!-- 4 -> 2800??? ~ 3200??? -->
						            		<span>2800??? ~ 3200???</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 5 }">		<!-- 5 -> 3200??? ~ 3600??? -->
						            		<span>3200??? ~ 3600???</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 6 }">		<!-- 5 -> 3600??? ~ 4000??? -->
						            		<span>3600??? ~ 4000???</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 7 }">		<!-- 5 -> 4000??? ?????? -->
						            		<span>4000??? ??????</span>
						            	</c:if>
									</div>
								</li>
							</ul>
							<ul class="resumeInfo2">
								<li class="workPlace">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/workPlace.png">
									</div>
									<div class="resumeInfoData">
										<em style="font-size: 16px; font-weight: normal;">???????????? : </em>
										<span>${rs.workPlace }</span>	<!-- r.resumeworkPlace -->
									</div>
								</li>       					           
								<li class="workForm">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/workFromWhite.PNG">
									</div>
									<div class="resumeInfoData">
										<!-- r.resumeWorkForm -->
										<em style="font-size: 16px; font-weight: normal;">?????? ???????????? : </em>
										<c:if test="${rs.workForm eq 1 }">		<!-- 1 -> ????????? -->
						            		<span>?????????</span>
						            	</c:if>
						            	<c:if test="${rs.workForm eq 2 }">		<!-- 2 -> ????????? -->
						            		<span>?????????</span>
						            	</c:if>
						            	<c:if test="${rs.workForm eq 3 }">		<!-- 3 -> ??????????????? -->
						            		<span>???????????????</span>
						            	</c:if>
						            	<c:if test="${rs.workForm eq 4 }">		<!-- 4 -> ?????? -->
						            		<span>??????</span>
						            	</c:if>
						            	<c:if test="${rs.workForm eq 5 }">		<!-- 5 -> ???????????? -->
						            		<span>????????????</span>
						            	</c:if>
									</div>
								</li>                       
							</ul>
							<div class="deleteBtn">
								<a href="/deleteResume.do?resumeNo=${rs.resumeNo }&memberNo=${rs.memberNo }">????????????</a>
							</div>
						</div>
					<%-- </c:if> --%>
				</c:forEach>
					</div>			
				</div>
			</c:otherwise>
		</c:choose>
		</div>
		<c:if test="${not empty list }">
			<div id="pageNavi">${pageNavi }</div>
		</c:if>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>