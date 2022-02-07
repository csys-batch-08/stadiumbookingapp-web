<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <link    rel="stylesheet"    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
    <link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
        <script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
<link rel="stylesheet" href="assets/css/wallet.css">
    <title>Matchbooking.com</title>
    <style>
        
    </style>
</head>
<body>

  <div class="sidenav">
         <fmt:bundle basename = "com.stadiumbooking.bundle.Sidenavbar" prefix="nav.">
        <a href="usersprofile"><fmt:message  key="Profile"/></a>
        <a href="allMatchDetalis"><fmt:message  key="UpcomingMatch"/></a>
        <a href="mymatch"><fmt:message  key="MyMatch"/></a>
        <a href="wallet"><fmt:message  key="Wallet"/></a>
        <a href="stadiumList"><fmt:message  key="StadiumList"/></a>
        <a href="ratingList"><fmt:message  key="RatingList"/></a>
        <a href="index.jsp"><fmt:message key="LogOut"/></a>
            </fmt:bundle>
    </div>
    
    
   
    <div id="walletId">


    <h1 >
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
     <span>:</span><span id="nbr">${sessionScope.wallet}</span> </h1>
  
  
    </div>
     <c:if test="${not empty sessionScope.LowBalanceError}">
      <h2 class="animate__animated animate__flash" id="Emesg" onclick="Error()" style="position:absolute; left:500px; top:150px;color:red;visibility:visible"> ${sessionScope.LowBalanceError}</h2>
</c:if>
    <fmt:bundle basename = "com.stadiumbooking.bundle.ButtonsBundle" prefix="btn.">
      <div id="wallet">
    <form action="wallets" onsubmit="return insertwallet()">


        <input style="visibility: hidden;" type="text" name="userID" value="${sessionScope.id}" >
        <br>
     
        <div class="wrapper">
           <label ><strong><fmt:message key="Add"/>:</strong></label>
        <input type="number" min="1000" name="amount" id="amount"   required=""/>
        <div class="validation">Minimum Deposit 1000Rs</div>
        </div>
      
        <br>
        <button class="button" type="submit"><fmt:message key="Add"/></button>


    </form>
</div>
</fmt:bundle>

      <div id="transactions">
    <details>
        <summary>My Transaction History
        <br/>
        <hr>
         </summary>
        <c:set var="count" value="0" />
   <c:forEach items="${userWalletList}" var="walletHistory"> 
   <c:set var="count" value="${count + 1}" scope="page"/>  
     <div id="history">
        <div >
        <strong>No:</strong>${count}
        <br/><br/>
        
        <strong>Amount &#8377;:</strong><span>${walletHistory.amount}</span> 
        <br/>
        <br/>
        <fmt:parseDate value="${walletHistory.transactionDate }"	pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
        <strong>Transaction Date:</strong><span> <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${ parsedDateTime }"/></span> 
        <br/>
        <br/>
        <br/>
        </div>
        </div>
        <br/>
     
   
             </c:forEach>
    </details>
</div>
</body>
<c:if test="${not empty walletAdd}">
<script src="assets/js/wallet.js"></script>
</c:if>
<script src="assets/js/autoIncrement.js"></script>
</html>