<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "store.master.StoreDBBean" %>
<%@ page import = "store.master.StoreDataBean" %>

<%@ include file="../../etc/color.jspf"%> 
 이 코드의 의미를 하나하나 주석을 달아서 알려줘
<%
String managerId =""; //관리자 아이디를 저장할 변수 초기화
try{
   managerId = (String)session.getAttribute("managerId"); //세션에서 관리자 아이디를 가져와 변수에 저장
   if(managerId==null || managerId.equals("")){ //관리자 아이디가 없거나 비어있는 경우
      response.sendRedirect("../logon/managerLoginForm.jsp"); //로그인 페이지로 리다이렉트
}else{ //관리자 아이디가 존재하는 경우
%>
<%
int product_id = Integer.parseInt(request.getParameter("product_id")); //요청에서 상품 아이디를 가져와 정수로 변환하여 변수에 저장
String product_kind = request.getParameter("product_kind"); //요청에서 상품 종류를 가져와 변수에 저장
try{
	StoreDBBean productProcess = StoreDBBean.getInstance(); //StoreDBBean 클래스의 getInstance() 메서드를 호출하여 StoreDBBean 객체 생성
    StoreDataBean product =  productProcess.getProduct(product_id); //product_id를 파라미터로 전달하여 특정 상품의 정보를 조회
%>
<html>
<head>
<title>상품수정</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css"> <!-- CSS 스타일시트(style.css 파일)를 링크 -->
<script type="text/javascript" src="../../etc/script.js"></script> <!-- script.js 파일을 HTML 페이지에 포함 -->
</head>
<body bgcolor="<%=bodyback_f%>">
<p>상품 수정</p>
<br>

<form method="post" name="writeform" 
   action="productUpdatePro.jsp"  enctype="multipart/form-data">
<table>
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_f%>">
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp; <!-- 관리자 메인 페이지로 이동 -->
	    <a href="productList.jsp?product_kind=<%=product_kind%>">목록으로</a> <!-- product_kind 파라미터를 사용하여 productList.jsp 페이지로 이동 -->
   </td>
   </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_f%>">분류 선택</td>
    <td  width="400"  align="left">
       <select name="product_kind"> <!-- 셀렉트 메뉴 생성 -->
           <option value="100" 
             <%if (product.getProduct_kind().equals("100")) {%>selected<%} %>
              >과자</option>
           <option value="200" 
             <%if (product.getProduct_kind().equals("200")) {%>selected<%} %>
             >음료수</option>
           <option value="300" 
             <%if (product.getProduct_kind().equals("300")) {%>selected<%} %>
             >문구</option>
       </select>
    </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">이 름</td>
    <td  width="400" align="left">
        <input type="text" size="50" maxlength="50" name="product_name" 
            value="<%=product.getProduct_name() %>"> <!-- 텍스트 입력 필드 생성 -->
        <input type="hidden" name="product_id" value="<%=product_id%>"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">가 격</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="9" name="product_price"  
          value="<%=product.getProduct_price() %>">원</td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">수량</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="product_count" 
          value="<%=product.getProduct_count() %>">개</td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_f%>">중량</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="product_weight" 
          value="<%=product.getProduct_weight()%>">g</td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">제조사</td>
    <td  width="400" align="left">
        <input type="text" size="20" maxlength="30" name="publishing_com" 
          value="<%=product.getPublishing_com() %>"></td> <!-- 텍스트 입력 필드 생성 -->
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
             <option value="<%=i %>"  
             <%if (Integer.parseInt(product.getPublishing_date().substring(0,4))==i) {%>
             selected<%} %>><%=i %></option>
        <%} %>
        </select>년
        
        <select name="publishing_month">
        <%
           for(int i=1;i<=12;i++){ //1~12월까지
        %>
             <option value="<%=i %>" 
             <%if (Integer.parseInt(product.getPublishing_date().substring(5,7))==i) {%>
               selected<%} %>><%=i %></option>
        <%} %>
        </select>월
        
        <select name="publishing_day">
        <%
           for(int i=1;i<=31;i++){ //1~31일까지
        %>
             <option value="<%=i %>" 
             <%if (Integer.parseInt(product.getPublishing_date().substring(8))==i) {%>
               selected<%} %>><%=i %></option>
        <%} %>
        </select>일
     </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_f%>">이미지</td>
    <td  width="400" align="left">
        <input type="file" name="product_image"><%=product.getProduct_image() %></td> <!-- 파일 로드 생성 -->
  </tr>
 <tr>
    <td  width="100"  bgcolor="<%=value_f%>">할인율</td>
    <td  width="400" align="left">
        <input type="text" size="5" maxlength="2" name="discount_rate" 
          value="<%=product.getDiscount_rate() %>">%</td> <!-- 텍스트 입력 필드 생성 -->
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_f%>" align="center"> 
  <input type="button" value="상품수정" onclick="updateCheckForm(this.form)"> <!-- 상품 수정 버튼 생성, updateCheckForm 함수 호출 --> 
  <input type="reset" value="다시작성"> <!-- 다시 작성 버튼 생성, 내용 초기화 -->
</td></tr></table>         
</form>   
<%
}catch(Exception e){
	e.printStackTrace(); //예외 표시
}%>         
</body>
</html>
<% 
  }
}catch(Exception e){
	e.printStackTrace(); //예외 표시
}
%>
