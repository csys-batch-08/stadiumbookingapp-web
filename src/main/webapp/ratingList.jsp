<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css"  rel="stylesheet">
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
<title>Matchbooking.com</title>
 <link rel="stylesheet" href="assets/css/ratingList.css">
</head>
<body>
<div id="nav">

        <ul>
         
            <strong id="logo"> MatchBooking</strong>
            
      <li><a href="index.jsp">Logout</a></li>
            <li>&nbsp; &nbsp;</li>
            <li>
            <c:choose>
             <c:when test="${sessionScope.role.equals('Admin')}">
             
            <a href="adminHome.jsp">Home</a>
            </c:when>
            <c:when test="${sessionScope.role.equals('User')}">
            
            <a href="userHome.jsp">Home</a>
        
            </c:when>
            </c:choose>
            </li>
            
           
          
          
        </ul>
    </div>


<br><br>
<br><br>


     <c:forEach items="${stadiumList}" var="stadiumList">
     
   <div class="rating">
   <img src="assets/image/${stadiumList.stadiumImg}" alt="${stadiumList.stadiumImg}" >
      
       <br>
       <strong>${stadiumList.stadiumName}</strong> 
       <br>
       
      
         <c:forEach items="${stadiumList.ratings}" var="ratingList">
      <jsp:useBean id="userDao" class="com.stadiumbooking.daoimpl.UserDaoImpl"/>
          
     
       <div class="reviewContainer">
           <img src="assets/image/${ratingList.user.profilePic}" alt="${ratingList.user.profilePic}" class="userProfile" data-aos="fade-up">
       <strong class="reviwerName" data-aos="fade-up">${ratingList.user.name}  
       &nbsp;
       <c:choose>
       <c:when test="${ratingList.ratingValue==5.0}">
      
       <label>&#11088;&#11088;&#11088;&#11088;&#11088;</label></strong>
      
       </c:when>
       <c:when test="${ratingList.ratingValue==4.0}">
       <label>&#11088;&#11088;&#11088;&#11088;</label></strong>
       </c:when>
        <c:when test="${ratingList.ratingValue==3.0}">
        <label>&#11088;&#11088;&#11088;</label></strong> 
       </c:when>
       
        <c:when test="${ratingList.ratingValue==2.0}">
       <label>&#11088;&#11088;</label></strong>
       </c:when>
        <c:when test="${ratingList.ratingValue==1.0}">
         <label>&#11088;</label></strong>
       </c:when>
       </c:choose>
     
       
        &nbsp; 
      
      <br> <br>
       <label id="review" data-aos="zoom-out">${ratingList.reviews}</label>
       <br>
       
       
       </div>
       </c:forEach>
      
       
       <br>
    </div>

    <br>
        
    <br>
    </c:forEach>
     <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity="filehash"></script>
<script src="assets/js/animation.js"></script>
     
</body>
</html>