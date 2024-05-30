<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*"%>
<%@ page import="store.shopping.CustomerDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

 <jsp:useBean id="member" class="store.shopping.CustomerDataBean">
     <jsp:setProperty name="member" property="*"/>
 </jsp:useBean>
 
<%
  member.setReg_date(new Timestamp(System.currentTimeMillis()) );
  CustomerDBBean logon = CustomerDBBean.getInstance();
  logon.insertMember(member); 
  %>
  <script>
  alert("회원가입을 축하합니다.");
  window.location.href="../../shopping/shopMain.jsp";
  </script>
  
