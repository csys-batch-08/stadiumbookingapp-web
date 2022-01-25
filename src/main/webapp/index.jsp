<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#4285f4">
    
    <meta name="theme-color" content="#1b1b1b">
    <link rel = "icon" type = "" href = "image/Studium.png">
    <title>Matchbooking.com</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
      <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
  
    <style>
    html {
    overflow-x:hidden;
  scroll-behavior: smooth;
}
         li {
            float: right;
            color: black;
            font-size: 18px;
        }
        li:hover{
        cursor: pointer;
        }
        #login input{
            background: transparent;
            border: none;
            border-bottom: 2px solid brown;
            color: blue;
            font-weight: bold;
            outline: none;
        }
        #regs input {
            border: none;
            background: transparent;
            border-bottom: 2px solid brown;
            color: blue;
            font-weight: bold;
            position: relative;
            left: 60px;
            top: 20px;
            outline: none;
        }
        #regs label{
        position:relative;
        left:60px;
        top:20px
        }


        input::placeholder {
            color:black;
            font-size: 14px;
        }
        #regs button
        {
            position: relative;
            left: -50px;
            top: 25px;
        }
        #regs i{

            position: relative;
            left: 100px;

        }
        #iconImg{
transition:box-shadow .4s, color .8s, transform .4s;
}        
#iconImg:hover{
color:red;
box-shadow: 0 20px 20px rgba(0,0,0,0.205),
inset -30px 0 20px 	rgba(0,0,0,0.205);
transform:translateY(-10px);
}

#iconn{
position:absolute;
top:-5px;
left:20px;
width: 85px;
height: 85px;
}
    input::placeholder {
            color:gray;
            font-size: 14px;
        }
        #login{
        margin-left: 120px;
        }
        #regs{
        margin-left: 60px;
        } 
   
          input:-webkit-autofill,
input:-webkit-autofill:hover, 
input:-webkit-autofill:focus, 
input:-webkit-autofill:active  {
  transition: background-color 5000s;
  -webkit-text-fill-color: blue !important;
}

#loginBuuton,#regButton {         
       transition:transform 300ms,background-color 300ms;
  animation:pulse 500ms;
        }
        #loginBuuton:hover,#regButton:hover{
transform:scale(1.05);
        }
        #loginBuuton:active,#regButton:active{
        transform:scale(0.95);
        animation:none; 
        }
        
        @keyframes pulse{
        from{
        box-shadow: yellow 0 0 0;
        }
        to{
        box-shadow: blue 0 0 0 6px;
        }
        }
        

    #con{
    background-image:url('image/StadiumImages.jpg');
    background-repeat: no-repeat;
    background-size:cover;
}

#partentRow{
margin-left: 160px;
}
#bcci{
margin-left: 120px;
}

#dream{
margin-left: 120px;
}

.rotate-center{animation:rotate-center 1s ease-in-out both}
@keyframes rotate-center{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}

::-webkit-scrollbar {
  width: 12px;

}


::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 

::-webkit-scrollbar-thumb {
  background: #888; 
    
}


::-webkit-scrollbar-thumb:hover {
  background: #555; 
}



    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg bg-secondary  navbar-primary py-3">
        <div class="container">



           <a id="iconImg" class="navbar-brand text-light">MatchBooking</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">

                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collpase navbar-collapse">
                <ul class="navbar-nav text-light">
                    <li class="nav-item">
                        <a href="" class="nav-link text-light" data-bs-toggle="modal" data-bs-target="#enroll">Sign In</a>
                    </li>
                    <li class="nav-item">
                        <a  class="nav-link text-light" data-bs-toggle="modal" data-bs-target="#register">Sign Up</a>
                    </li>

                </ul>
            </div>
        </div>

    </nav>
<img id="iconn" class="d-none d-sm-block" src="image/Studium.png">

    <section id="con"  class="bg-info text-light p-5 p-lg-0 pt-lg-5 text-center text-sm-start">
        <div class="container">
            <div class="d-sm-flex align-items-center justify-content-between">
                <div class="animate__animated animate__fadeInLeft">
   
   
   <c:if test="${not empty sessionScope.error}">
     <h2  id="Emesg" onclick="Error()" style="position:absolute;width:500px; left:665px; top:-120px;color:orange;visibility:visible"><i class="bi bi-emoji-frown"></i> ${sessionScope.error}</h2>

</c:if>
              
              <c:if test="${not empty sessionScope.RegisterSuccessful}">
                   <h2  id="Emesg" onclick="Error()" style="position:absolute; left:700px; width:500px; top:-120px;color:white;visibility:visible"><i class="bi bi-emoji-frown"></i> ${sessionScope.RegisterSuccessful}</h2>

                </c:if>      
   
     <c:if test="${not empty sessionScope.SomthingWentWrong}">
                <h2  id="RegSus" onclick="RegSus()" style="position:absolute; left:660px; width:500px;  top:-120px;color:red;visibility:visible"> <i class="bi bi-emoji-frown"></i> ${sessionScope.SomthingWentWrong }</h2>

                </c:if>        
    
                    <h1>Tickets On Sale <span class="text-danger">Book Now</span></h1>
                    <p class="lead font-weight-light my-4 ">
                        Upcoming TaTa IPL Tickets sales stared Book Now and Supports your Favorite Team
                    </p>
                    <button class="btn btn-primary btn-outline-warning text-light" id="loginBuuton" data-bs-toggle="modal" data-bs-target="#enroll">Book Now</button>
                </div>
                <div class="animate__animated animate__flipInY animate__delay-1s">
                    <img class="img-fluid h-100  max-width-200 d-none d-sm-block"
                        src="image/iplLogo.png"
                        alt="">
                </div>
            </div>
        </div>
    </section>

    <section class="bg-primary text-light p-5">
        <div class="container">
            <div class="d-md-flex justify-content-between align-items-center">
                <h3 class="mb-3 mb-md-0">Register Now For Booking</h3>
                <button class="btn btn-info btn-outline-warning text-light" id="regButton" data-bs-toggle="modal" data-bs-target="#register">Register</button>
            </div>
            
        </div>
    </section>

    <section class=" p-5">
        <div class="container">
            <div class="row text-center g-4">
                <div class="col-md">
                    <div class="card bg-dark text-light rotate-center">
                        <div class="card-body text-center">
                            <div class="h2 mb-3">
                                <i class="bi bi-binoculars"></i>
                            </div>
                            <h3 class="card-title mb-3">
                                Search
                            </h3>
                            <p class="card-text">
                                Online Sale of TATA IPL Ticket start
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum fugit doloremque at,
                                nobis facere explicabo.
                            </p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md">
                    <div class="card bg-secondary text-light rotate-center">
                        <div class="card-body text-center">
                            <div class="h2 mb-3">
                                <i class="bi bi-person-square"></i>
                            </div>
                            <h3 class="card-title mb-3">
                                Register Now
                            </h3>
                            <p class="card-text">
                            Be an early bird! Grab your tickets now. Limited seats are available. Click here to register.
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum fugit 
                            </p>
                            <a href="#" class="btn btn-dark">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md">
                    <div class="card bg-dark text-light rotate-center">
                        <div class="card-body text-center">
                            <div class="h2 mb-3">
                                <i class="bi bi-calendar3"></i>
                            </div>
                            <h3 class="card-title mb-3">
                                Online Sale
                            </h3>
                            <p class="card-text">
                                Online Sale of TATA IPL Ticket start
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum fugit doloremque at,
                                nobis facere explicabo.
                            </p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

 <section id="ins" class="p-5 bg-dark">
        <div class="container">
            <h2 class="text-center text-white">Official Partners</h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark">

                        <div class="card-body text-center">
                            <img class="mb-3 w-100"
                                src="image/36-361290_iccs-anti-corruption-unit-to-investigate-world-t20-removebg-preview.png"
                                alt="">
                           
                                    </div>
                    </div>
                
                </div>    

                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark">

                        <div class="card-body text-center">
                            <img class="mb-3  w-50"
                                src="image/BCCI_logo.png"
                                alt="">
                            
                                    </div>
                    </div>
                
                </div>    

                
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark">

                        <div class="card-body text-center">
                            <img class="mb-3 w-100"
                                src="image/dream11_logo_twitter_1_1633948080011-removebg-preview.png"
                                alt="">
                            
                                    </div>
                    </div>
                
                </div>  
                  
                </div>  
                
                
                <div class="row g-4 " id="partentRow">
                   <div class="col-md-6 col-lg-3 ">
                    <h3 class="card-title mb-2 pl-10 text-light d-none d-sm-block">ICC</h3>
                   </div>
                     <div class="col-md-6 col-lg-3" id="bcci">
                   <h3 class="card-title mb-3 text-light d-none d-sm-block">BCCI</h3>
                </div>
                  <div class="col-md-6 col-lg-3">
                   <h3 class="card-title mb-3 text-light d-none d-sm-block" id="dream">Dream11</h3>
                </div>
                 
                </div>  
        </div>

    </section>




    <section id="stadium" class="p-5">

        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md">
                    <img src="https://www10.aeccafe.com/blogs/arch-showcase/files/2011/07/ccsc_n48_medium_lge.jpg"
                        class="img-fluid" alt="">
                </div>
                <div class="col-md p-5">
                    <h2>M. A. Chidambaram Stadium</h2>
                    <p class="lead">
                        M. A. Chidambaram Stadium, commonly known as the Chepauk Stadium, is a cricket stadium in
                        Chennai, Tamil Nadu, India. Established in 1916, it is the second oldest cricket stadium in
                        the country after Eden Gardens in Kolkata. Formerly known as Madras Cricket Club Ground, the
                        stadium is named after M. A. Chidambaram Chettiar, former President of BCCI & Head of TNCA.
                    </p>
                    <p>
                        It is the home ground of the Tamil Nadu cricket team and the Indian Premier League team Chennai
                        Super Kings. Chepauk hosted its first Test match on 10 February 1934, the first Ranji Trophy
                        match in 1936 and the Indian cricket team's first test victory in 1952 against England. The 1986
                        India-Australia match held at Chepauk was only the second ever Tied Test in the history of the
                        game.
                    </p>
                    <a href="#" class="btn btn-primary mt-3">
                        <i class="bi bi-chevron-right"></i>Read More
                    </a>
                </div>
            </div>
        </div>
    </section>



    <section id="stadium" class="p-5 bg-dark text-light">

        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md">
                    <img src="https://staticg.sportskeeda.com/editor/2018/02/f6969-1517813007-800.jpg"
                        class="img-fluid" alt="">
                </div>
                <div class="col-md p-5">
                    <h2>Wankhede Stadium</h2>
                    <p class="lead">
                        The Wankhede Stadium is an international
                        cricket stadium in Mumbai, India. The stadium now has a capacity of 33,108, following
                        renovations for the 2011 Cricket World Cup. Before the upgrade, the capacity was approximately
                        45,000.
                    </p>
                    <p>
                        The stadium has been host to numerous high-profile cricket matches in the past, most notably the
                        2011 Cricket World Cup Final, in which India defeated Sri Lanka and became the first country to
                        win the cricket world cup on home soil. The stadium played host to the last match of Sachin
                        Tendulkar's international career. Additionally, it hosted many matches during the 1996 and 2011
                        Cricket World Cups. The stadium also played host to the match in which Ravi Shastri hit six
                        sixes in an over.
                    </p>
                    <a href="#" class="btn btn-primary mt-3">
                        <i class="bi bi-chevron-right"></i>Read More
                    </a>
                </div>
            </div>
        </div>
    </section>

    <section id="ins" class="p-5 bg-primary">
        <div class="container">
            <h2 class="text-center text-white">Our Instructors</h2>
            <p class="lead text-center text-white mb-5">
                Our Instructors All Have 10+ years working as a web devloper in the Industry
            </p>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="card bg-light">

                        <div class="card-body text-center">
                            <img class="mb-3 w-100"
                                src="image/stevOliver.jpg"
                                alt="">
                            <h3 class="card-title mb-3"> Oliver Queen</h3>
                            <p class="card-text">
                                Oliver Queen, also known by his alter-ego the Green Arrow, is a fictional character in
                                The CW's Arrowverse franchise, first introduced in the 2012 pilot episode  Arrow 
    
                                <b class="text-dark">#YouHaveFailedThisCity #GreenArrow</b>
                            
                            </p>
                            <a href="#"><i class="bi bi-twitter text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-facebook text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-instagram text-dark mx-1"></i></a>
                        </div>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3">
                    <div class="card bg-light">

                        <div class="card-body text-center">
                            <img class="mb-3 w-100"
                                src="image/grantFlash.png"
                                alt="">
                            <h3 class="card-title mb-3"> Barry Allen</h3>
                            <p class="card-text">
                                The Flash is a superhero appearing in a series of American comic books published by DC
                                Comics. Barry Allen is a reinvention of the original Flash
                            </p>
                            <a href="#"><i class="bi bi-twitter text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-facebook text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-linkedin text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-instagram text-dark mx-1"></i></a>
                        </div>
                    </div>
                </div>



                <div class="col-md-6 col-lg-3">
                    <div class="card bg-light">

                        <div class="card-body text-center">
                            <img class="mb-3 w-100"
                                src="image/tomPeter.jpg"
                                alt="">
                            <h3 class="card-title mb-3"> Peter Parker</h3>
                            <p class="card-text">
                                Spider-Man is a superhero appearing in American comic books published by Marvel Comics.
                                Created by writer-editor Stan Lee and artist Steve Ditko, he first appeared in the
                                anthology comic book
                            </p>
                            <a href="#"><i class="bi bi-twitter text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-facebook text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-linkedin text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-instagram text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-google text-dark mx-1"></i></a>
                        </div>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3">
                    <div class="card bg-light">

                        <div class="card-body text-center">
                            <img class="mb-3 w-100"
                                src="image/steave.jpg"
                                alt="">
                            <h3 class="card-title mb-3">Steve Rogers</h3>
                            <p class="card-text">
                                Captain America is a superhero appearing in American comic books published by Marvel
                                Comics. Created by cartoonists Joe Simon and Jack Kirby, the character first appeared in
                                Captain America Comics
                            </p>
                          
                            <a href="#"><i class="bi bi-facebook text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-linkedin text-dark mx-1"></i></a>
                            <a href="#"><i class="bi bi-google text-dark mx-1"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="p-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-md">
                    <h2 class="text-center mb-4">Contact Info</h2>
                    <ul class="list-group list-group-flush lead">
                        <li class="list-group-item">
                            <span class="fw-bold">Main Location:</span> Sivakasi,Virudhunagar
                        </li>
                        <li class="list-group-item">
                            <span class="fw-bold">Enrollment Email:</span> matchbooking@gmail.com
                        </li>
                        <li class="list-group-item">
                            <span class="fw-bold">Enrollment Phone:</span> 8098264081
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <footer class="p-5 bg-dark text-white text-center position-relative">
        <div class="container">
            <p class="lead">Copyright &copy; 2022 MatchBooking.com</p>
            <a href="#" class="position-absolute bottom-0 end-0 p-5">
                <i class="bi bi-arrow-up-circle h1"></i>
            </a>
        </div>
    </footer>


    <div class="modal fade" id="enroll" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
         
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Login Form</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
          
            <div class="modal-body">
               
                <div id="login">

                      <form action="loginServe"  onsubmit="return validate()">
                       
                        <input type="text" id="uname" name="username" placeholder="Username" />
                        <br> <label id="luser" style="color:red; visibility: hidden;">Enter Username</label> <br>
                        <input type="password" id="pass" name="password" placeholder="Password" />
                        <br> <label id="lpass" style="color: red; visibility: hidden;">Enter Password</label>
                           <br> <br>
                         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Submit</button>
              <br> <br>
              <i data-bs-toggle="modal" data-bs-target="#register">Don't Have An Account...??</i>
               </form>
                         
                </div>
            </div>
        
       
          </div>
        </div>
      </div>

      
    <div class="modal fade" id="register" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
                   
            <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Register Form</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="regs">
                    <form action="regSevr" method="get" onsubmit="return  reg()">         
                    
                        <input type="text" id="name" name="name" placeholder="Enter Your Name"> <br>
                        <label id="lname" style="visibility: hidden;">Enter Your Name</label>
                        <br>
                        <input type="text"  onkeyup="userName()" id="runame" name="uname" placeholder="Enter Your Username"> <br>
                        <label for="username" id="luname" style="visibility: hidden;">Enter Your Username</label>
                        <br>
                        <input type="password" name="pass" id="rpass"    placeholder="Enter Your Password"> <br>
                        <label id="repass" style="visibility: hidden;">Enter Password</label>
                        <br>
                        <input type="email" onkeyup="sendemail()" id="mail" name="mail" placeholder="Enter Your E-mail"> <br>
                        <label id="lmail" style="visibility: hidden;">Enter Your E-Mail</label>
                        <br>
                        <input type="text" onkeyup="verifyMobile()" name="phone" id="phone" placeholder="Enter Your Mobile Number"> <br>
            
                        <label id="mobile" style="visibility: hidden;">Enter Mobile Number</label>
                        <br>
                        <br>
                        <br>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <br> <br>
                        <i data-bs-toggle="modal" data-bs-target="#enroll">Already Have An Account..??</i>
                    </form>                    
            
                </div>
            </div>
          

          </div>
        </div>
      </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</body>

</html>


<script>
    function logV() {

        document.getElementById("login").style.visibility = "visible";
        document.getElementById("register").style.visibility = "hidden";
        document.getElementById("lname").style.visibility = "hidden";
        document.getElementById("luname").style.visibility = "hidden";
        document.getElementById("repass").style.visibility = "hidden"; 
        document.getElementById("lmail").style.visibility = "hidden";
        document.getElementById("mobile").style.visibility = "hidden";
        document.getElementById("registered").style.visibility="hidden";
        document.getElementById("Emesg").style.visibility="hidden";
        
        
    }

    function regsiter() {
        document.getElementById("login").style.visibility = "hidden";
        document.getElementById("register").style.visibility = "visible";
        document.getElementById("luser").style.visibility = "hidden";
        document.getElementById("lpass").style.visibility = "hidden";
        document.getElementById("registered").style.visibility="hidden";
        document.getElementById("Emesg").style.visibility="hidden";
    }

    function RegD() {


        document.getElementById("register").style.visibility = "visible";
        document.getElementById("login").style.visibility = "hidden";
        document.getElementById("luser").style.visibility = "hidden";
        document.getElementById("lpass").style.visibility = "hidden";
        document.getElementById("registered").style.visibility="hidden";
        document.getElementById("Emesg").style.visibility="hidden";
    }

    function RegV() {

        document.getElementById("login").style.visibility = "visible";
        document.getElementById("register").style.visibility = "hidden";
        document.getElementById("lname").style.visibility = "hidden";
        document.getElementById("luname").style.visibility = "hidden";
        document.getElementById("repass").style.visibility = "hidden"; 
        document.getElementById("lmail").style.visibility = "hidden";
        document.getElementById("mobile").style.visibility = "hidden";
        document.getElementById("registered").style.visibility="hidden";
        document.getElementById("Emesg").style.visibility="hidden";
    }
    
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
        var mobileExpression = /[6-9][0-9]{9}$/;

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
        
        else if (passExpression .test(password.value) == false) {
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

        else if(emailExpression.test(email.value) == false){
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
        else if (mobileExpression.test(mobileNumber.value) == false) {
            document.getElementById("mobile").innerHTML = "Invalid Number";
            document.getElementById("mobile").style.visibility = "visible";
            document.getElementById("mobile").style.color = "red";
            return false;
        }
        
        else if (mobileExpression.test(mobileNumber.value) && emailExpression.test(email.value)
        		&& passExpression .test(password.value)) {
            return true;
        }
        
        
        

    }
    
    
    
    function sendemail()
    {  
   
        let email=document.getElementById("mail").value;

        
        //console.log(email);

    var url="chechEmail.jsp?email="+email;  
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
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
    	//console.log(response);
    	document.getElementById("lmail").innerHTML=response;
    	 document.getElementById("lmail").style.color = "red";
    	document.getElementById("lmail").style.visibility = "visible";
    	 var email = document.getElementById("mail");
    	
    	//console.log(response);

    	}  
    	}
    
    
    function verifyMobile() {  
   
        let phone=document.getElementById("phone").value;

        
        //console.log(phone);

    var url="checkMobileNumber.jsp?phone="+phone;  
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
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
    	//console.log(response);
    	document.getElementById('mobile').innerHTML=response;
    	 document.getElementById("mobile").style.visibility = "visible";
         document.getElementById("mobile").style.color = "red";
         var mobileNumber = document.getElementById("phone");
      
    	//console.log(response);

    	}  
    	}
    
    

    function userName() {  
   
        let userName=document.getElementById("runame").value;

        
        //console.log(phone);

    var url="checkUsername.jsp?userName="+userName;  
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
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
    	//console.log(response);
    	document.getElementById('luname').innerHTML=response;
    	 document.getElementById("luname").style.visibility = "visible";
         document.getElementById("luname").style.color = "red";
   
      
    	//console.log(response);

    	}  
    	}
    
    

</script>