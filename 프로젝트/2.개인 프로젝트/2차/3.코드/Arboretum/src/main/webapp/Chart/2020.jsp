<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
	<meta charset="utf-8">
	<title>백두대간 수목원 관람객 이용 현황</title>
	<script src="https://d3js.org/d3.v7.min.js"></script>
</head>
<body>
<%!   
	String[] month_2020 = null;
	int[] count_2020 = null;
%>  
<%
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
		 month_2020 = new String[rs.getInt(1)];
		 count_2020 = new int[rs.getInt(1)];
	 }
	 
	 sql= "select * from tourist where Year = '2020년'";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 int i=0;
	 while(rs.next()){
	   String Year = rs.getString("Year");
       String Month = rs.getString("Month");
       int Count = rs.getInt("Count");
       month_2020[i] = Month;
       count_2020[i] = Count;
	   i++;	
%>
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

  <script>
    <%
    out.println("var dataset = [");
    for(int i=0; i < month_2020.length-1; i++){  
    	out.println("{ \"name\": \""+month_2020[i]+"\", \"value\": "+count_2020[i]+" },");  
    }
    out.println("{ \"name\": \""+month_2020[month_2020.length-1]+
    	"\", \"value\": "+count_2020[month_2020.length-1]+" }"); 
    out.println("]");
    %>
    dataset = dataset.filter(function(d) {
	      return d.name !== "null";
	});
    
    
    <!-- 파이 그래프 -->
    var width = 400;
    var height = 300; 
    var radius = Math.min(width, height) / 2 - 10;  

    // SVG 영역 설정
   var svg = d3.select("body").append("svg").attr("width", width).attr("height", height);

   var g = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

   
	// 컬러 설정
   var color = d3.scaleOrdinal()
     .range(["#DC3912", "#3366CC", "#109618", "#FF9900", "#990099"]);
   
	// pie 차트 dateset에 대한 함수 설정
   var pie = d3.pie()
     .value(function(d) { return d.value; })
     .sort(null);

   // pie 차트 SVG 요소 설정
   var pieGroup = g.selectAll(".pie")
     .data(pie(dataset))
     .enter()
     .append("g")
     .attr("class", "pie");

   arc = d3.arc()
     .outerRadius(radius)
     .innerRadius(0);

   pieGroup.append("path")
     .attr("d", arc)
     .attr("fill", function(d) { return color(d.index) })
     .attr("opacity", 0.75)
     .attr("stroke", "white");

   // pie 차트 텍스트 SVG 요소 설정
   var text = d3.arc()
     .outerRadius(radius - 30)
     .innerRadius(radius - 30);

   pieGroup.append("text")
     .attr("fill", "black")
     .attr("transform", function(d) { return "translate(" + text.centroid(d) + ")"; })
     .attr("dy", "5px")
     .attr("font", "10px")
     .attr("text-anchor", "middle")
     .text(function(d) { return d.data.name; });
  </script>
</body>
</html>