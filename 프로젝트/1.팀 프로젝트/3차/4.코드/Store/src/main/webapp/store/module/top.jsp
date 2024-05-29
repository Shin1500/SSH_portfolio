<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../etc/color.jspf"%> 
<html>
<head>
<h2>저의 잡화점을 방문해주셔서 감사합니다.</h2>


<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
 try{
   if(session.getAttribute("id")==null){%>
   <a href="../shopping/list.jsp?product_kind=all">전체목록보기</a>&nbsp;
   <br>
      
   <form name="inform" method="post" action="loginPro.jsp">
         아이디:  <input type="text" name="id" size="15" maxlength="50">
         비밀번호:  <input type="password" name="passwd" size="15" maxlength="16">
    <input type="submit" name="Submit" value="로그인">
    <input type="button" value="회원가입" onclick = "location.href='../manager/Customers/customerRegisterForm.jsp'">
   </form>
   <font color="red">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.*</font>    
 <%}else{%>
 <table style='border:0 solid white'>
 <tr>
  <td width="250"> 
  <td width="250"><a href="../shopping/list.jsp?product_kind=all">전체목록보기</a>&nbsp; 
    <a href="../shopping/cartList.jsp?product_kind=all">장바구니보기</a>&nbsp;
    <a href="../shopping/buyList.jsp">구매목록보기</a>&nbsp; 
  </td>
  <td width="200"> 
    <b><%=session.getAttribute("id")%></b>님, <br>즐거운 쇼핑시간이 되세요.
       
    <input type="button"  value="로그아웃" 
        onclick="javascript:window.location='../shopping/logout.jsp'">
  </td>
  </table>
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
</body>
</html>