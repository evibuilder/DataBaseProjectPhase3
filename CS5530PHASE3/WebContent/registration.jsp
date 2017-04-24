<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*" import="cs5530.CS5530.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script  LANGUAGE="javascript">
function check_all_fields(form){
	
	if( form.usernameValue.value == "" || form.passwordValue.value == "" ||
			form.firstnameValue.value == "" || form.lastnameValue.value == "" ||
			form.addressValue.value == "" || form.phoneValue.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script>

<title>Register New User</title>
</head>
<body>
<h1>Register New User</h1>
	<%
	String username = request.getParameter("usernameValue");
	if(username == null){
	%>
		<BR>
		Please enter the following information to register a new user:
		<BR>
			<form name="newuser_form" method=get onsubmit="return check_all_fields(this)" action="registration.jsp">
			<input type=text name="usernameValue" length=10 placeholder="username">
			<input type=text name="passwordValue" length=10 placeholder="password">
			<input type=text name="firstnameValue" length=10 placeholder="first name">
			<input type=text name="lastnameValue" length=10 placeholder="last name">
			<input type=text name="addressValue" length=10 placeholder="address">
			<input type=text name="phoneValue" length=10 placeholder="phone #">
			<input type=submit class="register" value="register">
		</form>
		<BR>

	<%
	}else{
		
		String password = request.getParameter("passwordValue");
		String firstname = request.getParameter("firstnameValue");
		String lastname = request.getParameter("lastnameValue");
		String address = request.getParameter("addressValue");
		String phone = request.getParameter("phoneValue");
		
		Connector con = new Connector();
		Users user = new Users();
		
		if(user.registerNewUser(username, password, firstname, lastname, address, phone, con.stmt)){
			//load the login index page
			%> <BR> Registration was successful <BR> 
			<a href="login.jsp">Login</a> <%
		}else{
			%> <BR> Registration was not successful <BR>
			<a href="index.html">back</a> <%
			//clear parameters
			//reload current page
		}
		
		con.closeConnection();
	}
	%>


</body>
</html>