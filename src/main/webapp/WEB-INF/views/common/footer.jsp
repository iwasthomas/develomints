<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#footer {
    margin: 5em 0;
}

.row span {
  position: relative;
  margin: 0;
  color: #fff;
  font-size: 20px;
  line-height: 20px;
}
.row span::before,
.row span::after {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  content: attr(data-text);
}
.row span::before {
  color: purple;
  z-index: -1;
  animation: glitch01 3s ease infinite;
}
.row span::after {
  color: cyan;
  z-index: -2;
  animation: glitch02 3s ease infinite reverse;
}
@keyframes glitch01 {
  0% {
    transform: translate(-2px, 2px);
  }
  25% {
    transform: translate(-4px, 4px);
  }
  50% {
    transform: translate(2px, 2px);
  }
  75% {
    transform: translate(2px, -4px);
  }
  100% {
    transform: translate(-2px, 2px);
  }
}
@keyframes glitch02 {
  0% {
    transform: translate(-2px, 2px);
  }
  25% {
    transform: translate(-4px, 4px);
  }
  50% {
    transform: translate(2px, 2px);
  }
  75% {
    transform: translate(2px, -4px);
  }
  100% {
    transform: translate(-2px, 2px);
  }
}

</style>
<body>
	<footer class="footer" style="border-top: solid 1px black">
		<div class="container" style="overflow:hidden;">
			<div style="overflow:hidden;" class="row">
				<a style="width:130px;position:absolute;left:100px; "  href="/"></a>
				
				<div style="" >
					<ul class="list-unstyled">
						<li ><a href="#" style="color:black;">이용약관</a></li>
						<li><a href="#" style="color:black;">개인정보취급방침</a></li>
						<li><a href="#" style="color:black;">인재채용</a></li>
						<li><a href="#" style="color:black;">제휴문의</a></li>
					</ul>
					<p>대표이사 | 이윤수</p>
					<p>대표주소 | 서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F</p>
					<p>전화번호 | 02-2163-8560</p>
					<p>Copyrightⓒ 2021 <span >team mint</span>. All right reserved</p>
				</div>
				
			</div>
		</div>
</footer>
</body>
</html>