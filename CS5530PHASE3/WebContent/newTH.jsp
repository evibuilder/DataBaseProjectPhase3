<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script  LANGUAGE="javascript">
function check_all_fields(obj1, obj2, obj3, obj4, obj5, obj6, obj7){
	
	if( obj1.attributeValue.value == "" || obj2.attributeValue.value == "" ||
			obj3.attributeValue.value == "" || obj4.attributeValue.value == "" ||
			obj5.attributeValue.value == "" || obj6.attributeValue.value == "" ||
			obj7.attributeValue.value == ""){
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
			String housingName = request.getParameter("nameAttribute");
		
		if(housingName == null){
		%>

			Name of TH:
			<form name="nameForm">
				<input type=hidden name="nameAttribute" value="name">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			Address:
				<form name="addressForm">
				<input type=hidden name="addressAttribute" value="address">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			City:
				<form name="cityForm">
				<input type=hidden name="cityAttribute" value="city">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			URL:
				<form name="urlForm">
				<input type=hidden name="urlAttribute" value="url">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			Year Built:
				<form name="yearForm">
				<input type=hidden name="yearAttribute" value="year">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			Phone Number:
			<form name="numberForm">
				<input type=hidden name="numberAttribute" value="number">
				<input type=text name="attributeValue" length =10>
			</form>
			<BR>
			
			Category:
				<form name="categoryForm" method=get onsubmit="return check_all_fields(nameForm, addressForm, cityForm, urlForm, yearForm, numberForm, this)" action="newTH.jsp">
				<input type=hidden name="categoryAttribute" value="category">
				<input type=text name="attributeValue" length=10>
				<input type=submit class="submit" value="submit">
			</form>
			<BR>
		
		<%
		}else{
			
			String address = request.getParameter("addressAttribute");
			String city = request.getParameter("cityAttribute");
			String URL = request.getParameter("urlAttribute");
			String yearString = request.getParameter("yearAttribute");
			String phonenumber = request.getParameter("numberAttribute");
			String category = request.getParameter("categoryAttribute");
			int year = 0;
			
			try{
				year = Integer.parseInt(yearString);
			}catch(Exception e){
				
			}

			Connector con = new Connector();
			Housing th = new Housing();
			
			String username = (String)session.getAttribute("username");
			
			if(th.addNewPH(housingName, address, category, URL, year, phonenumber, username, city, con.stmt)){
				%> Housing was successfully added to the system <%
			}else{
				//clear parameters
				//reload page
			}
			
		}
		%>



<a href="thIndex.html">back to TH menu</a><br>
</body>
</html>

