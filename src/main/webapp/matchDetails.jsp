<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="" href="assets/image/stadiumLogo.png">
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
    <link rel="stylesheet" href="assets/css/matchDetails.css">
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
    <div id="Form">
        <form action="matchServe" onsubmit="return sports()">
            <label for="stadoumName"><strong>Stadium Name:</strong></label>
            <select name="stdname" id="stadoumName" placeholder="Enter Stadium Name" style="position: relative; left: 20px;">
                <option>--Select--</option>
                <c:forEach items="${stadiumList}" var="stadium">
                    <option value="${stadium.stadiumName}">${stadium.stadiumName}</option>
                </c:forEach>
            </select>
            <br> <br>
            <label for="spname"><strong>Sports Name:</strong></label>
            <select name="spname" id="spname">
                <option value="">--Select--</option>
                <option value="Cricket">Cricket</option>
                <option value="Football">Football</option>
            </select>
            <br> <br>
            <label for="event"><strong>Event:</strong></label>
            <select name="event" id="event">
                <option>--Select--</option>
                <c:forEach items="${sportsList}" var="spotrs">
                    <option value="${spotrs.eventName}">${spotrs.eventName}</option>
                </c:forEach>
            </select>
            <br> <br>
            <label for="location"><strong>Location:</strong></label>
            <select name="location" id="location" style="position: relative; left: 65px; width: 150px;">
                <option value="">--Select Location--</option>
                <option value="Chennai">Chennai</option>
                <option value="Kolkata">Kolkata</option>
                <option value="Bengalur">Bengalur</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Dehli">Dehli</option>
                <option value="Ahmedabad">Ahmedabad</option>
                <option value="Hyderabad">Hyderabad</option>
            </select>
            <br> <br>
            <label for="dateinput"><strong>Date:</strong></label>
            <input type="date" id="dateinput" name="matchDate" min="${sessionScope.today}" placeholder="Select Date" style="position: relative; left: 95px;" required>
            <br> <br>
            <label for="time"><strong>Time:</strong></label>
            <input type="time" name="time" id="time" min="09:00" max="20:00" style="position: relative; left: 95px; width:145px " required>
            <br>
            <br>
            <div>
                <label for="teamA" onmouseover="spname()" onfocus="spname()"><strong>Team A:</strong></label>
                <select name="teamA" id="teamA" class="teamA">
                    <option value="">--Select--</option>
                    <option value="CSK">CSK</option>
                    <option value="MI">MI</option>
                    <option value="RCB">RCB</option>
                    <option value="DC">DC</option>
                    <option value="SRH">SRH</option>
                    <option value="RR">RR</option>
                    <option value="PBKS">PBKS</option>
                    <option value="KKR">KKR</option>
                    <option value="India">India</option>
                    <option value="England">England</option>
                    <option value="Australia">Australia</option>
                    <option value="West Indies">West Indies</option>
                    <option value="New Zealand">New Zealand</option>
                    <option value="Bangladesh">Bangladesh</option>
                    <option value="Pakistan">Pakistan</option>
                    <option value="Sri Lanka">Sri Lanka</option>
                    <option value="Chennaiyin FC">Chennaiyin FC</option>
                    <option value="FC Goa">FC Goa</option>
                    <option value="Kerala Blasters FC">Kerala Blasters FC</option>
                    <option value="Bengalur FC">Bengalur FC</option>
                    <option value="ATK Mohun Bagan FC">ATK Mohun Bagan FC</option>
                    <option value="SC East Bengal">SC East Bengal</option>
                    <option value="Mumbai City FC">Mumbai City FC</option>
                    <option value="Sri Lanka">Odisha FC</option>
                    <option value="Hyderabad FC">Hyderabad FC</option>
                    <option value="ATK">ATK</option>
                </select>
                <br> <br> &nbsp; <strong>VS</strong> &nbsp; <br><br>
                <label for="teamB"><strong>Team B:</strong></label>
                <select name="teamB" class="teamB" id="teamB">
                    <option value="">--Select--</option>
                    <option value="CSK">CSK</option>
                    <option value="MI">MI</option>
                    <option value="RCB">RCB</option>
                    <option value="DC">DC</option>
                    <option value="SRH">SRH</option>
                    <option value="RR">RR</option>
                    <option value="PBKS">PBKS</option>
                    <option value="KKR">KKR</option>
                    <option value="India">India</option>
                    <option value="England">England</option>
                    <option value="Australia">Australia</option>
                    <option value="West Indies">West Indies</option>
                    <option value="New Zealand">New Zealand</option>
                    <option value="Bangladesh">Bangladesh</option>
                    <option value="Pakistan">Pakistan</option>
                    <option value="Sri Lanka">Sri Lanka</option>
                    <option value="Chennaiyin FC">Chennaiyin FC</option>
                    <option value="FC Goa">FC Goa</option>
                    <option value="Kerala Blasters FC">Kerala Blasters FC</option>
                    <option value="Bengalur FC">Bengalur FC</option>
                    <option value="ATK Mohun Bagan FC">ATK Mohun Bagan FC</option>
                    <option value="SC East Bengal">SC East Bengal</option>
                    <option value="Mumbai City FC">Mumbai City FC</option>
                    <option value="Sri Lanka">Odisha FC</option>
                    <option value="Hyderabad FC">Hyderabad FC</option>
                    <option value="ATK">ATK</option>
                </select>
                <br>
                <br>
            </div>
            <label for="teamAlogo"><strong>Team A logo </strong></label>
            <input type="file" name="teamAlogo" id="teamAlogo" style="position: relative; left: 55px; width:145px ">
            <br> <br>
            <label for="teamBlogo"><strong>Team B logo</strong></label>
            <input type="file" name="teamBlogo" id="teamBlogo" style="position: relative; left: 55px; width:145px ">
            <br> <br>
            <label for="seats"><strong>Number Of Seats:</strong></label>
            <select name="totalSeats" id="seats" style="position: relative; left: 15px; width:145px ">
                <option value="200">200</option>
                <option value="300">300</option>
                <option value="400">400</option>
                <option value="500">500</option>
            </select>
            <br> <br>
            <label for="seat"><strong>Available Seats: </strong></label>
            <select name="availseats" id="seat" style="position: relative; left: 30px; width:145px ">
                <option value="">--Select--</option>
                <option value="100">100</option>
                <option value="125">125</option>
                <option value="150">150</option>
                <option value="200">200</option>
            </select>
            <br> <br>
            <label for="fclass"><strong>First Class Rate:</strong></label>
            <select name="firstClass" id="fclass">
                <option value="1000">1000Rs</option>
                <option value="1500">1500Rs</option>
                <option value="2000">2000Rs</option>
                <option value="2500">2500Rs</option>
            </select>
            <br> <br>
            <label for="sclass"><strong>Second Class Rate:</strong></label>
            <select name="secondClass" id="sclass">
                <option value="500">500Rs</option>
                <option value="700">700Rs</option>
                <option value="900">900Rs</option>
                <option value="1000">1000Rs</option>
            </select>
            <br> <br> <br>
            <button type="submit">Submit</button> &nbsp; &nbsp; <button type="reset">Reset</button>
        </form>
    </div>
</body>

</html>
<script src="assets/js/addMatch.js"></script>