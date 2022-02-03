<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
  <link  rel="stylesheet"    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>
<link rel="stylesheet" href="assets/css/sideNavBar.css">
<link rel="stylesheet" href="assets/css/updateMatch.css">
</head>
<body>

<div class="sidenav">
	      <a href="adminProfile">Profile</a>
        <a href="matchDetails">Match Details</a>
        <a href="stadiumDetalis.jsp">Stadium Details</a>
        <a href="sportsDetalis.jsp">Sports Details</a>
        <a href="Getallusers">All User</a>
        <a href="showMatchToAdmin">All Match Details</a>
        <a href="allBookingDetails">Booking Details</a>
        <a href="allUserWalletList">All User Wallet List</a>
        <a href="stadiumList">Stadium List</a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp">Logout</a>
	</div>


 
 	

    <div class="animate__animated animate__zoomIn animate__slow" id="updateMatch">
    <div>
     <div>
     <img src="assets/image/${match.teamAlogo}" alt="cann't find"> &nbsp; &nbsp;<strong id="vs">Vs</strong>  &nbsp;  <img src="assets/image/${match.teamBlogo}" id="teamBlogo" alt="cann't find">
    <br>
    <br>
    <strong id="teamA">${match.teamA}</strong>  
    
     
    <strong id="teamB">${match.teamB}</strong>
    <br>
    </div>
       <br>
    <div class="animate__animated animate__fadeInDown animate__delay-2s" id="matchDetails">
    <strong >${match.stadiumName}</strong>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <strong>${match.location}</strong>
    <br>
    <fmt:parseDate value="${match.matchDate}" pattern="yyyy-MM-dd" var="macthDate" type="date"/>
    <br> <fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}"/> &nbsp; &nbsp; ${match.matchTime}
    <br>
    </div>
    </div>
    <form action="updateMatch" >

<input type="text" name="matchId" value="${match.matchId}" style="visibility:hidden;">
<br>
        <input type="date" min="${sessionScope.today}" name="matchDate" id="matchDate" required>
        <br>
        <input type="time" name="matchTime" id="matchTime" required>
        <br>
        <button type="submit">Update</button>
    </form>
    </div>
    
</body>
</html>