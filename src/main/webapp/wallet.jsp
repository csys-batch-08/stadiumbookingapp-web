<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <link    rel="stylesheet"    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel = "icon" type = "" href = "image/Studium.png">
    <link rel="stylesheet" href="assets/css/sideNavBar.css">
<link rel="stylesheet" href="assets/css/wallet.css">
    <title>Matchbooking.com</title>
    <style>
        
    </style>
</head>
<body>

  <div class="sidenav">
        <a href="usersprofile">Profile</a>
         <a href="allMatchDetalis">Match Details</a>
        <a href="mymatch">My Match</a>
        <a href="wallet">Wallet</a>
         <a href="stadiumList">Stadium List</a>
        <a href="ratingList">Rating List</a>
        <a href="index.jsp">Logout</a>
    </div>
    
    
   
    <div id="walletId">

    
    <p><strong>Wallet Amount:</strong>${sessionScope.wallet}</p>
  
  
    </div>
     <c:if test="${not empty sessionScope.LowBalanceError}">
      <h2 class="animate__animated animate__flash" id="Emesg" onclick="Error()" style="position:absolute; left:500px; top:150px;color:red;visibility:visible"> ${sessionScope.LowBalanceError}</h2>
</c:if>
    
      <div id="wallet">
    <form action="wallets" onsubmit="return insertwallet()">


        <input style="visibility: hidden;" type="text" name="userID" value="${sessionScope.id}" >
        <br>
     
        <div class="wrapper">
           <label ><strong>Add Amount:</strong></label>
        <input type="number" min="1000" name="amount" id="amount"   required=""/>
        <div class="validation">Minimum Deposit 1000Rs</div>
        </div>
        <br>
        <label style="visibility: hidden;" id="amountError">Enter Amount</label>
        <br>
        <button class="button" type="submit">Submit</button>


    </form>
</div>
    
</body>
</html>
<script>
    function insertwallet(){

        
        var amountDetails=document.getElementById("amount");

        if(amountDetails.value.trim() ==""){
            //console.log("Working")
            document.getElementById("amountError").style.visibility="visible";
            document.getElementById("amountError").style.color="red";
            document.getElementById("amountError").style.position="relative";
            document.getElementById("amountError").style.left="100px";
            return false;
        }
            }
    
    function Error(){
   	 document.getElementById("Emesg").style.visibility="hidden";
   
   }
</script>