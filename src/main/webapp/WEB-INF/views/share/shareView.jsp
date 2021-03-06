<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico"/>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/member/comments.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Develomints</title>
<style>
	.container{
		margin-bottom:100px;
	}
	.cateImg{
		width: 50px;
		height: 50px;
		margin-left: 30px; 
	}
	.pageCategory{
		margin-top: 50px;
	}
	.pageWrap{
		padding: 40px;
   		border-radius: 10px;
   		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	}
	.viewHead,.viewMember{
		padding-top: 30px;
		padding-bottom: 30px;
		border-bottom: 1px solid #aeaeae;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.viewHead span{
		font-size: 16px;
	}
	.viewMember>div>*{
		margin-right: 20px;
	}
	.viewHead>div:last-child>*{
		margin-right: 20px;
	}
	.viewContent{
		padding: 20px;
	}
	.likeBtn{
		text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="pageCategory">
			<span style="font-size: 25px; font-family: NotoBold;">${sv.type }</span><img class="cateImg" src="/resources/img/shareBoard/search.png">				
		</div>
		<div class="pageWrap" style="margin-top: 50px;">
			<div class="viewHead">
				<div>
					<span style="font-weight: Bold; margin-right: 15px; font-size: 22px;">${sv.boardTitle }</span><span class="badge bg-info cateBadge">${sv.type }</span>				
				</div>
				<div>
					<i class="bi bi-chat" style="color: #4ecdc4; font-size: 1.3rem;">${sv.comments }</i>
					<i class="bi bi-suit-heart likeIcon" style="color: #4ecdc4; font-size: 1.3rem;">${sv.likes }</i>
					<i class="bi bi-eyeglasses" style="color: #4ecdc4; font-size: 1.3rem;">${sv.readCount }</i>
					<span class="text-muted">${sv.regDate }</span>					
				</div>
			</div>
			<div class="viewMember">
				<div>
					<c:if test="${not empty sv.profiles }">
						<img src="/resources/upload/member/${sv.profiles }" style="width: 50px; height: 50px; border-radius: 30px;">					
					</c:if>
					<c:if test="${empty sv.profiles }">
						<img src="/resources/img/member/user.png" style="width: 50px; height: 50px; border-radius: 30px;">						
					</c:if>
					<span>${sv.memberId }</span>
					<c:choose>
						<c:when test="${sv.memberGrade >=1 && sv.memberGrade <= 20 }">
							<span><img src="/resources/img/member/rank/bronze.png" style="width: 35px; height:35px;"></span>
						</c:when>
						<c:when test="${sv.memberGrade >=21 && sv.memberGrade <= 40 }">
							<span><img src="/resources/img/member/rank/silver.png" style="width: 35px; height:35px;"></span>
						</c:when>
						<c:when test="${sv.memberGrade >=41 && sv.memberGrade <= 60 }">
							<span><img src="/resources/img/member/rank/gold.png" style="width: 35px; height:35px;"></span>
						</c:when>
						<c:when test="${sv.memberGrade >=61 && sv.memberGrade <= 80 }">
							<span><img src="/resources/img/member/rank/platinum.png" style="width: 35px; height:35px;"></span>
						</c:when>
						<c:when test="${sv.memberGrade >=81 && sv.memberGrade <= 110 }">
							<span><img src="/resources/img/member/rank/diamond.png" style="width: 35px; height:35px;"></span>
						</c:when>
						<c:when test="${sv.memberGrade >=111 && sv.memberGrade <= 140 }">
							<span><img src="/resources/img/member/rank/master.png" style="width: 35px; height:35px;"></span>
						</c:when>
						<c:when test="${sv.memberGrade >=141 && sv.memberGrade <= 170 }">
							<span><img src="/resources/img/member/rank/challenger.png" style="width: 35px; height:35px;"></span>
						</c:when>								
					</c:choose>			
				</div>
				<div>
					<c:if test="${not empty sessionScope.m }">
						<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment" class="reply">???????????????</a><img style="width: 35px; height: 35px;" src="/resources/img/shareBoard/paper-plane.png">					
					</c:if>
					<!-- ??????????????? modal -->
					<div class="modal fade" id="reportComment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog  modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-body">
						      	<p class="Modaltitle">???????????????</p>
						      	<div style="padding:5px; margin-bottom: 10px;">
							      	<p><span>?????????</span> : ${sv.memberId }</p>
							      	<textarea rows="3" style="width:100%" class="form-control" id="dmContent"></textarea>
						      	</div>
						      	<div class="modal-btns">
							      	<div>
							      		<span class="text-danger text_cnt" >(0 / 100)</span>
							      	</div>						      	
							      	<div>
							      		<button type="button" class="btn btn-secondary" id="send"style="width: 100px;">??????</button>
							        	<button type="button" class="btn btn-primary " id="cancel" style="width: 100px;" data-bs-dismiss="modal">??????</button>					        	
									</div>
						      	</div>
								<input type="hidden" id="receiver" value="${sv.memberId }">
								<input type="hidden" id="sender" value="${sessionScope.m.memberId }">
					      </div>
						  </div>
					  </div>
					</div><!-- ?????? modal ??? -->						
				</div>
			</div>
			<div class="viewContent">
				${sv.boardContent }
			</div>
			<div class="likeBtn">
			  <c:if test="${sessionScope.m.memberId ne sv.memberId }">
				  <button type="button" class="btn btn-primary likesBtn"><i class="bi bi-hand-thumbs-up-fill"></i>?????????</button>			  
			  </c:if>
			  <c:if test="${sessionScope.m.memberId eq sv.memberId}">
			  	<!-- ?????? ?????? ???????????????-->
			  	<a href="/updateBoardFrm.do?boardNo=${sv.boardNo }" class="btn btn-info">??????</a>
			  	<button type="button" class="btn btn-info deleteBoard">??????</button>
			  </c:if>
			</div>
			<c:if test="${not empty sv.filename }">
				<div>
					???????????? : <a href="/sharefileDown.do?boardNo=${sv.boardNo }">${sv.filename }</a>			
				</div>
			</c:if>
		</div><!-- ????????? ????????? ?????? -->

		<div style="margin-bottom: 20px; margin-top: 20px;">
			<span style="font-weight: 900;">????????? ????????? ?????? ????????? ???????????? 
			<a id="community-guide">???????????? ?????????</a>
			??? ???????????? ?????????.
			</span>
		</div>
		<%---------------------------------------------------------------------------- --%>
		<%--????????? --%>
		
		<%--?????? ?????? ???(??????????????? ??? ?????????) ?????? ????????? ??? SQL?????? ????????? to_char(SYSDATE,'MM-DD HH24:MI') ????????? ???????????????--%>
		<c:if test="${not empty sessionScope.m.memberId }">
			<form action="/shareInsertComment.do" method="post">
				<div class="commentBox">
					<div class="userInfoBox">
						<c:choose>
							<c:when test="${sessionScope.m.filepath eq null }">
								<img src="/resources/img/member/user.png" style="width: 60px; height:60px; margin-left:10px;">				
							</c:when>
							<c:otherwise>
								<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 60px; height:60px; margin-left:10px; border-radius: 50%">
							</c:otherwise>
						</c:choose>
						<p>${sessionScope.m.memberId }</p>
					</div>
					<div class="textBox" >
						<textarea class="form-control textareaBox txbox" name="commentContent"></textarea>
					</div>
					<input type="submit" value="??????" class="btn btn-outline-primary commentBtn" style="font-weight: bold; height: 100px;" >
				</div>
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="commentType" value="1">
				<input type="hidden" name="boardNo" value="${sv.boardNo }">
			</form>
		</c:if>
		<%---------------------------------------------------------------------------- --%>
		
		<%--??????????????? --%>
		<c:choose>
			<%--????????? ???????????? --%>
			
			<c:when test="${not empty list }">
				<c:forEach items="${list }" var="cl" varStatus="i">
					<c:if test="${cl.commentType eq 1 }">
						<div class=comentListBox>
							<div class="comentView">
								<div class="commentImgBox">
										<c:choose>
											<c:when test="${cl.memberImg eq null }">
												<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
											</c:when>
											<c:otherwise>
												<img src="/resources/upload/member/${cl.memberImg }" style="width: 60px; height:60px; border-radius: 50%">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="iddate">
										<c:choose>
											<c:when test="${cl.memberId eq sv.memberId }">
												<p class="text-info">${cl.memberId }</p>
											</c:when>
											<c:otherwise>
												<p>${cl.memberId }</p>
											</c:otherwise>
										</c:choose>
										<p>${cl.regDate }</p>
										<%-- ?????? ??? ??????????????? ??????,?????? ???????????? --%>
										<c:if test="${not empty sessionScope.m and cl.memberId eq sessionScope.m.memberId}">
					
											<%--?????? ??????  --%>
											<a href="#" data-bs-toggle="modal" data-bs-target="#updateComment${i.index }">??????</a>
					
											<%--?????? ??????  Modal --%>
											<div class="modal fade" id="updateComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog  modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<textarea class="form-control reText" name="commentContent">${cl.commentContent }</textarea>
															<input type="hidden" value="${cl.commentNo }" name="commentNo"> 
															<div style="text-align: right;">
																<button type="button" class="btn btn-primary updateCm">??????</button>
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
															</div>
														</div>
													</div>
												</div>
											</div>
	
											<%--?????? ?????? --%>
											<a href="javascript:void(0);" class="delComment">??????</a>
											<input type="hidden" value="${cl.commentNo }" name="commentNo">
										</c:if>
									</div>
									<span>
										${cl.commentContent }
										<c:if test="${not empty sessionScope.m }">
											<a href="javascript:void(0)" class="reComentBtn"><i class="bi bi-chat-dots-fill" style="font-size: 20px"></i></a>																				
										</c:if>
									</span>
									
									<%--??????????????? ?????? ???????????? ???????????? --%>
									<c:if test="${not empty sessionScope.m }">
										<%--?????? ?????? --%>
										<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${i.index }"><i class="bi bi-exclamation-circle-fill" style="font-size: 20px;color:#f3969a;"></i></a>
										
										<%--?????? ??????  Modal --%>
										<div class="modal fade" id="reportComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog  modal-dialog-centered">
										    <div class="modal-content">
										      <div class="modal-body">
										      	<form action="/reportShare.do" method="post" class="reportBox">
											      	<p class="Modaltitle">?????? ??????</p>
											      	<div style="border-bottom:1px solid #d9d9d9; padding:5px; margin-bottom: 30px; padding-bottom: 10px;">
											      		<p>????????? ?????? ????????? ???????????? ????????? ????????????.</p>
											      		<p>??? ???????????? ????????? ???????????? ?????? ???????????? [??????] ????????? ????????? ?????????.</p>
											      	</div>
											      	<div style="padding:5px; margin-bottom: 20px;">
												      	<p style="margin-bottom: 5px;"><span>?????? ?????????</span> : ${cl.memberId }</p>
												      	<p><span>??????</span> : ${cl.commentContent }</p>
											      	</div>
											      	<div style="margin-bottom: 20px; padding:5px;">
											      		<p style="margin-bottom: 10px;"><span>????????????</span></p>
												      	<label style="margin-right: 70px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="1">????????????/?????????</label>
												      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="2">?????????/?????????</label>
												      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="3">????????????</label><br>					      	
												      	<label style="margin-right: 8px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="4">?????? ?????? ?????? ??????(??????)</label>
												      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="5">??????/????????????</label>
												      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="6">??????????????????</label><br>
												      	<label><input type="radio" class="form-check-input radioChk etcBtn" name="reportReason" value="7">??????</label><br>
											      		<textarea class="form-control etc" style="resize: none;" name="reportEtc"></textarea>
											      	</div>
											      	<div style="margin-bottom: 20px; background-color: #F7F7F7; padding:10px;">
											      		<p>??? ??????????????? ???????????? ?????????  5??? ?????? ????????? ????????? ????????? ?????? ????????? ???????????????.</p>
											      		<p>??? ??????????????? ??????, ???????????? ????????? ????????? ????????? ??? ????????? ??????????????? ???????????? ????????? ?????????.</p>
											      	</div>
											      	<div style="text-align: right;">
											      		<button type="button" class="btn btn-secondary reportBtn" style="width: 100px;">??????</button>
											        	<button type="button" class="btn btn-primary" style="width: 100px;" data-bs-dismiss="modal">??????</button>
													</div>
													<input type="hidden" name="reporterId" value="${sessionScope.m.memberId }">
													<input type="hidden" name="commentNo" value="${cl.commentNo }">
													<input type="hidden" name="reportStatus" value="1">
													<input type="hidden" name="commentContent" value="${cl.commentContent }">
													<input type="hidden" name="boardNo" value="${sv.boardNo }">
													<input type="hidden" name="commentId" value="${cl.memberId }">
										        </form>
										      </div>
											  </div>
										  </div>
										</div>	
									</c:if>
								</div>
								
							
		<%---------------------------------------------------------------------------- --%>
		
								<%--????????? ?????? ??? --%>
								<c:if test="${not empty sessionScope.m and cl.commentType eq 1 }">
								<form action="/insertReComment.do" method="post">
									<div class="recomentBox">
										<textarea class="form-control reText textareaBox txbox2" name="commentContent"></textarea>
										<c:choose>
											<c:when test="${not empty sessionScope.m }">
												<input type="submit" value="??????" class="btn btn-outline-primary commentBtn2" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
											</c:when>
											<c:otherwise>
												<input type="button" value="??????" class="btn btn-outline-primary noMember" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
											</c:otherwise>
										</c:choose>
										<input type="reset" value="??????" class="btn btn-outline-secondary cancelBtn" style="height: 100px; width: 80px; font-weight: bold">
										<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
										<input type="hidden" name="boardNo" value="${sv.boardNo }">
										<input type="hidden" name="commentType" value="2">
										<input type="hidden" name="commentRef" value="${cl.commentNo }">
									</div>
								</form>
							</c:if>
							
		<%---------------------------------------------------------------------------- --%>
							<%--????????? ????????? --%>
							<c:forEach items="${list }" var="rl" varStatus="j">
								<c:if test="${rl.commentType eq 2 && cl.commentNo eq rl.commentRef}">
									<div class="reComentView" style="margin-top: 10px;">
									<i class="bi bi-arrow-return-right" style="margin-left:50px; color:#4ECDC4;"></i>
										<div class="recommentImgBox">
											<c:choose>
												<c:when test="${rl.memberImg eq null }">
													<img src="/resources/img/member/user.png" style="width: 35px; height:35px;">				
												</c:when>
												<c:otherwise>
													<img src="/resources/upload/member/${rl.memberImg }" style="width: 35px; height:35px; border-radius: 50%">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="iddate">
											<c:choose>
											<c:when test="${rl.memberId eq sv.memberId }">
												<p class="text-info" style="font-size: 15px;">${rl.memberId }</p>
											</c:when>
											<c:otherwise>
												<p style="font-size: 15px;">${rl.memberId }</p>
											</c:otherwise>
										</c:choose>
											<p style="font-size: 13px;">${rl.regDate }</p>
											<%--??????????????? ?????? ???????????? --%>
											<c:if test="${not empty sessionScope.m }">
												<%--?????? ??? ????????? ????????? ???????????? --%>
												<c:if test="${rl.memberId eq sessionScope.m.memberId }">
												<%--?????? ??????  --%>
													<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#updateReComment${j.index }" class="updateBtn">??????</a>
													
													<%--?????? ??????  Modal --%>
													<div class="modal fade" id="updateReComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog  modal-dialog-centered">
													    <div class="modal-content">
													      <div class="modal-body">
													      	<textarea class="form-control reText textareaBox" name="commentContent">${rl.commentContent }</textarea>
													      	<input type="hidden" value="${rl.commentNo }" name="commentNo">
													      	<div style="text-align: right; ">
														      	<button type="submit" class="btn btn-primary updateCm">??????</button>
														        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
													        </div>
													      </div>
													    </div>
													  </div>
													</div>
													
													<%--?????? ?????? --%>
													<a href="javascript:void(0);" class="delComment">??????</a>
													<input type="hidden" value="${rl.commentNo }" name="commentNo">
												</c:if>
											</c:if>
										</div>
										<span>
										${rl.commentContent }
										</span>
										<c:if test="${not empty sessionScope.m }">
											<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${j.index }"><i class="bi bi-exclamation-circle-fill" style="font-size: 20px;color:#f3969a;"></i></a>
											
											<%--?????? ??????  Modal --%>
											<div class="modal fade" id="reportComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog  modal-dialog-centered">
											    <div class="modal-content">
											      <div class="modal-body">
												      <form action="/reportShare.do" method="post" class="reportBox">
													      	<p class="Modaltitle">?????? ??????</p>
													      	<div style="border-bottom:1px solid #d9d9d9; padding:5px; margin-bottom: 10px; padding-bottom: 10px;">
													      		<p>????????? ?????? ????????? ???????????? ????????? ????????????.</p>
													      		<p>??? ???????????? ????????? ???????????? ?????? ???????????? [??????] ????????? ????????? ?????????.</p>
													      	</div>
													      	<div style="padding:5px; margin-bottom: 10px;">
														      	<p><span>?????? ?????????</span> : ${rl.memberId }</p>
														      	<p><span>??????</span> : ${rl.commentContent }</p>
													      	</div>
													      	<div style="margin-bottom: 20px; padding:5px;">
													      		<p style="margin-bottom: 10px;"><span>????????????</span></p>
														      	<label style="margin-right: 70px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="1">????????????/?????????</label>
														      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="2">?????????/?????????</label>
														      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="3">????????????</label><br>					      	
														      	<label style="margin-right: 8px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="4">?????? ?????? ?????? ??????(??????)</label>
														      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="5">??????/????????????</label>
														      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="6">??????????????????</label><br>
														      	<label><input type="radio" class="form-check-input radioChk etcBtn" name="reportReason" value="7">??????</label><br>
													      		<textarea class="form-control etc" style="resize: none;" name="reportEtc" ></textarea>
													      	</div>
													      	<div style="margin-bottom: 20px; background-color: #F7F7F7; padding:10px;">
													      		<p>??? ??????????????? ???????????? ?????????  5??? ?????? ????????? ????????? ????????? ?????? ????????? ???????????????.</p>
													      		<p>??? ??????????????? ??????, ???????????? ????????? ????????? ????????? ??? ????????? ??????????????? ???????????? ????????? ?????????.</p>
													      	</div>
													      	<div style="text-align: right;">
													      		<button type="button" class="btn btn-secondary reportBtn" style="width: 100px;">??????</button>
													        	<button type="button" class="btn btn-primary" style="width: 100px;" data-bs-dismiss="modal">??????</button>
															</div>
															<input type="hidden" name="reporterId" value="${sessionScope.m.memberId }">
															<input type="hidden" name="commentNo" value="${rl.commentNo }">
															<input type="hidden" name="reportStatus" value="1">
															<input type="hidden" name="commentContent" value="${rl.commentContent }">
															<input type="hidden" name="boardNo" value="${sv.boardNo }">
															<input type="hidden" name="commentId" value="${rl.memberId }">
											        	</form>
											      	</div>
												  </div>
											  </div>
											</div>
										</c:if>
									</div>
								</c:if>
							</c:forEach>
						</div>	<!-- commentListBox ????????? ?????? -->
					</c:if>
				</c:forEach>	
			</c:when>
			<%--????????? ???????????? --%>
				<c:otherwise>
					<div style="padding: 20px; text-align: center; border: 1px solid #d9d9d9; margin-top: 20px;">
						<img src="/resources/img/member/user.png" style="border-radius: 50%; width: 70px; margin-top: 70px;">
						<h2 style="color: gray; font-size: 20px; font-weight: 900; line-height: 100px;">????????? ????????? ????????????.</h2>
					</div>
				</c:otherwise>
		</c:choose>
		
		<!-- ???????????? ????????? ?????? -->
		<div class="community-wrap" style="display: none; margin: 0;">
		<div id="community-modal">
			<div class="community-content">
				<br>

				<h2>
					?????????????????? ???????????? <br> <span style="color: black;">????????? ?????? </span>
					???????????? ?????????
				</h2>
				<div class="g-style c-style">

					<div style="text-align: left;">
						<h4>
							<img src="/resources/img/gosu/cum_chk.png">?????? ??? ?????? ??????
						</h4>
						??????????????? ??????????????? ????????? ???????????? ????????? ?????????????????????. ?????? ???????????? ????????? ??????, ??????, ??????, ???????????????
						????????? ?????? ????????? ????????????????????? ???????????? ????????????.<br> <br>
						<h4>
							<img src="/resources/img/gosu/cum_chk.png">????????? ??????
						</h4>
						????????? ????????? ????????? ????????? ????????? ??? ????????? ?????? ????????? ????????? ?????? ?????? ????????? ????????? ?????? ????????? ?????????????????????
						???????????? ????????????. ???????????? ????????? ???????????? ???????????? ???????????? ????????? ?????? ??????, ??????????????? ????????? ?????? ?????????
						?????????, ????????? ????????? ???????????? ?????? ??? ???????????? ????????? ????????? ??? ?????? ?????? ????????? ????????? ????????? ???????????????.<br>
						<br>
						<hr>
						?????? ????????? ????????? ????????? ????????? ????????????. ??????????????? ????????? ???????????? ????????? ????????? ??????????????? ?????????, ????????????,
						???????????? ???????????? ?????? ????????? ?????? ?????????????????? ?????? ????????? ????????? ????????? ????????????, ????????? ????????? ????????? ???????????????
						????????? ???????????? ?????? ???????????? ?????? ????????? ????????? ???????????? ????????? ??? ????????????. ?????????????????? ????????? ?????? ???????????? ??????
						????????? ??????????????? ????????? ????????? ????????????.

					</div>
				</div>
			</div>
			<div class="community-btn-wrap">
				<a id="community-close" class="btn btn-outline-success">??????</a>
			</div>
			<div class="community-btn-wrap2">
				<span style="color: white; margin: 20px;">2021.12.19</span>
			</div>
		</div>
	</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>

//?????? ????????? ??????
	 $('.textareaBox').keydown(function(){
		 var length = $(".textareaBox").val().length;
		 if($(this).val().length > 64) {
			swal({
			  title: "????????? ??????",
			  text: "?????? ?????? ??? ??? ????????????. ????????? ????????? ???????????? ???????????????.",
			  icon: "warning",
			  buttons: true,
			})
         $(this).val($(this).val().substring(0, 64));
		 }
	 })
	 
	 //?????? ?????? ????????? ?????? ?????????
	 $(".commentBtn").click(function(){
		 if($('.txbox').val() == ""){
			swal({
 			  title: "?????? ?????????",
 			  text: "????????? ??????????????????",
 			  icon: "warning",
 			  buttons: true,
 			})
			return false;
		}
	 })
	 //????????? ?????? ????????? ?????? ?????????
	 $(".commentBtn2").click(function(){
		var index = $(".commentBtn2").index(this);
		 if($('.txbox2').eq(index).val() == ""){
			swal({
 			  title: "?????? ?????????",
 			  text: "????????? ??????????????????",
 			  icon: "warning",
 			  buttons: true,
 			})
			return false;
		}
	 })
	

//????????? ??? ??????
$(".reComentBtn").click(function(){
	var index = $(".reComentBtn").index(this);
	$(".recomentBox").eq(index).toggle();
});
$(".reComentBtn").trigger('click');

//???????????? ?????? ????????? ?????????
$(".cancelBtn").click(function(){
	var index = $(".cancelBtn").index(this);
	$(".recomentBox").eq(index).css("display","none");
});

//?????? ??????
$(".updateCm").click(function(){
	var index = $(".updateCm").index(this);
	var commentNo = $(this).parent().prev().val();
	var commentContent = $(this).parent().prev().prev().val();
	 $.ajax({
		url : "/updateContestComment.do",
		data : {commentNo : commentNo, commentContent:commentContent},
		success : function(data) {
			location.reload();
		}
	});
			
});

//???????????? 
$(".delComment").click(function(){
	var index = $(".delComment").index(this);
	var commentNo = $(this).next().val();
	swal({
			  title: "?????? ??????",
			  text: "????????? ?????????????????????????",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				 $.ajax({
					url : "/deleteContestComment.do",
					data : {commentNo : commentNo},
					success : function(data) {
						location.reload();
					}
				});
			  }
			});
			
});

//?????? ???????????? ?????? ??? textarea ????????????
$("input[name=reportReason]").change(function(){
	var radioValue = $(this).val();
	if(radioValue == 7){
		$(".etc" ).attr('readonly', false);
	}else{
		$(".etc" ).attr('readonly', true);
	}	
});

//?????? ????????? ????????? ??????
$('.etc').keydown(function(){
var index = $(".etc").index(this);
var length = $(".etc").eq(index).val().length;
 if(length > 64) {
			swal({
			  title: "????????? ??????",
			  text: "?????? ?????? ??? ??? ????????????. ????????? ????????? ???????????? ???????????????.",
			  icon: "warning",
			  buttons: true,
			})
        $(this).val($(this).val().substring(0, 64));
		 }
});

//???????????? ????????? confirm??? ????????? ok?????? submit
$(".reportBtn").click(function(){
	var index = $(".reportBtn").index(this);
	var radioCheck = $('input[name=reportReason]').is(":checked");
	if(!radioCheck){
		alert("??????????????? ??????????????????.");
		return;
	}
	
		
	swal({
			  title: "?????? ??????",
			  text: "??????????????? ?????? ???????????? ???????????? ?????? ??? ????????????. ?????????????????????????",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				 $(".reportBox").eq(index).submit();
			  }
		});
})

//????????? ????????? ?????? ?????? ??????
$(".noMember").click(function(){
	alert("????????? ??? ????????? ???????????????.");
	location.href="/loginFrm.do";
})

//???????????? ?????????
$("#community-guide").click(function() {

	$(".community-wrap").css("display", "flex");

});
$("#community-close").click(function() {

	$(".community-wrap").css("display", "none");

});
	
	$(".likesBtn").click(function(){
		var memberNo = '${sessionScope.m.memberNo}';
		var boardNo = '${sv.boardNo }';
		var likeVal = Number($(".likeIcon").html());
		var boardWriter = '${sv.memberId}';
		$.ajax({
			type: "POST",
			url : "/shareLike.do",
			data : {memberNo:memberNo , boardNo:boardNo ,boardWriter:boardWriter },
			success : function(data){
				if(data==2){
					//?????? ????????????
					$(".likeIcon").removeClass("bi-suit-heart");
					$(".likeIcon").addClass("bi-suit-heart-fill");
					$(".likeIcon").html(likeVal+1);
				}else if(data==1){
					//?????? ????????????
					$(".likeIcon").removeClass("bi-suit-heart-fill");
					$(".likeIcon").addClass("bi-suit-heart");
					$(".likeIcon").html(likeVal-1);
				}
			}
		});
	});
	
	$(function(){
		var memberNo = '${sessionScope.m.memberNo}';
		var boardNo = '${sv.boardNo }';
		if(memberNo != ''){
			$.ajax({
				type: "POST",
				url : "/isLike.do",
				data : {memberNo:memberNo , boardNo:boardNo},
				success : function(data){
					if(data ==1 ){
						$(".likeIcon").removeClass("bi-suit-heart");
						$(".likeIcon").addClass("bi-suit-heart-fill");					
					}else{
						$(".likeIcon").removeClass("bi-suit-heart-fill");
						$(".likeIcon").addClass("bi-suit-heart");					
					}
				}
			});			
		}
		//?????? ????????? check
		$("#dmContent").on('keyup change paste', function() {
			var dmContent = $("#dmContent").val();
	        $('.text_cnt').html("("+$(this).val().length+" / 100)");
	        
	        if($(this).val().length > 100) {
	        	swal({
	                title: '???????????? 100??? ???????????????!',
	                icon: 'error',
	                button: '????????????'
	              })
		        $(this).val($(this).val().substring(0, 100));
	            $('.text_cnt').html("(100 / 100)");	
	        }
	    });
	});
	$("#send").click(function () {
		
		var receiver = $("#receiver").val();
		var dmContent = $("#dmContent").val();
		var sender = $("#sender").val();
		
		$.ajax({
			url : "/sendDm.do",
			data : {receiver:receiver,dmContent:dmContent,sender:sender},
			success : function(data) {
				if(data == 1){
					dmCount(receiver);
					swal({
						  title: "????????????",
						  icon: "success",
						  button: "??????",
						}).then(function(){
							location.reload();							
						});
				}else{
					console.log("??????");
				}
			}
		});
	});
	//?????? onclick ???????????? ???????????? swalMsg ??????!
	//????????? ?????? ?????? ??????
	$(".deleteBoard").click(function(){
		swal({
		    title: "?????? ?????????????????????????",
		    icon: "warning",
		    buttons: ["????????????", "????????????"],
		    dangerMode: true
		}).then((willDelete) => {
		    if (willDelete) {
		    	location.href="/deleteBoard.do?boardNo="+'${sv.boardNo}';
		    }
		});
	});
</script>
</body>
</html>