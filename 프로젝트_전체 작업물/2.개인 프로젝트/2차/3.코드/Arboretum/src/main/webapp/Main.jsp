<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>백두대간 수목원 관람객 이용 현황</title>
    <style>
        body {
            background-image: url('image/arboretum_image_3.jpg');
            background-size: cover; /* 배경 이미지가 화면을 가득 채우도록 설정 */
            background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
        }
    </style>
</head>
<body>
    <header> <!-- 화면 상단에 위치하는 로고-->
        <img src="image/arboretum_image.png" alt="Arboretum Image">
    </header>
    <h2>국립 백두대간 수목원 관람객 이용 현황</h2>
    <nav>
        <ul> <!-- 연도를 클릭하면 Table폴더의 연도.jsp 페이지로 이동 -->
            <li><a href="Table/2018.jsp">2018년</a></li> 
            <li><a href="Table/2019.jsp">2019년</a></li>
            <li><a href="Table/2020.jsp">2020년</a></li>
            <li><a href="Table/2021.jsp">2021년</a></li>
            <li><a href="Table/2022.jsp">2022년</a></li>
        </ul>
    </nav>
</body>
</html>


