<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>
<style>

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
  <%
    MatchDaoImpl matchDao=new MatchDaoImpl();
      int matchId=Integer.parseInt(request.getParameter("matchId")) ;
    ResultSet rs=matchDao.getMatchByMatchId(matchId);
    ResultSet dateRs=matchDao.getDate();
    dateRs.next();
   if(rs.next()){
    %>
    <div id="updateMatch">
    <div>
     <div>
     <img src="image/<%=rs.getString(7) %>"> &nbsp; &nbsp;<b id="vs">Vs</b>  &nbsp;  <img src="image/<%=rs.getString(8) %>" id="teamBlogo">
    <br>
    <br>
    <strong id="teamA"><%=rs.getString(5) %></strong>  
    
     
    <strong id="teamB"><%=rs.getString(6) %></strong>
    <br>
    </div>
       <br>
    <div id="matchDetails">
    <b ><%=rs.getString(2) %></b>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <b><%=rs.getString(1) %></b>
    <br>
   
    <br> <%=rs.getString(3) %> &nbsp; &nbsp; <%=rs.getString(4) %>
    <br>
    </div>
    </div>
    <form action="updateMatch" >

<input type="text" name="matchId" value="<%=matchId%>" style="visibility:hidden;">
<br>
        <input type="date" min="<%=dateRs.getDate(1) %>" name="matchDate" id="matchDate" required>
        <br>
        <input type="time" name="matchTime" id="matchTime" required>
        <br>
        <button type="submit">Update</button>
    </form>
    </div>
    <%} %>
</body>
</html>