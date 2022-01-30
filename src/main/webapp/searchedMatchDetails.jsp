<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link    rel="stylesheet"    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>
<style>
html {
  scroll-behavior: smooth;
}
body {
	overflow-x: hidden;
}

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

.main {
	margin-left: 200px;
}

#sportInfo {
	position: absolute;
	left: 300px;
}

#mathcInfo {
	position: absolute;
	left: 300px;
	top: 100px;
	width: 60%;
	height: fit-content;
	padding: 12px;
	padding: 20px;
	
}

.allMatch{
 background-color: #f2f2f2;
	border: 1px solid #023f72 !important;
	
	border-radius: 5px;
transition:.4s ease-in;
z-index:1;
}


.allMatch::before,
.allMatch::after{
content:"";
z-index:-1;
}



.allMatch:hover{
background-color:white;
 box-shadow:inset -10.5em 0 0 0 SlateBlue,

 inset 10.5em 0 0 0 DodgerBlue;
}

#CSKMI:hover{
background-color:white;
 box-shadow:inset -10.5em 0 0 0 blue,

 inset 10.5em 0 0 0 yellow;
}

#RCBKKR:hover{
background-color:white;
 box-shadow:inset -10.5em 0 0 0 purple,

 inset 10.5em 0 0 0 red;
}

#MIDC:hover{
background-color:white;
 box-shadow:inset -10.5em 0 0 0 indigo,

 inset 10.5em 0 0 0 blue;
}
#CSKRCB:hover{
background-color:white;
 box-shadow:inset -10.5em 0 0 0 red,

 inset 10.5em 0 0 0 yellow;
}
#KKRDC:hover{
background-color:white;
 box-shadow:inset -10.5em 0 0 0 indigo,

 inset 10.5em 0 0 0 purple;
}
#SRHDC:hover{
background-color:white;
 box-shadow:inset -10.5em 0 0 0 indigo,

 inset 10.5em 0 0 0 orange;
}

#mathcInfo:hover {
	background-color: white;
}

img {
	position: relative;
	top: -10px;
	left:10px;
	width: 100px;
	height: 100px;
}

#teamBlogo {
	position: relative;
	left: 400px;
}

#teamA {
	font-size: 23px;
	position: relative;
	left: -90px;
	top: 10px;
}

#Vs {
	font-size: 50px;
	position: relative;
	left: 200px;
	top: -40px;
}

#teamB {
	font-size: 23px;
	position: relative;
	left: 450px;
	top: 10px;
}

button {
	background-color: lightgreen;
	color: red;
	position: relative;
	left: 60px;
}

.matchDetalis {
	position: relative;
	left: 370px;
	font-size: 18px;
	top: -30px;
	font-weight: bold;
}

#about {
	position: relative;
	left: 300px;
}
#gifImage{
position: fixed;
top:30px;
left:1250px
}
.anime img{
width: 50px;
height: 50px;
}

#mathcInfo  button{         
   background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: large;
  font-weight: bold;
    position: relative;
  left: 40px;
       transition:transform 300ms,background-color 300ms;
  animation:pulse 500ms;
        }
        #mathcInfo button:hover{
background-color: green;
color: black;
transform:scale(1.05);
        }
        #mathcInfo button:active{
        transform:scale(0.95);
        animation:none;
        }
        
        @keyframes pulse{
        from{
        box-shadow: #ff69b4 0 0 0;
        }
        to{
        box-shadow: #ff69b400 0 0 0 12px;
        }
        }
        

#search {
	position: absolute;
	top: 20px;
	left: 850px;
	border: 2px solid blue;
}

#search input {
	border: none;
	height: 60px;
	font-weight: bold;
	outline: none;
	font-size: 18px;
}

#search  button {
	position: relative;
	left: 0px;
	background-color: DodgerBlue;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	height: 64px;
}

::placeholder {
	color: black;
	font-size: 18px;
	height: 50px;
	font-style: italic;
}


          input:-webkit-autofill,
input:-webkit-autofill:hover, 
input:-webkit-autofill:focus, 
input:-webkit-autofill:active  {
  transition: background-color 5000s;
}



::-webkit-scrollbar {
  width: 12px;

}


::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 

::-webkit-scrollbar-thumb {
  background: #888; 
    
}


::-webkit-scrollbar-thumb:hover {
  background: #555; 
}



</style>
</head>

<body>
	<div class="sidenav">
		 <a href="usersprofile">Profile</a>
         <a href="allMatchDetalis">Match Details</a>
        <a href="mymatch">My Match</a>
        <a href="wallet">Wallet</a>
         <a href="stadiumList">Stadium List</a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp">Logout</a>
	</div>

	<div id="search">
		<form action="searchedMatchDetails">
			<input type="text" name="teamName" placeholder="Search">
			<button type="submit">&#128269;</button>
		</form>
	</div>
 <div class="anime">
 <img src="image/circktballGif.gif" alt="can't find" id="gifImage"  onmouseout="dec()" onmouseover="inc()"  >
 </div>


	<div class="mathcInfo" id="mathcInfo">
	<div id="Allmatch">

  <c:choose>
		<c:when test="${searchMatchList.size() != 0 }">  
		
		<c:forEach items="${searchMatchList}" var="match">

	 <div class="allMatch animate__animated animate__flipInX animate__slow" id="${match.teamA}${match.teamB}">
     <br>
        <img src="image/${match.teamAlogo}" alt="can't find" loading="lazy">  &nbsp;  &nbsp; <label ><strong id="teamA">${match.teamA}</strong> <strong id="Vs">Vs</strong> <strong id="teamB"> ${match.teamB} </strong></label>
    <img src="image/${match.teamBlogo}" alt="can't find" id="teamBlogo"  loading="lazy"> <br> <br>
    <label class="matchDetalis" id="stadiumName" >${match.stadiumName}</label><br>
       <label class="matchDetalis" >${match.location}</label><br>
      <fmt:parseDate value="${match.matchDate}" pattern="yyyy-MM-dd" var="macthDate" type="date"/>
      <label class="matchDetalis" > <fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}"/>  </label><br>
       <label class="matchDetalis" >${match.matchTime}</label><br>
        

<br>
<div id="about">
     <c:choose>

	 <c:when test = "${sessionScope.today > match.matchDate }">

          <strong>${match.teamA}&nbsp; Won By 9 Wickets</strong>
          <br><br>
          </c:when>
	
<c:otherwise>  
 
<form action="bookSeats">

<button type="submit">Book Tickets</button>
<input type="text" style="visibility: hidden" name="matchId" value="${match.matchId}">

</form>
<br>
<br>     
    </c:otherwise> 

</c:choose>  
</div>
</div>
      <br>
<br>
	</c:forEach>  
	</c:when>
		<c:otherwise>
			<img style="width: 400px; height: 200px; " alt="can't find" class="animate__animated animate__zoomInDown"  src="image/no-search-found-removebg-preview.png">
</c:otherwise>

	</c:choose>
	
</div>
</div>
	

</body>
</html>
<script>

var width=100;
var diff=2;
var setInter=0;
function inc(){

    clearInterval(setInter);
  setInter=setInterval(zoomIn,20);
}

function zoomIn(){
   if(width<100){
       width=width+diff;
       document.getElementById("gifImage").style.width=width+"px";
       document.getElementById("gifImage").style.height=width+"px";
       
   //    console.log(width);
   }
   else{
       clearInterval(setInter);
   }
}

function dec(){

    clearInterval(setInter);
    setInter=setInterval(zoomOut,20);
}
function zoomOut(){
    if(width>50){
       width=width-diff;
       document.getElementById("gifImage").style.width=width+"px";
       document.getElementById("gifImage").style.height=width+"px";
//       console.log(width);
   }
   else{
       clearInterval(setInter);
   }
}
</script>