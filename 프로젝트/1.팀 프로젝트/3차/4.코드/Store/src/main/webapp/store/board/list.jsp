<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "store.board.BoardDBBean" %>
<%@ page import = "store.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jspf"%>

<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<BoardDataBean> articleList = null; 
    
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount();
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize);
    }

	number = count-(currentPage-1)*pageSize;
%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<title>게시판</title>
</head>
<body bgcolor="<%=bodyback_f%>">

<!-- 쇼핑몰로 되돌아가는 링크 -->
<center><table style='border:0 solid white'> 
   <tr>
    <td align="right" colspan="2" bgcolor="<%=""%>">
	    <a href = "../shopping/shopMain.jsp"><h3>쇼핑몰</h3></a> 
   </td>
  </tr>
</table></center>


<% if (count == 0) { %>

<table>
<tr>
    <td align="center">
              게시판에 저장된 글이 없습니다.
    </td>
</tr>
</table>

<% } else {%>
<center><table> 
<tr>
    <td align="left" colspan="2" bgcolor="<%=value_d%>">
       <a href="writeForm.jsp">글쓰기</a>
    </td>
  </tr>
    <tr height="30" bgcolor="<%=value_c%>"> 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
<%  
   for (int i = 0 ; i < articleList.size() ; i++) {
       BoardDataBean article = articleList.get(i);
%>
   <tr height="30">
    <td  width="50" > <%=number--%></td>
    <td  width="250" align="left">
<%
	int wid=0; 
	if(article.getRe_level()>0){
	   wid=5*(article.getRe_level());
%>
	  <img src="images/level.png" width="<%=wid%>" height="16">
	  <img src="images/re.png">
<%  }else{%>
	  <img src="images/level.png" width="<%=wid%>" height="16">
<%  }%>
           
      <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
           <%=article.getSubject()%></a> 
<% if(article.getReadcount()>=20){%>
         <img src="images/hot.png" border="0"  height="16"><%}%> </td>
    <td width="100" align="left"> 
       <a href="mailto:<%=article.getEmail()%>">
                     <%=article.getWriter()%></a></td>
    <td width="150"><%= sdf.format(article.getReg_date())%></td>
    <td width="50"><%=article.getReadcount()%></td>
    <td width="100" ><%=article.getIp()%></td>
  </tr>
<%}%>
</table></center>
<%}%>

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
          <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
           <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%      }
        
        if (endPage < pageCount) {  %>
        <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
<p>글목록(전체 글:<%=count%>)</p>
</body>
</html>