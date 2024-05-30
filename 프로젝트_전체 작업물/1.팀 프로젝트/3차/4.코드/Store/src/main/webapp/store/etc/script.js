function checkForm(writeform){

	if(!writeform.product_kind.value){
	  alert("상품의 분류를 선택하십시오");
	  writeform.product_kind.focus();
	  return false;
	}
	if(!writeform.product_name.value){
	  alert("상품이름을 입력하십시오");
	  writeform.product_name.focus();
	  return false;
	}
	
	if(!writeform.product_price.value){
	  alert("상품의 가격을 입력하십시오");
	  writeform.product_price.focus();
	  return false;
	}
        
	if(!writeform.product_count.value){
	  alert("상품의 수량을 입력하십시오");
	  writeform.product_count.focus();
	  return false;
	}
	
	if(!writeform.product_weight.value){
	  alert("중량을 입력하십시오");
	  writeform.product_weight.focus();
	  return false;
	}
	
	if(!writeform.publishing_com.value){
	  alert("제조사를 입력하십시오");
	  writeform.publishing_com.focus();
	  return false;
	}
	
	
		
	writeform.action = "productRegisterPro.jsp";
    writeform.submit();
	
 } 
 
 function updateCheckForm(writeform){

	if(!writeform.product_kind.value){
	  alert("상품의 분류를 선택하십시오");
	  writeform.product_kind.focus();
	  return false;
	}
	if(!writeform.product_name.value){
	  alert("상품이름을 입력하십시오");
	  writeform.product_name.focus();
	  return false;
	}
	
	if(!writeform.product_price.value){
	  alert("상품의 가격을 입력하십시오");
	  writeform.product_price.focus();
	  return false;
	}
        
	if(!writeform.product_count.value){
	  alert("상품의 수량을 입력하십시오");
	  writeform.product_count.focus();
	  return false;
	}
	
	if(!writeform.product_weight.value){
	  alert("중량을 입력하십시오");
	  writeform.product_weight.focus();
	  return false;
	}
	
	if(!writeform.publishing_com.value){
	  alert("제조사를 입력하십시오");
	  writeform.publishing_com.focus();
	  return false;
	}
	
	
		
	writeform.action = "productUpdatePro.jsp";
    writeform.submit();
	
 } 
 