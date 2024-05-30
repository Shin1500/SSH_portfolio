<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지의 언어를 지정하고 콘텐츠 유형 및 문자 인코딩 설정 -->
    
<%@ include file="../../etc/color.jspf"%> <!-- color.jspf 파일을 현재 JSP 페이지에 포함 -->

<%
String managerId =""; //관리자 아이디를 저장할 변수 초기화
try{
	managerId = (String)session.getAttribute("managerId"); //세션에서 관리자 아이디를 가져와 변수에 저장
	if(managerId==null || managerId.equals("")){ //관리자 아이디가 없거나 비어있는 경우
       response.sendRedirect("../logon/managerLoginForm.jsp"); //로그인 페이지로 리다이렉트
	}else{ //관리자 아이디가 존재하는 경우
       int product_id = Integer.parseInt(request.getParameter("product_id")); //요청에서 상품 아이디를 가져와 정수로 변환하여 변수에 저장
       String product_kind = request.getParameter("product_kind"); //요청에서 상품 종류를 가져와 변수에 저장
%> 

<html>
<head>
<title>상품삭제</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css"> <!-- CSS 스타일시트(style.css 파일)를 링크 -->
</head>
<body bgcolor="<%=bodyback_f%>"> <!-- 배경색은 bodyback_f 변수를 가져옴 -->
<table style='border:0 solid white'>  <!-- 테이블 생성 -->
<tr><td width="">  
<p>상품삭제 페이지</p>
</td></tr>
</table>

<br>
<form method="POST" name="delForm"  
   action="productDeletePro.jsp?product_id=<%= product_id%>&product_kind=<%=product_kind%>" 
   onsubmit="return deleteSave()"> <!-- productDeletePro.jsp 파일로 이동, product_id와 product_kind라는 매개변수를 URL에 포함시킨다, 폼이 제출될 때 실행할 자바스크립트 함수를 지정 -->
 <table style='border:0 solid white'> 
 <tr><td>
 <a href='productList.jsp?product_kind=all'>전체 목록</a> <!-- productList.jsp 페이지로 이동, URL 파라미터로 product_kind=all을 전달한다 -->
 </td></tr>
 </table>
 <table>
 <tr>
     <td align="right"  bgcolor="<%=value_f%>"> <!-- 텍스트나 다른 요소들을 셀의 오른쪽에 정렬, 배경색은 value_f 변수의 값 -->
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp; <!-- 관리자 메인 페이지로 이동 -->
	    <a href="productList.jsp?product_kind=<%=product_kind%>">이전으로</a> <!-- 이전 페이지로 이동 -->
	    
     </td>
  </tr> 
  
 <tr height="30">
    <td align=center bgcolor="<%=value_f%>"> <!-- 텍스트나 다른 요소들을 셀의 중앙에 정렬, 배경색은 value_f 변수의 값 -->
      <input type="submit" value="삭제" > <!-- 삭제 버튼 생성 -->
   </td>
 </tr>  
</table> 
</form>
</body>
</html>
<% 
   }
}catch(Exception e){
	e.printStackTrace(); //예외처리
}
%>