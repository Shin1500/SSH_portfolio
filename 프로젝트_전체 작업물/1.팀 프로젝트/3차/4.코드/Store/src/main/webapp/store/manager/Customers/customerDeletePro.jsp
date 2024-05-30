<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "store.shopping.CustomerDBBean" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

CustomerDBBean customerProcess = CustomerDBBean.getInstance();
customerProcess.deleteMember(id, passwd);

response.sendRedirect("customerList.jsp");

%>