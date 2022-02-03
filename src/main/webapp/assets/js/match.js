
function Error(){
	 document.getElementById("Emesg").style.visibility="hidden";
	 }

function Errors()
{
	 document.getElementById("EmMesg").style.visibility="hidden";
	 }
	 
	 
var width=100;
var diff=2;
var setInter=0;
function inc(){

    clearInterval(setInter);
  setInter=setInterval(zoomIn,20);
}

function zoomIn(){
   if(width<100){
       width=width+diff;
       document.getElementById("gifImage").style.width=width+"px";
       document.getElementById("gifImage").style.height=width+"px";
      
   }
   else{
       clearInterval(setInter);
   }
}

function dec(){

    clearInterval(setInter);
    setInter=setInterval(zoomOut,20);
}
function zoomOut(){
    if(width>50){
       width=width-diff;
       document.getElementById("gifImage").style.width=width+"px";
       document.getElementById("gifImage").style.height=width+"px";
   }
   else{
       clearInterval(setInter);
   }
}
