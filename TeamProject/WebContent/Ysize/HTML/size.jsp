<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="grid" href="../css/LayOut.css">
<!--  <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="../js/masonry.pkgd.min.js"></script>
<!-- //<script src="../js/size.js"></script> -->
<script>
$(function(){

var $grid = $('.grid').masonry({
  columnWidth: 80
});

$grid.on( 'click', '.grid-item', function() {
	  $( this ).toggleClass('grid-item--gigante');
  	  $ (this ).toggleClass('gigante');
  
  $grid.masonry('layout');
});


function getItemElement() {
  var elem = document.createElement('div');
  var wRand = Math.random();
  var hRand = Math.random();
  var widthClass = wRand > 0.8 ? 'grid-item--width3' : wRand > 0.6 ? 'grid-item--width2' : '';
  var heightClass = hRand > 0.85 ? 'grid-item--height4' : hRand > 0.6 ? 'grid-item--height3' : hRand > 0.35 ? 'grid-item--height2' : '';
  elem.className = 'grid-item ' + widthClass + ' ' + heightClass;
  return elem;
}

});
</script>


</head>
<body>

	<h1>브라이덜 샤워</h1>
   <div id="masonry_container">
        <div class = "item small"></div>
        <div class = "item big"></div>
        <div class = "item normal"></div>
        <div class = "item small"></div>
        <div class = "item small"></div>
        <div class = "item small"></div>
        <div class = "item normal"></div>
        <div class = "item normal"></div>
        <div class = "item small"></div>
        <div class = "item small"></div>
        <div class = "item small"></div>
    </div>
				<div class="grid">
				  <div class="grid-item"></div>
				  <div class="grid-item grid-item--width2 grid-item--height2"></div>
				  <div class="grid-item grid-item--height3"></div>
				  <div class="grid-item grid-item--height2"></div>
				  <div class="grid-item grid-item--width3"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item grid-item--height2"></div>
				  <div class="grid-item grid-item--width2 grid-item--height3"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item grid-item--height2"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item grid-item--width2 grid-item--height2"></div>
				  <div class="grid-item grid-item--width2"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item grid-item--height2"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item grid-item--height3"></div>
				  <div class="grid-item grid-item--height2"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item"></div>
				  <div class="grid-item grid-item--height2"></div>
						<div ><img src="../../img/1.JPG"></div>
						<div ><img src="../../img/2.JPG"></div>
						<div >
			<img src="../../img/3.JPG">
		</div>
				</div>
						
		<%-- <div class="box" onClick="popup();></div>   --%>
		<p>
			<button class="append-button">Click</button>
		</p>
<script>
		function popup() {
			alert('hi');
		}
		alert('사진 게시판');
	</script>


</body>
</html>
