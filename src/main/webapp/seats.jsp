<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="stadium booking,seat booking,stadium seat booking,match ticket booking">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel = "icon" type = "" href = "assets/image/stadiumLogo.png">
<title>Matchbooking.com</title>         
<link rel="stylesheet" href="assets/css/seats.css">

</head>


<body>

<div id="nav">

        <ul>
         
            <strong id="logo"> MatchBooking</strong>
            
      <li><a href="index.jsp">Logout</a></li>
            <li>&nbsp; &nbsp;</li>
            <li>
            <a href="userHome.jsp">Home</a>
            </li>
            
           
          
          
        </ul>
        <strong class="page-title">Seat Booking</strong>
    </div>
   <br/><br/><br/>
	<div id="pickSeats">
<div id="matchContrainer">
			<div class="mathcInfo">
				<div>
					<img src="assets/image/${match.teamAlogo}" alt="teamA logo"> <strong
						id="Vs">Vs</strong> <img src="assets/image/${match.teamBlogo}"
						alt="can't find" id="temaBLogo"> <br/> <br/> <strong
						id="teamA">${match.teamA}</strong> <strong id="teamB">${match.teamB}</strong>
					<br>
				</div>
				<br>
				<div id="matchDetails">
					<strong>${match.stadiumName}</strong> <strong>${match.location}</strong>
					<br>
					<fmt:parseDate value="${match.matchDate}" pattern="yyyy-MM-dd"
						var="macthDate" type="date" />
					<br>
					<fmt:formatDate pattern="dd/MM/yyyy" value="${macthDate}" />
					&nbsp; &nbsp; ${match.matchTime} <br>
				</div>
			</div>
			<br>.
			<br>
			<label><strong>Available Seats:</strong>${match.availableSeats}</label>
			<div class="stadium-container">
				<form action="booking">
					<input type="hidden"    id="matchId" value="${match.matchId}"
						name="matchIds"  min="1"> <br> <label for="ticketNumber"><strong>Seat
							Number:</strong></label> <input type="text" id="ticketNumber" name="ticketNumber" readonly="readonly">

					<label for="seatsCategory"><strong>Pick a Seat Category:</strong></label> 
					<select	id="seatsCategory" name="seatsCategory" required="required">
						<option disabled="disabled" value="">--Select--</option>
						<option value="${match.firstClassSeatsPrice}">FirstClass (Rs.${match.firstClassSeatsPrice})</option>
						<option value="${match.secondClassSeatsPrice}">Second Class(Rs.${match.secondClassSeatsPrice})</option>
					</select>
						
				 <input type="hidden" id="category" name="category"> <br> 
					<input type="hidden" id="checkFclass" 	value="${match.firstClassSeatsPrice}">
					<input type="hidden" id="checkSclass"	value="${match.secondClassSeatsPrice}"> <br> 
					<label for="count">	<strong>Number Of Tickets:</strong></label>
					<input type="number" id="count" name="seatCounts" min="1" max="100" required>
					   &nbsp;&nbsp;&nbsp;
				    <label for="total"><strong>Total Price (Rs):</strong></label> 
					<input	type="number" id="total" name="totalprice"> <br>
					<br>

					<button type="submit" onmouseover="check()">Pay</button>
					<br/>
	
				</form>
			
			</div>
			

	</div>
<ul class="showcase">
			<li>
				<div class="seat"></div> <small>N/A</small>
			</li>
			<li>
				<div class="seat selected"></div> <small>Selected</small>
			</li>
			<li>
				<div class="seat occupied"></div> <small>Occupied</small>
			</li>
		</ul>
		<div class="container">


			<div class="row">
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
			</div>
			<div class="row">
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
			</div>
			<div class="row">
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
			</div>
			<div class="row">
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
			</div>
			<div class="row">
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
			</div>
			<div class="row">
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat"></div>
				<div class="seat occupied"></div>
				<div class="seat occupied"></div>
			</div>
		</div>

	</div>
</body>
</html>

<script src="assets/js/seats.js"></script>