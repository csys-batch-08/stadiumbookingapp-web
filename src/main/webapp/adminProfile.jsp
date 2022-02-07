<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
        <script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
 <link rel="stylesheet" href="assets/css/profile.css">
 <link rel="stylesheet" href="assets/css/sideNavBar.css">
<title>Matchbooking.com</title>

</head>
<body>

	<div class="sidenav">
	 <fmt:bundle basename = "com.stadiumbooking.bundle.Sidenavbar" prefix="nav.">
         <a href="adminProfile"><fmt:message  key="Profile"/></a>
        <a href="matchDetails" ><fmt:message  key="MatchDetails"/></a>
        <a href="stadiumDetalis.jsp" ><fmt:message  key="StadiumDetails"/></a>
        <a href="sportsDetalis.jsp"><fmt:message  key="SportsDetails"/></a>
        <a href="Getallusers" ><fmt:message  key="AllUser"/></a>
        <a href="showMatchToAdmin" ><fmt:message  key="AllMatchDetails"/></a>
        <a href="allBookingDetails" ><fmt:message  key="AllBookingDetails"/></a>
        <a href="allUserWalletList" ><fmt:message  key="AllUserWalletList"/></a>
        <a href="stadiumList" ><fmt:message  key="StadiumList"/></a>
        <a href="ratingList" ><fmt:message  key="RatingList"/></a>
        <a href="index.jsp"><fmt:message key="LogOut"/></a>
    </fmt:bundle>
	</div>


<fmt:bundle basename = "com.stadiumbooking.bundle.ButtonsBundle" prefix="btn.">
	<div id="userInfo">
		<label for=""><strong>Name:</strong> &nbsp; ${user.name } </label> <br>
		<label for=""><strong>Username:</strong>&nbsp; ${user.username} </label> <br>
		<label for=""><strong>Mobile:</strong>&nbsp; ${user.phoneNumber}</label> <br>
		<label for=""><strong>Email:</strong> &nbsp; ${user.email} </label> <br>
		
		<button onclick="update()"><fmt:message key="Update"/></button>
		<div >
		<img src="assets/image/${user.profilePic }" alt="can't find">
		<button onclick="profile()" id="edit"> <fmt:message key="Edit"/></button>
		</div>
		
				
<div id="profile">
    <form action="profilePic" id="profilepicForm" style="visibility: hidden;">
        
        <input type="file" id="profilePic" aria-label="Profile Pic" name="profilePic">
       <button type="submit"><fmt:message key="Submit"/></button>
       <input type="hidden" name="role" value="Admin">
    </form>
</div>

	</div>



	<div id="update">
	<strong>Profile Details</strong>
	<br/>
	
		<form action="update" method="post" onsubmit="return validate()">
		    
			<label for="name"><strong>Name:</strong></label> <br>
		    <input type="text" value="${user.name}" aria-label="name" 	name="updateName" id="updateName"> <br>
		    <label id="uname" style="visibility: hidden;">Enter Name</label> <br>

			<label for="username"><strong>Username:</strong></label> <br> 
			<input type="text" value="${user.username}" aria-label="username"	name="updateUsername" id="updateUsername"> <br>			
		    <label id="username" style="visibility: hidden;">Enter Username</label> <br>
			
			
			
			<label for="password" ><strong>Password:</strong></label> <br> 
			<input	type="text" value="${user.password}" aria-label="Password" name="updatePassword" id="updatePassword"> <br>
			<label for="" id="lpass" style="visibility: hidden;">EnterPassword</label> <br>
			
			<label for="email"><strong>Email:</strong></label> <br> 
		    <input	type="email" value="${user.email}" aria-label="email" name="updateEmail" id="updateEmail"> <br>
			<label id="lmail" style="visibility: hidden;">Enter	Email</label> <br> 
			
			<label for="phoneNumber"><strong>Phone Number:</strong></label> <br>
			<input type="number" value="${user.phoneNumber}" aria-label="Phone Number" name="updateNumber" id="updateNumber"> <br>
			<label for="" id="mobile" style="visibility: hidden;">Enter	phone Number</label>
			
			<button type="submit"><fmt:message key="Submit"/></button>
			<input type="hidden" name="role" aria-label="role" value="${user.role}" id="role">
	
		</form>

	</div>
</fmt:bundle>
</body>
</html>
<c:if test="${not empty adminUpdate}">
<script src="assets/js/userDetailsUpdated.js"></script>
</c:if>
<script src="assets/js/profile.js"></script>