<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지의 언어를 지정하고 콘텐츠 유형 및 문자 인코딩 설정 -->
<%@ page import = "store.master.StoreDBBean" %> <!-- store.shopping.BuyDBBean클래스 import -->
<%@ page import = "store.master.StoreDataBean" %> <!-- store.shopping.BuyDataBean클래스 import -->
<%@ page import = "java.util.List" %> <!-- List클래스 import -->
<%@ page import = "java.text.SimpleDateFormat" %> <!-- SimpleDateFormat 클래스 import -->

<%@ include file="../../etc/color.jspf"%> <!-- color.jspf 파일을 현재 JSP 페이지에 포함 -->

<%
String managerId =""; //관리자 아이디 초기화
try{
	managerId = (String)session.getAttribute("managerId"); //세션에서 관리자 아이디를 가져옴
	if(managerId==null || managerId.equals("")){ //관리자 아이디가 없거나 비어있는 경우 
       response.sendRedirect("../logon/managerLoginForm.jsp"); //로그인 페이지로 리다이렉트
	}else{ //관리자 아이디가 있는 경우
%> 

<%!
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm"); //날짜 및 시간을 형식화하기 위한 SimpleDateFormat 객체 생성
%>

<%
    List<StoreDataBean> productList = null; //productList 초기화
    int number =0; //number 변수 초기화
    String product_kind=""; //product_kind 변수를 빈 문자열로 초기화
    
    product_kind = request.getParameter("product_kind"); //product_kind 변수에 요청에서 가져온 product_kind 매개변수 값을 할당
 
    StoreDBBean productProcess = StoreDBBean.getInstance(); //StoreDBBean 객체 productProcess를 생성
    int count = productProcess.getProductCount(); //데이터베이스에서 상품의 총 개수를 가져옴
    
    if (count > 0) { //상품이 존재한다면 (count가 0보다 크면)
    	productList = productProcess.getProducts(product_kind); //productProcess를 사용하여 product_kind에 해당하는 상품 목록을 productList에 할당
    }
%>
<html>
<head>
<title>등록된 상품 목록</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css"> <!-- CSS 스타일시트(style.css 파일)를 링크 -->
</head>
<body bgcolor="<%=bodyback_f%>"> <!-- 배경색은 bodyback_f 변수를 가져옴 -->
<%
   String product_kindName=""; //상품 종류 이름을 저장할 변수 선언
   if(product_kind.equals("100")){ //product_kind가 100이면 
	   product_kindName="과자"; //상품 종류 이름을 과자로 설정
   }else if(product_kind.equals("200")){ //product_kind가 200이면 
	   product_kindName="음료"; //상품 종류 이름을 음료로 설정
   }else if(product_kind.equals("300")){ //product_kind가 300이면
	   product_kindName="문구"; //상품 종류 이름을 문구로 설정
   }else if(product_kind.equals("all")){ //product_kind가 all이면
	   product_kindName="전체"; //상품 종류 이름을 전체로 설정
   }
%>
<center><table style='border:0 solid white'>
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_d%>"> <!-- 텍스트나 다른 요소들을 셀의 오른쪽에 정렬,열2개 겹치기, 배경색은 value_d 변수의 값 -->
	    <a href="../managerMain.jsp"> <h3>관리자 메인으로</h3></a> <!-- 관리자 메인 페이지로 이동 -->
   </td>
  </tr>
</table></center>
<p>
<p>

<%
  if (count == 0) { //상품이 존재하지 않는다면(count가 0이면)
%>
<table>
<tr>
   <td align="center"> <!-- 요소를 중앙 정렬 -->
           등록된 상품이 없습니다.
   </td>
</table>

<%} else {%> <!-- 상품이 존재한다면 -->
<center><table> 
     <td colspan="2" align="right" bgcolor="<%=value_b%>"> <!-- 텍스트나 다른 요소들을 셀의 오른쪽에 정렬,열2개 겹치기, 배경색은 value_b 변수의 값 -->
       <a href="productRegisterForm.jsp">상품 등록</a> <!-- 상품 등록 페이지로 이동 -->
     </td>
	 <td aligh="right" bgcolor="<%=value_e%>"> <!-- 텍스트나 다른 요소들을 셀의 오른쪽에 정렬,배경색은 value_e 변수의 값 -->
       <a href='productList.jsp?product_kind=all'>전체목록</a> <!-- 상품 목록 페이지 중 product_kind가 all인 목록으로 이동 -->
	 </td>
	 <td aligh="right" bgcolor="<%=value_e%>"> <!-- 텍스트나 다른 요소들을 셀의 오른쪽에 정렬,배경색은 value_e 변수의 값 -->
       <a href="productList.jsp?product_kind=<%=100%>">과자</a> <!-- 상품 목록 페이지 중 product_kind가 100인 목록으로 이동 -->
    </td>
    
    <td aligh="right" bgcolor="<%=value_e%>"> <!-- 텍스트나 다른 요소들을 셀의 오른쪽에 정렬,배경색은 value_e 변수의 값 -->
       <a href="productList.jsp?product_kind=<%=200%>">음료</a> <!-- 상품 목록 페이지 중 product_kind가 200인 목록으로 이동 -->
    </td>
    
    <td aligh="right" bgcolor="<%=value_e%>"> <!-- 텍스트나 다른 요소들을 셀의 오른쪽에 정렬,배경색은 value_e 변수의 값 -->
       <a href="productList.jsp?product_kind=<%=300%>">문구</a> <!-- 상품 목록 페이지 중 product_kind가 300인 목록으로 이동 -->
    </td>
     <tr height="30" bgcolor="<%=value_f%>"> <!-- 높이가 30, 배경색은 value_f 변수의 값 -->
      <td align="center"  width="30">번호</td> 
      <td align="center"  width="30">상품분류</td> 
      <td align="center"  width="100">이름</td>
      <td align="center"  width="50">가격</td> 
      <td align="center"  width="50">수량</td> 
      <td align="center"  width="70">중량</td>
      <td align="center"  width="70">제조사</td>
      <td align="center"  width="50">제조일</td>
      <td align="center"  width="50">상품이미지</td>
      <td align="center"  width="30">할인율</td>
      <td align="center"  width="70">등록일</td>
      <td align="center"  width="50">수정</td>
      <td align="center"  width="50">삭제</td>         
    </tr>
<%  
    for (int i = 0 ; i <productList.size() ; i++) { //productList 크기만큼 반복
      StoreDataBean product = 
    		  (StoreDataBean)productList.get(i); //해당 상품 목록을 product 변수에 저장 
%>
   <tr height="30">
      <td width="30"><%=++number%></td> 
      <td width="30"><%=product.getProduct_kind()%></td> <!-- 테이블의 각 행에 상품 종류를 표시 -->
      <td width="100" align="left">
           <%=product.getProduct_name()%></td> <!-- 테이블의 각 행에 상품 이름을 표시 -->
      <td width="50" align="right"><%=product.getProduct_price()%>원</td> <!-- 테이블의 각 행에 상품 가격을 표시 -->
      <td width="50" align="right">
      <% if(product.getProduct_count()==0) {%> <!-- 상품 개수가 0이면 -->
         <font color="red"><%="일시품절"%></font>
      <% }else{ %>
         <%=product.getProduct_count()%> <!-- 상품 개수를 표시 -->
      <%} %>
      개</td> 
      <td width="70"><%=product.getProduct_weight()%>g</td> <!-- 테이블의 각 행에 상품 중량을 표시 -->
      <td width="70"><%=product.getPublishing_com()%></td> <!-- 테이블의 각 행에 제조사를 표시 -->
      <td width="50"><%=product.getPublishing_date()%></td> <!-- 테이블의 각 행에 제조 날짜를 표시 -->
      <td width="50"><%=product.getProduct_image()%></td> <!-- 테이블의 각 행에 상품 이미지를 표시 -->
      <td width="50"><%=product.getDiscount_rate()%></td> <!-- 테이블의 각 행에 상품 할인율을 표시 -->
      <td width="50"><%=sdf.format(product.getReg_date())%></td> <!-- 테이블의 각 행에 상품 등록날짜를  표시 -->
      <td width="50">
         <a href="productUpdateForm.jsp?product_id=<%=product.getProduct_id()%>&product_kind=<%=product.getProduct_kind()%>">수정</a></td> <!-- 상품 수정 페이지로 이동 -->
      <td width="50">
         <a href="productDeleteForm.jsp?product_id=<%=product.getProduct_id()%>&product_kind=<%=product.getProduct_kind()%>">삭제</a></td> <!-- 상품 삭제 페이지로 이동 -->
   </tr>
<%}%>
</table></center> 
<%}%>
<br>
<a href="../managerMain.jsp"> <h2>관리자 메인으로</h2></a> 
<p><%=product_kindName%> 분류의 목록: 
<%if(product_kind.equals("all")){%> <!-- product_kind가 all이면 -->
    <%=count%>개 <!-- 전체 상품 개수 -->
<%}else{%> <!-- product_kind가 all이 아니면 -->
    <%=productList.size() %>개 <!-- 현재 페이지에 표시되는 상품 목록의 개수 -->
<%} %>
</p>
</body>
</html>

<% 
   }
}catch(Exception e){
   e.printStackTrace(); //예외 표시
}
%>
