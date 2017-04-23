<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function check_all_fields(form){
	if( form.houseIdValue.value == "" || form.periodIdValue.value == ""){
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
	String thIdString = request.getParameter("houseIdValue");
	if(thIdString == null){
	%>
	
	Enter ID of temporary housing and the available period to record stay in:
	<BR>
	<form name="stayForm" method=get onsubmit="return check_all_fields(this)" action="stays.jsp">
		<input type=text name=houseIdValue length=10 placeholder="House ID">
		<input type=text name=periodIdValue length=10 placeholder="Period ID">
		<input type=submit class="add to cart" value="add to cart">
	</form>
	<br>
	
	<%
	} else {

		String periodIdString = request.getParameter("periodIdValue");
		
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