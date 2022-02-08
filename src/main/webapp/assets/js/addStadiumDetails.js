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