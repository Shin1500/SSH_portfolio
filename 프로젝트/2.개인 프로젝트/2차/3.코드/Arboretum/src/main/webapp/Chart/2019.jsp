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
	String[] month_2019 = null;
	int[] count_2019 = null;
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
    for(int i=0; i < month_2019.length-1; i++){  
    	out.println("{ \"name\": \""+month_2019[i]+"\", \"value\": "+count_2019[i]+" },");  
    }
    out.println("{ \"name\": \""+month_2019[month_2019.length-1]+
    	"\", \"value\": "+count_2019[month_2019.length-1]+" }"); 
    out.println("]");
    %>
    dataset = dataset.filter(function(d) {
	      return d.name !== "null";
	});
    
    
    <!-- 세로막대 그래프-->
    var width = 850;
    var height = 350; 
    var padding = 40; 

    // SVG 영역 설정
    var svg = d3.select("body").append("svg").attr("width", width).attr("height", height);

    // 축 스케일(눈금) 설정
    var xScale = d3.scaleBand()
      .rangeRound([padding, width - padding])
      .padding(0.1)
      .domain(dataset.map(function (d) { return d.name; }));

    var yScale = d3.scaleLinear()
      .domain([0, d3.max(dataset, function (d) { return d.value; })])
      .range([height - padding, padding]);

    // 축 표시
    svg.append("g")
      .attr("transform", "translate(" + 0 + "," + (height - padding) + ")")
      .call(d3.axisBottom(xScale));

    svg.append("g")
      .attr("transform", "translate(" + padding + "," + 0 + ")")
      .call(d3.axisLeft(yScale));

    // 막대 표시
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