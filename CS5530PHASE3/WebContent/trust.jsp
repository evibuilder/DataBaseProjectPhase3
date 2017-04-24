<%@ page language="java" import="cs5530.*"%>
<html>
<head>
<script>
function check_all_fields(form){
	if( form.reviewee.value == "" || form.trust.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script>
<title>User Trust</title>
</head>
<body>
Rate User
<br>
    <% 
	String thIdString = request.getParameter("houseID");
	if(thIdString == null){
	%>
<form name="trusting" method=get onsubmit="return check_all_fields(this)" action="trust.jsp">
		User to Review: 
		<input type=text name="reviewee" length=10>
		<br><br>
		Trusted or Not Trusted(1 or 2)
		<br>
		<input type=text name="trust" length=10>
		<br><br>
		<input type=submit  class="Rate" value="Rate">
	</form>
	<br><br><br>
	<% 
	} else {

		String trustString = request.getParameter("trust");
		
		Connector con = new Connector();
		Reservations res = new Reservations();
		
		String username = (String)session.getAttribute("username");
		
		int trust_t = 0;
		
		try{
			trust_t = Integer.parseInt(trustString);
		}catch(Exception e){
			
		}
		
		//add to cart
		//give suggested reservations
	}
	%>
<a href="feedbackIndex.html">back to feedback menu</a><br>
</body>
</html>