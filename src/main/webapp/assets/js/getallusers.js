function confirmdelete(userId, name) {
	Swal.fire({

		title: "Are you sure about?",
		text: "deleting  user " + name+ "..!",
		type: "info",
		showCancelButton: true,
		confirmButtonText: "Yes, delete it!",
		confirmButtonColor: "#ff0055",
		cancelButtonColor: "#999999",
		focusConfirm: false,
		focusCancel: true
	}).then((result) => {
		if (result.isConfirmed) {
			window.location.replace("deleteUser?info=&userId=" + userId);
		}
	})
}