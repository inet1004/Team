<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">
    <link href="http://fonts.googleapis.com/earlyaccess/jejuhallasan.css" rel="stylesheet">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/templet/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templet/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templet/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templet/css/aos.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templet/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templet/fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templet/css/style.css">
    <style>
    body{
    font-family: 'Jeju Hallasan', serif;
    }
    </style>
</head>
<body>
	<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
	<div>
		<tiles:insertAttribute name="menu" />
	</div>
	<div>
		<tiles:insertAttribute name="header" />
	</div>
	<div>
		<tiles:insertAttribute name="body" />
	</div>
	<div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
	<script src="${pageContext.request.contextPath}/templet/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/templet/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/templet/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/templet/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/templet/js/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/templet/js/aos.js"></script>
    <script src="${pageContext.request.contextPath}/templet/js/main.js"></script>
</html>
