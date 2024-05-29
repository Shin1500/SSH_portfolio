<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "store.shopping.CartDBBean" %>

<%@ include file="../etc/color.jspf"%> 
 
<%
 String cart_id = request.getParameter("cart_id");
 String buy_count = request.getParameter("buy_count");
 String product_kind = request.getParameter("product_kind");
 
 if(session.getAttribute("id")==null){
	response.sendRedirect("shopMain.jsp");        
 }else{
	CartDBBean productProcess = CartDBBean.getInstance();
	productProcess.updateCount(Integer.parseInt(cart_id), Byte.parseByte(buy_count));
    response.sendRedirect("cartList.jsp?product_kind=" + product_kind);
 }
%>