<%@ page language="java" import="cs5530.*"%>
<html>
<head>
<script>
function check_all_fields(form){
	if(form.results.value == ""){
		alert("Form fields should be nonempty");
		return false;
	}
	return true;
}
</script>
<title>Most Popular THs</title>
</head>
<body>
<h1>Most Popular Houses</h1>
<form name="popular" method=get onsubmit="return check_all_fields(this)" action="popular.jsp">
		Number of Max Results: 
		<input type=text name="results" length=10>
		<br>
		<input type=submit class="view" value="view">
	</form>
	<br><br><br>
			<% 

		String resultsString = request.getParameter("results");
		
		Connector con = new Connector();
		Reservations res = new Reservations();
		
		String username = (String)session.getAttribute("username");
		
		int results_r = 0;
		
		try{
			results_r = Integer.parseInt(resultsString);
		}catch(Exception e){
			
		}
		
		Statistics st = new Statistics();
		String results = st.mostPopularTH(results_r, con.stmt);
		
		
		//give suggested reservations
	%>
<a href="statsIndex.html">back to stats menu</a><br>
</body>
</html>