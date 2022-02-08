function update(){
    document.getElementById("update").style.visibility="visible";

	}

	function validate() {

		var name = document.getElementById("updateName");
		var username = document.getElementById("updateUsername");
		var password = document.getElementById("updatePassword");
		var email = document.getElementById("updateEmail");
		var phonenumber = document.getElementById("updateNumber");

		var passExpression = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$/;
		var emailExpression = /[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}$/;
		var mobileExpression = /[6-9]\d{9}$/;

		if (name.value.trim() == "") {
			document.getElementById("uname").style.visibility = "visible";
			document.getElementById("uname").style.color = "red";
			return false;
		} else if (name.value.trim().length < 5) {
			document.getElementById("uname").style.visibility = "visible";
			document.getElementById("uname").style.color = "red";
			document.getElementById("uname").innerHTML = 'Name Too Short';
			return false;
		} else if (username.value.trim() == "") {
			document.getElementById("username").style.visibility = "visible";
			document.getElementById("username").style.color = "red";
			return false;
		} else if (username.value.trim().length< 5) {
			document.getElementById("username").style.visibility = "visible";
			document.getElementById("username").style.color = "red";
			document.getElementById("username").innerHTML = "Username Too Short";
			return false;
		} else if (password.value.trim()=="") {

			document.getElementById("lpass").style.color = "red";
			document.getElementById("lpass").style.visibility = "visible";
			return false;
		} else if (password.value.trim().length< 5) {

			document.getElementById("lpass").style.visibility = "visible";
			document.getElementById("lpass").style.color = "red";
			document.getElementById("lpass").innerHTML = "Password Too Short";
			return false;
		}
		
		else if (!passExpression .test(password.value) ) {
			document.getElementById("lpass").style.visibility = "visible";
			document.getElementById("lpass").style.color = "red";
			document.getElementById("lpass").innerHTML = "Invalid Password Format";

			return false;
		}

		else if (email.value.trim() == "") {
			document.getElementById("lmail").style.visibility = "visible";
			document.getElementById("lmail").style.color = "red";

			return false;
		} else if (!emailExpression.test(email.value)) {
			document.getElementById("lmail").style.visibility = "visible";
			document.getElementById("lmail").style.color = "red";
			document.getElementById("lmail").innerHTML = "Invalid Email Format";

			return false;
		}

		else if (phonenumber.value.trim() == "") {
			document.getElementById("mobile").style.visibility = "visible";
			document.getElementById("mobile").style.color = "red";

			return false;
		}

		else if (!mobileExpression.test(phonenumber.value)) {
			document.getElementById("mobile").innerHTML = "Invalid Number";
			document.getElementById("mobile").style.visibility = "visible";
			document.getElementById("mobile").style.color = "red";
			return false;
		} else if (mobileExpression.test(phonenumber.value)
				&& emailExpression.test(email.value) && passExpression .test(password.value)) {
			return true;
		}

	}
	
	 function profile(){
	        document.getElementById("profilepicForm").style.visibility="visible";
	        document.getElementById("edit").style.visibility="hidden";
	    }