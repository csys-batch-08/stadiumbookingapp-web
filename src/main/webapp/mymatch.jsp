<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
 <%@page import="java.sql.ResultSet"%>
 <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
 <%@page import="com.stadiumbooking.daoimpl.SeatsDaoImpl" %>
<% 
SeatsDaoImpl seatDao=new SeatsDaoImpl();
MatchDaoImpl matchDao=new MatchDaoImpl(); %>
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



 <%int userId = (int)session.getAttribute("id"); %>
<% 
ResultSet rs=seatDao.getSeatById(userId);
while(rs.next()){
int matchIds=rs.getInt(4);
ResultSet dateRs=matchDao.getDate();
%>

<%ResultSet rs1=matchDao.getMatchByMatchId(matchIds); 
Date date=null;
if(rs1.next()){
	date=rs1.getDate(3);
%>

    <div class="matchDetalis">

        <b><%=rs1.getString(5) %></b>  Vs <b><%=rs1.getString(6) %></b>
        <br>
        <label><%=rs1.getString(2) %></label>
        <label><%=rs1.getString(1) %></label>
        <br>
        <label><%=rs1.getDate(3) %></label>
         <label><%=rs1.getString(4) %></label>
         <br>
<%} %>
      <label><%=rs.getString(5) %></label>
<br>
         <label>Number Of Ticktes:<%=rs.getInt(7)%></label>

         <br>
         <label>Seats Numbers:<%=rs.getString(3) %></label>
         <br>
         <%
   if(dateRs.next()){
         if(dateRs.getDate(1).after(date)){     %>
         <h3>Match Ended</h3>
         <hr style="width: 300px;">
         <% 
    }
    else{
         if(rs.getString(8).equals("Booked")) {%>
<a href="mymatch.jsp?ticketId=<%= rs.getInt(1)%>">Cancel Ticket</a>
<% }
         else{
         
         %>
         <lable>Cancelled</lable>
         <%} %>
          <hr style="width: 300px;">
<br>

    </div>
    <%}} }%>
    
    <% 
 int ticketId=Integer.parseInt(request.getParameter("ticketId"));
    seatDao.cancelledSeats(ticketId);%>  
    
    
</body>
</html>