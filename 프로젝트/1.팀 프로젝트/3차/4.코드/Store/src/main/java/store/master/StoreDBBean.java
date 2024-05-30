package store.master;

import java.sql.Connection; //데이터베이스 연결을 나타내는 Connection 클래스를 import
import java.sql.PreparedStatement; //SQL 문을 실행하기 위한 PreparedStatement 클래스를 import
import java.sql.ResultSet; //SQL 쿼리 결과를 저장하고 처리하는 ResultSet 클래스를 import
import java.sql.SQLException; //SQL 관련 예외 처리를 위한 SQLException 클래스를 import
import java.util.ArrayList; //동적 배열을 제공하는 ArrayList 클래스를 import
import java.util.List; //List 인터페이스를 import
import javax.naming.Context; //JNDI API의 Context 인터페이스를 import
import javax.naming.InitialContext; //JNDI API의 InitialContext 클래스를 import
import javax.sql.DataSource; //DataSource 인터페이스를 import

import store.shopping.CustomerDataBean; //store.shopping 패키지의 CustomerDataBean 클래스를 import

public class StoreDBBean {
	
    private static StoreDBBean instance 
                          = new StoreDBBean(); //클래스의 유일한 인스턴스를 생성. instance 변수는 StoreDBBean 클래스의 단 하나의 인스턴스를 참조한다.
    
    public static StoreDBBean getInstance() { //StoreDBBean 클래스의 인스턴스를 반환하는 정적 메서드.
        return instance;					  //외부에서는 이 메서드를 통해 StoreDBBean의 유일한 인스턴스에 접근할 수 있다.
    }  
    
    private StoreDBBean() {} //기본 생성자를 private으로 정의하여 클래스 외부에서 직접 인스턴스를 생성하지 못하도록 설정
    
    private Connection getConnection() throws Exception { //데이터베이스와의 연결을 생성하고 반환
        Context initCtx = new InitialContext(); //JNDI 초기 컨텍스트를 생성
        Context envCtx = (Context) initCtx.lookup("java:comp/env"); //JNDI 네이밍 서비스에서 환경 컨텍스트를 찾는다
        DataSource ds = (DataSource)envCtx.lookup("jdbc/store"); //데이터 소스를 찾는다. 데이터 소스는 데이터베이스 연결 풀을 관리
        return ds.getConnection(); //데이터 소스에서 데이터베이스 연결을 얻고 반환
    } 
    
    
    public int managerCheck(String id, String passwd) //관리자 아이디와 비밀번호를 확인하는 메서드
	throws Exception {
		Connection conn = null; //데이터베이스 연결 초기화
        PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
		ResultSet rs= null; //쿼리 결과를 저장하기 위한 객체 초기화
        String dbpasswd=""; //반환할 비밀번호 결과 값을 초기화
		int x=-1; //데이터베이스에서 가져온 비밀번호를 저장할 변수
        
		try {
            conn = getConnection(); //데이터베이스 연결
            
            pstmt = conn.prepareStatement(
            	"select managerPasswd from manager where managerId = ? "); //관리자 테이블에서 관리자 아이디에 해당하는 비밀번호를 가져오는 명령문을 준비
            pstmt.setString(1, id); //SQL 명령문의 매개변수를 설정
            
            rs= pstmt.executeQuery(); //쿼리를 실행하고 결과를 ResultSet에 저장

			if(rs.next()){ //쿼리 실행 결과값이 있으면
				dbpasswd= rs.getString("managerPasswd"); //데이터베이스에서 관리자 비밀번호를 가져온 후 dbpasswd변수에 저장
				if(dbpasswd.equals(passwd)) //입력된 passwd와 dbpasswd 비교 후 동일하면 
					x= 1; //x는 1
				else //동일하지 않으면
					x= 0; //x는 0
			}else //쿼리 실행 결과값이 없으면
				x= -1; //x는 -1
			
        } catch(Exception ex) {
            ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
        } finally {
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {} //결과 닫음
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {} //연결 닫음
        }
		return x; //최종 결과 값을 반환
	} 
    
    
    public void insertProduct(StoreDataBean product) //상품 정보를 데이터베이스에 삽입하는 메서드
    throws Exception {
        Connection conn = null; //데이터베이스 연결 초기화
        PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
        
        try {
            conn = getConnection(); //데이터베이스 연결
            
            pstmt = conn.prepareStatement(
            	"insert into product values (?,?,?,?,?,?,?,?,?,?,?)"); //제품 정보를 삽입하기 위한 SQL 명령문 준비
            pstmt.setInt(1,product.getProduct_id()); //SQL 명령문의 매개변수 설정
            pstmt.setString(2, product.getProduct_kind()); //SQL 명령문의 매개변수 설정
            pstmt.setString(3, product.getProduct_name()); //SQL 명령문의 매개변수 설정
            pstmt.setInt(4, product.getProduct_price()); //SQL 명령문의 매개변수 설정
            pstmt.setShort(5, product.getProduct_count()); //SQL 명령문의 매개변수 설정
            pstmt.setShort(6, product.getProduct_weight()); //SQL 명령문의 매개변수 설정
            pstmt.setString(7, product.getPublishing_com()); //SQL 명령문의 매개변수 설정
			pstmt.setString(8, product.getPublishing_date()); //SQL 명령문의 매개변수 설정
			pstmt.setString(9, product.getProduct_image()); //SQL 명령문의 매개변수 설정
			pstmt.setByte(10,product.getDiscount_rate()); //SQL 명령문의 매개변수 설정
			pstmt.setTimestamp(11, product.getReg_date()); //SQL 명령문의 매개변수 설정
			
            pstmt.executeUpdate(); //SQL 쿼리를 실행하여 상품 정보를 데이터베이스에 삽입
            
        } catch(Exception ex) {
            ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {} //연결 닫음
        }
    } 
        
	public int getProductCount() //상품의 개수를 가져오는 메서드
    throws Exception {
        Connection conn = null; //데이터베이스 연결 초기화
        PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
        ResultSet rs = null; //쿼리 결과를 저장하기 위한 객체 초기화

        int x=0; //상품 개수를 저장할 변수 초기화

        try {
            conn = getConnection(); //데이터베이스 연결
            
            pstmt = conn.prepareStatement("select count(*) from product"); //상품 테이블의 레코드 수를 가져오는 SQL 명령문 준비
            rs = pstmt.executeQuery(); //SQL 쿼리를 실행하고 결과를 ResultSet에 저장

            if (rs.next()) //쿼기 결과 값이 있으면
               x= rs.getInt(1); //쿼리 결과에서 제품의 개수를 가져와 변수 x에 저장
        } catch(Exception ex) {
            ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {} //결과 닫음
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {} //연결 닫음
        }
		return x; //제품의 개수를 반환
    } 
	
	
	public List<StoreDataBean> getProducts(String product_kind) //상품 종류에 따라 상품 목록을 가져오는 메서드. 메서드는 StoreDataBean 객체의 리스트를 반환한다
    throws Exception {
        Connection conn = null; //데이터베이스 연결 초기화
        PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
        ResultSet rs = null; //쿼리 결과를 저장하기 위한 객체 초기화
        List<StoreDataBean> productList=null; //상품 목록을 저장하는 리스트를 초기화
        
        try {
            conn = getConnection(); //데이터베이스 연결
            
            String sql1 = "select * from product"; //모든 상품을 가져오는 SQL 쿼리 준비
            String sql2 = "select * from product ";
            sql2 += "where product_kind = ? order by reg_date desc"; //특정 종류의 상품을 가져오는 SQL 쿼리 준비
            
            if(product_kind.equals("all")){ //product_kind가 "all"이면 
            	 pstmt = conn.prepareStatement(sql1); //모든 제품을 가져오는 SQL 쿼리 실행(sql1)
            }else{ //"all"이 아니면
                pstmt = conn.prepareStatement(sql2); //product_kind에 해당하는 상품만 가져오는 SQL 쿼리 실행(sql2)
                pstmt.setString(1, product_kind); //SQL 쿼리의 매개변수를 설정
            }
        	rs = pstmt.executeQuery(); //SQL 쿼리를 실행하고 결과를 ResultSet에 저장
            
            if (rs.next()) { //쿼기 결과 값이 있으면             
            	productList = new ArrayList<StoreDataBean>(); //상품 목록을 저장할 ArrayList를 초기화
                do{
                     StoreDataBean product= new StoreDataBean(); //StoreDataBean의 객체 product를 생성
                     
                     product.setProduct_id(rs.getInt("product_id")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_kind(rs.getString("product_kind")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_name(rs.getString("product_name")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_price(rs.getInt("product_price")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_count(rs.getShort("product_count")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_weight(rs.getShort("product_weight")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setPublishing_com(rs.getString("publishing_com")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setPublishing_date(rs.getString("publishing_date")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_image(rs.getString("product_image")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setDiscount_rate(rs.getByte("discount_rate")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setReg_date(rs.getTimestamp("reg_date")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     
                     productList.add(product); //상품 정보를 리스트에 추가
			    }while(rs.next()); //do while 반복문
			}
        } catch(Exception ex) {
            ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {} //결과 닫음
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {} //연결 닫음
        }
		return productList; //상품 목록 반환
    } 
	
	public StoreDataBean[] getProducts(String product_kind,int count) //특정 종류의 상품을 가져오는 메서드
    throws Exception {
        Connection conn = null; //데이터베이스 연결 초기화
        PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
        ResultSet rs = null; //쿼리 결과를 저장하기 위한 객체 초기화
        StoreDataBean productList[]=null; //상품 목록을 저장할 배열 초기화
        int i=0; //상품 배열 인덱스 초기화
        
        try {
            conn = getConnection(); //데이터베이스 연결
            
            String sql = "select * from product where product_kind = ? ";
            sql += "order by reg_date desc limit ?,?"; //상품 종류에 해당하는 제품을 가져오는 SQL 쿼리 준비, 가져올 제품의 개수를 제한한다
            
            pstmt = conn.prepareStatement(sql); //sql쿼리문 실행
            pstmt.setString(1, product_kind); //SQL 쿼리의 매개변수 설정
            pstmt.setInt(2, 0); //SQL 쿼리의 매개변수 설정
            pstmt.setInt(3, count); //SQL 쿼리의 매개변수 설정
        	rs = pstmt.executeQuery(); //SQL 쿼리를 실행하고 결과 값을 ResultSet에 저장

            if (rs.next()) { //쿼리 실행 결과값이 있으면
            	productList = new StoreDataBean[count]; //productList 배열을 생성
                do{
                     StoreDataBean product= new StoreDataBean(); //StoreDataBean의 객체 product를 생성
                     product.setProduct_id(rs.getInt("product_id")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_kind(rs.getString("product_kind")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정 
                     product.setProduct_name(rs.getString("product_name")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_price(rs.getInt("product_price")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_count(rs.getShort("product_count")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_weight(rs.getShort("product_weight")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setPublishing_com(rs.getString("publishing_com")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setPublishing_date(rs.getString("publishing_date")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setProduct_image(rs.getString("product_image")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setDiscount_rate(rs.getByte("discount_rate")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     product.setReg_date(rs.getTimestamp("reg_date")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
                     
                     productList[i]=product; //productList 배열에 StoreDataBean의 product 객체 추가
                     
                     i++; //배열 인덱스 증가
			    }while(rs.next()); //do while 반복문
			}
        } catch(Exception ex) {
            ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {} //결과 닫음
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {} //연결 닫음
        }
		return productList; //productList 배열 반환
    } 
	
	
	public StoreDataBean getProduct(int productId) //특정 상품 ID에 해당하는 제품 정보를 가져오는 메서드
    throws Exception {
        Connection conn = null; //데이터베이스 연결 초기화
        PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
        ResultSet rs = null; //쿼리 결과를 저장하기 위한 객체 초기화
        StoreDataBean product=null; //상품 정보를 담을 객체 초기화
        
        try {
            conn = getConnection(); //데이터베이스 연결
            
            pstmt = conn.prepareStatement(
            	"select * from product where product_id = ?"); //상품 ID에 해당하는 상품 정보를 가져오는 쿼리문 준비
            pstmt.setInt(1, productId); //SQL 쿼리의 매개변수 설정
            
            rs = pstmt.executeQuery(); //SQL 쿼리를 실행하고 결과를 ResultSet에 저장

            if (rs.next()) { //쿼리 실행 결과값이 있으면 
            	product = new StoreDataBean(); //StoreDataBean의 객체 product를 생성
                
            	product.setProduct_kind(rs.getString("product_kind")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
            	product.setProduct_name(rs.getString("product_name")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
            	product.setProduct_price(rs.getInt("product_price")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
            	product.setProduct_count(rs.getShort("product_count")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
            	product.setProduct_weight(rs.getShort("product_weight")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
            	product.setPublishing_com(rs.getString("publishing_com")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
            	product.setPublishing_date(rs.getString("publishing_date")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
            	product.setProduct_image(rs.getString("product_image")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
            	product.setDiscount_rate(rs.getByte("discount_rate")); //ResultSet에서 제품 정보를 읽어와 StoreDataBean 객체에 설정
			}
        } catch(Exception ex) {
            ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {} //결과 닫음
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {} //연결 닫음
        }
		return product; //상품 정보를 담은 StoreDataBean의 객체 product를 반환
    } 
    
   
    public void updateProduct(StoreDataBean product, int productId) //특정 상품의 정보를 업데이트하는 메서드
    throws Exception {
        Connection conn = null; //데이터베이스 연결 초기화
        PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
        String sql; //SQL 쿼리를 저장할 문자열 변수 선언
        
        try {
            conn = getConnection(); //데이터베이스 연결
            
            sql = "update product set product_kind=?,product_name=?,product_price=?";
            sql += ",product_count=?,product_weight=?,publishing_com=?,publishing_date=?";
            sql += ",product_image=?,discount_rate=?";
            sql += " where product_id=?"; //상품 정보를 업데이트하는 SQL 쿼리문 준비
            
            pstmt = conn.prepareStatement(sql); //PreparedStatement를 생성하고 SQL 쿼리를 설정(sql)
            
            pstmt.setString(1, product.getProduct_kind()); //SQL 쿼리의 매개변수에 상품 정보를 설정
            pstmt.setString(2, product.getProduct_name()); //SQL 쿼리의 매개변수에 상품 정보를 설정
            pstmt.setInt(3, product.getProduct_price()); //SQL 쿼리의 매개변수에 상품 정보를 설정
            pstmt.setShort(4, product.getProduct_count()); //SQL 쿼리의 매개변수에 상품 정보를 설정
            pstmt.setShort(5, product.getProduct_weight()); //SQL 쿼리의 매개변수에 상품 정보를 설정
            pstmt.setString(6, product.getPublishing_com()); //SQL 쿼리의 매개변수에 상품 정보를 설정
			pstmt.setString(7, product.getPublishing_date()); //SQL 쿼리의 매개변수에 상품 정보를 설정
			pstmt.setString(8, product.getProduct_image()); //SQL 쿼리의 매개변수에 상품 정보를 설정
			pstmt.setByte(9, product.getDiscount_rate()); //SQL 쿼리의 매개변수에 상품 정보를 설정
			pstmt.setInt(10, productId); //SQL 쿼리의 매개변수에 상품 정보를 설정
            
            pstmt.executeUpdate(); //SQL 쿼리를 실행하여 상품 정보를 업데이트
            
        } catch(Exception ex) {
            ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {} //연결 닫음
        }
    } 
    
   
    public void deleteProduct(int productId) //특정 상품의 정보를 삭제하는 메서드
    throws Exception {
        Connection conn = null; //데이터베이스 연결 초기화
        PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
        ResultSet rs= null; //쿼리 결과를 저장하기 위한 객체 초기화
        
        try {
			conn = getConnection(); //데이터베이스 연결

            pstmt = conn.prepareStatement(
            	"delete from product where product_id=?"); //상품 정보를 삭제하는 SQL 쿼리문 준비
            pstmt.setInt(1, productId); //쿼리의 매개변수에 제품 ID를 설정
            
            pstmt.executeUpdate(); //SQL 쿼리를 실행하여 제품을 삭제
            
        } catch(Exception ex) {
            ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {} //결과 닫음
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {} //연결 닫음
        }
    } 
    
    public List<StoreDataBean> getProducts(int start, int end) //특정 범위의 상품 목록을 가져오는 메서드
            throws Exception {
       Connection conn = null; //데이터베이스 연결 초기화
       PreparedStatement pstmt = null; //SQL 명령문 실행을 위한 객체 초기화
       ResultSet rs = null; //쿼리 결과를 저장하기 위한 객체 초기화
       List<StoreDataBean> productList=null; //상품 목록을 저장하기 위한 List 객체 초기화
       try {
           conn = getConnection(); //데이터베이스 연결
           
           pstmt = conn.prepareStatement(
           	"select * from product order by reg_date"); //상품 목록을 가져오는 SQL 쿼리
           rs = pstmt.executeQuery(); //SQL 쿼리를 실행하고 결과를 ResultSet 객체에 저장

           if (rs.next()) { //쿼리 실행 결과값이 있으면
               productList = new ArrayList<StoreDataBean>(end); //상품 목록을 저장할 ArrayList 초기화
               do{
                 StoreDataBean product= new StoreDataBean(); //새로운 상품 객체 product 생성
                 product.setProduct_id(rs.getInt("product_id")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setProduct_kind(rs.getString("product_kind")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setProduct_name(rs.getString("product_name")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setProduct_price(rs.getInt("product_price")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setProduct_count(rs.getShort("product_count")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setProduct_weight(rs.getShort("product_weight")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setPublishing_com(rs.getString("publishing_com")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setPublishing_date(rs.getString("publishing_date")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setProduct_image(rs.getString("product_image")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setDiscount_rate(rs.getByte("discount_rate")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
                 product.setReg_date(rs.getTimestamp("reg_date")); //ResultSet에서 각 열의 데이터를 가져와서 상품 객체에 설정
				  
                 productList.add(product); //상품 목록에 상품 추가
			    }while(rs.next()); //do while 반복문
			}
       } catch(Exception ex) {
           ex.printStackTrace(); //예외가 발생한 경우 예외 내용을 출력
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {} //결과 닫음
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {} //명령문 닫음
           if (conn != null) try { conn.close(); } catch(SQLException ex) {} //연결 닫음
       }
		return productList; //상품 목록을 반환
   } 
}