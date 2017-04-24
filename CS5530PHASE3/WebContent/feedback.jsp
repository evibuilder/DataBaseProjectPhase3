<%@ page language="java" import="cs5530.*"%>
<html>
<head>
<script>
function check_all_fields(form){
	if( form.houseID.value == "" || form.score.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script>

<title>Record Feedback</title>
</head>
<body>
<h1>Record Feedback</h1>
<br>
	<% 
	String thIdString = request.getParameter("houseID");
	if(thIdString == null){
	%>
	<form name="record" method=get onsubmit="return check_all_fields(this)" action="feedback.jsp">
		House ID: 
		<input type=text name=houseID length=10>
		<br><br>
		Score: 
		<input type=text name=score length=10 placeholder="1-10">	
		<br><br>
		Comments *Optional*
		<br>
		<input type=text name="comment" length=10>
		<br><br>
		<input type=submit class="Record Feedback" value="Record Feedback">
	</form>
	<br><br><br>
	<% 
	} else {

		String scoreString = request.getParameter("score");
		
		Connector con = new Connector();
		Reservations res = new Reservations();
		
		String username = (String)session.getAttribute("username");
		
		int th_id = 0;
		int score_s = 0;
		
		try{
			th_id = Integer.parseInt(thIdString);
			score_s = Integer.parseInt(scoreString);
		}catch(Exception e){
			
		}
		
		//add to cart
		//give suggested reservations
	}
	%>
<a href="feedbackIndex.html">back to feedback menu</a><br>

</body>
</html>