<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css"  rel="stylesheet">
<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>
<style>

::-webkit-scrollbar {
  width: 12px;

}


::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 

::-webkit-scrollbar-thumb {
  background: #888; 
    
}


::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
.sidenav {
	height: 100%;
	width: 200px;
	position: fixed;
	top: 0;
	left: 0;
	background-color: steelblue;
}

.sidenav a {
	padding: 6px 6px 6px 32px;
	text-decoration: none;
	font-size: 23px;
	color: white;
	display: block;
}

.sidenav a:hover {
	color: black;
}

.main {
	margin-left: 200px;
}
        .matchDetalis{

             position: relative;
            left: 00px;
            text-align: center;
        }
        #TotalBookingPrice{
        position: fixed;
        top:5px;
        right: 10px;
        }
</style>
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

 

 <c:set var="TotalBookingPrice" value="0" />
   <c:forEach items="${seatList}" var="seatList">   
<c:choose>
<c:when test="${seatList.status.equals('Booked') }">
<c:set var="TotalBookingPrice" value="${seatList.price+TotalBookingPrice}" scope="page"/>
</c:when>
<c:when test="${seatList.status.equals('Cancelled')}">
<c:set var="TotalBookingPrice" value="${seatList.price+(TotalBookingPrice*.90)}" scope="page"/>
</c:when>
</c:choose>  


<jsp:useBean id="matchDao" class="com.stadiumbooking.daoimpl.MatchDaoImpl"/>


    <div class="matchDetalis" data-aos="fade-up" 
     data-aos-delay="100">
  <c:forEach items="${matchDao.getMatchByMatchId(seatList.matchId)}" var="match">
  

<jsp:useBean id="userDao" class="com.stadiumbooking.daoimpl.UserDaoImpl"/>

        <strong>${userDao.getUserNamebyId(seatList.userid)}</strong>
     
        <br>
        <strong>${match.teamA}</strong>  Vs <strong>${match.teamB}</strong>
        <br>
        <div data-aos="fade-up"
     data-aos-duration="1000">
        <label>${match.stadiumName}</label>
        <label>${match.location}</label>
        <br>
           <fmt:parseDate value="${match.matchDate}" pattern="yyyy-MM-dd" var="macthDate" type="date"/>
        
        <label><fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}"/> </label>
         <label>${match.matchTime}</label>
         <br>

      <label>${seatList.seatclass}</label>
<br>
         <label>Number Of Ticktes:${seatList.seatcount}</label>
         <br>
         <label>Price:${seatList.price}</label>

         <br>
         <label>Seats Numbers:${seatList.ticketNumbers}</label>
         <br>
         <label>${seatList.status}</label>
         
<hr style="width: 300px;">
 </div>
 </c:forEach>
    </div>

</c:forEach>
<h2 id="TotalBookingPrice"> Total Sales:- <span style="color: green;">&#8377;<fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${TotalBookingPrice}" /></span> </h2>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity="filehash"></script>
<script>
  AOS.init();
</script>
</body>
</html>