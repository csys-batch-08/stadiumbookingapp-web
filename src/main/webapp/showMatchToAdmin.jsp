<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
   <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    
    <%
    MatchDaoImpl matchDao=new MatchDaoImpl();
    
    ResultSet rs=matchDao.getAllMatchDetalis();

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="60">
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
        }
        #mathcInfo a:hover{
background-color: green;
color: black;
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
   


    <div id="mathcInfo">
<div id="Allmatch">
 <%while(rs.next())
	 {%>    
	 <div class="allMatch" id="<%=rs.getString(7)+rs.getString(8)%>">
     <br>
        <img src="image/<%=rs.getString(9) %>" loading="lazy">  &nbsp;  &nbsp; <label ><b id="teamA"><%=rs.getString(7) %></b> <strong id="Vs">Vs</strong> <b id="teamB"> <%=rs.getString(8) %> </b></label>
    <img src="image/<%=rs.getString(10) %>" id="teamBlogo"  loading="lazy"> <br> <br>
    <label class="matchDetalis" id="stadiumName" ><%=rs.getString(3) %></label><br>
       <label class="matchDetalis" ><%=rs.getString(4) %></label><br>
      <label class="matchDetalis" ><%=rs.getDate(5) %></label><br>
       <label class="matchDetalis" ><%=rs.getTime(6) %></label><br>
        

<br>
<div id="about">
<%
ResultSet dateRs=matchDao.getDate();

if(dateRs.next()){ 

	if(dateRs.getDate(1).after(rs.getDate(5))){
%>
          <b><%=rs.getString(7) %>&nbsp; Won By 9 Wickets</b>
          <br><br>
          <%}
	
else{
%>   
   <a href="updateMatch.jsp?matchId=<%=rs.getInt(1)%>">Update Match</a>
<br>
<br>     
     <%}} %>
     
     </div>
        

        </div> 
        <br>
<br>
<%} %>
</div>
    </div>

</body>
</html>