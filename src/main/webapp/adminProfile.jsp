<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<link rel = "icon" type = "" href = "image/Studium.png">
<title>Matchbooking.com</title>
<style type="text/css">
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

input {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

#update {
	visibility: hidden;
	position: absolute;
	left: 450px;
	top: 60px;
}

#update {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 50%;
}

#userInfo {
	position: absolute;
	left: 600px;
	top: 50px;
}
 img{

width:250px;
height:250px;
            position: absolute;
            left: -350px;
            top:-30px;
            border-radius: 50%;

        }
     #edit{
   position: absolute;
            left: -150px;
            top:200px;     
     } 
     #profile{
     position: relative;
     left:-100px;
     top:100px;
     }
    #profile input{
     outline: none;
     }
      input:-webkit-autofill,
input:-webkit-autofill:hover, 
input:-webkit-autofill:focus, 
input:-webkit-autofill:active  {
  transition: background-color 5000s;
  -webkit-text-fill-color: black !important;
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



	<div id="userInfo">
		
		
		
		<c:forEach items="${userDateils}" var="user">

		<label for=""><strong>Name:</strong> &nbsp; ${user.name } </label> <br>
		<label for=""><strong>Username:</strong>&nbsp; ${user.username} </label> <br>
		<label for=""><strong>Mobile:</strong>&nbsp; ${user.phoneNumber}</label> <br>
		<label for=""><strong>Email:</strong> &nbsp; ${user.email} </label> <br>
		
		<button onclick="update()">Update</button>
		<div >
		<img src="image/${user.profilePic }" alt="can't find">
		<button onclick="profile()" id="edit"> Edit </button>
		</div>
		</c:forEach>
				
<div id="profile">
    <form action="profilePic" id="profilepicForm" style="visibility: hidden;">
        
        <input type="file" name="profilePic">
       <button type="submit">Submit</button>
       <input type="text" name="role" value="Admin" style="visibility: hidden;">
    </form>
</div>

	</div>



	<div id="update">

		<form action="update" method="post" onsubmit="return validate()">
		    <c:forEach items="${userDateils}" var="user">


			<label><strong>Name:</strong></label> <br>
		    <input type="text" value="${user.name}" 	name="updateName" id="updateName"> <br>
		    <label id="uname" style="visibility: hidden;">Enter Name</label> <br>

			<label><strong>Username:</strong></label> <br> 
			<input type="text" value="${user.username}"	name="updateUsername" id="updateUsername"> <br>			
		    <label id="username" style="visibility: hidden;">Enter Username</label> <br>
			
			
			
			<label ><strong>Password:</strong></label> <br> 
			<input	type="text" value="${user.password}" name="updatePassword" id="updatePassword"> <br>
			<label for="" id="lpass" style="visibility: hidden;">EnterPassword</label> <br>
			
			<label for=""><strong>Email:</strong></label> <br> 
		    <input	type="email" value="${user.email}" name="updateEmail" id="updateEmail"> <br>
			<label for="" id="lmail" style="visibility: hidden;">Enter	Email</label> <br> 
			
			<label for=""><strong>Phone Number:</strongb></label> <br>
			<input type="number" value="${user.phoneNumber}" name="updateNumber" id="updateNumber"> <br>
			<label for="" id="mobile" style="visibility: hidden;">Enter	phone Number</label>
			
			<button type="submit">Submit</button>
			<input type="text" name="role" value="${user.role}" id="role" style="visibility: hidden;">
		</c:forEach>
		</form>

	</div>

</body>
</html>
<script>
function update(){
    document.getElementById("update").style.visibility="visible";
   

	}

	function validate() {

		var name = document.getElementById("updateName");
		var username = document.getElementById("updateUsername");
		var password = document.getElementById("updatePassword");
		var email = document.getElementById("updateEmail");
		var phonenumber = document.getElementById("updateNumber");

		var passExpression = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$/;
		var emailExpression = /[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}/;
		var mobileExpression = /[6-9][0-9]{9}$/;

		if (name.value.trim() == "") {
			document.getElementById("uname").style.visibility = "visible";
			document.getElementById("uname").style.color = "red";
			return false;
		} else if (name.value.trim() < 5) {
			document.getElementById("uname").style.visibility = "visible";
			document.getElementById("uname").style.color = "red";
			document.getElementById("luname").innerHTML = 'Name Too Short';
			return false;
		} else if (username.value.trim() == "") {
			document.getElementById("username").style.visibility = "visible";
			document.getElementById("username").style.color = "red";
			return false;
		} else if (username.value.trim() < 5) {
			document.getElementById("username").style.visibility = "visible";
			document.getElementById("username").style.color = "red";
			document.getElementById("username").innerHTML = "Username Too Short";
			return false;
		} else if (password.value.trim() == "") {

			document.getElementById("lpass").style.color = "red";
			document.getElementById("lpass").style.visibility = "visible";
			return false;
		} else if (password.value.trim().length < 5) {

			document.getElementById("lpass").style.visibility = "visible";
			document.getElementById("lpass").style.color = "red";
			document.getElementById("lpass").innerHTML = "Password Too Short";
			return false;
		}
		
		else if (passExpression .test(password.value) == false) {
			document.getElementById("lpass").style.visibility = "visible";
			document.getElementById("lpass").style.color = "red";
			document.getElementById("lpass").innerHTML = "Invalid Password Format";

			return false;
		}

		else if (email.value.trim() == "") {
			document.getElementById("lmail").style.visibility = "visible";
			document.getElementById("lmail").style.color = "red";

			return false;
		} else if (emailExpression.test(email.value) == false) {
			document.getElementById("lmail").style.visibility = "visible";
			document.getElementById("lmail").style.color = "red";
			document.getElementById("lmail").innerHTML = "Invalid Email Format";

			return false;
		}

		else if (phonenumber.value.trim() == "") {
			document.getElementById("mobile").style.visibility = "visible";
			document.getElementById("mobile").style.color = "red";

			return false;
		}

		else if (mobileExpression.test(phonenumber.value) == false) {
			document.getElementById("mobile").innerHTML = "Invalid Number";
			document.getElementById("mobile").style.visibility = "visible";
			document.getElementById("mobile").style.color = "red";
			return false;
		} else if (mobileExpression.test(phonenumber.value)
				&& emailExpression.test(email.value) && passExpression .test(password.value)) {
			return true;
		}

	}
	
	 function profile(){
	        document.getElementById("profilepicForm").style.visibility="visible";
	        document.getElementById("edit").style.visibility="hidden";
	    }
</script>