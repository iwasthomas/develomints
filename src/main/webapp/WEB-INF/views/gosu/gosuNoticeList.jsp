<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	font-size: 45px;
	font-weight: 900;
}

.gosu-search {
	display: flex;
	justify-content: right;
	margin-top: 100px;
	margin-bottom: 50px;
}

.gosu-search * {
	padding: 10px;
}

.gosu-search input {
	width: 350px;
}

.g-gall {
	width: 100%;
	display: flex;
	justify-content: center;
}

ul#gallery {
	display: flex;
	justify-content: space-between;
	margin-top: 30px;
	list-style: none;
	padding: 0;
	width: 80%;
}

ul#gallery>a>li dt {
	position: relative;
	background-color: #000;
	width: 180px;
	height: 150px;
	margin: 5px;
	overflow: hidden;
}

ul#gallery>a>li dt::after {
	box-sizing: border-box;
	position: absolute;
	display: block;
	top: 50%;
	left: 50%;
	width: 87%;
	height: 87%;
	padding-top: 80px;
	transform: translate(-50%, -50%);
	text-align: center;
	font-size: 35px;
	color: #fff;
	opacity: 0;
	transition: 0.8s;
}

ul#gallery>a>li dt img {
	width: 100%;
	height: 100%;
	transition: 0.6s ease-in-out;
}

ul#gallery>a>li:hover img {
	transform: scale(1.18);
	opacity: 0.65;
}

ul#gallery>a>li:hover::after {
	opacity: 1;
}

ul#gallery>a>li dd {
	padding: 5px;
}

#pageNavi {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
}

.gosu-write-wrap {
	position: fixed;
	z-index: 1000;
	display: flex;
	align-items: center;
	justify-content: right;
	width: 1400px;
}

.gosu-write {
	border: 1px solid rgb(190, 190, 190);
	padding: 40px;
	text-align: center;
	justify-content: right;
	background-color: white;
}

.gosu-write a {
	margin-top: 20px;
	padding: 10px;
	width: 200px;
}

.gosu-write * {
	font-weight: bold;
	line-height: 30px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);">고수</span>의 게시판
		</h3>
		<div class="gosu-search">

			<input type="text" value="" placeholder="내용을 입력해주세요"> <select>
				<option value="" selected disabled hidden>검색</option>
				<option value="">제목</option>
				<option value="">내용</option>
			</select>

		</div>
		<div class="gosu-write-wrap">
			<div class="gosu-write">
				<h5 style="font-size: small; color: gray;">
					고수님만의 노하우를<br> 알려주세요!
				</h5>
				<a href="/gosuNoticeWriteFrm.do" class="btn btn-primary">노하우
					작성하기</a>
			</div>
		</div>
		<div>
			<div class="g-gall">
				<ul id="gallery">
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
				</ul>
			</div>

			<div class="g-gall">
				<ul id="gallery">
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
				</ul>

			</div>
			<div class="g-gall">
				<ul id="gallery">
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
				</ul>

			</div>
			<div class="g-gall">
				<ul id="gallery">
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
				</ul>

			</div>
			<div class="g-gall">
				<ul id="gallery">
					<a href="">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
				</ul>

			</div>
			<div class="g-gall">
				<ul id="gallery">
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
					<a href="/gosuNoticeContent.do">
						<li>
							<dl>
								<dt>
									<img src="/resources/img/gosu/g_img_basic.png">
								</dt>
								<dd>
									<b>제목제목</b>
								</dd>
								<dd>내용내용</dd>
							</dl>
					</li>
					</a>
				</ul>

			</div>
		</div>
		<div id="pageNavi"></div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>