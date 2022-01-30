
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        
        table {
             position: absolute;
             left:235px;  
             top:50px;     
            width: 80%;
            border-collapse: collapse;
            
            border-top: none;
        }

      tr:nth-of-type(odd) { 
	   background: #eee; 
	      }
        th{
             background-color: blue;
             color: white;
            height: 60px;
            border: 1px solid black;
        }
        caption{             
        background-color: #eee;
             color: blue;
             font-size:25px;
             text-align:center;
              height: 60px;
            border: 1px solid black;
        
        }
        
       
        

        td {
        height:20px;
            text-align: center;
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
   
    <table data-aos="zoom-out-down"  id="tabel">
     <caption><strong id="title">All User List</strong></caption>
      <tr>  
     
     <th id="name">Name</th>
     <th id="username">Username</th>
     <th id="role">Role</th> 
     <th id="password">Password</th>
     <th id="email">Email</th>
     <th id="phone">Phone Number</th> 
     <th id="delete"></th> 
     </tr>  

<c:forEach items="${UserLists}" var="users">

	<tr >
	 
	<td  data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="400">${users.name}</td>
     
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="550">${users.username}</td> 
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="600">${users.role}</td> 
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="750"> ${users.password}</td> 
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="800"> ${users.email}</td>
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="950">${users.phoneNumber}</td>
	<c:choose>
	<c:when test="${users.wallet==0 and users.role.equals('User')}">
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="1050"><a href="deleteUser?userId=${users.userid}">Delete</a></td>
	
	</c:when>
<c:when test="${users.role.equals('Admin') }">
		<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="1050">-----</td>
	</c:when>
	 <c:otherwise>
	 <td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="1050">Regular User</td>
	 </c:otherwise>
	</c:choose>
	
	</tr>  

</c:forEach>



</table>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js" ></script>
<script>
  AOS.init();
</script>

</body>
</html>