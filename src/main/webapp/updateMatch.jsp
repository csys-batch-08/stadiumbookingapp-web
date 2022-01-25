<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link  rel="stylesheet"    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>
<style>

.sidenav {
	height: 100%;
	width: 200px;
	position: fixed;
	top: 0;
	left: 0;
	background-color: steelblue;
}

.sidenav a {
	padding: 6px 6px 6px 32px;
	text-decoration: none;
	font-size: 23px;
	color: white;
	display: block;
}

.sidenav a:hover {
	color: black;
}

#updateMatch{
 position:absolute;
 left:350px;
 top:100px;
 width: 40%;
  padding: 12px;
  border: 1px solid #ccc;
    border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}


#updateMatch b{
text-align: center;

}

#updateMatch input[type="date"]{
position:relative;
left:120px;
top:-20px;
  background: transparent;
            border: none;
}

#updateMatch input[type="time"]{
position:relative;
left:320px;
top:-45px;
  background: transparent;
            border: none;
}

#updateMatch button{
position:relative;
left:200px;
  background-color: navy;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 18px;

  margin: 4px 2px;
}
#updateMatch  button:hover {
            background-color: green;
        }
img{
width:100px;
height:100px;
}
#teamA{
position:relative;
left:30px;
}
#teamB{
position:relative;
left:420px;
}
#teamBlogo{
position:relative;
left:250px;
}
#vs{
font-size: 50px;
        position: relative;
        left: 120px;
        top: 0px;
}
b{
text-align: center;
}
#matchDetails{

        position: relative;
        left: 180px;
        top:-20px;        
}
#matchDetails b{
font-size: 20px;
}
       ::placeholder {
  color: black;
  font-size: 28px;
  height: 50px;
  font-style: italic;
}
</style>
</head>
<body>

<div class="sidenav">
	   <a href="adminProfile.jsp">Profile</a>
        <a href="matchDetails.jsp">Match Details</a>
        <a href="stadiumDetalis.jsp">Stadium Details</a>
        <a href="sportsDetalis.jsp">Sports Details</a>
       <a href="Getallusers.jsp?deleteId=0">All User</a>
        <a href="showMatchToAdmin.jsp">All Match Details</a>
        <a href="allBookingDetails.jsp">Booking Details</a>
        <a href="allUserWalletList.jsp">All User Wallet List</a>
        <a href="stadiumList.jsp">Stadium List</a>
        <a href="ratingList.jsp">Rating List</a>
        <a href="index.jsp">Logout</a>
	</div>


 
 	<c:forEach items="${sessionScope.singleMatch}" var="match">

    <div class="animate__animated animate__zoomIn animate__slow" id="updateMatch">
    <div>
     <div>
     <img src="image/${match.teamAlogo}"> &nbsp; &nbsp;<b id="vs">Vs</b>  &nbsp;  <img src="image/${match.teamBlogo}" id="teamBlogo">
    <br>
    <br>
    <strong id="teamA">${match.teamA}</strong>  
    
     
    <strong id="teamB">${match.teamB}</strong>
    <br>
    </div>
       <br>
    <div class="animate__animated animate__fadeInDown animate__delay-2s" id="matchDetails">
    <b >${match.stadium_name}</b>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <b>${match.location}</b>
    <br>
    <fmt:parseDate value="${match.match_date}" pattern="yyyy-MM-dd" var="macthDate" type="date"/>
    <br> <fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}"/> &nbsp; &nbsp; ${match.match_time}
    <br>
    </div>
    </div>
    <form action="updateMatch" >

<input type="text" name="matchId" value="${match.match_id}" style="visibility:hidden;">
<br>
        <input type="date" min="${sessionScope.today}" name="matchDate" id="matchDate" required>
        <br>
        <input type="time" name="matchTime" id="matchTime" required>
        <br>
        <button type="submit">Update</button>
    </form>
    </div>
    </c:forEach>
</body>
</html>