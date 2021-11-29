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

.container{
    min-width: 1200px;
    width:1200px;
      margin: 0 auto;
}
.container>h1{
    display: flex;
    justify-content: center;
    margin-top: 50px;
    font-size: 55px;
    font-weight: 900;
}
.container> .g-msg{
    margin: 50px;
    display:flex;
  justify-content:center;
  color: rgb(153, 153, 153);
  text-align: center;
  font-size: 13px;
  font-weight: bold;
}
.container .g-plus{
    display:flex;
    justify-content: right;
    color: rgb(78, 205, 196);
    text-align: right;
    font-weight: bold;
    margin: 20px;
}
.gosu{
    display: flex;
    justify-content: center;
}
.gosu table{
    width: 100%;
}
.gosu .gosu_img{
    text-align: center;
    width: 300px;
    height: 200px;
}
.gosu td{
    padding: 10px;
    padding-right: 30px;
    padding-left: 30px;
    
}
.gosu hr{
    max-width: 100%;
    font-weight: bold; 
    background-color: rgb(199, 199, 199);
    height: 1px;
   
}
.gosu-person-wrap{
    margin-top: 50px;
    margin-bottom: 50px;
    background-color: rgb(223, 245, 235);
    left: 0;
    min-width: 100%;
    padding: 50px;
}
.gosu-person>h3,.gosu-notice>h3, .gosu-status>h3{
    font-size: 30px;
    font-weight: 900;
    margin-left: 40px;
}
.gosu-one{
    text-align: center;
    font-weight: bold;
    
}
.g-act{
    display:flex;
    justify-content: right;
    color: gray;
    text-align: right;
    font-weight: bold;
    margin: 20px;
}
 
.g-gall{
  width: 100%;   
  display: flex; 
  justify-content: center;
}

ul#gallery{
    display: flex; 
    justify-content: space-between;

    margin-top: 30px;
      list-style: none;
      padding: 0;
      width: 80%;
  }

  ul#gallery>a>li{
      position: relative;
      background-color: #000;
      width: 200px;
      height: 200px;
      margin: 5px;
      overflow: hidden;
  }
  
  ul#gallery>a>li::after{
      box-sizing: border-box;
      position: absolute;
      display: block;
      top: 50%;
      left: 50%;
      width: 87%;
      height: 87%;
      padding-top: 80px;
      border: 2px solid #fff;
      transform: translate(-50%, -50%);
      text-align: center;
      content: '제목';
      font-size: 35px;
      color: #fff;
      opacity: 0;
      transition: 0.8s;
  }
  
  ul#gallery>a>li>img{
      width: 100%;
      height: 100%;
      transition: 0.6s ease-in-out;
      
  }
  
  ul#gallery>a>li:hover img{
      transform: scale(1.18);
      opacity: 0.65;
  }
  
  ul#gallery>a>li:hover::after{
      opacity: 1;
  }
  .dot{
    cursor: pointer;
    height: 15px;
    width: 15px;
    margin: 0 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
  }
  
.active, .dot:hover {
    background-color: rgb(78, 205, 196);
  }
  .gosu-status{
      margin-top: 100px;
    padding: 50px;
  }
  .gosu-status hr{
      margin-top: 80px;
      margin-bottom: 80px;
}
.fade {
    -webkit-animation-name: fade;
    -webkit-animation-duration: 1.5s;
    animation-name: fade;
    animation-duration: 1.5s;
  }
  
  @-webkit-keyframes fade {
    from {opacity: .4} 
    to {opacity: 1}
  }
  
  @keyframes fade {
    from {opacity: .4} 
    to {opacity: 1}
  }
</style>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
   <div class="container">
        <h1><span style="color: rgb(78, 205, 196); ">고수</span>의 노하우</h1>
    <div class="g-msg">
        고수에게 피드백을 신청해보세요!<br>
        당신의 작품을 평가해줍니다. 마음껏 질문하세요!
    </div>
    <div class="g-plus">
        <a>더보기</a>
    </div>
    <div class="gosu-wrap">
        <div class="gosu">
            <div class="card border-primary mb-3" style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
                <label>
                    <table>
                        <tr>
                            <td rowspan="4" class="gosu_img" style="width: 30%;"><img src="/resources/img/gosu/g_img_basic.png" style=" border-radius: 50%;"></td>
                            <td><a href="">제목</a></td>
                        </tr>
                        <tr>
                            <td><hr></td>
                        </tr>
                        <tr>
                           
                            <td> <li>한줄소개</li></td>
                        </tr>
                        <tr>
                            <td> <li>피드백 예상견적</li></td> 
                        </tr>
                        <tr>
                            <td style="text-align: center; font-weight: bold;">고수 xxxx</td>
                            <td>4.0</td>
                        </tr>
                    </table>
                </label>
              </div>
            </div> 
            <div class="gosu">
                <div class="card border-primary mb-3" style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
                    <label>
                        <table>
                            <tr>
                                <td rowspan="4" class="gosu_img" style="width: 30%;"><img src="/resources/img/gosu/g_img_basic.png" style=" border-radius: 50%;"></td>
                                <td><a href="">제목</a></td>
                            </tr>
                            <tr>
                                <td><hr></td>
                            </tr>
                            <tr>
                               
                                <td> <li>한줄소개</li></td>
                            </tr>
                            <tr>
                                <td> <li>피드백 예상견적</li></td> 
                            </tr>
                            <tr>
                                <td style="text-align: center; font-weight: bold;">고수 xxxx</td>
                                <td>4.0</td>
                            </tr>
                        </table>
                    </label>
                  </div>
            </div>
           
        </div>
        <div class="gosu-wrap">
            <div class="gosu">
                <div class="card border-primary mb-3" style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
                    <label>
                        <table>
                            <tr>
                                <td rowspan="4" class="gosu_img" style="width: 30%;"><img src="/resources/img/gosu/g_img_basic.png" style=" border-radius: 50%;"></td>
                                <td><a href="">제목22222</a></td>
                            </tr>
                            <tr>
                                <td><hr></td>
                            </tr>
                            <tr>
                               
                                <td> <li>한줄소개2222</li></td>
                            </tr>
                            <tr>
                                <td> <li>피드백 예상견적2222</li></td> 
                            </tr>
                            <tr>
                                <td style="text-align: center; font-weight: bold;">고수 xxxx</td>
                                <td>4.0</td>
                            </tr>
                        </table>
                    </label>
                  </div>
                </div> 
                <div class="gosu">
                    <div class="card border-primary mb-3" style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
                        <label>
                            <table>
                                <tr>
                                    <td rowspan="4" class="gosu_img" style="width: 30%;"><img src="/resources/img/gosu/g_img_basic.png" style=" border-radius: 50%;"></td>
                                    <td><a href="">제목2222</a></td>
                                </tr>
                                <tr>
                                    <td><hr></td>
                                </tr>
                                <tr>
                                   
                                    <td> <li>한줄소개2222</li></td>
                                </tr>
                                <tr>
                                    <td> <li>피드백 예상견적222</li></td> 
                                </tr>
                                <tr>
                                    <td style="text-align: center; font-weight: bold;">고수 xxxx</td>
                                    <td>4.0</td>
                                </tr>
                            </table>
                        </label>
                      </div>
                </div>
               
            </div>
        <div style="text-align:center">
            <span class="dot" onclick="currentSlide(1); "></span> 
            <span class="dot" onclick="currentSlide(2); "></span> 
            <span class="dot" onclick="currentSlide(3); "></span> 
          </div>
       <div class="gosu-person-wrap" >
           <div class="gosu-person "  >
           <h3 style="margin-left: 0; margin-top:0;">새로운 <span style="color: rgb(78, 205, 196); ">고수</span>를 소개합니다!</h3>
           <div class="g-act">활동 고수&nbsp;&nbsp;<span> 00</span>명</div>
           <div style="display: flex; justify-content: space-between; margin-top: 50px;">
            <div class="gosu-one" >
                <img src="/resources/img/gosu/g_img_basic.png"style=" border-radius: 50%;"> 
                <div style="margin-top: 20px;">고수 이름</div>
            </div>
            <div class="gosu-one">
                <img src="/resources/img/gosu/g_img_basic.png"style=" border-radius: 50%;"> 
                <div style="margin-top: 20px;">고수 이름</div>
            </div>
            <div class="gosu-one">
                <img src="/resources/img/gosu/g_img_basic.png"style=" border-radius: 50%;">
                <div style="margin-top: 20px;">고수 이름</div> 
            </div>
            <div class="gosu-one">
                <img src="/resources/img/gosu/g_img_basic.png"style=" border-radius: 50%;">
                <div style="margin-top: 20px;">고수 이름</div> 
            </div>
        </div>
        </div>
       </div>
       <div class="gosu-notice">
           
        <h3><span style="color: rgb(78, 205, 196); ">고수</span>의 게시판</h3>
        <div class="g-plus">
            <a>더보기</a>
        </div>
        <div class="g-gall" >
            <ul id="gallery">
                <a href=""><li><img src="/resources/img/gosu/g_img_basic.png" ></li></a>
                <a href=""><li><img src="/resources/img/gosu/g_img_basic.png" ></li></a>
                <a href=""><li><img src="/resources/img/gosu/g_img_basic.png" ></li></a>
            </ul>
        </div>  
        <div class="g-gall" >
            <ul id="gallery">
                <a href=""><li><img src="/resources/img/gosu/g_img_basic.png" ></li></a>
                <a href=""><li><img src="/resources/img/gosu/g_img_basic.png" ></li></a>
                <a href=""><li><img src="/resources/img/gosu/g_img_basic.png" ></li></a>
            </ul>
       
        </div>
       </div>
       <div class="gosu-status">
        <hr>
        <h3 style="text-align: center;">나의 현황</h3>
        <div class="g-plus">
            <a>자세히 보기</a>
        </div>
         </div>
    </div>
     <script>
       		 var slideIndex2 = 1;
       		 showSlides2(slideIndex2);

            function plusSlides(n) {
            showSlides2(slideIndex2 += n);
            }
            
            function currentSlide(n) {
            showSlides2(slideIndex2 = n);
            }

            function showSlides2(n) {
            var i;
            var slides = document.getElementsByClassName("gosu-wrap");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) {slideIndex2 = 1}    
            if (n < 1) {slideIndex2 = slides.length}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex2 -1].style.display="block";
            dots[slideIndex2 -1].className += " active";  
            }
    
            function membership(){
            	location.href="/membership";
            }
        </script>
</body>
</html>