<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="store.master.StoreDBBean" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("utf-8");%> <!-- 문자 인코딩을 UTF-8로 설정 -->

<%
String realFolder = ""; //파일이 저장될 실제 폴더 경로를 저장하기 위한 변수
String filename =""; //업로드된 파일의 이름을 저장하기 위한 변수
MultipartRequest imageUp = null; //파일 업로드를 위한 MultipartRequest 객체 초기화

String saveFolder = "/imageFile"; //파일이 저장될 폴더의 경로
String encType = "utf-8"; //인코딩 타입 설정
int maxSize = 2*1024*1024; //최대 업로드 파일 크기 설정
ServletContext context = getServletContext(); //ServletContext 객체를 사용
realFolder = context.getRealPath(saveFolder); //실제 폴더 경로 설정

try{
    imageUp = new MultipartRequest( //MultipartRequest 객체 생성
		   request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());  //파일 업로드를 처리하기 위해 MultipartRequest 객체생성
   
   Enumeration<?> files = imageUp.getFileNames(); //파일 이름들을 열거형으로 얻어옴
   
   while(files.hasMoreElements()){ //파일이 존재하는 동안 반복하여 파일명을 얻어옴
      String name = (String)files.nextElement(); //다음 파일명을 얻어옴
   
      filename = imageUp.getFilesystemName(name); //업로드된 파일의 시스템 상의 이름을 얻어옴
   }
}catch(IOException ioe){
 System.out.println(ioe); //예외처리
}catch(Exception ex){
 System.out.println(ex); //예외처리
}
%>

<jsp:useBean id="product" scope="page" 
     class="store.master.StoreDataBean"> <!-- Java Bean 객체를 사용하기 위한 태그 -->
</jsp:useBean>

<%
 int product_id= Integer.parseInt(imageUp.getParameter("product_id")); //product_id 값을 정수로 변환하여 변수 product_id에 저장
 String product_kind = imageUp.getParameter("product_kind"); //이미지 업로드로부터 받은 파라미터들을 저장
 String product_name = imageUp.getParameter("product_name"); //이미지 업로드로부터 받은 파라미터들을 저장
 String product_price = imageUp.getParameter("product_price"); //이미지 업로드로부터 받은 파라미터들을 저장
 String product_count = imageUp.getParameter("product_count"); //이미지 업로드로부터 받은 파라미터들을 저장
 String product_weight = imageUp.getParameter("product_weight"); //이미지 업로드로부터 받은 파라미터들을 저장
 String publishing_com = imageUp.getParameter("publishing_com"); //이미지 업로드로부터 받은 파라미터들을 저장
 String discount_rate = imageUp.getParameter("discount_rate"); //이미지 업로드로부터 받은 파라미터들을 저장

 String year = imageUp.getParameter("publishing_year"); //출판 연도를 받아와서 날짜 형식에 맞게 조합
 String month = 
		 (imageUp.getParameter("publishing_month").length()==1)?
		 "0"+ imageUp.getParameter("publishing_month"): 
			 imageUp.getParameter("publishing_month"); //출판 월을 받아와서 날짜 형식에 맞게 조합
 String day =  (imageUp.getParameter("publishing_day").length()==1)?
		 "0"+ imageUp.getParameter("publishing_day"): 
			 imageUp.getParameter("publishing_day"); //출판 일을 받아와서 날짜 형식에 맞게 조합

 product.setProduct_kind(product_kind); //StoreDataBean 객체에 데이터를 설정
 product.setProduct_name(product_name); //StoreDataBean 객체에 데이터를 설정
 product.setProduct_price(Integer.parseInt(product_price)); //StoreDataBean 객체에 데이터를 설정
 product.setProduct_count(Short.parseShort(product_count)); //StoreDataBean 객체에 데이터를 설정
 product.setProduct_weight(Short.parseShort(product_weight)); //StoreDataBean 객체에 데이터를 설정
 product.setPublishing_com(publishing_com); //StoreDataBean 객체에 데이터를 설정
 product.setPublishing_date(year+"-"+month+"-"+day); //StoreDataBean 객체에 데이터를 설정
 product.setProduct_image(filename); //StoreDataBean 객체에 데이터를 설정
 product.setDiscount_rate(Byte.parseByte(discount_rate)); //StoreDataBean 객체에 데이터를 설정
 product.setReg_date(new Timestamp(System.currentTimeMillis())); //StoreDataBean 객체에 데이터를 설정

StoreDBBean productProcess = StoreDBBean.getInstance(); //StoreDBBean 객체를 생성
productProcess.updateProduct(product, product_id); //상품 수정

response.sendRedirect("productList.jsp?product_kind="+product_kind); //상품 목록 페이지로 이동
%>
