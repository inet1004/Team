<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="WebContent/css/Gridcss.jsp"></script>
<head>
    <title>브라이덜샤워</title>
    <link href="common.css" rel="stylesheet" type="text/css">
    <style>
      body{ background-color: #F7FFF5;}
      p,div { width: 100%; }
      div { background-color: lightgray; padding: 10px; margin-left: 220px;}
      img.fixed { 
        position: fixed;
        width: 40%;
      /* 본문 내 이미지 요소의 'position' 속성을 'fixed'로 지정 */
        left: 20px;
        top: 50px;
    img.static { 
        position: static;
      }
    </style>
  </head>
  <body>


  <!-- 회색 배경의 <div> 영역을 선언 -->
  <div>
    <h1> rrr </h1>
    <p>wwww </p>
    <!-- 문서 전체의 좌측 상단을 기준으로 왼쪽에서 20px, 위에서 50px 떨어진 곳에 이미지를 위치시킴. 
스크롤을 좌우로 움직여봐도 이미지는 고정되어 움직이지 않음 -->
    <img src="../img/1.JPG" class="fixed"><br/>
    <img src="../img/2.JPG" class="fixed"><br/> 
    <img src="../img/3.JPG" class="fixed"><br/> 
    <img src="../img/4.JPG" class="fixed"><br/> 
    <img src="../img/5.JPG" class="fixed"><br/> 
    <img src="../img/6.JPG" class="fixed"><br/> 
    <img src="../img/7.JPG" class="fixed"><br/> 
    <img src="../img/8.JPG" class="fixed"><br/> 
    <img src="../img/9.JPG" class="fixed"><br/> 
  </div>
  </body>

</html>