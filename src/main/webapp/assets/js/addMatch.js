
    function spname(){
     
    var select=document.getElementById("spname");
    var event=document.getElementById("event");
    var teamA=document.getElementById("teamA");
    var teamB=document.getElementById("teamB");



   if(select.options[select.selectedIndex].value=="Cricket" &&
     event.options[event.selectedIndex].value=="IPL"){

	
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
        
        if(teamA_Value[teamA_Value.selectedIndex].value == teamB_Value.options[teamB_Value.selectedIndex].value)
        {
        alert( teamA_Value[teamA_Value.selectedIndex].value +" Team Can't be Selected in both Team A & Team B ");
        return false;
        }


    }