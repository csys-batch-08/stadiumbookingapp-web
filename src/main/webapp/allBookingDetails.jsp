<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
 <%@page import="java.sql.ResultSet"%>
 <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
 <%@page import="com.stadiumbooking.daoimpl.SeatsDaoImpl" %>
 <%@page import="com.stadiumbooking.daoimpl.UserDaoImpl"%>
<% 
SeatsDaoImpl seatDao=new SeatsDaoImpl();
MatchDaoImpl matchDao=new MatchDaoImpl();
UserDaoImpl userDao = new UserDaoImpl();
%>
    
    
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

     
<% 
ResultSet rs=seatDao.getSeatsDetalis();
while(rs.next()){
int matchId=rs.getInt(4);
int userId=rs.getInt(2);
%>

<%ResultSet rs1=matchDao.getMatchByMatchId(matchId); 
if(rs1.next()){
%>

    <div class="matchDetalis">
    <%ResultSet rs2 = userDao.getUserById(userId);
    if(rs2.next()){
    %>


        <b><%=rs2.getString(2)%></b>
        
        <%} %>
        <br>
        <b><%=rs1.getString(5) %></b>  Vs <b><%=rs1.getString(6) %></b>
        <br>
        <label><%=rs1.getString(2) %></label>
        <label><%=rs1.getString(1) %></label>
        <br>
        <label><%=rs1.getString(3) %></label>
         <label><%=rs1.getString(4) %></label>
         <br>

      <label><%=rs.getString(5) %></label>
<br>
         <label>Number Of Ticktes:<%=rs.getInt(7)%></label>

         <br>
         <label>Seats Numbers:<%=rs.getString(3) %></label>
         <br>
         <label><%=rs.getString(8) %></label>
<hr style="width: 300px;">
    </div>
    <%}} %>


</body>
</html>