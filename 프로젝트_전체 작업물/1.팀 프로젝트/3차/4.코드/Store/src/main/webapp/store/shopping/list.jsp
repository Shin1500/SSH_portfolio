<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "store.master.StoreDBBean" %>
<%@ page import = "store.master.StoreDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 
 
<%
  String product_kind = request.getParameter("product_kind");
%>

<html>
<head>
<title>Store Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_f%>"> 

<%/* <table style='border:0 solid white'> 
<tr>
<td width="150" valign="top">
  <jsp:include page="../module/left.jsp" flush="false" />
</td>
 <td width="700">
</table>*/ %>


<center> 
<%
 List<StoreDataBean> productLists = null;
StoreDataBean productList = null;
 String product_kindName="";
  
 StoreDBBean productProcess = StoreDBBean.getInstance();
 
  productLists = productProcess.getProducts(product_kind);
  
 if(product_kind.equals("100"))
	 product_kindName="과자";
 else if(product_kind.equals("200"))
	 product_kindName="음료";  
 else if(product_kind.equals("300"))
	 product_kindName="문구";
 else if(product_kind.equals("all"))
	 product_kindName="전체";
%>


<p>상품분류</p>
<table style='border:0 solid white' width="450">
<tr>			
 <td><li><a href="../shopping/list.jsp?product_kind=all">전체목록보기</a></li></td>
<td><li>
<a href="../shopping/list.jsp?product_kind=100">과자</a></li></td>
<td><li>
<a href="../shopping/list.jsp?product_kind=200">음료</a></li></td>
<td><li>
<a href="../shopping/list.jsp?product_kind=300">문구</a></li></td>
<td><li>
<a href="../board/list.jsp">게시판</a></li></td>
</tr>					
</table>



<br><br> 
 <h3><b><%=product_kindName%> 분류의 목록</b></h3> 
    <a href="shopMain.jsp">메인으로</a>

<%
 for(int i=0;i<productLists.size();i++){
	 productList = (StoreDataBean)productLists.get(i);
%></center>
  <center><br><table> 
    <tr height="30" bgcolor="<%=value_f%>"> 
      <td rowspan="4"  width="100">
         <a href="productContent.jsp?product_id=<%=productList.getProduct_id()%>&product_kind=<%=product_kind%>">
         <img src="../../imageFile/<%=productList.getProduct_image()%>" border="0" width="60" height="90"></a></td> 
      <td width="350"><font size="+1"><b>
         <a href="productContent.jsp?product_id=<%=productList.getProduct_id()%>&product_kind=<%=product_kind%>">
         <%=productList.getProduct_name() %></a></b></font></td> 
      <td rowspan="4" width="100"  align="center"  valign="middle">
        <%if(productList.getProduct_count()==0){ %>
              <b>일시품절</b>
        <%}else{ %>
              남은수량 : <%=productList.getProduct_count()%>개 
        <%} %>
      </td>
    </tr>        
    <tr height="30" bgcolor="<%=value_f%>"> 
       <td width="350">제조사 : <%=productList.getPublishing_com()%></td> 
    </tr>
    <tr height="30" bgcolor="<%=value_f%>"> 
       <td width="350">제조일 : <%=productList.getPublishing_date()%></td>
    </tr>
        <tr height="30" bgcolor="<%=value_f%>"> 
       <td width="350">중량 : <%=productList.getProduct_weight()%>g</td>
    </tr>
    <tr height="30" bgcolor="<%=value_f%>"> 
       <td colspan="3" width="350">정가 : <%=NumberFormat.getInstance().format(productList.getProduct_price())%>원<br> 
                     판매가 : <b><font color="red">
         <%=NumberFormat.getInstance().format((int)(productList.getProduct_price()*((double)(100-productList.getDiscount_rate())/100)))%>
         </font></b>원</td> 
    </tr> 
  </table></center>
  <br>
<%
 } 
%>
</td>
</tr>

</body>
</html>