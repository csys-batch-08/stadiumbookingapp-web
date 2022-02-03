
AOS.init();

    
    function Error(){
    	 document.getElementById("Emesg").style.visibility="hidden";
    	 document.getElementById("login").style.visibility = "visible";
    }
    function RegSus(){
    	 document.getElementById("RegSus").style.visibility="hidden";
    	 document.getElementById("login").style.visibility = "visible";
    }

    function validate() {
        var username = document.getElementById("uname");
        var password = document.getElementById("pass");

        if (username.value.trim() == "") {

            document.getElementById("luser").style.visibility = "visible";
            username.style.borderBottom = "solid 3px black";
            return false;

        }
        else if (password.value.trim() == "") {

            password.style.borderBottom = "solid 3px black";
            document.getElementById("lpass").style.visibility = "visible";
            return false;
        }
        else if (password.value.trim().length < 5) {

            document.getElementById("lpass").style.visibility = "visible";
            document.getElementById("lpass").innerHTML = "Password Too Short";
            return false;
        }
        else {
            return true;
        }
    }



    function reg() {
        var name = document.getElementById("name");
        var username = document.getElementById("runame");
        var password = document.getElementById("rpass");
        var email = document.getElementById("mail");
        var mobileNumber = document.getElementById("phone");
        
        var passExpression = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$/;
        var emailExpression=/[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}/;
        var mobileExpression = /[6-9]\d{9}$/;

        if (name.value.trim() == "") {
            document.getElementById("lname").style.visibility = "visible";
            document.getElementById("lname").style.color = "red";
            name.style.borderBottom = "2px solid black";
            return false;
        }
        
        else if(name.value.trim().length<5){
            document.getElementById("lname").style.visibility = "visible";
            document.getElementById("lname").style.color = "red";
            document.getElementById("lname").innerHTML="Name Too Short";
            username.style.borderBottom = "2px solid black";
            return false;
        }
        
        else if (username.value.trim() == "") {
            document.getElementById("luname").style.visibility = "visible";
            document.getElementById("luname").style.color = "red";
            username.style.borderBottom = "2px solid black";
            return false;
        }
        else if(username.value.trim().length<5){
            document.getElementById("luname").style.visibility = "visible";
            document.getElementById("luname").style.color = "red";
            document.getElementById("luname").innerHTML="Username Too Short";
            username.style.borderBottom = "2px solid black";
            return false;
        }
        else if (password.value.trim() == "") {
            document.getElementById("repass").style.visibility = "visible";
            document.getElementById("repass").style.color = "red";
            password.style.borderBottom = "2px solid black";
            return false;
        }
        else if (password.value.trim().length < 5) {

            document.getElementById("repass").style.visibility = "visible";
            document.getElementById("repass").style.color = "red";
            document.getElementById("repass").innerHTML = "Password Too Short";
            return false;
        }
        
        else if (!passExpression .test(password.value)) {
			document.getElementById("repass").style.visibility = "visible";
			document.getElementById("repass").style.color = "red";
			document.getElementById("repass").innerHTML = "Invalid Password Format";

			return false;
		}
        else if (email.value.trim() == "") {
            document.getElementById("lmail").style.visibility = "visible";
            document.getElementById("lmail").style.color = "red";
            email.style.borderBottom = "2px solid black";
            return false;
        }

        else if(!emailExpression.test(email.value)){
            document.getElementById("lmail").style.visibility = "visible";
            document.getElementById("lmail").style.color = "red";
            document.getElementById("lmail").innerHTML="Invalid Email Format";
            email.style.borderBottom = "2px solid black";
            return false;
        }
        
        else if (mobileNumber.value.trim() == "") {
            document.getElementById("mobile").style.visibility = "visible";
            document.getElementById("mobile").style.color = "red";
            mobileNumber.style.borderBottom = "2px solid black";
            return false;
        }
        else if (!mobileExpression.test(mobileNumber.value)) {
            document.getElementById("mobile").innerHTML = "Invalid Number";
            document.getElementById("mobile").style.visibility = "visible";
            document.getElementById("mobile").style.color = "red";
            return false;
        }
        
        else if (mobileExpression.test(mobileNumber.value) && emailExpression.test(email.value)
        		&& passExpression.test(password.value)) {
            return true;
        }
        
        
        

    }
    
    
    
    function sendemail()
    {  
   
        let email=document.getElementById("mail").value;




    var url="chechEmail.jsp?email="+email;  
    if(window.XMLHttpRequest){  
    var request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    try  
    {  
    request.onreadystatechange=getInfo;  
    request.open("GET",url,true);  
    request.send();  
    }  
    catch(e)  
    {  
    alert("Unable to connect to server");  
    }
        
       }
    
    function getInfo(){  
    	if(request.readyState==4){  
    	var response =request.responseText; 
  
    	document.getElementById("lmail").innerHTML=response;
    	 document.getElementById("lmail").style.color = "red";
    	document.getElementById("lmail").style.visibility = "visible";
    	


    	}  
    	}
    
    
    function verifyMobile() {  
   
        let phone=document.getElementById("phone").value;

    var url="checkMobileNumber.jsp?phone="+phone;  
    if(window.XMLHttpRequest){  
    var request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    try  
    {  
    request.onreadystatechange=getInfos;  
    request.open("GET",url,true);  
    request.send();  
    }  
    catch(e)  
    {  
    alert("Unable to connect to server");  
    }
        
       }
    
    function getInfos(){  
    	if(request.readyState==4){  
    	var response =request.responseText; 
  
    	document.getElementById('mobile').innerHTML=response;
    	 document.getElementById("mobile").style.visibility = "visible";
         document.getElementById("mobile").style.color = "red";
      
    	}  
    	}
    
    

    function userName() {  
   
        let username=document.getElementById("runame").value;

    var url="checkUsername.jsp?userName="+username;  
    if(window.XMLHttpRequest){  
    var request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    try  
    {  
    request.onreadystatechange=getInf;  
    request.open("GET",url,true);  
    request.send();  
    }  
    catch(e)  
    {  
    alert("Unable to connect to server");  
    }
        
       }
    
    function getInf(){  
    	if(request.readyState==4){  
    	var response =request.responseText; 
    
    	document.getElementById('luname').innerHTML=response;
    	 document.getElementById("luname").style.visibility = "visible";
         document.getElementById("luname").style.color = "red";
   
    	}  
    	}
    
    

