<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "store.master.StoreDBBean" %>
<%@ page import = "store.master.StoreDataBean" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 
 
<html>
<head>
<title>Store Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<h3>소개</h3>
<%
StoreDataBean productLists[] = null;
  int number =0;
  String product_kindName="";
  
  StoreDBBean productProcess = StoreDBBean.getInstance();
  for(int i=1; i<=3;i++){
	  productLists = productProcess.getProducts(i+"00",3);
     
     if(productLists[0].getProduct_kind().equals("100")){
    	 product_kindName="과자";
     }else if(productLists[0].getProduct_kind().equals("200")){
    	 product_kindName="음료";  
     }else if(productLists[0].getProduct_kind().equals("300")){
    	 product_kindName="문구";
     }
%>
  <br><font size="+1"><b><%=product_kindName%> 분류의 신간목록: 
  <a href="list.jsp?product_kind=<%=productLists[0].getProduct_kind()%>">더보기</a>
  </b></font>
<%             
  for(int j=0;j<productLists.length;j++){
%>
    <table> 
      <tr height="30" bgcolor="<%=bodyback_d%>"> <br>
        <td rowspan="5"  width="50" height="300">  
          <a href="productContent.jsp?product_id=<%=productLists[j].getProduct_id()%>&product_kind=<%=productLists[0].getProduct_kind()%>">
             <img src="../../imageFile/<%=productLists[j].getProduct_image()%>"  
             border="0" width="60" height="90"></a></td> 
       <td width="350"><font size="+1"><b>
          <a href="productContent.jsp?product_id=<%=productLists[j].getProduct_id()%>&product_kind=<%=productLists[0].getProduct_kind()%>">
              <%=productLists[j].getProduct_name() %></a></b></font></td> 
       <td rowspan="4" width="100">
          <%if(productLists[j].getProduct_count()==0){ %>
              <b>일시품절</b>
          <%}else{ %>
               남은수량 : <%=productLists[j].getProduct_count()%>개
          <%} %>
       </td>
     </tr>      
       
     <tr height="30" bgcolor="<%=bodyback_f%>"> 
       <td width="350">제조사 : <%=productLists[j].getPublishing_com()%></td> 
     </tr>
     
     <tr height="30" bgcolor="<%=bodyback_f%>"> 
       <td width="350">제조일 : <%=productLists[j].getPublishing_date()%></td>
     </tr>
     
          <tr height="30" bgcolor="<%=bodyback_f%>"> 
       <td width="350">중량 : <%=productLists[j].getProduct_weight()%>g</td>
     </tr>
     
     <tr height="30" bgcolor="<%=bodyback_f%>">
       <td colspan="3" width="350">정가 :<%=NumberFormat.getInstance().format(productLists[j].getProduct_price())%>원<br>
                판매가 : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(productLists[j].getProduct_price()*((double)(100-productLists[j].getDiscount_rate())/100)))%>
            </font></b>원</td>   
     </tr> 
     </table>
     <br>
<%
  }
}
%>
</body>
</html>