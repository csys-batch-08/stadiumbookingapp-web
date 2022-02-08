<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
<link rel="stylesheet" href="assets/css/sideNavBar.css">
<link rel="stylesheet" href="assets/css/table.css">
<title>Matchbooking.com</title>

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

	<div id="tables">
		<table id="table" data-aos="zoom-in-down" cellspacing="0" width="100%">
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
			</thead>
			<tfoot>
			<tr>

				<th id="serialNumber">S/N</th>
				<th id="name">Name</th>
				<th id="amount">Amount</th>
				<th id="date">Transaction Date</th>
			</tr>
			</tfoot>
			<c:set var="count" value="0" />
			<tbody>
			<c:forEach items="${walletList}" var="walletlist">
				<c:set var="count" value="${count + 1}" scope="page" />

				<tr>



					<td >${count}</td>
					<td >${walletlist.user.name}</td>

					<td >${walletlist.amount }</td>

					<fmt:parseDate value="${ walletlist.transactionDate }"
						pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />


					<td><fmt:formatDate
							pattern="dd-MM-yyyy HH:mm" value="${ parsedDateTime }" /></td>

				</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"
		integrity=''></script>
	<script src="assets/js/animation.js" ></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js" integrity=''></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" integrity=''></script>
<script src="assets/js/table.js"></script>
</body>
</html>