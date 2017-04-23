<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function check_all_fields(lowerForm, upperForm, sortForm){
	
	if((lowerForm.attributeValue.value != "" && upperForm.attributeValue.value == "") || 
			(lowerForm.attributeValue.value == "" && upperForm.attributeValue.value != "")){
		alert("Please fill out both price ranges");
		return false;
	}
	
	if( sortForm.attributeValue.value == ""){
		alert("You must choose how to sort the results");
		return false;
	}
	return true;
}
</script>
<title>Browse Temporary Housing</title>
</head>
<body>

	<h1>Browse TH</h1>


		<%
		String sorting = request.getParameter("sortAttribute");
		
		if(sorting == null){
		%>

			Please fill out the fields you would like to search by:
			<br>
			
			Lower price range:
			<form name="lowerForm">
				<input type=hidden name="lowerAttribute" value="lower">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			Upper price range:
				<form name="upperForm">
				<input type=hidden name="upperAttribute" value="upper">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			City:
				<form name="cityForm">
				<input type=hidden name="cityAttribute" value="city">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			Keyword:
				<form name="keywordForm">
				<input type=hidden name="keywordAttribute" value="keyword">
				<input type=text name="attributeValue" length=10>
			</form>
			<BR>
			
			Category:
			<form name="categoryForm">
				<input type=hidden name="categoryAttribute" value="category">
				<input type=text name="attributeValue" length=10>
			</form>
			
			How would you like to sort your results?:<p>
			1. by price<p>
			2. by the average numerical score of the feedbacks<p>
			3. by the average numerical score of the trusted user feedbacks<p>
			<form name="sortForm" method=get onsubmit="return check_all_fields(lowerForm, upperForm, this)" action="browseTH.jsp">
				<input type=hidden name="sortAttribute" value="sort">
				<input type=text name="attributeValue" length=10>
				<input type=submit class="search" value="search">
			</form>
			<BR>
			
			<%
		}else{
			
			String lower = request.getParameter("lowerAttribute");
			String upper = request.getParameter("upperAttribute");
			String city = request.getParameter("cityAttribute");
			String keyword = request.getParameter("keywordAttribute");
			String category = request.getParameter("categoryAttribute");
			
			int lowerInt = 0;
			int upperInt = 10000;
			int sortInt = 4;
			
			try{
				lowerInt = Integer.parseInt(lower);
				upperInt = Integer.parseInt(upper);
				sortInt = Integer.parseInt(sorting);
			}catch(Exception e){
				
			}
			Connector con = new Connector();
			Housing th = new Housing();
			String results = th.browseTemporaryHousing(lowerInt, upperInt, city, keyword, category, sortInt, con.stmt);
			//display results	
		}
			%>

<a href="thIndex.html">back to TH menu</a><br>

</body>
</html>