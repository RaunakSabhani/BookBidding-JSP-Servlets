<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
</script>
<title>Insert title here</title>
</head>
<body>
	<h1>In posts</h1>
	<table id="myDummyTable" class="tablesorter" border="0" cellpadding="0" cellspacing="1">
		<thead>
        <tr>
          <th>Book Name</th>
          <th>Post Date</th>      
          <th>Price</th>
        </tr>
      </thead>
      	<tbody>
		<c:forEach items="${output}" var="product">
			<tr>
				<td><a href="getpost?postid=${product.postID}">${product.bookName}</a></td>
				<td><c:out value="${product.postDate}" /></td>
				<td><c:out value="${product.price}" /></td>
				<!--<td><fmt:formatNumber value="${product.price}" type="currency" currencyCode="USD" /></td>  -->
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>