<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="" href="assets/image/stadiumLogo.png">
    <title>Matchbooking.com</title>
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
    <link rel="stylesheet" href="assets/css/stylesheet.css">
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
    <br>
    <div id="stadium">
        <form action="stadium" onsubmit="return insert()">
            <label for="stadiumName"><strong>Stadium Name:</strong></label>
            <input type="text" name="stadiumName" id="stadiumName">
            <br>
            <label style="visibility: hidden;" id="stadiumError">Enter Stadium Name</label>
            <br>
            <label for="stadiumImge"><strong>Stadium Image :</strong></label>
            <input type="file" name="stadiumImge" id="stadiumImge">
            <br>
            <label style="visibility: hidden;" id="image">Enter Image Url</label>
            <br>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>

</html>
<script src="assets/js/addStadiumDetails.js"></script>