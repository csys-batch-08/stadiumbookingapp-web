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
    <title>Matchbooking.com</title>
    <style>
        .sidenav {
            height: 100%;
            width: 200px;
            position: fixed;

            top: 0;
            left: 0;
            background-color:steelblue;

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
        #wallet{
            position: absolute;
            left: 400px;
            top: 100px;
        }
        #walletId{
        position: absolute;
            left: 400px;
            top: px;
        }
          #walletId p{
        font-size: 15px;
        }
        
        .wrapper{
        position:relative;
        overflow: hidden;
        }
        .wrapper input{
        border: none;
        border-bottom:2px solid blue;
        width: 200px;
        height:40px;
        outline:none;
        
        }
        .validation{
        position: absolute;
        top:50%;
        right: 0.5rem;
        transform:translate(5rem,-50%);
        opacity: 0;
        color:blue;
        transition:all 0.35s;
        }
        .wrapper input:valid {border-color:blue;}
        
         .wrapper input:invalid ~ .validation{
         opacity:1;
         transform:translate(0,-50%);
         }
         
                   input:-webkit-autofill,
input:-webkit-autofill:hover, 
input:-webkit-autofill:focus, 
input:-webkit-autofill:active  {
  transition: background-color 5000s;
  -webkit-text-fill-color: black !important;
}  
         
        input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
}

input[type=number] {
  -moz-appearance: textfield;
}
        
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
        <input type="number" min="1000" name="amount" id="amount" required />
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