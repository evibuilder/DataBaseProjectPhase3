<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback Usefulness</title>
</head>
<body>
<h1>Top Useful Feedback</h1>
<br>
<form name="record" method=get onsubmit="return check_all_fields(this)" action="orders.jsp">
		House ID: 
		<input type=hidden name="searchAttribute" value="login">
		<input type=text name="attributeValue" length=10>
		<br><br>
		Max Number of Results:
		<br>
		<input type=hidden name="searchAttribute" value="login">
		<input type=text name="attributeValue" length=10>
		<br><br>
		<input type=submit>
	</form>
	<br><br><br>
<a href="feedbackIndex.html">back to feedback menu</a><br>
</body>
</html>