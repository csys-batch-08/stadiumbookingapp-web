<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

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
	 caption{             
        background-color: #eee;
             color: blue;
             font-size:25px;
             text-align:center;
              height: 60px;
            border: 1px solid black;
        
        }
        
        td:hover{
        color:blue;
        
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
    
    <div>
    <table>
     <caption> <strong>User Transaction History</strong> </caption>
    <tr>
 
    <th id="name">Name</th>
    <th id="amount">Amount</th>
    <th id="date">Transaction Date</th>
    </tr>
   <c:forEach items="${walletList}" var="walletlist">
  
	 <
    <tr>
     <jsp:useBean id="userDao" class="com.stadiumbooking.daoimpl.UserDaoImpl"/>
          
     
   
    <td>${userDao.getUserNamebyId(walletlist.userId )}</td>
    <td>${walletlist.amount }</td>
    
<fmt:parseDate value="${ walletlist.transactionDate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />

   
    <td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${ parsedDateTime }" /></td>
   
    </tr>
   </c:forEach>
    </table>
    </div>
   
</body>
</html>