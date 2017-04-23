<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function check_all_fields(th_object, period_object){
	if( th_object.attributeValue.value == "" || period_object.attributeValue.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script> 
<title>Record Stay</title>
</head>
<body>
	<h1>Record Stay</h1>

	<% 
	String thIdString = request.getParameter("thAttribute");
	if(thIdString == null){
	%>
	
	Enter ID of temporary housing to record stay in:
	<form name="form_th">
		<input type=hidden name="thAttribute" value="th">
		<input type=text name="attributeValue" length=10>
	</form>
	<br>
	
	Enter ID of period to record stay in:
	<form name="form_period" method=get onsubmit="return check_all_fields(form_th, this)" action="stays.jsp">
		<input type=hidden name="periodAttribute" value="period">
		<input type=text name="attributeValue" length=10>
		<input type=submit class="add to cart" value="add to cart">
	</form>
	
	<%
	} else {

		String periodIdString = request.getParameter("periodAttribute");
		
		Connector con = new Connector();
		Reservations res = new Reservations();
		
		String username = (String)session.getAttribute("username");
		
		int th_id = 0;
		int period_id = 0;
		
		try{
			th_id = Integer.parseInt(thIdString);
			period_id = Integer.parseInt(periodIdString);
		}catch(Exception e){
			
		}
		
		if(res.checkForReservation(username, th_id, period_id, con.stmt)){
			//add to cart
		}else{
			%> One or more of the provided ID's were not valid <%
		}
	}
	%>


<a href="thIndex.html">back to TH menu</a><br>
</body>
</html>