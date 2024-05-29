<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>

<%@ include file="../../etc/color.jspf"%> 



<%
   String managerId =""; //관리자 아이디를 저장할 변수 초기화
   try{
	   managerId = (String)session.getAttribute("managerId"); //세션에서 관리자 아이디를 가져와 변수에 저장
	   if(managerId==null || managerId.equals("")){ //관리자 아이디가 없거나 비어있는 경우
           response.sendRedirect("../logon/managerLoginForm.jsp"); //로그인 페이지로 리다이렉트
	   }else{ //관리자 아이디가 존재하는 경우
%>
<html>
<head>
<title>상품등록</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css"> <!-- CSS 스타일시트(style.css 파일)를 링크 -->
<script type="text/javascript" src="../../etc/script.js"></script> <!-- script.js 파일을 HTML 페이지에 포함 -->
</head>
<body bgcolor="<%=bodyback_f%>"> <!-- 배경색은 bodyback_f 변수를 가져옴 -->
<p><table style='border:0 solid white'><td><h2>상품 등록</h2></p></td></table>
<br>

<form method="post" name="writeform" 
     action="productRegisterPro.jsp"  enctype="multipart/form-data">
<table> 
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_d%>">
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> <!-- 관리자 메인 페이지로 이동 -->
   </td>
   <td></td><td></td>
   <td align="right" colspan="2" bgcolor="<%=value_d%>">
	    <a href='productList.jsp?product_kind=all'>상품리스트로</a> <!-- 상품 목록 페이지로 이동 -->
   </td>
   </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_f%>">분류 선택</td>
    <td  width="400" align="left">
       <select name="product_kind"> <!-- 셀렉트 메뉴 생성 -->
           <option value="100">과자</option>
           <option value="200">음료</option>
           <option value="300">문구</option>
       </select>
    </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">이 름</td>
    <td  width="400" align="left">
        <input type="text" size="50" maxlength="50" name="product_name"></td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">가 격</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="9" name="product_price">원</td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">수량</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="product_count">개</td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">중량</td>
    <td  width="400" align="left">
        <input type="text" size="20" maxlength="30" name="product_weight">g</td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">제조사</td>
    <td  width="400" align="left">
        <input type="text" size="20" maxlength="30" name="publishing_com"></td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">제조일</td>
    <td  width="400" align="left">
        <select name="publishing_year">
        <% //현재 연도부터 2010년까지의 옵션을 가진 셀렉트 박스 생성
        Timestamp nowTime  = new Timestamp(System.currentTimeMillis());
        int lastYear = Integer.parseInt(nowTime.toString().substring(0,4));
           for(int i=lastYear;i>=2010;i--){
        %>
             <option value="<%=i %>"><%=i %></option>
        <%} %>
        </select>년
        
        <select name="publishing_month">
        <%
           for(int i=1;i<=12;i++){ //1~12월까지
        %>
             <option value="<%=i %>"><%=i %></option>
        <%} %>
        </select>월
        
        <select name="publishing_day">
        <%
           for(int i=1;i<=31;i++){ //1~31일까지
        %>
             <option value="<%=i %>"><%=i %></option>
        <%} %>
        </select>일
     </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">이미지</td>
    <td  width="400" align="left">
        <input type="file" name="product_image"></td> <!-- 파일 로드 생성 -->
  </tr>
 <tr>
    <td  width="100"  bgcolor="<%=value_f%>">할인율</td>
    <td  width="400" align="left">
        <input type="text" size="5" maxlength="2" name="discount_rate">%</td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_d%>" align="center"> 
  <input type="button" value="상품등록" onclick="checkForm(this.form)"> <!-- 상품 등록 버튼 생성, checkForm 함수 호출 -->
  <input type="reset" value="다시작성"> <!-- 다시 작성 버튼 생성, 내용 초기화 -->
  
</td></tr></table>         
</form>      
</body>
</html>
<% 
	}
}catch(Exception e){
	e.printStackTrace(); //예외 표시
}
%>