<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script  LANGUAGE="javascript">
function check_all_fields(form){
	
	if( form.nameValue.value == "" || form.addressValue.value == "" ||
			form.cityValue.value == "" || form.urlValue.value == "" ||
			form.yearValue.value == "" || form.phoneValue.value == "" ||
			form.categoryValue.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script>


<title>New TH</title>
</head>
<body>
<h1>New TH</h1>

		<%
			String name = request.getParameter("nameValue");
		
		if(name == null){
		%>

			Please fill out the following information to register a new temporary housing:<BR>
			
			<form name="houseForm" method=get onsubmit="return check_all_fields(this)" action="newTH.jsp">
				<input type=text name="nameValue" length=10 placeholder="name">
				<input type=text name="addressValue" length=10 placeholder="address">
				<input type=text name="cityValue" length=10 placeholder="city">
				<input type=text name="urlValue" length=10 placeholder="URL">
				<input type=text name="yearValue" length=4 placeholder="year built">
				<input type=text name="phoneValue" length=10 placeholder="phone #">
				<input type=text name="categoryValue" length=10 placeholder="category">
				<input type=submit class="register" value="register">
			</form>
		
		<%
		}else{
			
			String address = request.getParameter("addressValue");
			String city = request.getParameter("cityValue");
			String URL = request.getParameter("urlValue");
			String yearString = request.getParameter("yearValue");
			String phonenumber = request.getParameter("phoneValue");
			String category = request.getParameter("categoryValue");
			int year = 0;
			
			try{
				year = Integer.parseInt(yearString);
			}catch(Exception e){
				
			}

			Connector con = new Connector();
			Housing th = new Housing();
			
			String username = (String)session.getAttribute("username");
			
			if(th.addNewPH(name, address, category, URL, year, phonenumber, username, city, con.stmt)){
				%> <BR>Housing was successfully added to the system <BR><%
			}else{
				%><BR>There was an error adding your housing to the system <BR><%
				
			}
			con.closeConnection();

		}
		%>



<a href="thIndex.html">back to TH menu</a><br>
</body>
</html>

