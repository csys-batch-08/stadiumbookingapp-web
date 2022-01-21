<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.stadiumbooking.daoimpl.StadiumDaoImpl"%>
<%
StadiumDaoImpl stadiumDao = new StadiumDaoImpl();
%>
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
					<%
					int count = 0;
					ResultSet rs = stadiumDao.getAllStadiumList();
					while (rs.next()) {
					%>
					<td>
						<table id="stadumList" cellspacing=70px;>
							<tbody>
								<tr>
									<td><img src="image/<%=rs.getString(3)%>"></td>
									
									</tr>
								
									<td id="stadium">
									<a href="rating.jsp?stadiumId=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a>
									
																</td>
							</tbody>
						</table>


					</td>
					<%
					count++;
					if (count == 4) {
					%>
				</tr>
				<tr>
					<%
					count = 0;
					}
					}
					%>

				</tr>
			</tbody>
		</table>

	</div>



	
</body>
</html>