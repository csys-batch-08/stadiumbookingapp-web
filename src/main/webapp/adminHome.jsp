<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords"
	content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js" integrity=''></script>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<link rel="icon" type="" href="assets/image/stadiumLogo.png">
<title>Matchbooking.com</title>
<link rel="stylesheet" href="assets/css/sideNavBar.css">
</head>
<body>
	<div class="sidenav">
		
			<a href="adminProfile"> Profile
			</a>
			<a href="matchDetails"> Add Match 
			</a>
			<a href="stadiumDetalis.jsp"> Stadium Details 
			</a>
			<a href="sportsDetalis.jsp"> Add Sports 
			</a>
			<a href="Getallusers"> Users List
			</a>
			<a href="showMatchToAdmin"> All Match Details 
			</a>
			<a href="allBookingDetails"> Booking Details 
			</a>
			<a href="allUserWalletList"> Transaction Historys
			</a>
			<a href="stadiumList"> Stadium List 
			</a>
			<a href="ratingList"> Rating List
			</a>
			<a href="index.jsp"> Logout
			</a>
		
	</div>
</body>
</html>
<c:if test="${not empty admin}">
	<script src="assets/js/adminlogin.js"></script>
</c:if>

