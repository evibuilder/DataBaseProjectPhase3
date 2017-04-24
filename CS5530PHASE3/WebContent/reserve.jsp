<%@ page language="java" import="cs5530.*"%>
<html>
<head>
<script>
function check_all_fields(form){
	if( form.houseIdValue.value == "" || form.periodIdValue.value == ""){
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
	String thIdString = request.getParameter("houseIdValue");
	if(thIdString == null){
	%>
	
	Enter ID of temporary housing and the available period to reserve:
	<BR>
	<form name="reserveForm" method=get onsubmit="return check_all_fields(this)" action="reserve.jsp">
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
		
		//add to cart
		//give suggested reservations
		con.closeConnection();

	}
	%>
<a href="thIndex.html">back to TH menu</a>
</body>
</html>
