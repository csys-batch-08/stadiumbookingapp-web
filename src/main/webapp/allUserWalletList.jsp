<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="icon" type="" href="image/Studium.png">
<link rel="stylesheet" href="assets/css/sideNavBar.css">
<link rel="stylesheet" href="assets/css/table.css">
<title>Matchbooking.com</title>

</head>
<body>

	<div class="sidenav">
		 <a href="adminProfile">Profile</a>
		 <a href="matchDetails">Match Details</a> 
		 <a href="stadiumDetalis.jsp">Stadium Details</a> 
		 <a	href="sportsDetalis.jsp">Sports Details</a>
		 <a href="Getallusers">All	User</a>
		 <a href="showMatchToAdmin">All Match Details</a> 
		 <a	href="allBookingDetails">Booking Details</a> 
		 <a href="allUserWalletList">All User Wallet List</a>
		 <a href="stadiumList">Stadium List</a> 
		 <a href="ratingList">Rating List</a>
		 <a href="index.jsp">Logout</a>

	</div>

	<div>
		<table data-aos="zoom-in-down">
			<caption>
				<strong>User Transaction History</strong>
			</caption>
			<tr>

				<th id="serialNumber">S/N</th>
				<th id="name">Name</th>
				<th id="amount">Amount</th>
				<th id="date">Transaction Date</th>
			</tr>
			<c:set var="count" value="0" />
			<c:forEach items="${walletList}" var="walletlist">
				<c:set var="count" value="${count + 1}" scope="page" />

				<tr>



					<td data-aos="flip-up" data-aos-easing="linear"
						data-aos-duration="500" data-aos-delay="100">${count}</td>
					<td data-aos="flip-up" data-aos-easing="linear"
						data-aos-duration="500" data-aos-delay="400">${walletlist.user.name}</td>

					<td data-aos="flip-up" data-aos-easing="linear"
						data-aos-duration="500" data-aos-delay="800">${walletlist.amount }</td>

					<fmt:parseDate value="${ walletlist.transactionDate }"
						pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />


					<td data-aos="flip-up" data-aos-easing="linear"
						data-aos-duration="500" data-aos-delay="1200"><fmt:formatDate
							pattern="dd-MM-yyyy HH:mm" value="${ parsedDateTime }" /></td>

				</tr>
			</c:forEach>
		</table>
	</div>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"
		integrity="filehash"></script>
	<script src="assets/js/animation.js"></script>
</body>
</html>