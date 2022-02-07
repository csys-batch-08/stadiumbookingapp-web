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
<title>Matchbooking.com</title>
<style>
.sidenav {
            height: 100%;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            background-color:steelblue;
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
        
        .matchDetalis  a{
         
   background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: large;
  font-weight: bold;
    position: relative;
  left: 0px;
        }
        .matchDetalis a:hover{
background-color: green;
color: black;
        }
</style>
</head>
<body>

 <div class="sidenav">
      <fmt:bundle basename = "com.stadiumbooking.bundle.Sidenavbar" prefix="nav.">
        <a href="usersprofile"><fmt:message  key="Profile"/></a>
        <a href="allMatchDetalis"><fmt:message  key="UpcomingMatch"/></a>
        <a href="mymatch"><fmt:message  key="MyMatch"/></a>
        <a href="wallet"><fmt:message  key="Wallet"/></a>
        <a href="stadiumList"><fmt:message  key="StadiumList"/></a>
        <a href="ratingList"><fmt:message  key="RatingList"/></a>
        <a href="index.jsp"><fmt:message key="LogOut"/></a>
            </fmt:bundle>
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
     <fmt:bundle basename = "com.stadiumbooking.bundle.ButtonsBundle" prefix="btn.">
<a  onclick="cancleTickets(${seatList.ticketId})"><fmt:message key="Cancle_ticket"/></a>
</fmt:bundle>

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
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity="filehash"></script>
	<script src="assets/js/animation.js"></script>
	<script src="assets/js/mymatch.js"></script>
</body>
</html>