  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "icon" type = "" href = "image/Studium.png">
    <title>Matchbooking.com</title>
  <link rel="stylesheet" href="assets/css/sideNavBar.css">
</head>
<body>
    <div class="sidenav" id="mainnav" role="navigation" aria-labelledby="mainnavheading">
<fmt:bundle basename = "sidenaveBar" prefix = "count.">
         <a href="adminProfile" target="adminProfile" >Profile</a>
        <a href="matchDetails">Match Details</a>
        <a href="stadiumDetalis.jsp">Stadium Details</a>
        <a href="sportsDetalis.jsp">Sports Details</a>
        <a href="Getallusers">All User</a>
        <a href="showMatchToAdmin">All Match Details</a>
        <a href="allBookingDetails">Booking Details</a>
        <a href="allUserWalletList">All User Wallet List</a>
        <a href="stadiumList">Stadium List</a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp"><fmt:message key = "Logout"/></a>
</fmt:bundle>       
    </div>
</body>
</html>

