<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "store.shopping.CustomerDBBean" %>
    <%@ page import = "java.sql.Timestamp" %>
    <% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id = "member" scope = "page" class = "store.shopping.CustomerDataBean">

</jsp:useBean>
<%

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String address = request.getParameter("address");
String tel = request.getParameter("tel");


member.setPasswd(passwd);
member.setName(name);
member.setAddress(address);
member.setTel(tel);
member.setId(id);



CustomerDBBean process = CustomerDBBean.getInstance();
process.updateMember(member);

response.sendRedirect("customerList.jsp");
%>
