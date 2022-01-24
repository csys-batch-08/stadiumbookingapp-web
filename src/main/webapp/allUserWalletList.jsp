<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.ResultSet" %>
     <%@page import="com.stadiumbooking.daoimpl.WalletDaoImpl" %>
     <%@page import="com.stadiumbooking.daoimpl.UserDaoImpl" %>
     <% WalletDaoImpl walletDao=new WalletDaoImpl();
     UserDaoImpl userDao=new UserDaoImpl();
     ResultSet rs=walletDao.allUserWalletList();
     %>
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
         table {
             position: absolute;
             left:235px;  
             top:50px;     
            width: 80%;
            border-collapse: collapse;
            
            border-top: none;
        }

        th{
             background-color: blue;
             color: white;
         
            height: 60px;
            border: 1px solid black;
        }

        td {
        height:20px;
            text-align: center;
            border: 1px solid black;
        }
         tr:nth-of-type(odd) { 
	background: #eee; 
	}
        td:hover{
        color:blue;
        
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
    
    <div>
    <table>
    <tr>
 
    <th>Name</th>
    <th>Amount</th>
    <th>Transaction Date</th>
    </tr>
    
    <%while(rs.next()){ %>
    <tr>

    <td><%=userDao.getUserNamebyId(rs.getInt(2)) %></td>
    <td><%=rs.getLong(3) %></td>
    <td><%=rs.getString(4) %></td>
    </tr>
   <%} %> 
    </table>
    </div>
   
</body>
</html>