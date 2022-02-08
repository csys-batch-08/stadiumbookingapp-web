<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
    <title>Matchbooking.com</title>
    <script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js" integrity=''></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
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
</body>

</html>
<c:if test="${not empty user}">
			<script src="assets/js/userlogin.js"></script>
					</c:if>