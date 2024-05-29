<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지의 언어를 지정하고 콘텐츠 유형 및 문자 인코딩 설정 -->

<html>
<head>
<title>로그인</title>
</head>
<body>
  <h2>로그인폼</h2>
    
    <form method="post" action="managerLoginPro.jsp"> <!-- 로그인 정보를 전달할 폼 생성, 전송 방식은 POST, 데이터를 보낼 URL은 "managerLoginPro.jsp"로 설정. -->
        아이디: <input type="text" name="id" maxlength="50" 
               style="ime-mode:inactive;"><br> <!-- 사용자가 아이디를 입력할 수 있는 텍스트 입력 필드 생성. 입력된 텍스트는 "id"라는 이름으로 서버에 전송, 최대 입력 길이는 50자. -->
        비밀번호: <input type="password" name="passwd" maxlength="16"
               style="ime-mode:inactive;"><br> <!-- 사용자가 비밀번호를 입력할 수 있는 패스워드 입력 필드 생성. 입력된 텍스트는 "passwd"라는 이름으로 서버에 전송, 최대 입력 길이는 16자. -->
        <input type="submit" value="로그인"> <!-- 로그인 버튼을 생성, 사용자가 입력한 아이디와 비밀번호를 서버에 전송. -->
    </form>
</body>
</html>


