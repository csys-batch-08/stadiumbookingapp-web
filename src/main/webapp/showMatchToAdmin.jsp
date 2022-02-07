<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
<title>Matchbooking.com</title>

 <link rel="stylesheet" href="assets/css/sideNavBar.css">
         <link rel="stylesheet" href="assets/css/allMatch.css">

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
   


    <div id="mathcInfo">
<div id="Allmatch">
   <c:forEach items="${MatchDetails}" var="match">
   <div class="matchCard" data-aos="fade-left">
	 <div class="allMatch animate__animated animate__flipInX animate__slow" id="${match.teamA}${match.teamB}">
    
     <br>
        <img src="assets/image/${match.teamAlogo}" alt="can't find" loading="lazy">  &nbsp;  &nbsp; <label ><strong id="teamA">${match.teamA}</strong> <strong id="Vs">Vs</strong> <strong id="teamB"> ${match.teamB} </strong></label>
    <img src="assets/image/${match.teamBlogo}" alt="can't find" id="teamBlogo"  loading="lazy"> <br> <br>
    <label class="matchDetalis" id="stadiumName" >${match.stadiumName}</label><br>
       <label class="matchDetalis" >${match.location}</label><br>
       
      <fmt:parseDate value="${match.matchDate}" pattern="yyyy-MM-dd" var="macthDate" type="date"/>   
      
      <label class="matchDetalis" > <fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}"/>  </label><br>
       <label class="matchDetalis" >${match.matchTime}</label><br>
        

<br>
<div id="about">
     <c:choose>

	 <c:when test = "${today > match.matchDate }">

          <strong>${match.teamA}&nbsp; Won By 9 Wickets</strong>
          <br><br>
          </c:when>
	
<c:otherwise>   

<fmt:bundle basename = "com.stadiumbooking.bundle.ButtonsBundle" prefix="btn.">

<a href="updateMatchCall?matchId=${match.matchId}"><fmt:message key="UpdateMatch"/></a>

</fmt:bundle>

<br>
<br>     
    </c:otherwise> 

</c:choose>     
     </div>
        
</div>
        </div> 
        <br>
<br>
</c:forEach>
</div>
    </div>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"integrity="filehash"></script>
	<script src="assets/js/animation.js"></script>
</body>
</html>
