<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://mottie.github.io/tablesorter/css/theme.default.css"
	rel="stylesheet">

<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script>
	$(function() {
		$("#myDummyTable").tablesorter({
			widgets : [ 'zebra' ]
		});
	});
	$(function() {    
	    $('#filter1').change(function() {
	        $("#myDummyTable td.col3:contains('" + $(this).val() + "')").parent().show();
	        $("#myDummyTable td.col3:not(:contains('" + $(this).val() + "'))").parent().hide();
	    });
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Book: <%=request.getAttribute("bookname") %></h4>
<h3>Author: <%=request.getAttribute("authorname") %></h2>
<h3>Publisher: <%=request.getAttribute("publishername") %></h2>
<h4>Expected price: <%=request.getAttribute("price") %></h1>
<h4>Post Date: <%=request.getAttribute("postdate") %></h1>
<c:choose>
<c:when test="${postowner!=sessionuser}">
<form method="post" action="addbid">
<input type="hidden" name="postid" value=<%=request.getAttribute("postid") %> >
<input type="submit" value="Add Bid"></input>
</form>
</c:when>
</c:choose>
	Bid Price Filter: <input type="text" id="filter1" />
	<table id="myDummyTable" class="tablesorter" border="0" cellpadding="0" cellspacing="1">
		<thead>
        <tr>
          <th>User Name</th>
          <th>Bid Date</th>      
          <th>Bid Price</th>
        </tr>
      </thead>
      	<tbody>
		<c:forEach items="${listBids}" var="bid">
			<tr>
				<td class="col1"><c:out value="${bid.username}" /></td>
				<td><c:out value="${bid.bidDate}" /></td>
				<td class="col3"><c:out value="${bid.bidPrice}" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>