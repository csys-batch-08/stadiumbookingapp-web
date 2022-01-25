<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="60">
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
       <a href="usersprofile.jsp">Profile</a>
       <a href="allMatchDetalis.jsp">Match Detalis</a>
        <a href="mymatch.jsp?ticketId=0">My Match</a>
        <a href="wallet.jsp">Wallet</a>
        <a href="stadiumList.jsp">Stadium List</a>
        <a href="ratingList.jsp">Rating List</a>
        <a href="index.jsp">Logout</a>
    </div>



   <c:forEach items="${sessionScope.seatListById}" var="seatList">   


<jsp:useBean id="matchDao" class="com.stadiumbooking.daoimpl.MatchDaoImpl"/>


    <div class="matchDetalis">
 <c:forEach items="${matchDao.getMatchByMatchId(seatList.match_id)}" var="match">
  
       <br>
        <b>${match.teamA}</b>  Vs <b>${match.teamB}</b>
        <br>
        <label>${match.stadium_name}</label>
        <label>${match.location}</label>
        <br>
           <fmt:parseDate value="${match.match_date}" pattern="yyyy-MM-dd" var="macthDate" type="date"/>
        
        <label><fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}"/> </label>
         <label>${match.match_time}</label>
         <br>

      <label>${seatList.seatclass}</label>
<br>
         <label>Number Of Ticktes:${seatList.seatcount}</label>

         <br>
         <label>Seats Numbers:${seatList.ticket_numbers}</label>
         <br>
         <c:choose>
         <c:when test = "${sessionScope.today > match.match_date }">

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


</c:forEach>
<br>


    </div>
   
    </c:forEach>
 
    
</body>
</html>