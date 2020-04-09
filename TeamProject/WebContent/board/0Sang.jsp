<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}


header {
  background-color: #666;
  text-align: center;
   padding: 0px;
   magin : 0px;
   
  font-size: 35px;
  color: white;
}


nav {
  float: left;
  width: 30%;
  height: 300px; 
  background: #ccc;
  padding: 30px;
}


nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 30px;
  width: 70%;
  background-color: #f1f1f1;
  height: 120px; 
}


section:after {
  content: "";
  display: table;
  clear: both;
}




@media (max-width: 600px) {
  nav, article {
    width: 700%;
    height: auto;
  }
}
</style>
</head>
<body>

<h2>영상 게시판!</h2>
<p> </p>

<header>
  <h2>Youtube</h2>
</header>


  <nav>
    <iframe width="100%" height="100%" src="https://www.youtube.com/embed/BqXZN7MhR5g"  ></iframe>
  </nav>
 
  <article>
    <h1>YouTuBe 조회수 10만 이상 </h1>
    
     <li> 브라이덜샤워의 대한 영상모음집.</li>
      <li> 브라이덜샤워의 대한 영상모음집.</li>
	      <li> 브라이덜샤워의 대한 영상모음집.</li>
      
      
      
    
  </article>
  <section>
  
<div class="slide">
<img src ="../img/dg1.jpg" width="30%" height="">
</div>

</section>

</body>
</html>