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
       <a href="usersprofile">Profile</a>
       <a href="allMatchDetalis">Match Details</a>
        <a href="mymatch">My Match</a>
        <a href="wallet">Wallet</a>
        <a href="stadiumList">Stadium List</a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp">Logout</a>
    </div>



   <c:forEach items="${seatListById}" var="seatList">   


<jsp:useBean id="matchDao" class="com.stadiumbooking.daoimpl.MatchDaoImpl"/>


    <div class="matchDetalis" data-aos="fade-up" 
     data-aos-delay="100">
 <c:forEach items="${matchDao.getMatchByMatchId(seatList.matchId)}" var="match">
  
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
         <c:choose>
         <c:when test = "${sessionScope.today > match.matchDate }">

         <h3>Match Ended</h3>
         <hr style="width: 300px;">
</c:when>
<c:otherwise>


<c:choose>
        <c:when test = "${seatList.status=='Booked'}">
     
<a href="cancleTicket?ticketId=${seatList.ticketId}">Cancel Ticket</a>


</c:when>
<c:otherwise>
         <lable>Cancelled</lable>
         </c:otherwise>
         </c:choose>
         
         
          <hr style="width: 300px;">
         
</c:otherwise>
</c:choose>
</div>

</c:forEach>
<br>


    </div>
   
    </c:forEach>
 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>
</body>
</html>