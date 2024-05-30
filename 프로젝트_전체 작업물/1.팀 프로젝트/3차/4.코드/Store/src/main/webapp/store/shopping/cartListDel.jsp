<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "store.shopping.CartDBBean" %>

<%@ include file="../etc/color.jspf"%> 
 
<%
 String list = request.getParameter("list");
 String buyer = (String)session.getAttribute("id");
 String product_kind = request.getParameter("product_kind");
   
 if(session.getAttribute("id")==null){
	response.sendRedirect("shopMain.jsp");        
 }else{
	CartDBBean productProcess = CartDBBean.getInstance();
	   
	if(list.equals("all"))
		productProcess.deleteAll(buyer);
	else
		productProcess.deleteList(Integer.parseInt(list));
	
	response.sendRedirect("cartList.jsp?product_kind=" + product_kind);
 }
%>