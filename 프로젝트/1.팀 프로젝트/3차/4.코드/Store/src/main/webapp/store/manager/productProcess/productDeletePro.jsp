<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지의 언어를 지정하고 콘텐츠 유형 및 문자 인코딩 설정 -->

<%@ page import = "store.master.StoreDBBean" %> <!-- store.master.StoreDBBean 클래스를 import -->

<% request.setCharacterEncoding("utf-8");%> <!-- 문자 인코딩을 UTF-8로 설정 -->

<%
  int product_id = Integer.parseInt(request.getParameter("product_id")); //product_id를 가져와서 정수로 변환, product_id 변수에 저장
  String product_kind = request.getParameter("product_kind"); //product_kind를 가져와서 product_kind 변수에 저장
 
  StoreDBBean productProcess = StoreDBBean.getInstance(); //StoreDBBean 클래스의 인스턴스를 가져옴
  productProcess.deleteProduct(product_id); //deleteProduct(product_id) 메소드를 호출하여 해당 product_id에 해당하는 제품을 삭제

  response.sendRedirect("productList.jsp?product_kind="+product_kind); //productList.jsp 페이지로 리디렉션, product_kind를 쿼리 매개변수로 전달, 해당 상품 종류의 목록 페이지로 이동
%> 
