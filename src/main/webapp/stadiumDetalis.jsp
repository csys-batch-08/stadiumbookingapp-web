<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "icon" type = "" href = "image/Studium.png">
    <title>Matchbooking.com</title>
 <link rel="stylesheet" href="assets/css/sideNavBar.css">
      <link rel="stylesheet" href="assets/css/stylesheet.css">
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
    <br>
    <div id="stadium">
    <form action="stadium" onsubmit="return insert()">

        <label ><strong>Stadium Name:</strong></label>
        <input type="text" name="stadiumName" id="stadiumName" >
        <br>
        
        <label style="visibility: hidden;" id="stadiumError">Enter Stadium Name</label>
        <br>
        <label ><strong>Stadium Image :</strong></label>
        <input type="file" name="stadiumImge" id="stadiumImge">
        <br>
        <label style="visibility: hidden;" id="image">Enter Image Url</label>
        <br>
        <button type="submit">Submit</button>
     

    </form>
</div>
</body>
</html>
<script>
    function insert(){

        var sstadiumName=document.getElementById("stadiumName");
        var stadiumImge=document.getElementById("stadiumImge");

        if(sstadiumName.value.trim() ==""){
           // console.log("Working")
            document.getElementById("stadiumError").style.visibility="visible";
            document.getElementById("stadiumError").style.color="red";
            document.getElementById("stadiumError").style.position="relative";
            document.getElementById("stadiumError").style.left="100px";
            return false;
        }
        else if(stadiumImge.value.trim()==""){
            document.getElementById("image").style.visibility="visible";
            document.getElementById("image").style.color="red";
            document.getElementById("image").style.position="relative";
            document.getElementById("image").style.left="100px";
            return false;

        }
    }
</script>