<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	   <link    rel="stylesheet"    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
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
        #sportInfo{
            position: absolute;
            left: 300px;
        }
       #mathcInfo{
            position: absolute;
            left: 300px;
            top:100px;
            
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
 box-shadow:inset -10.5em 0 0 0 blue,

 inset 10.5em 0 0 0 yellow;

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
/* .allMatch{
--x-pos:0;
--y-angle:calc(var(--x-pos) * 5deg);

--y-pos:0;
--x-angle:calc(var(--y-pos) * 5deg);

transform:
perspective(200px)
rotateY(var(--y-angle))
rotateX(var(--x-angle));
}
*/

 #mathcInfo:hover{
 background-color: white;
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
#gifImage{
position: fixed;
top:30px;
left:1200px
}
.anime img{
width: 50px;
height: 50px;
}




#mathcInfo  a{
         
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
        


        
        #search{
        position:absolute;
        top:20px;
left:850px;
border: 2px solid blue;

        }
        #search input{
        border:none;
        height:60px;
         font-weight: bold;
         outline: none;
         font-size: 18px;

         }
              #search  button {
               position:relative;
               left:0px;
  background-color:DodgerBlue;
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
 <input type="text" name="teamName" placeholder="Search"><button type="submit"> &#128269;</button>
 
 </form>
 </div>
 <div class="anime">
 <img src="image/circktballGif.gif" alt="can't find" id="gifImage" loading="lazy"  onmouseout="dec()" onmouseover="inc()"  >
 </div>
   <%
    String error=(String)session.getAttribute("houseFull");
    if (error!=null) {
    %>
     <h2  id="Emesg" onclick="Error()" style="position:absolute; left:300px; top:10px;color:red;visibility:visible"> <%=session.getAttribute("houseFull") %></h2>
   <%} %>
 <!-- LowCountSeats -->
 
 <%
    String errors=(String)session.getAttribute("LowCountSeats");
    if (errors!=null) {
    %>
     <h2  id="EmMesg" onclick="Errors()" style="position:absolute; left:320px; top:30px;color:red;visibility:visible"> <%=session.getAttribute("LowCountSeats")%></h2>
   <%} %>
 
   
    <div class="mathcInfo" id="mathcInfo">
<div id="Allmatch">
   <c:forEach items="${MatchDetails}" var="match">
  
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


<a href="bookSeats?matchId=${match.matchId}">Book Tickets</a>

<br>
<br>     
    </c:otherwise> 

</c:choose>     
     </div>
        

        </div> 
        <br>
<br>
</c:forEach>
</div>
    </div>

</body>
</html>
<script >
function Error(){
	 document.getElementById("Emesg").style.visibility="hidden";
	 }

function Errors()
{
	 document.getElementById("EmMesg").style.visibility="hidden";
	 }
	 
	 
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
   }
   else{
       clearInterval(setInter);
   }
}


</script>