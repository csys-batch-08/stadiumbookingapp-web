<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="icon" type="" href="assets/image/stadiumLogo.png">
    <title>Matchbooking.com</title>
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
    <link rel="stylesheet" href="assets/css/allBookingDetails.css">
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
    <div id="tables">
        <table id="table" class="display" cellspacing="0" width="40%">
            <caption>All Booking Details</caption>
            <thead>
                <tr>
                    <th id="name">Name</th>
                    <th id="match">Match</th>
                    <th id="stadium">Stadium</th>
                    <th id="location">Location</th>
                    <th id="date">Date</th>
                    <th id="time">Time</th>
                    <th id="category">Category</th>
                    <th id="NoSeat">No Seat</th>
                    <th id="Amount">Amount</th>
                    <th id="seatNumber">Seat Number</th>
                    <th id="status">Status</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th id="name">Name</th>
                    <th id="match">Match</th>
                    <th id="stadium">Stadium</th>
                    <th id="location">Location</th>
                    <th id="date">Date</th>
                    <th id="time">Time</th>
                    <th id="category">Category</th>
                    <th id="NoSeat">No Seat</th>
                    <th id="Amount">Amount</th>
                    <th id="seatNumber">Seat Number</th>
                    <th id="status">Status</th>
                </tr>
            </tfoot>
            <tbody>
                <c:forEach items="${seatList}" var="seatList">
                    <tr>
                        <td> ${seatList.user.name} </td>
                        <td>${seatList.match.teamA}<strong> Vs </strong>${seatList.match.teamB}</td>
                        <td>${seatList.match.stadiumName}</td>
                        <td>${seatList.match.location}</td>
                        <fmt:parseDate value="${seatList.match.matchDate}" pattern="yyyy-MM-dd" var="macthDate" type="date" />
                        <td>
                            <fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}" />
                        </td>
                        <td>${seatList.match.matchTime}</td>
                        <td>${seatList.seatclass}</td>
                        <td>${seatList.seatcount}</td>
                        <td>${seatList.price}</td>
                        <td>${seatList.ticketNumbers}</td>
                        <td>${seatList.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity=''></script>
    <script src="assets/js/animation.js" integrity=''></script>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js" integrity=''></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" integrity=''></script>

</html>
<script src="assets/js/table.js"></script>