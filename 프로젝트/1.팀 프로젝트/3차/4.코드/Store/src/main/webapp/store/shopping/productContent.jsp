<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "store.master.StoreDBBean" %>
<%@ page import = "store.master.StoreDataBean" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 
  
<%
 String product_kind = request.getParameter("product_kind");
 String product_id = request.getParameter("product_id");
 String id = "";
 int buy_price=0;
 try{
   if(session.getAttribute("id")==null)
     id="not";
   else
     id= (String)session.getAttribute("id");    
}catch(Exception e){}
%>

<html>
<head>
<title>Store Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_f%>">
<%
StoreDataBean  productList = null;
String product_kindName="";
  
StoreDBBean productProcess = StoreDBBean.getInstance();
 
productList = productProcess.getProduct(Integer.parseInt(product_id));
     
if(product_kind.equals("100"))
	product_kindName="과자";
else if(product_kind.equals("200"))
	product_kindName="음료";  
else if(product_kind.equals("300"))
	product_kindName="문구";

%>
<br><br><br> 
<center>
<form name="inform" method="post" action="cartInsert.jsp">
<table bgcolor="<%=value_f%>"> 
   <tr height="30"> 
     <td rowspan="6"  width="150">
        <img src="../../imageFile/<%=productList.getProduct_image()%>" 
             border="0" width="150" height="200"></td> 
     <td width="500"><font size="+1">
       <b><%=productList.getProduct_name() %></b></font></td>
   </tr> 
   
   <tr><td width="500">제조사 : <%=productList.getPublishing_com()%></td></tr> 
   <tr><td width="500">제조일 : <%=productList.getPublishing_date()%></td></tr>
   <tr><td width="500">중량 : <%=productList.getProduct_weight()%>g</td></tr>
   <tr><td width="500">정가 : <%=NumberFormat.getInstance().format(productList.getProduct_price())%>원<br>
      <%buy_price = (int)(productList.getProduct_price()*((double)(100-productList.getDiscount_rate())/100)) ;%>
            판매가 : <b><font color="red">
            <%=NumberFormat.getInstance().format((int)(buy_price))%>원
            </font></b></td> 
   <tr><td width="500">수량 : <input type="text" size="5"name="buy_count" value="1"> 개
 <%
   if(id.equals("not")){
     if(productList.getProduct_count()==0){
 %>
        <b>일시품절</b>
<%  
     }           
  }else{ 
     if(productList.getProduct_count()==0){
%>
         <b>일시품절</b>
                           
<%   }else{ %>	 
       <input type="hidden" name="product_id" value="<%=product_id %>">
       <input type="hidden" name="product_image" value="<%=productList.getProduct_image()%>">
       <input type="hidden" name="product_name" value="<%=productList.getProduct_name() %>">
       <input type="hidden" name="buy_price" value="<%=buy_price %>">
       <input type="hidden" name="product_kind" value="<%=product_kind %>">              
       <input type="submit" value="장바구니에 담기">
<%}}%>
   <input type="button" value="목록으로" 
     onclick="javascript:window.location='list.jsp?product_kind=<%=product_kind%>'">
   <input type="button" value="메인으로" 
     onclick="javascript:window.location='shopMain.jsp'">
   </td>
  </tr>         
</table></center>
</form>
</body>
</html>