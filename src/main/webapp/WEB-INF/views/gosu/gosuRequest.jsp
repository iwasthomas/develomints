<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<style>
body {
	
}

.container * {
	text-decoration: none;
	color: black;
}

.container {
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1200px;
}

.g-center {
	display: flex;
	justify-content: center;
}

.g-title-wrap {
	background: url("/resources/img/gosu/g-background1.jpg");
	background-size: 100% 100%;
	background-position: center;
	background-repeat: no-repeat;
	height: 300px;
	display: flex;
	flex-direction: column;
	align-items: left;
	justify-content: center;
}

.g-b {
	font-weight: 900;
}

.g-title-wrap>div {
	overflow: hidden;
	margin-left: 50px;
}

.g-title-wrap>div div {
	float: left;
	margin: 20px;
	text-align: center;
}

.progress {
	width: 400px;
	margin: 50px;
}

.g-content-wrap {
	margin-top: 100px;
	margin-bottom: 100px;
	display: flex;
	justify-content: space-around;
}

#gallery {
	width: 500px;
	padding: 40px;
	border-radius: 50px;
	padding: 40px;
}

#gallery>li {
	display: none;
	list-style-type: none;
}

#gallery>li:first-child {
	display: block;
}

#btn_gallery {
	text-align: center;
}

#btn_gallery a.off {
	cursor: default;
	opacity: 0.5;
	display: none;
}

.g-div {
	padding: 30px;
}

input[type="checkbox"] {
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: white;
	height: 15px;
		width: 15px;
	border: 1px solid gray;
	margin-right: 20px;
}

input[type="checkbox"]:checked {
	background: #78c2ad;
	border: 1px solid #78c2ad;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.g-div>ul>label>li, .g-seq {
	list-style-type: none;
	margin-bottom: 20px;
}

.container label {
	display: block !important;
}

.g-btn {
	font-weight: 900;
	margin: 20px;
	padding: 20px;
	width: 100px;
}

.g-text-wrap {
	padding: 100px;
}

.g-text-wrap dl {
	padding: 20px;
}

.g-text-wrap dt {
	margin-bottom: 20px;
}

.g-form-wrap {
	margin-left: 120px;
	border: 5px solid #78c2ad;
}

.g-seq li {
	float: left;
	margin: 40px;
	text-align: center;
}
.upbtn {
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.upbtn:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}

.g-seq {
	padding: 0;
}

.g-seq dt, .g-seq dd {
	padding: 10px;
}

.g-mint {
	text-align: left;
	color: #78c2ad;
	font-weight: 900;
	font-size: 20px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="g-title-wrap g-b">
			<div>
				<h1 class="g-b" style="color: white; margin-top: 40px;">?????? ?????????
					????????????</h1>
				<div>
					<h5 style="color: white;">${countGosu }</h5>
					<p style="color: white;">?????? ??????</p>
				</div>
				<div>
					<h5 style="color: white;">${countRequest }</h5>
					<p style="color: white;">?????? ?????????</p>
				</div>
			</div>
		</div>



		<div class="g-content-wrap">

			<div class="g-form-wrap">
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated"
						role="progressbar" aria-valuemin="0" aria-valuemax="100">0%</div>
				</div>
				<form action="/gosuRequestdo.do" id="btn-submit">
					<ul id="gallery">

						<li>

							<h3 class="g-b"
								style="text-align: center; font-size: large; margin-bottom: 40px;">??????
								???????????? ????????????????</h3>
							<div class="g-div">
								<ul>
									<label><li><input type="checkbox" name="request1"
											class="checkSelect1" value="Windows" onclick="setBg(this);">Windows</li></label>
									<label><li><input type="checkbox" name="request1"
											class="checkSelect1" value="Mac" onclick="setBg(this);">Mac</li></label>
									<label><li><input type="checkbox" name="request1"
											class="checkSelect1" value="Linux" onclick="setBg(this);">Linux</li></label>
									<label><li><input type="checkbox" name="request1"
											class="checkSelect1" value="iOS" onclick="setBg(this);">iOS</li></label>
									<label><li><input type="checkbox" name="request1"
											class="checkSelect1" value="Android" onclick="setBg(this);">Android</li></label>
									<label><li><input type="checkbox" name="request1"
											class="checkSelect1" value="?????????
											?????? ??? ???????????????."
											onclick="setBg(this);">????????? ?????? ??? ???????????????.</li></label>
									<label><li><input type="checkbox" name="request1"
											class="checkSelect1" value="??????" onclick="setBg(this);">??????</li></label>
								</ul>
							</div>
						</li>
						<li>
							<h3 class="g-b"
								style="text-align: center; font-size: large; margin-bottom: 40px;">??????
								????????? ????????? ????????????????</h3>
							<div class="g-div">
								<ul>
									<label><li><input type="checkbox" name="request2"
											class="checkSelect2" value="??????????????????" onclick="setBg(this);">??????
											????????????</li></label>
									<label><li><input type="checkbox" name="request2"
											class="checkSelect2" value="??????" onclick="setBg(this);">??????</li></label>
									<label><li><input type="checkbox" name="request2"
											class="checkSelect2" value="????????????" onclick="setBg(this);">????????????</li></label>
									<label><li><input type="checkbox" name="request2"
											class="checkSelect2" value="??????" onclick="setBg(this);">??????</li></label>

								</ul>
							</div>
						</li>
						<li>
							<h3 class="g-b"
								style="text-align: center; font-size: large; margin-bottom: 40px;">?????????
								???????????? ???????????? ????????????????</h3>
							<div class="g-div">
								<ul>
									<label><li><input type="checkbox"
											name="request3[]" class="checkSelect3" value="?????? ??? ??????"
											onclick="setBg(this);">?????? ??? ??????</li></label>
									<label><li><input type="checkbox"
											name="request3[]" class="checkSelect3" value="????????? (3??? ??????)"
											onclick="setBg(this);">????????? (3??? ??????)</li></label>
									<label><li><input type="checkbox"
											name="request3[]" class="checkSelect3" value="?????? (4~9???)"
											onclick="setBg(this);">?????? (4~9???)</li></label>
									<label><li><input type="checkbox"
											name="request3[]" class="checkSelect3" value="?????????(10??? ??????)"
											onclick="setBg(this);">?????????(10??? ??????)</li></label>
									<label><li><input type="checkbox"
											name="request3[]" class="checkSelect3" value="??????"
											onclick="setBg(this);">??????</li></label>
								</ul>
							</div>
						</li>
						<li>
							<h3 class="g-b"
								style="text-align: center; font-size: large; margin-bottom: 40px;">?????????
								?????? ?????? ????????????????</h3>
							<div class="g-div">
								<ul>
									<label><li><input type="checkbox"
											name="request4[]" class="checkSelect4" value="??????????????? ??????."
											onclick="setBg(this);">??????????????? ??????.</li></label>
									<label><li><input type="checkbox"
											name="request4[]" class="checkSelect4" value="?????? ?????? ???????????? ??????."
											onclick="setBg(this);">?????? ?????? ???????????? ??????.</li></label>
									<label><li><input type="checkbox"
											name="request4[]" class="checkSelect4" value="????????? ?????? ?????? ??????."
											onclick="setBg(this);">????????? ?????? ?????? ??????.</li></label>
									<label><li><input type="checkbox"
											name="request4[]" class="checkSelect4"
											value="????????????, ????????? ??? ?????? ??????." onclick="setBg(this);">????????????,
											????????? ??? ?????? ??????.</li></label>
									<label><li><input type="checkbox"
											name="request4[]" class="checkSelect4" value="??????"
											onclick="setBg(this);">??????</li></label>

								</ul>
							</div>
						</li>

						<li>
							<h3 class="g-b"
								style="text-align: center; font-size: large; margin-bottom: 40px;">????????????
								????????? ??????????????? ??????????</h3>
							<div class="g-div">
								<ul>
									<label><li><input type="checkbox"
											name="request5[]" class="checkSelect5" value="?????? ????????????."
											onclick="setBg(this);">?????? ????????????.</li></label>
									<label><li><input type="checkbox"
											name="request5[]" class="checkSelect5"
											value="????????? ?????? ???????????? ?????????." onclick="setBg(this);">?????????
											?????? ???????????? ?????????.</li></label>
									<label><li><input type="checkbox"
											name="request5[]" class="checkSelect5"
											value="????????? ????????? ???????????? ?????????." onclick="setBg(this);">?????????
											????????? ???????????? ?????????.</li></label>
									<label><li><input type="checkbox"
											name="request5[]" class="checkSelect5" value="????????? ????????? ?????????."
											onclick="setBg(this);">????????? ????????? ?????????.</li></label>
									<label><li><input type="checkbox"
											name="request5[]" class="checkSelect5" value="??????"
											onclick="setBg(this);">??????</li></label>

								</ul>
							</div>
						</li>

						<li>
							<h3 class="g-b"
								style="text-align: center; font-size: large; margin-bottom: 40px;">?????????
								?????? ?????? ????????????????</h3>
							<div class="g-div">
								<ul>
									<label><li><input type="checkbox"
											name="request6[]" class="checkSelect6" value="?????? ???????????? ???????????????."
											onclick="setBg(this);">?????? ???????????? ???????????????.</li></label>
									<label><li><input type="checkbox"
											name="request6[]" class="checkSelect6" value="????????? ?????? ?????????."
											onclick="setBg(this);">????????? ?????? ?????????.</li></label>
									<label><li><input type="checkbox"
											name="request6[]" class="checkSelect6"
											value="?????? ?????? ????????? ????????????." onclick="setBg(this);">?????? ??????
											????????? ????????????.</li></label>
									<label><li><input type="checkbox"
											name="request6[]" class="checkSelect6"
											value="????????? ?????? ????????? ?????????." onclick="setBg(this);">????????? ??????
											????????? ?????????.</li></label>
								</ul>
							</div>
						</li>
						<li>
							<h3 class="g-b"
								style="text-align: center; font-size: large; margin-bottom: 40px;">??????
								????????? ?????? ????????? ?????? ????????? ???????????????.</h3>
							<div class="g-div">
								<input type="text" name="requestContent7" class="checkSelect7"
									style="width: 100%; padding: 20px; font-size: small;"
									placeholder="?????? ??????, ?????? ?????? ????????? ??? ???????????? ???????????????.">
							</div>
						</li>
						<div id="btn_gallery">
							<div class="g-msg"></div>
							<a href="#"
								class="btn_gallery_prev off btn btn-outline-success g-btn upbtn">??????</a>
							<a href="#" class="btn_gallery_next btn btn-primary g-btn upbtn">??????</a>
							<button type="submit" class="btn_submit btn btn-info  g-btn g-b upbtn"
								style="display: none;">??????</button>
						</div>
					</ul>
					<input type="hidden" name="requestContent1" id="requestContent1">
					<input type="hidden" name="requestContent2" id="requestContent2">
					<input type="hidden" name="requestContent3" id="requestContent3">
					<input type="hidden" name="requestContent4" id="requestContent4">
					<input type="hidden" name="requestContent5" id="requestContent5">
					<input type="hidden" name="requestContent6" id="requestContent6">
					<input type="hidden" value="${sessionScope.m.memberNo }"
						name="requestWriterNo">
				</form>
			</div>
			<div class="g-text-wrap">
				<dl>
					<dt>
						<b>????????? ???????????? ?????? ?????????????</b>
					</dt>
					<dd>
						<p>???????????? ????????? ????????? ???????????? ???????????? ?????? ????????? ?????? ????????? ?????????????????? ????????? ?????? ??????????????????.
							???????????? ????????????, ?????? ??????????????? ????????? ????????? ???????????????. ?????? ??? ?????? ????????? ????????? ???????????? ???????????????</p>
					</dd>
				</dl>
				<dl>
					<dt>
						<b>??????????????? ?????? ???????????? ?????????!</b>
					</dt>
					<dd>
						<p>??????????????? ?????? ?????? ????????? ?????? ????????????? ?????? ?????? ???????????? ???????????????, ??????????????? ?????? ????????????
							??????????????????!</p>
					</dd>
				</dl>
			</div>
		</div>

		<div class="g-content-wrap">
			<ul class="g-seq">
				<li>
					<dl>
						<dt class="g-mint">1</dt>
						<dt>
							<img src="/resources/img/gosu/gosuSend1.png">
						</dt>
						<dt>????????? ??????</dt>
						<dd>
							???????????? ????????? ????????????<br>????????? ?????? ????????????.
						</dd>
					</dl>

				</li>
				<li>
					<dl>
						<dt class="g-mint">2</dt>
						<dt>
							<img src="/resources/img/gosu/gosuSend2.png">
						</dt>
						<dt>?????? ??????</dt>
						<dd>
							???????????? ???????????? ?????????<br>???????????? ????????? ?????????<br>?????????.
						</dd>
					</dl>

				</li>
				<li>
					<dl>
						<dt class="g-mint">3</dt>
						<dt>
							<img src="/resources/img/gosu/gosuSend3.png">
						</dt>
						<dt>?????? ??? ??????</dt>
						<dd>
							????????? ????????? ????????? ??????<br>???????????????.
						</dd>
					</dl>

				</li>
				<li>
					<dl>
						<dt class="g-mint">4</dt>
						<dt>
							<img src="/resources/img/gosu/gosuSend4.png">
						</dt>
						<dt>?????? ??????</dt>
						<dd>
							????????? ??? ????????? ????????????<br>????????? ?????? ?????????<br>???????????????.
						</dd>
					</dl>

				</li>
			</ul>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		var gCount = 1;
		function setBg(t) {
			td = t.parentNode;
			td.style.color = (t.checked) ? "#78c2ad" : "black";
		}
		var bar = 0;
		$(".btn_gallery_next").click(function() {
			var g1 = $(".checkSelect" + gCount + ":checked").length;

			$(".g-msg").empty();
			var html = "";
			if (g1 == 0 && gCount != 7) {
				html += "????????? ??????????????????";
				$(".g-msg").append(html);
				$(".g-msg").css("color", "red");

				return false;
			} else {

				if (!$("#gallery>li").last().is(":visible")) {
					$("#gallery>li:visible").hide().next("li").fadeIn("80");
					$(".btn_gallery_prev").removeClass("off");
					$(".progress-bar").css("width", (bar += 16) + "%");
					$(".progress-bar").html(bar + "%");

					var send_array = Array();
					var send_cnt = 0;
					var chkbox = $(".checkSelect" + gCount);
					if (gCount != 7) {
						for (i = 0; i < chkbox.length; i++) {
							if (chkbox[i].checked == true) {
								send_array[send_cnt] = chkbox[i].value;

								send_cnt++;
							}

						}
						$("#requestContent" + gCount).val(send_array);

					}
					gCount++;

				}

				if ($("#gallery>li").last().is(":visible")) {
				
					$(this).addClass("off");
					$(".btn_submit").css("display", "inline-block");
					$('#btn-submit').submit(function() {
						$(".g-msg").empty();
						var html = "";
						if ($("input[name=requestContent7]").val()=="") {
						
							html += "????????? ??????????????????";
							$(".g-msg").append(html);
							$(".g-msg").css("color", "red");
							return false;
						}
					});

				}

			}

			return false;
		});
		$(".btn_gallery_prev").click(function() {
			$(".g-msg").empty();

			if (!$("#gallery>li").first().is(":visible")) {
				$(".btn_submit").css("display", "none");
				$("#gallery>li:visible").hide().prev("li").fadeIn("80");
				$(".btn_gallery_next").removeClass("off");
				$(".progress-bar").css("width", (bar -= 16) + "%");
				$(".progress-bar").html(bar + "%");
				gCount--;

			}
			if ($("#gallery>li").first().is(":visible")) {
				$(this).addClass("off");
			}
			return false;
		});
	</script>
</body>
</html>