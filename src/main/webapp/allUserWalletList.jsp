<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="icon" type="" href="assets/image/stadiumLogo.png">
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
    <link rel="stylesheet" href="assets/css/table.css">
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
    <div id="tables">
        <table id="table" cellspacing="0" width="100%">
            <caption>
                <strong>User Transaction History</strong>
            </caption>
            <thead>
                <tr>
                    <th id="serialNumber">S/N</th>
                    <th id="name">Name</th>
                    <th id="amount">Amount</th>
                    <th id="date">Transaction Date</th>
                </tr>
                <c:set var="count" value="0" />
            <tbody>
                <c:forEach items="${walletList}" var="walletlist">
                    <c:set var="count" value="${count + 1}" scope="page" />
                    <tr>
                        <td>${count}</td>
                        <td>${walletlist.user.name}</td>
                        <td>&#x20B9;${walletlist.amount }</td>
                        <fmt:parseDate value="${ walletlist.transactionDate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                        <td>
                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${ parsedDateTime }" />
                        </td>
                    </tr>
            </tbody>
            </c:forEach>
        </table>
    </div>
</body>

</html>