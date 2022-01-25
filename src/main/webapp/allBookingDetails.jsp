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
</style>
</head>
<body>
	<div class="sidenav">
	   <a href="adminProfile.jsp">Profile</a>
        <a href="matchDetails.jsp">Match Details</a>
        <a href="stadiumDetalis.jsp">Stadium Details</a>
        <a href="sportsDetalis.jsp">Sports Details</a>
       <a href="Getallusers.jsp?deleteId=0">All User</a>
        <a href="showMatchToAdmin.jsp">All Match Details</a>
        <a href="allBookingDetails.jsp">Booking Details</a>
        <a href="allUserWalletList.jsp">All User Wallet List</a>
        <a href="stadiumList.jsp">Stadium List</a>
        <a href="ratingList.jsp">Rating List</a>
        <a href="index.jsp">Logout</a>
	</div>

 
   <c:forEach items="${sessionScope.seatList}" var="seatList">   


<jsp:useBean id="matchDao" class="com.stadiumbooking.daoimpl.MatchDaoImpl"/>


    <div class="matchDetalis">
  <c:forEach items="${matchDao.getMatchByMatchId(seatList.match_id)}" var="match">
  

<jsp:useBean id="userDao" class="com.stadiumbooking.daoimpl.UserDaoImpl"/>

        <b>${userDao.getUserNamebyId(seatList.userid)}</b>
     
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
         <label>${seatList.status}</label>
<hr style="width: 300px;">
 </c:forEach>
    </div>

</c:forEach>

</body>
</html>