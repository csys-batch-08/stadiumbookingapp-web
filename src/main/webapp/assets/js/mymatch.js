function cancleTickets(ticketId) {
	 Swal.fire({
		
		 title: "Are you sure about?",
	 text: "if you cancel it, 10% amount will be deduct..!",
		    type: "info",
		    showCancelButton: true,
		    confirmButtonText: "Yes, cancle it!",
		    confirmButtonColor: "#ff0055",
		    cancelButtonColor: "#999999",
            cancelButtonText:"No.!",
		    focusConfirm: false,
		    focusCancel: true
		}).then((result) => {
		  if (result.isConfirmed) {
		    window.location.replace("cancleTicket?info=&ticketId=" +ticketId);
		  }
		})
}