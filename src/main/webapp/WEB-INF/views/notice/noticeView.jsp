<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;">CS Center</h2></div>
			<div class="center_tap">
				<ul>
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/tocounsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<div class="title"><h2 style="display: inline-block;">Notice</h2></div>
				<div class="notice-contents">
					<h3>${n.noticeTitle }</h3>
					<span>${n.regDate }/View : ${n.readCount }</span>
					<span>
						<c:if test="${not empty n.noticeFilename }">
							<img src="/resources/img/notice/file.png" style="color:white;">
							<a href="/fileDown?noticeNo=${n.noticeNo }">${n.noticeFilename }</a>
						</c:if>
					</span>
					<div class="contents-box">
						${n.noticeContent }
					</div>
				</div>
				<a href="javascript:history.go(-1)" class="btn btn-secondary">목록보기</a>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>