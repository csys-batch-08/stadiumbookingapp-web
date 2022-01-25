<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="60">
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
}

table tr,td{
margin-left: 150px;
	
}


   
#stadiumLists{
margin-left: -380px;
margin-top: 115px;
}
#stadiumList{
padding:10px;

}
#stadium{
position: relative;
left:400px;

}
a{
text-decoration: none;
}

</style>
</head>
<body>


	<div id="stadiumLists">

		<table>
			<tbody>
				<tr>
					<c:set var="count" value="0" />
					
					
					     <c:forEach items="${sessionScope.stadiumList}" var="stadium">
       
					<td>
						<table id="stadumList" cellspacing=70px;>
							<tbody>
								<tr>
									<td><img src="image/${stadium.stadium_img}"></td>
									
									</tr>
								
									<td id="stadium">
									<a href="rating.jsp?stadiumId=${stadium.stadium_id }">${stadium.stadium_name}</a>
									
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



	
</body>
</html>