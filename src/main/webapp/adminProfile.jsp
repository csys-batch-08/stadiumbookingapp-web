<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<link rel = "icon" type = "" href = "assets/image/Studium.png">

 <link rel="stylesheet" href="assets/css/profile.css">
<title>Matchbooking.com</title>

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



	<div id="userInfo">
		<label for=""><strong>Name:</strong> &nbsp; ${user.name } </label> <br>
		<label for=""><strong>Username:</strong>&nbsp; ${user.username} </label> <br>
		<label for=""><strong>Mobile:</strong>&nbsp; ${user.phoneNumber}</label> <br>
		<label for=""><strong>Email:</strong> &nbsp; ${user.email} </label> <br>
		
		<button onclick="update()">Update</button>
		<div >
		<img src="assets/image/${user.profilePic }" alt="can't find">
		<button onclick="profile()" id="edit"> Edit </button>
		</div>
		
				
<div id="profile">
    <form action="profilePic" id="profilepicForm" style="visibility: hidden;">
        
        <input type="file" name="profilePic">
       <button type="submit">Submit</button>
       <input type="text" name="role" value="Admin" style="visibility: hidden;">
    </form>
</div>

	</div>



	<div id="update">
	<strong>Profile Details</strong>
	<br/>
	
		<form action="update" method="post" onsubmit="return validate()">
		    
			<label><strong>Name:</strong></label> <br>
		    <input type="text" value="${user.name}" 	name="updateName" id="updateName"> <br>
		    <label id="uname" style="visibility: hidden;">Enter Name</label> <br>

			<label><strong>Username:</strong></label> <br> 
			<input type="text" value="${user.username}"	name="updateUsername" id="updateUsername"> <br>			
		    <label id="username" style="visibility: hidden;">Enter Username</label> <br>
			
			
			
			<label ><strong>Password:</strong></label> <br> 
			<input	type="text" value="${user.password}" name="updatePassword" id="updatePassword"> <br>
			<label for="" id="lpass" style="visibility: hidden;">EnterPassword</label> <br>
			
			<label for=""><strong>Email:</strong></label> <br> 
		    <input	type="email" value="${user.email}" name="updateEmail" id="updateEmail"> <br>
			<label for="" id="lmail" style="visibility: hidden;">Enter	Email</label> <br> 
			
			<label for=""><strong>Phone Number:</strongb></label> <br>
			<input type="number" value="${user.phoneNumber}" name="updateNumber" id="updateNumber"> <br>
			<label for="" id="mobile" style="visibility: hidden;">Enter	phone Number</label>
			
			<button type="submit">Submit</button>
			<input type="text" name="role" value="${user.role}" id="role" style="visibility: hidden;">
	
		</form>

	</div>

</body>
</html>
<script src="assets/js/profile.js"></script>