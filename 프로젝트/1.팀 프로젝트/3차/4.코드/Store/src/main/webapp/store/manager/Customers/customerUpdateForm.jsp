<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "store.shopping.CustomerDataBean" %>
    <%@ page import = "store.shopping.CustomerDBBean" %>
    <%@ page import = "java.sql.Timestamp" %>
    <%
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    String name = request.getParameter("name");
    String date = request.getParameter("date");
    String address = request.getParameter("address");
    String tel = request.getParameter("tel");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body>
<form method = "post" action = "customerUpdatePro.jsp">
	<table>
   <tr>
    <td align="right" colspan="2" >
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
	    <a href="customerList.jsp">목록으로</a>
   </td>
   </tr>
   </table>
   <table >
   <tr>
   <td align = "center">아이디</td>
   <td><%=id %><input type = "hidden" name = "id" value = "<%=id%>"></td>
   <tr>
   <td align = "center">비밀번호</td>
   <td><input type = "text" name = "passwd" value = "<%=passwd%>"></td>
   </tr>
   <tr>
   <td align = "center">이름</td>
   <td><input type = "text" name = "name" value = "<%=name%>"></td>
   </tr>
   <tr>
   <td align = "center">주소</td>
   <td><input type = "text" name = "address" value = "<%=address%>"></td>
   </tr>
   <tr>
   <td align = "center">전화번호</td>
   <td><input type = "text" name = "tel" value = "<%=tel%>"></td>
   </tr>
   </table>
<input type = "hidden" name = "date" value = "<%=date%>">
<input type = "submit" value = "수정완료">
</form>
</body>
</html>
