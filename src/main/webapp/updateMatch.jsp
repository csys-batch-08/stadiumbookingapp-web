<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
  <link  rel="stylesheet"    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
<title>Matchbooking.com</title>
<link rel="stylesheet" href="assets/css/sideNavBar.css">
<link rel="stylesheet" href="assets/css/updateMatch.css">
</head>
<body>

<div class="sidenav">
	   <fmt:bundle basename = "com.stadiumbooking.bundle.Sidenavbar" prefix="nav.">
         <a href="adminProfile"><fmt:message  key="Profile"/></a>
        <a href="matchDetails" ><fmt:message  key="MatchDetails"/></a>
        <a href="stadiumDetalis.jsp" ><fmt:message  key="StadiumDetails"/></a>
        <a href="sportsDetalis.jsp"><fmt:message  key="SportsDetails"/></a>
        <a href="Getallusers" ><fmt:message  key="AllUser"/></a>
        <a href="showMatchToAdmin" ><fmt:message  key="AllMatchDetails"/></a>
        <a href="allBookingDetails" ><fmt:message  key="AllBookingDetails"/></a>
        <a href="allUserWalletList" ><fmt:message  key="AllUserWalletList"/></a>
        <a href="stadiumList" ><fmt:message  key="StadiumList"/></a>
        <a href="ratingList" ><fmt:message  key="RatingList"/></a>
        <a href="index.jsp"><fmt:message key="LogOut"/></a>
    </fmt:bundle>
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
        <fmt:bundle basename = "com.stadiumbooking.bundle.ButtonsBundle" prefix="btn.">
        <button type="submit"><fmt:message key="Update"/></button>
        </fmt:bundle>
    </form>
    </div>
    
</body>
</html>