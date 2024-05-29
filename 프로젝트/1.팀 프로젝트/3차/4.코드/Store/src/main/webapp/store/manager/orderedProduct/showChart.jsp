<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<html>
<head>
	<meta charset="utf-8">
	<title>판매 통계</title>
	<style>
	
		th { background-color: aqua;}
		td { text-align:center; }
	</style>
	<script src="https://d3js.org/d3.v7.min.js"></script>
</head>
<body>
<table>
<tr><td>
     <a href='../managerMain.jsp'>관리자메인으로</a></td></tr>
</table>
  <h2>판매 통계</h2>
  <table border="1">
  <tr>
  	<th width="100">아이디</th>
  	<th width="100">분류</th>
  	<th width="250">상품명</th>
  	<th width="100">수량</th>
  </tr>
<%!   
	String[] btitle = null;
	int[] bcount = null;
%>  
<%
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	 String jdbcUrl="jdbc:mysql://localhost:3306/store";
     String dbId="root";
     String dbPass="1234";
	 
	 Class.forName("com.mysql.jdbc.Driver");
	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
		
	 String sql= "select count(*) from product";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 if(rs.next()){
		 btitle = new String[rs.getInt(1)];
		 bcount = new int[rs.getInt(1)];
	 }
	 
	 sql= "select * from product";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 int i=0;
	 while(rs.next()){
	   int product_id = rs.getInt("product_id");
       String product_kind = rs.getString("product_kind");
       String product_name = rs.getString("product_name");
       btitle[i] = product_name; // 그래프 출력용 데이터 저장(책이름)
       int product_count = rs.getInt("product_count");
       bcount[i] = product_count; // 그래프 출력용 데이터 저장(수량)
       //Timestamp register =rs.getTimestamp("reg_date");
	   i++;	
%>
       <tr>
  	     <td width="100"><%=product_id%></td>
  	     <td width="100"><%=product_kind%></td>
  	     <td width="250"><%=product_name%></td>
  	     <td width="100"><%=product_count%></td>
  	     
  	     <%--
  	     <td width="250"><%=register.toString()%></td>
  	     --%>
  	     
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
  </table>
  <hr>
  <h2> 판매 그래프</h2>
  <script>
    <%
    out.println("var dataset = [");
    for(int i=0; i < btitle.length-1; i++){
    	out.println("{ \"name\": \""+btitle[i]+"\", \"value\": "+bcount[i]+" },");
    }
    out.println("{ \"name\": \""+btitle[btitle.length-1]+"\", \"value\": "+bcount[btitle.length-1]+" }");
    out.println("]");
    %>
    var width = 800; // 그래프 넓이
    var height = 300; // 그래프 높이
    var padding = 30; // 스케일 표시용 여백

    // 2. SVG 영역 설정
    var svg = d3.select("body").append("svg").attr("width", width).attr("height", height);

    //  3. 축 스케일(눈금) 설정
    var xScale = d3.scaleBand()
      .rangeRound([padding, width - padding])
      .padding(0.1)
      .domain(dataset.map(function (d) { return d.name; }));

    var yScale = d3.scaleLinear()
      .domain([0, d3.max(dataset, function (d) { return d.value; })])
      .range([height - padding, padding]);

    // 4. 축 표시
    svg.append("g")
      .attr("transform", "translate(" + 0 + "," + (height - padding) + ")")
      .call(d3.axisBottom(xScale));

    svg.append("g")
      .attr("transform", "translate(" + padding + "," + 0 + ")")
      .call(d3.axisLeft(yScale));

    // 5. 막대 표시
    svg.append("g")
      .selectAll("rect")
      .data(dataset)
      .enter()
      .append("rect")
      .attr("x", function (d) { return xScale(d.name); })
      .attr("y", function (d) { return yScale(d.value); })
      .attr("width", xScale.bandwidth())
      .attr("height", function (d) { return height - padding - yScale(d.value); })
      .attr("fill", "steelblue");
  </script>
</body>
</html>