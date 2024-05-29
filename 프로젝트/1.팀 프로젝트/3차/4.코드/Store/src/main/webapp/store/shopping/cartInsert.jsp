<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "store.shopping.CartDBBean" %>

<% request.setCharacterEncoding("utf-8");%>
 
<%
   String product_kind = request.getParameter("product_kind");
   String buy_count = request.getParameter("buy_count");
   String product_id = request.getParameter("product_id");
   String product_name = request.getParameter("product_name");
   String product_image = request.getParameter("product_image");
   String buy_price = request.getParameter("buy_price");
   String buyer = (String)session.getAttribute("id");
%>

<jsp:useBean id="cart" scope="page"
           class="store.shopping.CartDataBean">
</jsp:useBean>

<%
  cart.setProduct_id(Integer.parseInt(product_id));
  cart.setProduct_image(product_image);
  cart.setProduct_name(product_name);
  cart.setBuy_count(Byte.parseByte(buy_count));
  cart.setBuy_price(Integer.parseInt(buy_price));
  cart.setBuyer(buyer);
  
  CartDBBean productProcess = CartDBBean.getInstance();
  productProcess.insertCart(cart);
  response.sendRedirect("cartList.jsp?product_kind="+product_kind);
%>