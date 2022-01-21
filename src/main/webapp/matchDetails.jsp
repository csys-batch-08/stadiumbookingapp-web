<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
   <%@page import="java.sql.ResultSet"%>
   <%@page import="com.stadiumbooking.daoimpl.SportsDaoImpl" %>
   <%@page import="com.stadiumbooking.daoimpl.StadiumDaoImpl" %>
<%
MatchDaoImpl matchDao=new MatchDaoImpl();
ResultSet rs=matchDao.getDate();

SportsDaoImpl sportsDao=new SportsDaoImpl();
ResultSet sportsRS=sportsDao.getAllSports();

StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
ResultSet stadiumRs=stadiumDao.getAllStadiumList();
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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



        #Form{
            position: absolute;
            top: 30PX;
            left: 500px;
        }
        #From input{
            width: 150px;
        }
        #From select{
            width: 150px;
        }
        #spname{
            width: 150px;
            position: relative;
            left: 35px;
        }
        #dateinput{
            position: relative;
            left: -5px;
        }
        .teamA{
            width: 150px;
            position: absolute;
            left: 140px;
        }
        .teamB{
            width: 150px;
            position: absolute;
            left: 140px;
        }
        #event{
            width: 150px;
            position: relative;
            left: 85px;
        }

        #teamAlogo, #teamBlogo{
            position: relative;
            left: 50px;
        }

        #seats{
            width: 100px;
            position: relative;
            left: 15px;
        }

        #fclass{
            width: 100px;
            position: relative;
            left: 25px;
        }

        #sclass{
            width: 100px;
            position: relative;
            left: 10px;
        }
    </style>
</head>
<body>


    <div class="sidenav">
         <a href="adminProfile.jsp">Profile</a>
        <a href="matchDetails.jsp">Match Details</a>
        <a href="stadiumDetalis.jsp">Stadium Details</a>
        <a href="sportsDetalis.jsp">Sports Details</a>
        <a href="Getallusers.jsp?deleteId=0">All User</a>
        <a href="showMatchToAdmin.jsp">All Match Details</a>
        <a href="allBookingDetails.jsp">Booking Details</a>
        <a href="allUserWalletList.jsp">All User Wallet List</a>
        <a href="stadiumList.jsp">Stadium List</a>
        <a href="ratingList.jsp">Rating List</a>
        <a href="index.jsp">Logout</a>
    </div>

    <div id="Form">
    <form action="matchServe" onsubmit="return sports()" >
        <label for="stadoumName"><b>Stadoum Name:</b></label>
        <select name="stdname" placeholder="Enter Stadium Name" style="position: relative; left: 20px;">
        <option >--Select--</option>
        <%while(stadiumRs.next()){ %>
        <option value="<%=stadiumRs.getString(2)%>"><%=stadiumRs.getString(2)%></option>
       <%} %>
        </select>
        <br> <br>
        <label for="Sports Name"><b>Sports Name:</b></label>
        <select name="spname" id="spname">
            <option value="">--Select--</option>
            <option value="Cricket">Cricket</option>
            <option value="Football">Football</option>
        </select>
        <br> <br>
        <label for="event"><b>Event:</b></label>
        <select name="event" id="event" >
            <option>--Select--</option>
           <%while(sportsRS.next()) { %>
           <option value="<%=sportsRS.getString(3)%>"><%=sportsRS.getString(3) %></option>
            <%} %>

        </select>
        <br> <br>

        <label for="location"><b>Location:</b></label>
        <select  name="location" id="location" style="position: relative; left: 65px; width: 150px;">
            <option value="">--Select Location--</option>
            <option value="Chennai">Chennai</option>
            <option value="Kolkata">Kolkata</option>
            <option value="Bengalur">Bengalur</option>
            <option value="Mumbai">Mumbai</option>
            <option value="Dehli">Dehli</option>
            <option value="Ahmedabad">Ahmedabad</option>
            <option value="Hyderabad">Hyderabad</option>
        </select>
        <br> <br>
        <%if(rs.next()){ %>
        
        <label for="date"><b>Date:</b></label>
        <input type="date" id="dateinput" name="matchDate" min="<%=rs.getDate(1) %>"   placeholder="Select Date" style="position: relative; left: 95px;" required>
        <%} %>
        <br> <br>
        <label><b>Time:</b></label>
        <input type="time" name="time" id="time"  min="09:00" max="20:00" style="position: relative; left: 95px; width:145px " required >
        <br>
        <br>
        
        
        <div>


        <label for="teamA" onmouseover="spname()"><b>Team A:</b></label> 
        <select name="teamA" id="teamA" class="teamA" >
            <option value="">--Select--</option>
            <option value="CSK">CSK</option>
            <option value="MI">MI</option>
            <option value="RCB">RCB</option>
            <option value="DC">DC</option>
            <option value="SRH">SRH</option>
            <option value="RR">RR</option>
            <option value="PBKS">PBKS</option>
            <option value="KKR">KKR</option>
           
            <option value="India">India</option>
            <option value="England">England</option>
            <option value="Australia">Australia</option>
            <option value="West Indies">West Indies</option>
            <option value="New Zealand">New Zealand</option>
            <option value="Bangladesh">Bangladesh</option>
            <option value="Pakistan">Pakistan</option>
            <option value="Sri Lanka">Sri Lanka</option>
          
            <option value="Chennaiyin FC">Chennaiyin FC</option>
            <option value="FC Goa">FC Goa</option>
            <option value="Kerala Blasters FC">Kerala Blasters FC</option>
            <option value="Bengalur FC">Bengalur FC</option>
            <option value="ATK Mohun Bagan FC">ATK Mohun Bagan FC</option>
            <option value="SC East Bengal">SC East Bengal</option>
            <option value="Mumbai City FC">Mumbai City FC</option>
            <option value="Sri Lanka">Odisha FC</option>
            <option value="Hyderabad FC">Hyderabad FC</option>
            <option value="ATK">ATK</option>
        </select> 
      
      
        <br> <br>
        &nbsp;
        <b>VS</b>
        &nbsp;
        <br><br>
        <label for="teamB"><b>Team B:</b></label>
         <select name="teamB" class="teamB" id="teamB">
            <option value="">--Select--</option>
            <option value="CSK">CSK</option>
            <option value="MI">MI</option>
            <option value="RCB">RCB</option>
            <option value="DC">DC</option>
            <option value="SRH">SRH</option>
            <option value="RR">RR</option>
            <option value="PBKS">PBKS</option>
            <option value="KKR">KKR</option>
           
            <option value="India">India</option>
            <option value="England">England</option>
            <option value="Australia">Australia</option>
            <option value="West Indies">West Indies</option>
            <option value="New Zealand">New Zealand</option>
            <option value="Bangladesh">Bangladesh</option>
            <option value="Pakistan">Pakistan</option>
            <option value="Sri Lanka">Sri Lanka</option>
           
            <option value="Chennaiyin FC">Chennaiyin FC</option>
            <option value="FC Goa">FC Goa</option>
            <option value="Kerala Blasters FC">Kerala Blasters FC</option>
            <option value="Bengalur FC">Bengalur FC</option>
            <option value="ATK Mohun Bagan FC">ATK Mohun Bagan FC</option>
            <option value="SC East Bengal">SC East Bengal</option>
            <option value="Mumbai City FC">Mumbai City FC</option>
            <option value="Sri Lanka">Odisha FC</option>
            <option value="Hyderabad FC">Hyderabad FC</option>
            <option value="ATK">ATK</option>
        </select>

        <br>
        <br>
    </div>
       
    
    
    
    <label for="teamAimg"><b>Team A logo </b></label>
        <input type="file" name="teamAlogo" id="teamAlogo" style="position: relative; left: 55px; width:145px ">
        <br> <br>
        <label for="tramBimg"><b>Team B logo</b></label>
        <input type="file" name="teamBlogo" id="teamBlogo" style="position: relative; left: 55px; width:145px ">
        <br> <br>
        <label for="numberseats"><b>Number Of Seats:</b></label>
        <select name="totalSeats" id="seats" style="position: relative; left: 15px; width:145px ">
            <option value="200">200</option>
            <option value="300">300</option>
            <option value="400">400</option>
            <option value="500">500</option>
        </select>
        <br> <br>
         <label for="availseats"><b>Available Seats: </b></label>
        <select name="availseats" id="seat" style="position: relative; left: 30px; width:145px ">
            <option value="">--Select--</option>
            <option value="100">100</option>
            <option value="125">125</option>
            <option value="150">150</option>
            <option value="200">200</option>
        </select>
        <br> <br>
        <label for="firstClass"><b>First Class Rate:</b></label>
        <select name="firstClass" id="fclass" >
            <option value="1000">1000Rs</option>
            <option value="1500">1500Rs</option>
            <option value="2000">2000Rs</option>
            <option value="2500">2500Rs</option>
        </select>

        <br> <br>
        <label for="secondClass"><b>Second Class Rate:</b></label>
        <select name="secondClass" id="sclass">
            <option value="500">500Rs</option>
            <option value="700">700Rs</option>
            <option value="900">900Rs</option>
            <option value="1000">1000Rs</option>
        </select>
        <br> <br> <br>

        <button  type="submit">Submit</button> &nbsp; &nbsp; <button type="reset">Reset</button>
    </form>

</div>
</body>
</html>


<script>
  
    function spname(){
       // console.log("match details working");
    var select=document.getElementById("spname");
    var event=document.getElementById("event");
    var teamA=document.getElementById("teamA");
    var teamB=document.getElementById("teamB");



   if(select.options[select.selectedIndex].value=="Cricket" &&
     event.options[event.selectedIndex].value=="IPL"){

	   //console.log("team selecting working");
	   teamA.options[1].style.display = 'block';
        teamA.options[2].style.display = 'block';
        teamA.options[3].style.display = 'block';
        teamA.options[4].style.display = 'block';
        teamA.options[5].style.display = 'block';
        teamA.options[6].style.display = 'block';
        teamA.options[7].style.display = 'block';
        teamA.options[8].style.display = 'block';

        teamA.options[9].style.display = 'none';
        teamA.options[10].style.display = 'none';
        teamA.options[11].style.display = 'none';
        teamA.options[12].style.display = 'none';
        teamA.options[13].style.display = 'none';
        teamA.options[14].style.display = 'none';
        teamA.options[15].style.display = 'none';
        teamA.options[16].style.display = 'none';

        teamA.options[17].style.display = 'none';
        teamA.options[18].style.display = 'none';
        teamA.options[19].style.display = 'none';
        teamA.options[20].style.display = 'none';
        teamA.options[21].style.display = 'none';
        teamA.options[22].style.display = 'none';
        teamA.options[23].style.display = 'none';
        teamA.options[24].style.display = 'none';
        teamA.options[25].style.display = 'none';
        teamA.options[26].style.display = 'none';
      

        teamB.options[1].style.display = 'block';
        teamB.options[2].style.display = 'block';
        teamB.options[3].style.display = 'block';
        teamB.options[4].style.display = 'block';
        teamB.options[5].style.display = 'block';
        teamB.options[6].style.display = 'block';
        teamB.options[7].style.display = 'block';
        teamB.options[8].style.display = 'block';

        teamB.options[9].style.display = 'none';
        teamB.options[10].style.display = 'none';
        teamB.options[11].style.display = 'none';
        teamB.options[12].style.display = 'none';
        teamB.options[13].style.display = 'none';
        teamB.options[14].style.display = 'none';
        teamB.options[15].style.display = 'none';
        teamB.options[16].style.display = 'none';

        teamB.options[17].style.display = 'none';
        teamB.options[18].style.display = 'none';
        teamB.options[19].style.display = 'none';
        teamB.options[20].style.display = 'none';
        teamB.options[21].style.display = 'none';
        teamB.options[22].style.display = 'none';
        teamB.options[23].style.display = 'none';
        teamB.options[24].style.display = 'none';
        teamB.options[25].style.display = 'none';
        teamB.options[26].style.display = 'none';
       
   }
   
   
    else if(select.options[select.selectedIndex].value=="Cricket" &&
     event.options[event.selectedIndex].value=="ICC World CUP"){

        teamA.options[1].style.display = 'none';
        teamA.options[2].style.display = 'none';
        teamA.options[3].style.display = 'none';
        teamA.options[4].style.display = 'none';
        teamA.options[5].style.display = 'none';
        teamA.options[6].style.display = 'none';
        teamA.options[7].style.display = 'none';
        teamA.options[8].style.display = 'none';
        
        teamA.options[9].style.display = 'block';
        teamA.options[10].style.display = 'block';
        teamA.options[11].style.display = 'block';
        teamA.options[12].style.display = 'block';
        teamA.options[13].style.display = 'block';
        teamA.options[14].style.display = 'block';
        teamA.options[15].style.display = 'block';
        teamA.options[16].style.display = 'block';

        teamA.options[17].style.display = 'none';
        teamA.options[18].style.display = 'none';
        teamA.options[19].style.display = 'none';
        teamA.options[20].style.display = 'none';
        teamA.options[21].style.display = 'none';
        teamA.options[22].style.display = 'none';
        teamA.options[23].style.display = 'none';
        teamA.options[24].style.display = 'none';
        teamA.options[25].style.display = 'none';
        teamA.options[26].style.display = 'none';

        teamB.options[1].style.display = 'none';
        teamB.options[2].style.display = 'none';
        teamB.options[3].style.display = 'none';
        teamB.options[4].style.display = 'none';
        teamB.options[5].style.display = 'none';
        teamB.options[6].style.display = 'none';
        teamB.options[7].style.display = 'none';
        teamB.options[8].style.display = 'none';
        
        teamB.options[9].style.display = 'block';
        teamB.options[10].style.display = 'block';
        teamB.options[11].style.display = 'block';
        teamB.options[12].style.display = 'block';
        teamB.options[13].style.display = 'block';
        teamB.options[14].style.display = 'block';
        teamB.options[15].style.display = 'block';
        teamB.options[16].style.display = 'block';

        teamB.options[17].style.display = 'none';
        teamB.options[18].style.display = 'none';
        teamB.options[19].style.display = 'none';
        teamB.options[20].style.display = 'none';
        teamB.options[21].style.display = 'none';
        teamB.options[22].style.display = 'none';
        teamB.options[23].style.display = 'none';
        teamB.options[24].style.display = 'none';
        teamB.options[25].style.display = 'none';
        teamB.options[26].style.display = 'none';

   
    }
    else if(select.options[select.selectedIndex].value=="Football" &&
     event.options[event.selectedIndex].value=="ISL"){

        teamA.options[1].style.display = 'none';
        teamA.options[2].style.display = 'none';
        teamA.options[3].style.display = 'none';
        teamA.options[4].style.display = 'none';
        teamA.options[5].style.display = 'none';
        teamA.options[6].style.display = 'none';
        teamA.options[7].style.display = 'none';
        teamA.options[8].style.display = 'none';
        
        teamA.options[9].style.display = 'none';
        teamA.options[10].style.display = 'none';
        teamA.options[11].style.display = 'none';
        teamA.options[12].style.display = 'none';
        teamA.options[13].style.display = 'none';
        teamA.options[14].style.display = 'none';
        teamA.options[15].style.display = 'none';
        teamA.options[16].style.display = 'none';

        teamA.options[17].style.display = 'block';
        teamA.options[18].style.display = 'block';
        teamA.options[19].style.display = 'block';
        teamA.options[20].style.display = 'block';
        teamA.options[21].style.display = 'block';
        teamA.options[22].style.display = 'block';
        teamA.options[23].style.display = 'block';
        teamA.options[24].style.display = 'block';
        teamA.options[25].style.display = 'block';
        teamA.options[26].style.display = 'block';

        teamB.options[1].style.display = 'none';
        teamB.options[2].style.display = 'none';
        teamB.options[3].style.display = 'none';
        teamB.options[4].style.display = 'none';
        teamB.options[5].style.display = 'none';
        teamB.options[6].style.display = 'none';
        teamB.options[7].style.display = 'none';
        teamB.options[8].style.display = 'none';
        
        teamB.options[9].style.display = 'none';
        teamB.options[10].style.display = 'none';
        teamB.options[11].style.display = 'none';
        teamB.options[12].style.display = 'none';
        teamB.options[13].style.display = 'none';
        teamB.options[14].style.display = 'none';
        teamB.options[15].style.display = 'none';
        teamB.options[16].style.display = 'none';

        teamB.options[17].style.display = 'block';
        teamB.options[18].style.display = 'block';
        teamB.options[19].style.display = 'block';
        teamB.options[20].style.display = 'block';
        teamB.options[21].style.display = 'block';
        teamB.options[22].style.display = 'block';
        teamB.options[23].style.display = 'block';
        teamB.options[24].style.display = 'block';
        teamB.options[25].style.display = 'block';
        teamB.options[26].style.display = 'block';
     
    }

   
    }

    function sports(){

        
    var teamA_Value=document.getElementById("teamA");
    var teamB_Value=document.getElementById("teamB");
    
        
    
        //console.log(teamA_Value[teamA_Value.selectedIndex].value );
        //console.log(teamB_Value[teamB_Value.selectedIndex].value);
        
        if(teamA_Value[teamA_Value.selectedIndex].value == teamB_Value.options[teamB_Value.selectedIndex].value)
        {
        alert( teamA_Value[teamA_Value.selectedIndex].value +" Team Can't be Selected in both Team A & Team B ");
        return false;
        }


    }
</script>