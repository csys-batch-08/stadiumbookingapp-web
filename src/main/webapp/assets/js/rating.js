

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