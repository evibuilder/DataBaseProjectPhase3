<%@ page language="java" import="cs5530.*"%>
<html>
<head>
<script>
function check_all_fields(form){
	if( form.houseID.value == "" || form.results.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script>
<title>Feedback Usefulness</title>
</head>
<body>
<h1>Top Useful Feedback</h1>
<br>
	<% 
	String thIdString = request.getParameter("houseID");
	if(thIdString == null){
	%>
<form name="record" method=get onsubmit="return check_all_fields(this)" action="orders.jsp">
		House ID: 
		<input type=text name="houseID" length=10>
		<br><br>
		Max Number of Results:
		<br>
		<input type=text name="results" length=10>
		<br><br>
		<input type=submit class="view" value="view">
	</form>
	<br><br><br>
	<% 
	} else {

		String resultsString = request.getParameter("results");
		
		Connector con = new Connector();
		Reservations res = new Reservations();
		
		String username = (String)session.getAttribute("username");
		
		int hs_id = 0;
		int results_r = 0;
		
		try{
			hs_id = Integer.parseInt(thIdString);
			results_r = Integer.parseInt(resultsString);
		}catch(Exception e){
			
		}
		
		Feedback fb = new Feedback();
		String results = fb.showFeedbackForTH(hs_id, con.stmt);
		//give suggested reservations
	}
	%>
<a href="feedbackIndex.html">back to feedback menu</a><br>
</body>
</html>