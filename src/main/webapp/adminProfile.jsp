<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <link rel="icon" type="" href="assets/image/stadiumLogo.png">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js" integrity=''></script>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
    <link rel="stylesheet" href="assets/css/profile.css">
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
    <title>Matchbooking.com</title>
</head>

<body>
    <div class="sidenav">
        <a href="adminProfile"> Profile </a>
        <a href="matchDetails"> Add Match </a>
        <a href="stadiumDetalis.jsp"> Stadium Details </a>
        <a href="sportsDetalis.jsp"> Add Sports </a>
        <a href="Getallusers"> Users List </a>
        <a href="showMatchToAdmin"> All Match Details </a>
        <a href="allBookingDetails"> Booking Details </a>
        <a href="allUserWalletList"> Transaction Historys </a>
        <a href="stadiumList"> Stadium List </a>
        <a href="ratingList"> Rating List </a>
        <a href="index.jsp"> Logout </a>
    </div>
    <div id="userInfo">
        <label for="Name"><strong>Name:</strong> &nbsp; ${user.name } </label> <br>
        <label for="Username"><strong>Username:</strong>&nbsp; ${user.username} </label> <br>
        <label for="Mobile"><strong>Mobile:</strong>&nbsp; ${user.phoneNumber}</label> <br>
        <label for="Email"><strong>Email:</strong> &nbsp; ${user.email} </label> <br>
        <button onclick="update()">Update</button>
        <div>
            <img src="assets/image/${user.profilePic }" alt="can't find">
            <button onclick="profile()" id="edit"> Edit</button>
        </div>
        <div id="profile">
            <form action="profilePic" id="profilepicForm" style="visibility: hidden;">
                <input type="file" id="profilePic" aria-label="Profile Pic" name="profilePic">
                <button type="submit">
                    <fmt:message key="Submit" />
                </button>
                <input type="hidden" name="role" value="Admin">
            </form>
        </div>
    </div>
    <div id="update">
        <strong>Profile Details</strong>
        <br />
        <form action="update" method="post" onsubmit="return validate()">
            <label for="updateName"><strong>Name:</strong></label> <br>
            <input type="text" value="${user.name}" aria-label="name" name="updateName" id="updateName"> <br/>
            <label id="uname" style="visibility: hidden;">Enter Name</label> <br>
            <label for="updateUsername"><strong>Username:</strong></label> <br>
            <input type="text" value="${user.username}" aria-label="username" name="updateUsername" id="updateUsername"> <br/>
            <label id="username" style="visibility: hidden;">Enter Username</label> <br>
            <label for="updatePassword"><strong>Password:</strong></label> <br>
            <input type="text" value="${user.password}" aria-label="Password" name="updatePassword" id="updatePassword"> <br/>
            <label for="" id="lpass" style="visibility: hidden;">EnterPassword</label> <br>
            <label for="updateEmail"><strong>Email:</strong></label> <br>
            <input type="email" value="${user.email}" aria-label="email" name="updateEmail" id="updateEmail"> <br/>
            <label id="lmail" style="visibility: hidden;">Enter Email</label> <br/>
            <label for="updateNumber"><strong>Phone Number:</strong></label> <br/>
            <input type="number" value="${user.phoneNumber}" aria-label="Phone Number" name="updateNumber" id="updateNumber"> <br/>
            <label for="" id="mobile" style="visibility: hidden;">Enter phone Number</label>
            <button type="submit">Submit</button>
            <input type="hidden" name="role" aria-label="role" value="${user.role}" id="role">
        </form>
    </div>
</body>

</html>
<c:if test="${not empty adminUpdate}">
    <script src="assets/js/userDetailsUpdated.js"></script>
</c:if>
<script src="assets/js/profile.js"></script>