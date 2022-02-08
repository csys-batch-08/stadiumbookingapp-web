<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css"  rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
 <link rel="stylesheet" href="assets/css/sideNavBar.css">
 <link rel="stylesheet" href="assets/css/myMatch.css">
<title>Matchbooking.com</title>
<style>
       
</style>
</head>
<body>

 <div class="sidenav">
     
        <a href="usersprofile">Profile </a>
        <a href="allMatchDetalis">Upcoming Matches </a>
        <a href="mymatch">My Bookings</a>
        <a href="wallet">Wallet</a>
        <a href="stadiumList">Stadium List </a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp">Logout</a>
    </div>



   <c:forEach items="${seatListById}" var="seatList">   




    <div class="matchDetalis" data-aos="fade-up"  data-aos-delay="100">
  
       <br>
        <strong>${seatList.match.teamA}</strong>  Vs <strong>${seatList.match.teamB}</strong>
        <br>
           <div data-aos="fade-up"
     data-aos-duration="1000">
        <label>${seatList.match.stadiumName}</label>
        <label>${seatList.match.location}</label>
        <br>
           <fmt:parseDate value="${seatList.match.matchDate}" pattern="yyyy-MM-dd" var="macthDate" type="date"/>
        
        <label><fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}"/> </label>
         <label>${seatList.match.matchTime}</label>
         <br>

      <label>${seatList.seatclass}</label>
<br>
         <label>Number Of Ticktes:${seatList.seatcount}</label>
    <br>
         <label>Price:${seatList.price}</label>
         <br>
         <label>Seat Numbers:${seatList.ticketNumbers}</label>
         <br>
         <c:choose>
         <c:when test = "${sessionScope.today > seatList.match.matchDate }">

         <h3>Match Ended</h3>
         <hr style="width: 300px;">
</c:when>
<c:otherwise>


<c:choose>
        <c:when test = "${seatList.status=='Booked'}">
     
<a  onclick="cancleTickets(${seatList.ticketId})">Cancle Ticket</a>

</c:when>
<c:otherwise>
         <lable>Cancelled</lable>
         </c:otherwise>
         </c:choose>
         
         
          <hr style="width: 300px;">
         
</c:otherwise>
</c:choose>
</div>
<br>


    </div>
   
    </c:forEach>
 <c:if test="${not empty cancel}">
			<script src="assets/js/cancelswetalret.js"></script>

					</c:if>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity=''></script>
	<script src="assets/js/animation.js"></script>
	<script src="assets/js/mymatch.js"></script>
</body>
</html>