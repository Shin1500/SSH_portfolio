<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href=customerRegisterStyle.css rel="stylesheet" type="text/css">
<script type = "text/javascript" src = "registerScript.js"></script>
</head>
<body>
<form method="post" action="customerRegisterPro.jsp">
<div class="form-structor">
  <div class="signup">
    <h2 class="form-title" id="signup"><span>or</span>Sign up</h2>
    <div class="form-holder">
    
      <input type="text" class="input" placeholder="id" name = "id"/>
      <input type="password" class="input" placeholder="passwd" name="passwd"/>
      <input type="text" class="input" placeholder="name" name="name"/>
      <input type="text" class="input" placeholder="address" name="address"/>
      <input type="text" class="input" placeholder="tel" name="tel"/>
      <input type = "hidden" name = "reg_date">
    </div>
    <input type="button" value = "Sign up" class="submit-btn" onclick="Validation(this.form)">
    </form>
  </div><!-- 
  <div class="login slide-up">
    <div class="center">
      <h2 class="form-title" id="login"><span>or</span>Log in</h2>
      <div class="form-holder">
        <input type="email" class="input" placeholder="Email" />
        <input type="password" class="input" placeholder="Password" />
      </div>
      <button class="submit-btn">Log in</button>
    </div>
  </div>
   -->
</div>

</body>
</html>