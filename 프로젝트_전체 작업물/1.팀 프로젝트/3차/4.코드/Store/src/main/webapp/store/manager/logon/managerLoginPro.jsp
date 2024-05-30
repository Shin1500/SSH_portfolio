<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지의 언어를 지정하고 콘텐츠 유형 및 문자 인코딩 설정 -->
<%@ page import="store.master.StoreDBBean"%> <!-- StoreDBBean 클래스를 현재 JSP 페이지에 import -->

<% request.setCharacterEncoding("utf-8");%> <!-- HTTP 요청의 문자 인코딩을 UTF-8로 설정 -->

<%
    String id = request.getParameter("id"); //id 파라미터 값을 가져옴.
	String passwd  = request.getParameter("passwd"); //passwd 파라미터 값을 가져옴
	
	StoreDBBean manager = StoreDBBean.getInstance(); //StoreDBBean 객체 manager 생성
    int check = manager.managerCheck(id,passwd); //입력된 아이디와 비밀번호를 검사

	if(check == 1){ //아이디와 비밀번호가 일치한다면(check가 1이면)
		session.setAttribute("managerId",id); //세션에 managerId 속성을 설정, 그 값으로 입력된 아이디를 저장.
		response.sendRedirect("../managerMain.jsp"); //메인 페이지로 이동
	}else if(check == 0){%> <!-- 비밀번호가 일치하지 않는(check가 0이면) -->
    <script> 
	  alert("비밀번호가 맞지 않습니다."); //비밀번호가 맞지 않습니다 문구 출력
      history.go(-1); //이전 페이지로 이동
	</script>
<% }else{ %> <!-- 아이디가 일치하지 않는 경우 -->
	<script>
	  alert("아이디가 맞지 않습니다.."); //아이디가 맞지 않습니다.. 문구 출력
	  history.go(-1); //이전 페이지로 이동
	</script>
<% }%> 
