<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지의 언어를 지정하고 콘텐츠 유형 및 문자 인코딩 설정 -->

<% session.invalidate(); %> <!-- 현재 세션을 무효화. 현재 사용자의 세션을 종료하고 모든 세션 속성을 제거 -->

<script>
    alert("로그아웃 되었습니다."); //로그아웃 되었습니다. 문구 출력
	location.href="../managerMain.jsp"; //메인 페이지로 이동
</script>