
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<link rel="stylesheet" href="assets/css/sideNavBar.css">
<link rel="stylesheet" href="assets/css/table.css">
<script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css"  rel="stylesheet">
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">

<title>Matchbooking.com</title>

  <style type="text/css">

</style>

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
   
    <table data-aos="zoom-out-down"  id="tabel">
     <caption><strong id="title">All User List</strong></caption>
      <tr>  
     <th id="serialNo">S/N</th>
     <th id="name">Name</th>
     <th id="username">Username</th>
     <th id="role">Role</th> 
     <th id="password">Password</th>
     <th id="email">Email</th>
     <th id="phone">Phone Number</th> 
     <th id="delete"></th> 
     </tr>  
<c:set var="count" value="0" />
<c:forEach items="${UserLists}" var="users">
<c:set var="count" value="${count + 1}" scope="page"/>
	<tr >
<td  data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="250">${count}</td>	 
	<td  data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="400">${users.name}</td>
     
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="550">${users.username}</td> 
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="600">${users.role}</td> 
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="750"> ${users.password}</td> 
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="800"> ${users.email}</td>
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="950">${users.phoneNumber}</td>
	<c:choose>
	<c:when test="${users.wallet==0 and users.role.equals('User')}">
	
	<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="1050"><a onclick="confirmdelete(${users.userid},'${users.name}')">
     <fmt:bundle basename = "com.stadiumbooking.bundle.ButtonsBundle" prefix="btn.">
     <fmt:message key="Delete"/>
     </fmt:bundle>
     </a></td>
	
	</c:when>
<c:when test="${users.role.equals('Admin') }">
		<td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="1050">-----</td>
	</c:when>
	 <c:otherwise>
	 <td data-aos="fade-down" 
	data-aos-easing="linear"
     data-aos-delay="1050">Regular User</td>
	 </c:otherwise>
	</c:choose>
	
	</tr>  

</c:forEach>



</table>
<c:if test="${not empty delete}">
			<script src="assets/js/swetalret.js"></script>

					</c:if>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity="filehash"></script>
<script src="assets/js/animation.js"></script>
<script src="assets/js/getallusers.js"></script>
</body>
</html>