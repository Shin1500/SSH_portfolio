<!DOCTYPE HTML>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Store</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="description" content=""><meta name="keywords" content="">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<!--[if lte IE 8]>
<script src="css/ie/html5shiv.js"></script>
<![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css">
	<link rel="stylesheet" href="css/style.css">
</noscript>
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="css/ie/v8.css" />
	<![endif]-->
	</head>
	<body class="homepage">

		<!-- Header -->
			<div id="header">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="#" id="logo">Store</a></h1>
					
					<!-- Nav -->
						<nav id="nav"><ul><li><a href="shopMain.jsp">Store</a></li>
								<li>
									<a href="#">메뉴</a>
									<ul><li><a href="../shopping/list.jsp?product_kind=all">전체목록</a></li>
										<li><a href="../shopping/list.jsp?product_kind=100">과자</a></li>
										<li><a href="../shopping/list.jsp?product_kind=200">음료</a></li>
										<li><a href="../shopping/list.jsp?product_kind=300">문구</a>
									</ul></li>
								<li><a href="../board/list.jsp">게시판</a></li>
								<li><a href="../manager/managerMain.jsp">관리자페이지</a></li>
								<li><a href="no-sidebar.html"></a></li>
							</ul></nav><!-- Banner --><div id="banner">
							<div class="container">
								<section><header class="major">
								<%
 try{
   if(session.getAttribute("id")==null){%>
   <a href="../shopping/list.jsp?product_kind=all">전체목록보기</a>&nbsp;
   <br>
      
   <form name="inform" method="post" action="loginPro.jsp">
	아이디  <input type="text" name="id" size="5" maxlength="50" >
   비밀번호  <input type="password" name="passwd" size="5" maxlength="16" > 
<input type="submit" name="Submit" value="로그인">
        <input type="button" value="회원가입" onclick = "location.href='../manager/Customers/customerRegisterForm.jsp'">
   </form>
   
    
 <%}else{%>
    <a href="../shopping/list.jsp?product_kind=all">전체목록보기</a>&nbsp;
    <a href="../shopping/cartList.jsp?product_kind=all">장바구니보기</a>&nbsp;
    <a href="../shopping/buyList.jsp">구매목록보기</a>&nbsp;
      
    <br><br> 
    <b><%=session.getAttribute("id")%></b> 님 , 즐거운 쇼핑시간이 되세요.
       
    <input type="button"  value="로그아웃" 
        onclick="javascript:window.location='../shopping/logout.jsp'">
     
     
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
										<span class="byline">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.*</span>
									</header>
								</section></div>
						</div>

				</div>
			</div>

		<!-- Featured -->
			<div class="wrapper style2">
				<section class="container"><header class="major"><h2>판매 상품</h2>
						<span class="byline">다양한 상품들이 준비되어 있습니다!</span>
					</header><div class="row no-collapse-1">
						<section class="4u"><a href="../shopping/list.jsp?product_kind=100" class="image feature"><img src="images/pic02.jpg" alt="" width="368" height="180"></a>
							<p>과자</p>
						</section><section class="4u"><a href="../shopping/list.jsp?product_kind=200" class="image feature"><img src="images/pic03.jpg" alt="" width="368" height="180"></a>
							<p>음료수</p>
						</section><section class="4u"><a href="../shopping/list.jsp?product_kind=300" class="image feature"><img src="images/pic04.jpg" alt="" width="368" height="180"></a>
							<p>문구</p>
						</section>
						</div>
				</section></div>

		<!-- Main -->
			<div id="main" class="wrapper style1">
				<section class="container">
				<%@ include file = "introList.jsp" %>
					
				</section>
				</div>

		<!-- Footer -->
			<div id="footer">
				<div class="container">

					<!-- Lists -->
						<div class="row">
							<div class="8u">

									</div>
						</div>

				</div>
			</div>
		<div class="copyright">
		<font color = "white">개인정보 보호 정책 | 홈페이지 이용안내 | E-MAIL | 도움말 | 약관</font><br>
<font color = "white" size="2">본 웹 사이트는 이메일주소가 무단으로 수집되는 것을 거부합니다.</font><br>
			Design by: <a href="https://templated.co/">TEMPLATED</a>
		</div>
	</body></html>
