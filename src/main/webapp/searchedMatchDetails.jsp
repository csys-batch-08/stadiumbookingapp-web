<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link    rel="stylesheet"    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
     <link rel="stylesheet" href="assets/css/allMatch.css">

</head>

<body>
	<div class="sidenav">
		 <a href="usersprofile">Profile</a>
         <a href="allMatchDetalis">Match Details</a>
        <a href="mymatch">My Match</a>
        <a href="wallet">Wallet</a>
         <a href="stadiumList">Stadium List</a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp">Logout</a>
	</div>

	<div id="search">
		<form action="searchedMatchDetails">
			<input type="text" name="teamName" placeholder="Search">
			<button type="submit">&#128269;</button>
		</form>
	</div>
 <div class="anime">
 <img src="assets/image/circktballGif.gif" alt="can't find" id="gifImage"  onmouseout="dec()" onmouseover="inc()"  >
 </div>


	<div class="mathcInfo" id="mathcInfo">
	<div id="Allmatch">

  <c:choose>
		<c:when test="${searchMatchList.size() != 0 }">  
		
		<c:forEach items="${searchMatchList}" var="match">

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

	 <c:when test = "${sessionScope.today > match.matchDate }">

          <strong>${match.teamA}&nbsp; Won By 9 Wickets</strong>
          <br><br>
          </c:when>
	
<c:otherwise>  
 
<form action="bookSeats">

<button type="submit">Book Tickets</button>
<input type="text" style="visibility: hidden" name="matchId" value="${match.matchId}">

</form>
<br>
<br>     
    </c:otherwise> 

</c:choose>  
</div>
</div>
      <br>
<br>
	</c:forEach>  
	</c:when>
		<c:otherwise>
			<img style="width: 400px; height: 200px; " alt="can't find" class="animate__animated animate__zoomInDown"  src="assets/image/no-search-found-removebg-preview.png">
</c:otherwise>

	</c:choose>
	
</div>
</div>
	

</body>
</html>
<script src="assets/js/match.js"></script>