<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<body>
<form method = "post" action = "customerDeletePro.jsp?id=<%=id%>&passwd=<%=passwd%>">

 <table>
 <tr>
     <td align="right" >
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
	    <a href="customerList.jsp">목록으로</a>
     </td>
  </tr>
  
 <tr height="30">
    <td align=center">
      <input type="submit" value="삭제" >  
   </td>
 </tr>  
</table> 
</form>
</body>
</html>