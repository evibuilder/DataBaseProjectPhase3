<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*" import="cs5530.CS5530.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script  LANGUAGE="javascript">
function check_all_fields(username_form, password_form, firstname_form, lastname_form, address_form, number_form){
	
	if( username_form.usernameAttributeValue.value == "" || password_form.passwordAattributeValue.value == "" ||
			firstname_form.firstnameAttributeValue.value == "" || lastname_form.lastnameAttributeValue.value == "" ||
			address_form.addressAttributeValue.value == "" || number_form.numberAttributeValue.value == ""){
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
	String usernameAttribute = request.getParameter("usernameAttribute");
	if(usernameAttribute == null){
		
		out.println("The value of username is: " + usernameAttribute);
	%>
		<BR>
		Username:
		<form name="form_username">
			<input type=hidden name="usernameAttribute" value="login">
			<input type=text name="usernameAttributeValue" length=10>
		</form>
		<BR>
		
		Password:
			<form name="form_password">
			<input type=hidden name="passwordAttribute" value="password">
			<input type=text name="passwordAttributeValue" length=10>
		</form>
		<BR>
		
		First Name:
			<form name="form_firstname">
			<input type=hidden name="firstnameAttribute" value="firstname">
			<input type=text name="firstnameAttributeValue" length=10>
		</form>
		<BR>
		
		Last Name:
			<form name="form_lastname">
			<input type=hidden name="lastnameAttribute" value="lastname">
			<input type=text name="lastnameAttributeValue" length=10>
		</form>
		<BR>
		
		Address:
			<form name="form_address">
			<input type=hidden name="addressAttribute" value="address">
			<input type=text name="addressAttributeValue" length=10>
		</form>
		<BR>
		
		Phone Number:
			<form name="form_number" method=get onsubmit="return check_all_fields(form_username, this)" action="registration.jsp">
			<input type=hidden name="numberAttribute" value="number">
			<input type=text name="numberAttributeValue" length=10>
			<input type=submit class="register" value="register">
		</form>
		<BR>
		
	<%
	}else{
		out.println("The value of username is: " + usernameAttribute);
		
		String passwordAttribute = request.getParameter("passwordAttribute");
		String firstnameAttribute = request.getParameter("firstnameAttribute");
		String lastnameAttribute = request.getParameter("lastnameAttribute");
		String addressAttribute = request.getParameter("addressAttribute");
		String numberAttribute = request.getParameter("numberAttribute");
		
		Connector con = new Connector();
		Users user = new Users();
		
		if(user.registerNewUser(usernameAttribute, passwordAttribute, firstnameAttribute, lastnameAttribute, addressAttribute, numberAttribute, con.stmt)){
			//load the login index page
			%> <a href="login.jsp">Login</a> <%
		}else{
			%> didn't work <%
			//clear parameters
			//reload current page
		}
		
		con.closeConnection();
	}
	%>

<a href="index.html">back</a>
</body>
</html>