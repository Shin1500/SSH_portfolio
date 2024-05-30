<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지의 언어를 지정하고 콘텐츠 유형 및 문자 인코딩 설정 -->
<%@ page import = "store.shopping.BuyDataBean" %> <!-- store.shopping.BuyDataBean클래스 import -->
<%@ page import = "store.shopping.BuyDBBean" %> <!-- store.shopping.BuyDBBean클래스 import -->
<%@ page import = "java.util.List" %> <!-- List클래스 import -->
<%@ page import = "java.text.NumberFormat" %> <!-- 숫자를 형식화하고 출력하는 데 사용되는 NumberFormat클래스 import --> 

<%@ include file="../../etc/color.jspf"%> <!-- color.jspf 파일을 현재 JSP 페이지에 포함 -->

<%
  String buyer = (String)session.getAttribute("id"); //현재 세션에서 id라는 이름의 속성을 가져와서 문자열로 변환한 후 변수 buyer에 저장
%>

<html>
<head>
<title>Store Mall</title> 
<link href="../../etc/style.css" rel="stylesheet" type="text/css"> <!-- CSS 스타일시트(style.css 파일)를 링크 -->
</head>
<body bgcolor="<%=bodyback_f%>"> <!-- 배경색은 bodyback_f 변수를 가져옴 -->
<%
List<BuyDataBean> buyLists = null; //BuyDataBean 객체의 리스트를 선언하고 초기화
BuyDataBean buyList = null; //BuyDataBean 객체인 buyList 선언 후 초기화
int count = 0; //count(주문 목록 개수)를 선언 후 초기화

BuyDBBean buyProcess = BuyDBBean.getInstance(); //BuyDBBean의 인스턴스를 생성하여 buyProcess 변수에 할당
count = buyProcess.getListCount(); //count 변수(주문 목록 개수)에 저장

if(count == 0){ //주문 목록이 없으면(0이면)
%>
  <h3><b>주문목록</b></h3>
<center>
  <table> 
    <tr><td>구매목록이 없습니다.</td></tr>
  </table></center>
  <br><a href="../managerMain.jsp"> 관리자 메인으로</a> <!-- 관리자 메인 페이지로 이동 -->
<%
}else{ //주문 목록이 있으면(0이 아니면)
   buyLists = buyProcess.getBuyList(); //주문 목록을 가져와서 buyLists 변수에 저장
%><table style='border:0 solid white'> <!-- 주문목록 테이블 생성 -->
	<tr>
	<td>
  <h3><b>주문목록</b></h3>
    <a href="../managerMain.jsp"> 관리자 메인으로</a> <!-- 관리자 메인 페이지로 이동 -->
    </tr>
    </td>
    </table> 
  <table> 
    <tr> <!-- 테이블 구성 -->
      <td>주문번호</td> 
      <td>주문자</td> 
      <td> 상품이름</td>
      <td>주문가격</td> 
      <td>주문수량</td>
      <td>주문일</td>
      <td>결제계좌</td>
      <td>배송명</td>
      <td>배송지전화</td>
      <td>배송지주소</td>
      <td>배송지상황</td>
   </tr>
<%
  for(int i=0;i<buyLists.size();i++){ //buyLists 크기만큼 반복
    buyList = (BuyDataBean)buyLists.get(i);	//해당 주문 항목을 buyList 변수에 저장     	 
%>
    <tr> 
      <td><%=buyList.getBuy_id() %></td> <!-- buyList에서 주문 번호를 가져옴 -->
      <td><%=buyList.getBuyer() %></td> <!-- buyList에서 주문자 정보를 가져옴 -->
      <td><%=buyList.getProduct_name() %></td> <!-- buyList에서 상품 이름을 가져옴 -->
      <td><%=buyList.getBuy_price() %></td> <!-- buyList에서 상품 가격을 가져옴 -->
      <td><%=buyList.getBuy_count()%></td> <!-- buyList에서 주문 수량을 가져옴 -->
      <td><%=buyList.getBuy_date().toString() %></td> <!-- buyList에서 주문 날짜를 문자열 형태로 가져옴 -->
      <td><%=buyList.getAccount() %></td> <!-- buyList에서 결제 계좌 정보를 가져옴 -->
      <td><%=buyList.getDeliveryName() %></td> <!-- buyList에서 배송 이름을 가져옴 -->
      <td><%=buyList.getDeliveryTel() %></td> <!-- buyList에서 배송 전화번호를 가져옴 -->
      <td><%=buyList.getDeliveryAddress() %></td> <!-- buyList에서 배송 주소를 가져옴 -->
      <td><%=buyList.getSanction() %></td> <!-- buyList에서 배송 상태를 가져옴 -->
    </tr>
<%}%>
</table>
<%}%>
</body>
</html> 
