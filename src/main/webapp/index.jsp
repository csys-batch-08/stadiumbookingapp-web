<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="theme-color" content="#4285f4">
<meta name="keywords"
	content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<meta name="theme-color" content="#1b1b1b">
<link rel="icon" type="" href="assets/image/stadiumLogo.png">
<title>Matchbooking.com</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/index.css">
</head>

<body>

	<nav class="navbar navbar-expand-lg bg-secondary  navbar-primary py-3">
		<div class="container">



			<a id="iconImg" class="navbar-brand text-light">MatchBooking</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navmenu">

				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collpase navbar-collapse">
				<ul class="navbar-nav text-light">

					<li class="nav-item"><a href="" class="nav-link text-light"
						data-bs-toggle="modal" data-bs-target="#enroll">Sign In</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						data-bs-toggle="modal" data-bs-target="#register">Sign Up</a></li>

				</ul>
			</div>
		</div>

	</nav>
	<img id="iconn" class="d-none d-sm-block" alt="can't find"
		src="assets/image/stadiumLogo.png">

	<section id="con"
		class="bg-info text-light p-5 p-lg-0 pt-lg-5 text-center text-sm-start">
		<div class="container">
			<div class="d-sm-flex align-items-center justify-content-between">
				<div class="animate__animated animate__fadeInLeft">


					<c:if test="${not empty sessionScope.error}">
						<h2 id="Emesg" onclick="Error()"
							style="position: absolute; width: 500px; left: 665px; top: -120px; color: orange; visibility: visible">
							<em class="bi bi-emoji-frown"></em> ${sessionScope.error}
						</h2>

					</c:if>

					<c:if test="${not empty sessionScope.RegisterSuccessful}">
						<h2 id="Emesg" onclick="Error()"
							style="position: absolute; left: 700px; width: 500px; top: -120px; color: white; visibility: visible">
							<em class="bi bi-emoji-smile"></em>
							${sessionScope.RegisterSuccessful}
						</h2>

					</c:if>

					<c:if test="${not empty sessionScope.SomthingWentWrong}">
						<h2 id="RegSus" onclick="RegSus()"
							style="position: absolute; left: 660px; width: 550px; top: -120px; color: red; visibility: visible">
							<em class="bi bi-emoji-frown"></em>
							${sessionScope.SomthingWentWrong }
						</h2>

					</c:if>

					<h1>
						Tickets On Sale <span class="text-danger">Book Now</span>
					</h1>
					<p class="lead font-weight-light my-4 ">Upcoming TaTa IPL
						Tickets sales stared Book Now and Supports your Favorite Team</p>
					<button class="btn btn-primary btn-outline-warning text-light"
						id="loginBuuton" data-bs-toggle="modal" data-bs-target="#enroll">Book
						Now</button>
				</div>
				<div class="animate__animated animate__flipInY animate__delay-1s">
					<img class="img-fluid h-100  max-width-200 d-none d-sm-block"
						src="assets/image/iplLogo.png" alt="ipllogo">
				</div>
			</div>
		</div>
	</section>

	<section class="bg-primary text-light p-5">
		<div class="container">
			<div class="d-md-flex justify-content-between align-items-center">
				<h3 class="mb-3 mb-md-0">Register Now For Booking</h3>
				<button class="btn btn-info btn-outline-warning text-light"
					id="regButton" data-bs-toggle="modal" data-bs-target="#register">Register</button>
			</div>

		</div>
	</section>
	<section class=" p-5">
		<div class="container">
			<div class="row text-center g-4 ">
				<div class="col-md animate__animated animate__fadeInUp">
					<div class="card bg-dark text-light">
						<div class="card-body text-center">
							<div class="h2 mb-3">
								<em class="bi bi-binoculars"></em>
							</div>
							<h3 class="card-title mb-3">Search</h3>
							<p class="card-text">Online Sale of TATA IPL Ticket start
								Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Voluptatum fugit doloremque at, nobis facere explicabo.</p>
							<a href="#" class="btn btn-primary">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-md animate__animated animate__fadeInUp">
					<div class="card bg-secondary text-light">
						<div class="card-body text-center">
							<div class="h2 mb-3">
								<em class="bi bi-person-square"></em>
							</div>
							<h3 class="card-title mb-3">Register Now</h3>
							<p class="card-text">Be an early bird! Grab your tickets now.
								Limited seats are available. Click here to register. Lorem ipsum
								dolor sit amet consectetur adipisicing elit. Voluptatum fugit</p>
							<a href="#" class="btn btn-dark">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-md animate__animated animate__fadeInUp">
					<div class="card bg-dark text-light">
						<div class="card-body text-center">
							<div class="h2 mb-3">
								<em class="bi bi-calendar3"></em>
							</div>
							<h3 class="card-title mb-3">Online Sale</h3>
							<p class="card-text">Online Sale of TATA IPL Ticket start
								Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Voluptatum fugit doloremque at, nobis facere explicabo.</p>
							<a href="#" class="btn btn-primary">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="ins" data-aos="fade-right" class="p-5 bg-dark">
		<div class="container">
			<h2 class="text-center text-white">Official Partners</h2>
			<div class="row g-4">
				<div data-aos="zoom-in" data-aos-easing="linear"
					data-aos-duration="1500" class="col-md-6 col-lg-4">
					<div class="card bg-dark">

						<div class="card-body text-center">
							<img class="mb-3 w-100"
								src="assets/image/36-361290_iccs-anti-corruption-unit-to-investigate-world-t20-removebg-preview.png"
								alt="">

						</div>
					</div>

				</div>

				<div data-aos="zoom-in" data-aos-easing="linear"
					data-aos-duration="1500" class="col-md-6 col-lg-4">
					<div class="card bg-dark">

						<div class="card-body text-center">
							<img class="mb-3  w-50" src="assets/image/BCCI_logo.png" alt="">

						</div>
					</div>

				</div>


				<div data-aos="zoom-in" data-aos-easing="linear"
					data-aos-duration="1500" class="col-md-6 col-lg-4 ">
					<div class="card bg-dark">

						<div class="card-body text-center">
							<img class="mb-3 w-100"
								src="assets/image/dream11_logo_twitter_1_1633948080011-removebg-preview.png"
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




	<section id="stadium" data-aos="fade-up-right" class="p-5 shimmerBG ">

		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-md">
					<img src="assets/image/Chepauk.jpg" class="img-fluid" alt="">
				</div>
				<div class="col-md p-5">
					<h2>M. A. Chidambaram Stadium</h2>
					<p class="lead">M. A. Chidambaram Stadium, commonly known as
						the Chepauk Stadium, is a cricket stadium in Chennai, Tamil Nadu,
						India. Established in 1916, it is the second oldest cricket
						stadium in the country after Eden Gardens in Kolkata. Formerly
						known as Madras Cricket Club Ground, the stadium is named after M.
						A. Chidambaram Chettiar, former President of BCCI & Head of TNCA.
					</p>
					<p>It is the home ground of the Tamil Nadu cricket team and the
						Indian Premier League team Chennai Super Kings. Chepauk hosted its
						first Test match on 10 February 1934, the first Ranji Trophy match
						in 1936 and the Indian cricket team's first test victory in 1952
						against England. The 1986 India-Australia match held at Chepauk
						was only the second ever Tied Test in the history of the game.</p>
					<a href="#" class="btn btn-primary mt-3"> <em
						class="bi bi-chevron-right"></em>Read More
					</a>
				</div>
			</div>
		</div>
	</section>



	<section id="stadium" data-aos="zoom-in" class="p-5 bg-dark text-light">

		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-md">
					<img src="assets/image/Wankhede.jpg" class="img-fluid" alt="">
				</div>
				<div class="col-md p-5">
					<h2>Wankhede Stadium</h2>
					<p class="lead">The Wankhede Stadium is an international
						cricket stadium in Mumbai, India. The stadium now has a capacity
						of 33,108, following renovations for the 2011 Cricket World Cup.
						Before the upgrade, the capacity was approximately 45,000.</p>
					<p>The stadium has been host to numerous high-profile cricket
						matches in the past, most notably the 2011 Cricket World Cup
						Final, in which India defeated Sri Lanka and became the first
						country to win the cricket world cup on home soil. The stadium
						played host to the last match of Sachin Tendulkar's international
						career. Additionally, it hosted many matches during the 1996 and
						2011 Cricket World Cups. The stadium also played host to the match
						in which Ravi Shastri hit six sixes in an over.</p>
					<a href="#" class="btn btn-primary mt-3"> <em
						class="bi bi-chevron-right"></em>Read More
					</a>
				</div>
			</div>
		</div>
	</section>

	<section data-aos="zoom-out" id="ins" class="p-5 bg-primary">
		<div class="container">
			<h2 class="text-center text-white">Our Instructors</h2>
			<p class="lead text-center text-white mb-5">Our Instructors All
				Have 10+ years working as a web devloper in the Industry</p>
			<div class="row g-4">
				<div class="col-md-6 col-lg-3">
					<div data-aos="flip-right" data-aos-easing="linear"
						data-aos-duration="2000" class="card bg-light">

						<div class="card-body text-center">
							<img class="mb-3 w-100" src="assets/image/stevOliver.jpg" alt="">
							<h3 class="card-title mb-3">Oliver Queen</h3>

							<a href="#"><em class="bi bi-twitter text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-facebook text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-instagram text-dark mx-1"></em></a>
						</div>
					</div>
				</div>


				<div class="col-md-6 col-lg-3">
					<div data-aos="flip-right" data-aos-easing="linear"
						data-aos-duration="2000" class="card bg-light">

						<div class="card-body text-center">
							<img class="mb-3 w-100" src="assets/image/rachal.jpg" alt="">
							<h3 class="card-title mb-3">Rachel Green</h3>

							<a href="#"><em class="bi bi-twitter text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-facebook text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-linkedin text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-instagram text-dark mx-1"></em></a>
						</div>
					</div>
				</div>



				<div class="col-md-6 col-lg-3">
					<div data-aos="flip-right" data-aos-easing="linear"
						data-aos-duration="2000" class="card bg-light">

						<div class="card-body text-center">
							<img class="mb-3 w-100" src="assets/image/tomPeter.jpg" alt="">
							<h3 class="card-title mb-3">Peter Parker</h3>

							<a href="#"><em class="bi bi-twitter text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-facebook text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-linkedin text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-instagram text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-google text-dark mx-1"></em></a>
						</div>
					</div>
				</div>


				<div class="col-md-6 col-lg-3">
					<div data-aos="flip-right" data-aos-easing="linear"
						data-aos-duration="2000" class="card bg-light">

						<div class="card-body text-center">
							<img class="mb-3 w-100" src="assets/image/steave.jpg" alt="">
							<h3 class="card-title mb-3">Steve Rogers</h3>


							<a href="#"><em class="bi bi-facebook text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-linkedin text-dark mx-1"></em></a> <a
								href="#"><em class="bi bi-google text-dark mx-1"></em></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<section data-aos="zoom-out-down" class="p-5 ">
		<div class="container">
			<div class="row g-4">
				<div class="col-md">
					<h2 class="text-center mb-4">Contact Info</h2>
					<ul class="list-group list-group-flush lead">
						<li class="list-group-item"><span class="fw-bold">Main
								Location:</span> Sivakasi,Virudhunagar</li>
						<li class="list-group-item"><span class="fw-bold">Enrollment
								Email:</span> matchbooking@gmail.com</li>
						<li class="list-group-item"><span class="fw-bold">Enrollment
								Phone:</span> 8098264081</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<footer data-aos="flip-up"
		class="p-5 bg-dark text-white text-center position-relative">
		<div class="container">
			<p class="lead">Copyright &copy; 2022 MatchBooking.com</p>
			<a href="#" class="position-absolute bottom-0 end-0 p-5"> <em
				class="bi bi-arrow-up-circle h1"></em>
			</a>
		</div>
	</footer>


	<div class="modal fade" id="enroll" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Login Form</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">

					<div id="login">

						<form action="loginServe" onsubmit="return validate()"
							method="post">

							<input type="text" id="uname" name="username"
								placeholder="Username" aria-label="Username" /> <br> <label
								id="luser" style="color: red; visibility: hidden;">Enter
								Username</label> <br> <input type="password" id="pass"
								name="password" placeholder="Password" aria-label="Password" />
							<br> <label id="lpass"
								style="color: red; visibility: hidden;">Enter Password</label> <br>
							<br>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Submit</button>
							<br> <br> <em data-bs-toggle="modal"
								data-bs-target="#register">Don't Have An Account...??</em>
						</form>

					</div>
				</div>


			</div>
		</div>
	</div>


	<div class="modal fade" id="register" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Register Form</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="regs">
						<form action="regSevr" method="get" onsubmit="return  reg()"
							method="post">

							<input type="text" id="name" name="name"
								placeholder="Enter Your Name" aria-label="name"> <br />
							<label id="lname" style="visibility: hidden;">Enter Your
								Name</label> <br /> <input type="text" onkeyup="userName()" id="runame"
								name="uname" placeholder="Enter Your Username"
								aria-label="Username"> <br /> <label for="username"
								id="luname" style="visibility: hidden;">Enter Your
								Username</label> <br> <input type="password" name="pass" id="rpass"
								placeholder="Enter Your Password" aria-label="Password">
							<br /> <label id="repass" style="visibility: hidden;">Enter
								Password</label> <br> <input type="email" aria-label="Email"
								onkeyup="sendemail()" id="mail" name="mail"
								placeholder="Enter Your E-mail"> <br> <label
								id="lmail" style="visibility: hidden;">Enter Your E-Mail</label>
							<br> <input type="number" onkeyup="verifyMobile()"
								name="phone" id="phone" aria-label="Mobile Numbe"
								placeholder="Enter Your Mobile Number"> <br> <label
								id="mobile" style="visibility: hidden;">Enter Mobile
								Number</label> <br> <br> <br>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Submit</button>
							<br> <br> <em data-bs-toggle="modal"
								data-bs-target="#enroll">Already Have An Account..??</em>
						</form>

					</div>
				</div>


			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity=''></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity=''></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js" integrity=''></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"
		integrity=''></script>
</body>

</html>
<script src="assets/js/index.js"></script>