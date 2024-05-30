<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "store.shopping.CustomerDataBean"%>
    <%@ page import = "store.shopping.CustomerDBBean" %>
    <%@ page import = "java.util.List" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
    <%@ page import = "java.sql.Timestamp" %>
    <%@ include file="../../etc/color.jspf"%> 
    
    <%
    	int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    String pageNum = request.getParameter("pageNum");
    
    if(pageNum == null)
    {
    	pageNum = "1";
    }
    
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<CustomerDataBean> customerList = null; 
    
    CustomerDBBean dbPro = CustomerDBBean.getInstance();
    count = dbPro.getCustomerCount();
    
    if (count > 0)
    {
    	customerList = dbPro.getCustomers(startRow, pageSize);
    }
    
    number = count - (currentPage-1)*pageSize;
    %>
    <style>
    .white{color : white;}
    .black{color : black;}
    </style>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body bgcolor="<%=bodyback_f%>">
<table>
  <tr>
    <td align="right" colspan="2" bgcolor="">
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> 
    </td>
  </tr>
</table>

<% if (count == 0) { %>

<table>
<tr>
    <td align="center">
              회원이 없습니다.
    </td>
</tr>
</table>
<%} else {%>
<table border = "1"> 
    <tr height="30"> 
      <th bgcolor="<%=value_f%>" align="center"  width="200" >아이디</th> 
      <th bgcolor="<%=value_f%>" align="center"  width="150" >비밀번호</th> 
      <th bgcolor="<%=value_f%>" align="center"  width="100" >이름</th>
      <th bgcolor="<%=value_f%>" align="center"  width="200" >가입일</th> 
      <th bgcolor="<%=value_f%>" align="center"  width="300" >주소</th> 
      <th bgcolor="<%=value_f%>" align="center"  width="150" >전화번호</th>
      <th bgcolor="<%=value_f%>" align="center" width="50">수정</th>
      <th bgcolor="<%=value_f%>" align="center" width="50">삭제</th>  
    </tr>
    <%  
   for (int i = 0 ; i < customerList.size() ; i++) {
       CustomerDataBean customer = customerList.get(i);
%>
   <tr height="30">
    <td width="200" align = "center"> <%=customer.getId()%></td>
    <td width="150" align = "center"><%=customer.getPasswd() %></td>
    <td width = "100" align = "center"><%=customer.getName() %></td>
    <td width = "200" align = "center"><%=customer.getReg_date() %></td>
    <td width = "300" align = "center"><%=customer.getAddress() %></td>
    <td width = "150" align = "center"><%=customer.getTel() %></td>
    <td width="50">
         <a href="customerUpdateForm.jsp?id=<%=customer.getId()%>&passwd=<%=customer.getPasswd()%>&name=<%=customer.getName()%>&date=<%=customer.getReg_date() %>&address=<%=customer.getAddress()%>&tel=<%=customer.getTel()%>">수정</a></td>
      <td width="50">
         <a href="customerDeleteForm.jsp?id=<%=customer.getId()%>&passwd=<%=customer.getPasswd()%>">삭제</a></td>
            
<%

%>
	 
<%  }%>
           

</table>
<% } %>

<%
    if (count > 0) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage =1;
		
		if(currentPage % 10 != 0)
           startPage = (int)(currentPage/10)*10 + 1;
		else
           startPage = ((int)(currentPage/10)-1)*10 + 1;

		int pageBlock = 10;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) { %>
          <a href="customerList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
           <a href="customerList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%      }
        
        if (endPage < pageCount) {  %>
        <a href="customerList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
    
</body>
</html>