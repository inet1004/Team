<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
        <!-- Header Start  -->
       <div class="header-area">
            <div class="main-header header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- Logo --> 
                        <div class="col-xl-2 col-lg-2 col-md-2">
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-xl-10 col-lg-10 col-md-10">
                            <!-- Main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>                              
                                    <ul id="navigation">    
                       <c:choose>
						 <c:when test="${not empty sessionID }">
							<c:if test="${grade == 'admin' }"> 
							   <li><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
							   <li><a href="${pageContext.request.contextPath}/home.do">회원목록</a></li>
							   <li><a href="${pageContext.request.contextPath}/orderJoin.do">주문</a></li>
							</c:if>
							  <li><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
							  <li><a href="${pageContext.request.contextPath}/orderJoin.do">주문</a></li>
							  <li><a href="${pageContext.request.contextPath}/logout.do"">로그아웃</a></li>
						</c:when>
						<c:otherwise>
                               <li><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
                               <li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
                               <li><a href="${pageContext.request.contextPath}/memberJoin.do">회원가입</a></li>
                               <li><a href="${pageContext.request.contextPath}/orderJoin.do">주문</a></li>
                               <li><a href="#">Pages</a>
                                 <ul class="submenu">
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="single-blog.html">Blog Details</a></li>
                                    <li><a href="elements.html">Element</a></li>
                                   </ul>
                                 </li>
                        </c:otherwise>
					  </c:choose>
                                    </ul>
                                </nav>
                            </div>
                        </div> 
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <!-- Header End -->
    </header>