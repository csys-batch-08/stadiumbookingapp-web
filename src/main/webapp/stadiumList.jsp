<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css"  rel="stylesheet">
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
<link rel="stylesheet" href="assets/css/stadiumList.css">
<title>Matchbooking.com</title>

</head>
<body>


<div id="nav">

        <ul>
         
            <strong id="logo"> MatchBooking</strong>
            
      <li><a href="index.jsp">Logout</a></li>
            <li>&nbsp; &nbsp;</li>
            <li>
            <c:choose>
             <c:when test="${sessionScope.role.equals('Admin')}">
             
            <a href="adminHome.jsp">Home</a>
            </c:when>
            <c:when test="${sessionScope.role.equals('User')}">
            
            <a href="userHome.jsp">Home</a>
        
            </c:when>
            </c:choose>
            </li>
            
           
          
          
        </ul>
    </div>


	<div id="stadiumLists">

		<table id="Staidum">
		<caption></caption>
		<th></th>
			<tbody>
				<tr>
					<c:set var="count" value="0" />
					
					
					     <c:forEach items="${stadiumList}" var="stadium">
       
					<td>
						<table id="stadumList" >
						<caption></caption>
						<th></th>
							<tbody>
								<tr>
									<td >
									
								
									<img src="assets/image/${stadium.stadiumImg}" alt="can't find" data-aos="flip-right" data-aos-easing="linear"   data-aos-duration="1000"></td>
								
									</tr>
								
									<td id="stadium">
									<a href="ratingStadium?stadiumId=${stadium.stadiumId }">${stadium.stadiumName}</a>
									
																</td>
							</tbody>
						</table>


					</td>
					
					<c:set var="count" value="${count + 1}" scope="page"/>
					<c:choose>
					<c:when test="${count==4}">
				</tr>
				<tr>
						<c:set var="count" value="0" scope="page" />
					</c:when>
					</c:choose>
</c:forEach>
				</tr>
			</tbody>
		</table>

	</div>


     <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity=''></script>
<script src="assets/js/animation.js"></script>
</body>
</html>