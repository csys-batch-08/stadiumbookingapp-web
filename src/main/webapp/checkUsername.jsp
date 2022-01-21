<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%> 
    <%@page import="java.io.PrintWriter"%>

     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userName =request.getParameter("userName"); 
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
PreparedStatement ps=con.prepareStatement("select * from users where username=? ");  
ps.setString(1,userName);  
ResultSet rs=ps.executeQuery();  
if(rs.next())
{
	//System.out.println(userName);
	PrintWriter Write = response.getWriter();
   Write.println("Already Registered Username");
	//System.out.println("userName"+userName);

}  
}
catch(Exception e)
{
	e.printStackTrace(); 
	//System.out.println("chechking"+e);

}
 

%>


</body>
</html>