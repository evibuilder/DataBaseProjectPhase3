<%@ page language="java" import="cs5530.*" %>

<html>
<head>
<script LANGUAGE="javascript">

function check_all_fields(username_form, password_form){
	//alert(username_form.usernameAttribute.value+"='"+username_form.usernameAttributeValue.value+"'");
	//alert(password_form.passwordAttribute.value+"='"+password_form.passwordAattributeValue.value+"'");

	if( username_form.usernameAttributeValue.value == "" || password_form.passwordAattributeValue.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}

</script> 
<title>Login Page</title>
</head>
<body>
	<h1>Login Page</h1>

	<%
	String usernameAttribute = request.getParameter("usernameAttribute");
	if(usernameAttribute == null){
	%>

	Username:
	<form name="form_username">
		<input type=hidden name="usernameAttribute" value="login">
		<input type=text name="usernameAttributeValue" length=10>
	</form>
	<BR>
	
	Password:
	<form name="form_password" method=get onsubmit="return check_all_fields(form_username, this)" action="login.jsp">
		<input type=hidden name="passwordAttribute" value="password">
		<input type=text name="passwordAattributeValue" length=10>
		<input type=submit class="login" value="login">
	</form>

	<%
	} else {
		String passwordAttribute = request.getParameter("passwordAttribute");
		
		Connector con = new Connector();
		Users user = new Users();
		
		if(user.login(usernameAttribute, passwordAttribute, con.stmt)){
			
			session.setAttribute("username", usernameAttribute);
			//load main index
		}else{
			//clear parameters
			//reload the page
		}

		con.closeConnection();
		
	}
	%>

<a href="index.html">back</a>
</body>
</html>