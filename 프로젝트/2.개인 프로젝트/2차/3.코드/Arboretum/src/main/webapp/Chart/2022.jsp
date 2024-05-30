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
	String[] month_2022 = null;
	int[] count_2022 = null;
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
		 month_2022 = new String[rs.getInt(1)];
		 count_2022 = new int[rs.getInt(1)];
	 }
	 
	 sql= "select * from tourist where Year = '2022년'";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 int i=0;
	 while(rs.next()){
	   String Year = rs.getString("Year");
       String Month = rs.getString("Month");
       int Count = rs.getInt("Count");
       month_2022[i] = Month;
       count_2022[i] = Count;
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
    var dataset = [
      <% 
        for(int i = 0; i < month_2022.length - 1; i++) {  
          out.println("{\"name\": \"" +month_2022[i]+ "\", \"value\": " +count_2022[i] + " },");  
        }
        out.println("{\"name\": \"" +month_2022[month_2022.length - 1]+ 
        	"\", \"value\": " +count_2022[month_2022.length - 1]+"}"); 
      %>
    ];
    dataset = dataset.filter(function(d) {
	      return d.name !== "null";
	});

    // 그래프 넓이와 높이 설정
    
    <!-- 꺾은선 그래프-->
    var width = 800;
    var height = 400;
    var margin = { top: 30, right: 30, bottom: 60, left: 60 };

    // SVG 영역 설정
    var svg = d3.select("body").append("svg").attr("width", width).attr("height", height);

    // 축 스케일(눈금) 설정
    var xScale = d3.scaleBand()
      .range([margin.left, width - margin.right])
      .padding(0.1)
      .domain(dataset.map(function(d) { return d.name; }));

    var yScale = d3.scaleLinear()
      .domain([0, d3.max(dataset, function(d) { return d.value; })])
      .range([height - margin.bottom, margin.top]);

    // 축 표시
    var xAxis = d3.axisBottom(xScale);
    var yAxis = d3.axisLeft(yScale);

    svg.append("g")
      .attr("transform", "translate(0," + (height - margin.bottom) + ")")
      .call(xAxis)
      .append("text")
      .attr("x", (width - margin.left - margin.right) / 2 + margin.left)
      .attr("y", 35)
      .attr("fill", "black")
      .attr("text-anchor", "middle")
      .attr("font-size", "10pt")
      .attr("font-weight", "bold")
      
    svg.append("g")
      .attr("transform", "translate(" + margin.left + ",0)")
      .call(yAxis)
      .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", -margin.left)
      .attr("x", -(height - margin.top - margin.bottom) / 2 - margin.top)
      .attr("dy", "1em")
      .attr("fill", "black")
      .attr("text-anchor", "middle")
      .attr("font-size", "10pt")
      .attr("font-weight", "bold")
      
    // 라인 생성
    var line = d3.line()
      .x(function(d) { return xScale(d.name) + xScale.bandwidth() / 2; })
      .y(function(d) { return yScale(d.value); });

    svg.append("path")
      .datum(dataset)
      .attr("fill", "none")
      .attr("stroke", "steelblue")
      .attr("stroke-width", 2)
      .attr("d", line);
  </script>
</body>
</html>