<%@ page language="java" import="cs5530.*"%>
<html>
<head>
<script>
function check_all_fields(form){
	if( form.houseID.value == "" || form.usefulRate.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script>
<title>Rate Feedback</title>
</head>
<body>
<h1>Usefulness Rating</h1>
<br>
	<% 
	String thIdString = request.getParameter("houseID");
	if(thIdString == null){
	%>
<form name="rating" method=get onsubmit="return check_all_fields(this)" action="rateFeedback.jsp">
		ID of House to Rate: 
		<input type=text name="houseID" length=10>
		<br><br>
		Usefulness (2. Very Useful, 1. Useful, 0. Useless)
		<br>
		<input type=text name="usefulRate" length=10>
		<br><br>
		<input type=submit  class="Rate" value="Rate">
	</form>
	<br><br><br>
	<% 
	} else {

		String usefulString = request.getParameter("usefulRate");
		
		Connector con = new Connector();
		Reservations res = new Reservations();
		
		String username = (String)session.getAttribute("username");
		
		int th_id = 0;
		int useful_u = 0;
		
		try{
			th_id = Integer.parseInt(thIdString);
			useful_u = Integer.parseInt(usefulString);
		}catch(Exception e){
			
		}
		
		//add to cart
		//give suggested reservations
	}
	%>
<a href="feedbackIndex.html">back to feedback menu</a><br>
</body>
</html>