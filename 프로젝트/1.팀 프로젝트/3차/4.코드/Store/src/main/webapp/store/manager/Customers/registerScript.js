function Validation(writeform){
	const id = document.getElementById("id");
	const passwd = document.getElementById("passwd");
	const name = document.getElementById("name");
	const address = document.getElementById("address");
	const tel = document.getElementById("tel");
	
	if(!id.value){
		alert("아이디를 입력하세요");
		writeform.id.focus();
		return false;
	}
	if(!passwd.value){
		alert("비밀번호를 입력하세요");
		writeform.passwd.focus();
		return false;
	}
	if(!name.value){
		alert("이름을 입력하세요");
		writeform.name.focus();
		return false;
	}
	if(!address.value){
		alert("주소를 입력하세요");
		writeform.address.focus();
		return false;
	}
	if(!tel.value){
		alert("전화번호를 입력하세요");
		writeform.address.focus();
		return false;
	}
		writeform.action = "customerRegisterPro.jsp";
	writeform.submit();

}