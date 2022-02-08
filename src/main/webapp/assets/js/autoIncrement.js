   var speed = 5;
    function incEltNbr(id) {
    	 var elt = document.getElementById(id);
    	 var endNbr = Number(document.getElementById(id).innerHTML);
    	  incNbrRec(0, endNbr, elt);
    	}

    	function incNbrRec(i, endNbr, elt) {
    	  if (i <= endNbr) {
    	    elt.innerHTML = i;
    	    setTimeout(function() {
    	      incNbrRec(i + 10, endNbr, elt);
    	    }, speed);
    	  }
    	}

    	function incNbr(){
    	  incEltNbr("nbr");
    	}

    	incEltNbr("nbr");