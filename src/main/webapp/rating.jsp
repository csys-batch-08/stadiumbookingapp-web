
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
    <title>Matchbooking.com</title>
   <link rel="stylesheet" href="assets/css/rating.css">
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
<br>
<h2>Give A Ratings To</h2>
    <div id="ratingBody">
    <div id="rating">

        <div class="rate">
            <input type="radio"  id="star5" name="rate" value="5" onclick="rate5()" />
            <label for="star5" title="text">5 stars</label>
            <input type="radio" id="star4" name="rate" value="4"onclick="rate4()" />
            <label for="star4" title="text">4 stars</label>
            <input type="radio" id="star3" name="rate" value="3" onclick="rate3()"/>
            <label for="star3" title="text">3 stars</label>
            <input type="radio" id="star2" name="rate" value="2" onclick="rate2()" />
            <label for="star2" title="text">2 stars</label>
            <input type="radio" id="star1" name="rate" value="1" onclick="rate1()" />
            <label for="star1" title="text">1 star</label>
          </div>
    </div>
    <br>
    <br>
    <div>
        <br>
        <form action="ratings" onsubmit="return ratings()">
          <input type="hidden" name="ratingNumber" id="ratingNumber" aria-label="ratingNumber">
            <input type="hidden" id="stadiumId" value="${stadiumID}" name="stadiumId" aria-label="stadiumId" >
         <br>
          <label>Write a review</label>
          <br> <br>
          <textarea name="review" id="review" rows="3" cols="30" ></textarea>
          <button type="submit">Submit</button>
        </form>
        </div>

        </div>
</body>
</html>
<script src="assets/js/rating.js"></script>