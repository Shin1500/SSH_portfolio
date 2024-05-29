<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
	<meta charset="utf-8">
	<title>백두대간 수목원 관람객 이용 현황</title>
	<style>
		th { background-color: aqua;}
		td { text-align:center; }
		#chart-container {
            display: inline-block;
            vertical-align: top;
        }
        #chart-toggle {
            cursor: pointer;
            color: blue;
            text-decoration: underline;
        }
        #home-btn {
            display: block;
            margin-top: 10px;
            text-align: center;
        }
	</style>
	<script src="https://d3js.org/d3.v7.min.js"></script>
</head>
<body>
<%
  int total_2019 = 0;
  try {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String jdbcUrl = "jdbc:mysql://localhost:3306/Arboretum";
    String dbId = "root";
    String dbPass = "1234";

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

    String sql = "SELECT SUM(Count) AS total_count FROM tourist WHERE Year = '2019년'";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
      total_2019 = rs.getInt("total_count");
    }
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
  <h2>2019년 총 관람객 수: <%= total_2019 %>명</h2>
  
  <table border="1" style="display: inline-block; vertical-align: top;">
  <tr> <!-- 데이터를 보는 테이블 생성 -->
  	<th width="100">연도</th>
  	<th width="100">월</th>
  	<th width="250">관람객 수</th>
  </tr>
<%! //배열 생성
	String[] month_2019 = null;
	int[] count_2019 = null;
%>  
<% //DB연결
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	 String jdbcUrl="jdbc:mysql://localhost:3306/Arboretum";
     String dbId="root";
     String dbPass="1234";
	 
	 Class.forName("com.mysql.jdbc.Driver");
	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
		
	 String sql= "select count(*) from tourist";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 if(rs.next()){
		 month_2019 = new String[rs.getInt(1)];
		 count_2019 = new int[rs.getInt(1)];
	 }
	 
	 sql= "select * from tourist where Year = '2019년'";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 int i=0;
	 while(rs.next()){
	   String Year = rs.getString("Year");
       String Month = rs.getString("Month");
       int Count = rs.getInt("Count");
       month_2019[i] = Month;
       count_2019[i] = Count;
	   i++;	
%>
       <tr>
  	     <td width="100"><%=Year%></td>
  	     <td width="100"><%=Month%></td>
  	     <td width="250"><%=Count%></td>
       </tr>
<%  } 
  }catch(Exception e){ 
	 e.printStackTrace();
  }finally{
	 if(rs != null) 
	    try{rs.close();}catch(SQLException sqle){}
	 if(pstmt != null) 
		try{pstmt.close();}catch(SQLException sqle){}
	 if(conn != null) 
		try{conn.close();}catch(SQLException sqle){}
  }
%>
<!-- 차트 보기 토글 버튼 -->
    <div id="chart-toggle">차트 보기</div>
</table>
<!-- 차트 컨테이너 -->
<div id="chart-container" style="display: none; vertical-align: top;">
    <!-- 차트를 포함한 2019.jsp 파일을 불러와서 표시 -->
    <iframe src="../Chart/2019.jsp" width="900" height="500" frameborder="0"></iframe>
</div>
<!-- 홈으로 버튼 -->
<div id="home-btn">
    <a href="../Main.jsp">홈으로</a>
</div>
<!-- 차트 보기 토글 버튼에 대한 JavaScript 코드 -->
<script>
    var chartContainer = document.getElementById("chart-container");
    var chartToggle = document.getElementById("chart-toggle");
    // 차트 보기 토글 버튼을 클릭하면 차트를 숨기거나 표시
    chartToggle.addEventListener("click", function() {
        if (chartContainer.style.display === "none") {
            chartContainer.style.display = "inline-block";
            chartToggle.innerText = "차트 숨기기";
        } else {
            chartContainer.style.display = "none";
            chartToggle.innerText = "차트 보기";
        }
    });
</script>
</body>
</html>