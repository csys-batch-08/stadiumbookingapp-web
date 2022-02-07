<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
    <title>Matchbooking.com</title>
 <link rel="stylesheet" href="assets/css/sideNavBar.css">
      <link rel="stylesheet" href="assets/css/stylesheet.css">
</head>
<body>
    <div class="sidenav">
   <fmt:bundle basename = "com.stadiumbooking.bundle.Sidenavbar" prefix="nav.">
         <a href="adminProfile"><fmt:message  key="Profile"/></a>
        <a href="matchDetails" ><fmt:message  key="MatchDetails"/></a>
        <a href="stadiumDetalis.jsp" ><fmt:message  key="StadiumDetails"/></a>
        <a href="sportsDetalis.jsp"><fmt:message  key="SportsDetails"/></a>
        <a href="Getallusers" ><fmt:message  key="AllUser"/></a>
        <a href="showMatchToAdmin" ><fmt:message  key="AllMatchDetails"/></a>
        <a href="allBookingDetails" ><fmt:message  key="AllBookingDetails"/></a>
        <a href="allUserWalletList" ><fmt:message  key="AllUserWalletList"/></a>
        <a href="stadiumList" ><fmt:message  key="StadiumList"/></a>
        <a href="ratingList" ><fmt:message  key="RatingList"/></a>
        <a href="index.jsp"><fmt:message key="LogOut"/></a>
    </fmt:bundle>
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
        <fmt:bundle basename = "com.stadiumbooking.bundle.ButtonsBundle" prefix="btn.">
        <button type="submit"><fmt:message key="Submit"/></button>
     </fmt:bundle>

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