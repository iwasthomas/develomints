<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
}

input:focus, textarea:focus {
	outline: none;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 30px;
	font-weight: 900;
}

.requestList {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 50px;
}

.requestList * {
	padding: 20px;
}

.requestList>table {
	width: 100%;
}

.requestList>table>tbody>tr>td {
	padding: 0;
}

.requestList a {
	display: flex;
	justify-content: center;
}

.g-one-tbl img {
	border-radius: 50%;
	width: 150px;
}

.g-one-tbl {
	width: 90%;
	border: 1px solid rgb(211, 211, 211);
}

.g-one-tbl:hover {
	border: 1px solid black;
}

.g-one-tbl th {
	width: 200px;
}

.g-one-tbl td {
	padding-right: 50px;
	text-align: center;
}

#pageNavi {
	display: flex;
	justify-content: center;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);">디벨로민트</span>에서 연결된 요청리스트
		</h3>
		
		<div class="requestList">
			<table>
				<c:forEach items="${memberRequestList }" var="mrl" varStatus="i">
					<tr>
						<td><a href="/gosuRequestContent.do?mrn=${mrl.requestNo }">
								<table class="g-one-tbl">
									<tr>
										<th rowspan="2">
										<c:if test="${empty mrl.requestWriterImg }">
										<img src="/resources/img/gosu/g_img_basic.png">
										</c:if>
										<c:if test="${not empty mrl.requestWriterImg }">
										<img src="/resources/upload/member/${mrl.requestWriterImg }">
										</c:if>
										</th>
										<th><span style="color: rgb(78, 205, 196);padding:0;">${mrl.requestWriterId }</span></th>
										<td style="text-align: right;">${mrl.requsetDate}</td>
									</tr>
									<tr>
										<td colspan="2" style="background-color:  rgba(239, 239, 239, 0.3);">${mrl.requestContent7}</td>
									</tr>
								</table>
						</a></td>
					</tr>
				</c:forEach>

			</table>


		</div>

		<div id="pageNavi"></div>

		<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>