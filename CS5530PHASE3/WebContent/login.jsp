<%@ page language="java" import="cs5530.*" %>

<html>
<head>
<script LANGUAGE="javascript">

function check_all_fields(login_form){
	if( login_form.usernameValue.value == "" || login_form.passwordValue.value == ""){
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
	String username = request.getParameter("usernameValue");
	if(username == null){
	%>
	<BR>
	Please enter your login and password<BR>
	<form name="form_username" method=get onsubmit="return check_all_fields(this)" action="login.jsp">
		<input type=text name="usernameValue" length=10 placeholder="login">
		<input type=text name="passwordValue" length=10 placeholder="password">
				<input type=submit class="login" value="login">
	</form>
	<BR> 
	
	<%
	} else {
		String password = request.getParameter("passwordValue");

		Connector con = new Connector();
		Users user = new Users();
		
		
		if(user.login(username, password, con.stmt)){
			
			session.setAttribute("username", username);
			%><BR>login was successful <BR>
			<a href="mainIndex.html">To Main Menu</a>
			<%
			
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