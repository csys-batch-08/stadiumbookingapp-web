<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="60">
<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>
<style>
body{
overflow-x:hidden; 
}
  img{
            width: 300px;
            height: 300px;
            border: 2px solid black;
            position: relative;
            left: 350px;
        }

        .reviewContainer{
background: rgba(250, 250, 250, .9) !important;
	border: none !important;
	padding: 15px;
	border-radius: 3px;
}
.reviwerName{
	color: #023f72 !important;
	font-family: times;	
	position: relative;
	top:-15px;
	left:5px;
}
    .rating{
	border: 1px solid #023f72 !important;
	box-shadow: 2px 2px 3px rgba(0, 0, 0, .4);
	border-radius: 5px;
} 

.userProfile{
border-radius: 50%;
width: 50px;
height: 50px;
position: relative;
left:0px;
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


ul {
            margin: 0;
            overflow: hidden;
            background-color: gray;
            color: white;
            font-weight: bolder;
            padding: 16px;
            opacity: 0.5px;
        }

        li {
            float: right;
            color: white;
        }
#nav{
position: absolute;
left: 0px;
top: 0px;
width: 1355px;
}        
#nav a{
color:white;
text-decoration: none;
}
        </style>
</head>
<body>

<%-- 
<% int id=(int) session.getAttribute("id");
            ResultSet user=userDao.getUserById(id);
String role=null;
            if(user.next()){
	role=user.getString(4);
}
            %>
<div id="nav">

        <ul type="none">
         
            <b id="logo"> MatchBooking</b>
            
            <b>
           
            </b>
      <li><a href="index.jsp">Logout</a></li>
            <li>&nbsp; &nbsp;</li>
            <li onclick="regsiter()"> <%if(role.equals("Admin")){ %>
            <a href="adminHome.html">Home</a>
            <%} else if(role.equals("User")){%>
            <a href="userHome.html">Home</a>
            <%} %></li>
            
           
          
          
        </ul>
    </div>


<br><br>
<br><br>
 --%>
    

     <c:forEach items="${sessionScope.stadiumList}" var="stadiumList">
     
   <div class="rating">
   <img src="image/${stadiumList.stadium_img}" >
      
       <br>
       <b>${stadiumList.stadium_name}</b> 
       <br>
       
       <jsp:useBean id="ratingDao" class="com.stadiumbooking.daoimpl.RatingsDaoImpl"/>
       
    
         <c:forEach items="${ratingDao.getAllRatingsById(stadiumList.stadium_id)}" var="ratingList">
      <jsp:useBean id="userDao" class="com.stadiumbooking.daoimpl.UserDaoImpl"/>
          
     <c:forEach items="${userDao.getUserById(ratingList.userId)}" var="userList">
   
       <div class="reviewContainer">
           <img src="image/${userList.profilePic}" class="userProfile">
       <b class="reviwerName">${userList.name}  
       &nbsp;
       <c:choose>
       <c:when test="${ratingList.ratings==5.0}">
      
       <label>&#11088;&#11088;&#11088;&#11088;&#11088;</label></b>
      
       </c:when>
       <c:when test="${ratingList.ratings==4.0}">
       <label>&#11088;&#11088;&#11088;&#11088;</label></b>
       </c:when>
        <c:when test="${ratingList.ratings==3.0}">
        <label>&#11088;&#11088;&#11088;</label></b> 
       </c:when>
       
        <c:when test="${ratingList.ratings==2.0}">
       <label>&#11088;&#11088;</label></b>
       </c:when>
        <c:when test="${ratingList.ratings==1.0}">
         <label>&#11088;</label></b>
       </c:when>
       </c:choose>
       </c:forEach>     
       
        &nbsp; 
      
      <br> <br>
       <label id="review">${ratingList.reviews}</label>
       <br>
       </div>
       </c:forEach>
      
       
       <br>
    </div>

    <br>
        
    <br>
    </c:forEach>
     
</body>
</html>