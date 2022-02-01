<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css"  rel="stylesheet">
<link rel="icon" type="" href="image/Studium.png">
<title>Matchbooking.com</title>
<style>
body
{
overflow-x:hidden; 
}


img {
	width: 200px;
	height: 200px;
	border-radius:50%;
	position: relative;
	left: 350px;
	border: 2px solid blue;
}
.shimmer{
    animation-duration: 2.2s;
    animation-fill-mode: forwards;
    animation-iteration-count: infinite;
    animation-name: shimmer;
    animation-timing-function: linear;
    background: #ddd;
    background: linear-gradient(to right, #F6F6F6 8%, #F0F0F0 18%, #F6F6F6 33%);
    background-size: 1200px 100%;
}

@-webkit-keyframes shimmer {
    0% {
        background-position: -100% 0;
    }
    100% {
        background-position: 100% 0;
    }
}

@keyframes shimmer {
    0% {
        background-position: -1200px 0;
    }
    100% {
        background-position: 1200px 0;
    }
}
  

table tr,td{
margin-left: 150px;
	
}


   
#stadiumLists{
margin-left: -380px;
margin-top: 50px;
width:auto;
}
#stadiumList{
padding:10px;

}
table th,
table td {
  padding: 5px;
  /* Apply cell padding */
}
table {
  border-collapse: separate;
  border-spacing: 30px;
  cellspacing:70px;
  /* Apply cell spacing */
}

#stadium{
position: relative;
left:400px;

}
a{
text-decoration: none;
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
}ul {
    list-style-type: none;
}

</style>
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
             
            <a href="adminHome.html">Home</a>
            </c:when>
            <c:when test="${sessionScope.role.equals('User')}">
            
            <a href="userHome.html">Home</a>
        
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
									
								
									<img src="image/${stadium.stadiumImg}" alt="can't find" data-aos="flip-right" data-aos-easing="linear"   data-aos-duration="1000"></td>
								
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


     <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity="filehash"></script>
<script>
  AOS.init();
</script>
	
</body>
</html>