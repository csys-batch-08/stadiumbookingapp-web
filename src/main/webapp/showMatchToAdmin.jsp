<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>

    <style>
    body {
  
  overflow-x: hidden;
}
        .sidenav {
            height: 100%;
            width: 200px;
            position: fixed;

            top: 0;
            left: 0;
            background-color:steelblue;

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
        
    
      
        }
           #sportInfo{
            position: absolute;
            left: 300px;
        }
        #mathcInfo{
            position: absolute;
            left: 300px;
            
            
 width: 60%;
 height:fit-content;
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
/*
.allMatch::before{
content:'';
display:block;
background: #ff5677;
transform:scaleY(0);
transform-origin:bottom;
transition:transform .4s;
z-index:-1;
}
.allMatch:hover::before{
transform:scaleY(1);
transform-origin:top;
}
*/
#matchInfo hr{
width:400px;
}
.matchCard{
position: relative;
left:75px;
}
img{
position:relative;
top:-10px;
left:10px;
width:100px;
height:100px;
}
#teamBlogo{
position:relative;
left:400px;
}
#teamA{
font-size: 23px;
position:relative;
left:-90px;
top:10px;

}
#Vs{
font-size: 50px;
        position: relative;
        left: 200px;
        top: -40px;
}
#teamB{
font-size: 23px;
position:relative;
left:450px;
top:10px;
}
button{
background-color:lightgreen;
color:red;
position:relative;
left:60px;
}
.matchDetalis {
position:relative;
left:370px;
font-size: 18px;
top:-30px;
font-weight: bold;
}
#about{
position:relative;
left:300px;
}
#mathcInfo  a {
         
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
        #mathcInfo a:hover{
background-color: green;
color: black;
transform:scale(1.05);
        }
        #mathcInfo a:active{
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
           <a href="adminProfile">Profile</a>
        <a href="matchDetails">Match Details</a>
        <a href="stadiumDetalis.jsp">Stadium Details</a>
        <a href="sportsDetalis.jsp">Sports Details</a>
        <a href="Getallusers">All User</a>
        <a href="showMatchToAdmin">All Match Details</a>
        <a href="allBookingDetails">Booking Details</a>
        <a href="allUserWalletList">All User Wallet List</a>
        <a href="stadiumList">Stadium List</a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp">Logout</a>
    </div>
   


    <div id="mathcInfo">
<div id="Allmatch">
   <c:forEach items="${MatchDetails}" var="match">
   <div class="matchCard" data-aos="fade-left">
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

	 <c:when test = "${today > match.matchDate }">

          <strong>${match.teamA}&nbsp; Won By 9 Wickets</strong>
          <br><br>
          </c:when>
	
<c:otherwise>   



<a href="updateMatchCall?matchId=${match.matchId}">Update Match</a>


<br>
<br>     
    </c:otherwise> 

</c:choose>     
     </div>
        
</div>
        </div> 
        <br>
<br>
</c:forEach>
</div>
    </div>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"integrity="filehash"></script>
<script>
  AOS.init();
</script>
</body>
</html>
