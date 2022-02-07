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
 <fmt:bundle basename = "com.stadiumbooking.bundle.Sidenavbar" prefix="nav.">
         <a href="adminProfile"><fmt:message  key="Profile"/></a>
        <a href="matchDetails" ><fmt:message  key="MatchDetails"/></a>
        <a href="stadiumDetalis.jsp" ><fmt:message  key="StadiumDetails"/></a>
        <a href="sportsDetalis.jsp"><fmt:message  key="SportsDetails"/></a>
        <a href="Getallusers" ><fmt:message  key="AllUser"/></a>
        <a href="showMatchToAdmin" ><fmt:message  key="AllMatchDetails"/></a>
        <a href="allBookingDetails" ><fmt:message  key="AllBookingDetails"/></a>
        <a href="allUserWalletList" ><fmt:message  key="AllUserWalletList"/></a>
        <a href="stadiumList" ><fmt:message  key="StadiumList"/></a>
        <a href="ratingList" ><fmt:message  key="RatingList"/></a>
        <a href="index.jsp"><fmt:message key="LogOut"/></a>
    </fmt:bundle>

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
		integrity="filehash"></script>
	<script src="assets/js/animation.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="assets/js/table.js"></script>
</body>
</html>