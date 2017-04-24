<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*" import="cs5530.CS5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script LANGUAGE="javascript">

function check_all_fields(form_obj){
	//alert(username_form.usernameAttribute.value+"='"+username_form.usernameAttributeValue.value+"'");
	//alert(password_form.passwordAttribute.value+"='"+password_form.passwordAattributeValue.value+"'");

	if( form_obj.idValue.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}

</script> 
<title>Make Favorite</title>
</head>
<body>
	<h1>Make Favorite</h1>
	
	<%
		String idString = request.getParameter("idValue");
	if(idString == null){
	%>
	
	Enter the ID of the housing you would like to make your favorite:
	<form name="idForm" method=get onsubmit="return check_all_fields(this)" action="favorite.jsp">
		<input type=text name="idValue" length=10>
		<input type=submit class="submit" value="submit">
	</form>
	
	<%}else{
		Connector con = new Connector();
		Users user = new Users();
		
		int thID = 0;
		try{
			thID = Integer.parseInt(idString);
		}catch(Exception e){
			
		}
		
		String username = (String)session.getAttribute("username");
		
		if(user.makeHousingFavorite(username, thID, con.stmt)){
			%> <BR>Favorite Successfully Updated<BR> <%
		}else{
			%><BR>There was an error with your request<BR><%
		}
		
		con.closeConnection();
	}
	

		%>
	
	
<a href="thIndex.html">back to TH menu</a><br>
</body>
</html>