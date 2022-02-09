<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <link rel="icon" type="" href="assets/image/stadiumLogo.png">
    <link rel="icon" type="" href="assets/image/stadiumLogo.png">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js" integrity=''></script>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
    <link rel="stylesheet" href="assets/css/wallet.css">
    <title>Matchbooking.com</title>
    <style>
    </style>
</head>

<body>
    <div class="sidenav">
        <a href="usersprofile">Profile </a>
        <a href="allMatchDetalis">Upcoming Matches </a>
        <a href="mymatch">My Bookings</a>
        <a href="wallet">Wallet</a>
        <a href="stadiumList">Stadium List </a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp">Logout</a>
    </div>
    <div id="walletId">
        <h1>
            <span>W</span>
            <span>a</span>
            <span>l</span>
            <span>l</span>
            <span>e</span>
            <span>t</span>
            <span>&nbsp;</span>
            <span>A</span>
            <span>m</span>
            <span>o</span>
            <span>u</span>
            <span>n</span>
            <span>t</span>
            <span>&#8377;</span>
            <span>:</span><span id="nbr">${sessionScope.wallet}</span>
        </h1>
    </div>
    <c:if test="${not empty sessionScope.LowBalanceError}">
        <h2 class="animate__animated animate__flash" id="Emesg" onclick="Error()" style="position:absolute; left:500px; top:150px;color:red;visibility:visible"> ${sessionScope.LowBalanceError}</h2>
    </c:if>
    <div id="wallet">
        <form action="wallets" onsubmit="return insertwallet()">
            <input type="hidden" id="userID" name="userID" value="${sessionScope.id}">
            <br>
            <div class="wrapper">
                <label for="amount"><strong>Add Amount:</strong></label>
                <input type="number" min="1000" name="amount" id="amount" required="" />
                <div class="validation">Minimum Deposit 1000Rs</div>
            </div>
            <br>
            <button class="button" type="submit">Add Amount</button>
        </form>
    </div>
    <div id="transactions">
        <details>
            <summary>My Transaction History <br />
                <hr>
            </summary>
            <c:set var="count" value="0" />
            <c:forEach items="${userWalletList}" var="walletHistory">
                <c:set var="count" value="${count + 1}" scope="page" />
                <div id="history">
                    <div>
                        <strong>No:</strong>${count} <br /><br />
                        <strong>Amount &#8377;:</strong><span>${walletHistory.amount}</span>
                        <br />
                        <br />
                        <fmt:parseDate value="${walletHistory.transactionDate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                        <strong>Transaction Date:</strong><span>
                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${ parsedDateTime }" />
                        </span>
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
                <br />
            </c:forEach>
        </details>
    </div>
</body>
<c:if test="${not empty walletAdd}">
    <script src="assets/js/wallet.js"></script>
</c:if>
<script src="assets/js/autoIncrement.js"></script>

</html>