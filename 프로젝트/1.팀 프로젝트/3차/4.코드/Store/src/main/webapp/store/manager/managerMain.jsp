<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../etc/color.jspf"%>

<%
   String managerId =""; //관리자 아이디를 저장할 변수 초기화
   try{
	   managerId = (String)session.getAttribute("managerId"); //세션에서 관리자 아이디를 가져와 변수에 저장
	   
	   if(managerId==null || managerId.equals("")){ //관리자 아이디가 없거나 비어있는 경우
          response.sendRedirect("logon/managerLoginForm.jsp"); //로그인 페이지로 리다이렉트
	   }else{ //관리자 아이디가 존재하는 경우
%>
<html>
<head>
<title>상품관리</title>
</head>
<body bgcolor="<%=bodyback_f%>">
  <form method="post" action="logon/managerLogout.jsp">
	 <b>관리작업중... </b><input type="submit" value="로그아웃"> <!-- 사용자가 로그아웃 버튼을 클릭하면 현재 관리자 세션을 무효화하고 로그아웃 -->
  </form>
    
   <table>
     <tr><td align="center" bgcolor="<%=bar%>">상품관련 작업</td></tr>
     <tr><td>
     <a href='productProcess/productRegisterForm.jsp'>상품등록</a></td></tr> <!-- 상품 등록 페이지로 이동 -->
     <tr><td>
     <a href='productProcess/productList.jsp?product_kind=all'>상품 리스트</a> <!-- 상품 목록 페이지로 이동 -->
     </td></tr>
     
   </table><br><br>
   
   <table>
     <tr><td align="center" bgcolor="<%=bar%>">구매된 상품관련 작업</td></tr>
     <tr><td>
     <a href='orderedProduct/orderedList.jsp'>전체구매목록 확인</a></td></tr> <!-- 구매목록 페이지로 이동 -->
     <tr><td>
     <a href='orderedProduct/showChart.jsp'>판매량 통계</a> <!-- 통계 차트 페이지로 이동 -->
     </td></tr>
   </table> <br><br>
         <table>
     <tr><td align="center" bgcolor="<%=bar%>">회원 관련 작업</td></tr>
     <tr><td>
     <a href='Customers/customerList.jsp'>회원 리스트</a></td></tr> <!-- 회원 목록 페이지로 이동 -->
   </table>
   <br><br>
            <table>
     <tr><td align="center" bgcolor="<%=bar%>">쇼핑몰</td></tr>
     <tr><td>
     <a href='../shopping/shopMain.jsp'>쇼핑몰로가기</a></td></tr> <!-- 쇼핑몰 메인 홈페이지로 이동 -->
   </table>
   <br><br>
</body>
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace(); //예외처리
	}
%>