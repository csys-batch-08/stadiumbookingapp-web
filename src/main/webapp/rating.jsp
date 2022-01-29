
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "icon" type = "" href = "image/Studium.png">
    <title>Matchbooking.com</title>
    <style>
   
  .rate {
    float: left;
    height: 46px;
    padding: 0 10px;
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float:right;
    width:1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:30px;
    color:#ccc;
}
.rate:not(:checked) > label:before {
    content:'\2605';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
#ratingBody{

    position: absolute;
    left: 450px;
    top: 100px;
}

    </style>
</head>
<body>
    <div id="ratingBody">
    <div id="rating">

        <div class="rate">
            <input type="radio" id="star5" name="rate" value="5" onclick="rate5()" />
            <label for="star5" title="text">5 stars</label>
            <input type="radio" id="star4" name="rate" value="4"onclick="rate4()" />
            <label for="star4" title="text">4 stars</label>
            <input type="radio" id="star3" name="rate" value="3" onclick="rate3()"/>
            <label for="star3" title="text">3 stars</label>
            <input type="radio" id="star2" name="rate" value="2" onclick="rate2()" />
            <label for="star2" title="text">2 stars</label>
            <input type="radio" id="star1" name="rate" value="1" onclick="rate1()" />
            <label for="star1" title="text">1 star</label>
          </div>
    </div>
    <br>
    <br>
    <div>
        <br>
        <form action="ratings" onsubmit="return ratings()">
          <input type="text" name="ratingNumber" id="ratingNumber" style="visibility:hidden;">
            <input type="text" id="stadiumId" value="${stadiumID}" name="stadiumId" style="visibility:hidden;"  >
         <br>
          <label>Write a review</label>
          <br> <br>
          <textarea name="review" id="review" rows="3" cols="30" ></textarea>
          <button type="submit">Submit</button>
        </form>
        </div>

        </div>
</body>
</html>
<script>


function rate5(){
    var x = document.getElementsByName("rate")[0].value;
    document.getElementById("ratingNumber").value = x;
}

function rate4(){
    var x = document.getElementsByName("rate")[1].value;
    document.getElementById("ratingNumber").value = x;
}

function rate3(){
    var x = document.getElementsByName("rate")[2].value;
    document.getElementById("ratingNumber").value = x;
}

function rate2(){
    var x = document.getElementsByName("rate")[3].value;
    document.getElementById("ratingNumber").value = x;
}
function rate1(){
    var x = document.getElementsByName("rate")[4].value;
    document.getElementById("ratingNumber").value = x;
}

function ratings(){
    var rating=document.getElementById("ratingNumber");
    var review=document.getElementById("review");
    if(rating.value.trim()==""){
        return false;
    }
    else if(review.value.trim()==""){
        return false;
    }
}
</script>