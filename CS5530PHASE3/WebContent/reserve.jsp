<%@ page language="java" import="cs5530.*"%>
<html>
<head>
<script>
function check_all_fields(th_object, period_object){
	if( th_object.attributeValue.value == "" || period_object.attributeValue.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script> 

<title>Reserve TH</title>
</head>
<body>
<h1>Reserve TH</h1>

	<% 
	String thIdString = request.getParameter("thAttribute");
	if(thIdString == null){
	%>
	
	Enter ID of temporary housing to reserve
	<form name="form_th">
		<input type=hidden name="thAttribute" value="th">
		<input type=text name="attributeValue" length=10>
	</form>
	<br>
	
	Enter ID of period to reserve
	<form name="form_period" method=get onsubmit="return check_all_fields(form_th, this)" action="reserve.jsp">
		<input type=hidden name="periodAttribute" value="period">
		<input type=text name="attributeValue" length=10>
		<input type=submit class="add to cart" value="add to cart">
	</form>
	
	<%
	} else {

		//add to cart
		//give suggested reservations
	}
	%>
<a href="loginIndex.html">back</a>
</body>
</html>
