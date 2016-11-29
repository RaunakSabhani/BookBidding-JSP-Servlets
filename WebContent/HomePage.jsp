<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>HomePage</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="homestyle.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
	function myFunction() {
		var myWindow = window.open("myposts.html", "_self");
	}
</script>
<script>
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("postbutton");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal 
	btn.onclick = function() {
		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
<style>
.modal-body .form-horizontal .col-sm-2, .modal-body .form-horizontal .col-sm-10
	{
	width: 100%
}

.modal-body .form-horizontal .control-label {
	text-align: left;
}

.modal-body .form-horizontal .col-sm-offset-2 {
	margin-left: 15px;
}
}
</style>


</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="menu">
					<ul>
						<li><a class="navbar-brand" href="index.html">Home</a></li>
						<li><a class="navbar-brand" href="about.html">About</a></li>
						<li><a class="navbar-brand" href="delivery.html">Delivery</a></li>
						<li><a class="navbar-brand" href="news.html">News</a></li>
						<li><a class="navbar-brand" href="contact.html">Contact</a></li>
					</ul>
				</div>
			</div>
			<div class="search_box">
				<form method="get" action="servlet/search">
					<input type="text" name="search" value="Search" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Search';}"><input
						type="submit" value="Search Value">
				</form>
			</div>
			<div class="cart">
				<p>
					WelcomeUsername <span>Cart:</span>
				<div id="dd" class="wrapper-dropdown-2">
					0 item(s) - $0.00
					<ul class="dropdown">
						<li>you have no items in your Shopping cart</li>
					</ul>
				</div>
				</p>
			</div>





		</nav>
		<!-- /#wrapper -->
	</div>


	<div class="container">
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img
							src="http://keenthemes.com/preview/metronic/theme/assets/admin/pages/media/profile/profile_user.jpg"
							class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
							<%=session.getAttribute("name")%>
						</div>
						<div class="profile-usertitle-job">Developer</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->

					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="#"> <i
									class="glyphicon glyphicon-home"></i> Overview
							</a></li>
							<li><a href="servlet/profile"> <i class="glyphicon glyphicon-user"></i>
									My Profile
							</a></li>
							<li><a href="servlet/getmyposts"> <i
									class="glyphicon glyphicon-flag"></i> My Posts
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->
					<button class="btn btn-primary btn-lg" data-toggle="modal"
						data-target="#myModalHorizontal">Add Post</button>
					<div="logoutbutton">
						<form method="get" action="Logout">
							<input type="submit" name="logout" value="Logout">
						</form>
					</div>
					<div class="modal fade" id="myModalHorizontal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">ADD POST</h4>
								</div>

								<!-- Modal Body -->
								<div class="modal-body">
									<form class="form-horizontal" role="form" method="post" action="AddPost">
										<div class="form-group">
											<div class="col-sm-10">
												Expected Price: <input type="text" name="price" required><br>
											</div>
											<br>
											<br>
											<div class="col-sm-10">
												Book Title: <input type="text" name="title" required><br>
												<br>
											</div>
											<div class="col-sm-10">
												Author Name: <input type="text" name="aname"><br>
												<br>
											</div>
											<div class="col-sm-10">
												Publisher Name: <input type="text" name="pname"><br>
												<br>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit" onclick="click">Submit Post!</button>
											</div>
										</div>
									</form>
								</div>

								<!-- Modal Footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="profile-content">
					<div class="wrap">
						<div class="table">
							<ul class="ulli">

								<li>
									<div class="top">
										<h1>Selp-Helf</h1>
										<div class="circle">$12</div>
									</div>
									<div class="bottom">
										<p>
											<span>5</span> bids
										</p>
										<p>
											<span>Bid 1:</span>10$
										</p>
										<p>
											<span>Bid 2:</span>10.5$
										</p>
										<p>
											<span>Bid 3:</span>10$
										</p>
										<p>
											<span>Bid 4:</span>10$
										</p>
										<p>
											<span>Bid 5:</span>10$
										</p>
										<div class="sign">
											<a href='#' class='button'>BID</a>
										</div>
									</div>
								</li>

								<li>
									<div class="top">
										<h1>BASIC</h1>
										<div class="circle">$29</div>
									</div>
									<div class="bottom">
										<p>
											<span>10</span> users
										</p>
										<p>
											<span>50</span> projects
										</p>
										<p>
											<span>50GB</span> amount of space
										</p>
										<p>
											<span>10</span> e-mail accounts
										</p>
										<div class="sign">
											<a href='#' class='button'>BID</a>
										</div>
									</div>
								</li>

								<li>
									<div class="top">
										<h1>PRO</h1>
										<div class="circle">$49</div>
									</div>
									<div class="bottom">
										<p>
											<span>100</span> users
										</p>
										<p>
											<span>Unlimited</span> projects
										</p>
										<p>
											<span>1TB</span> amount of space
										</p>
										<p>
											<span>100</span> e-mail accounts
										</p>
										<div class="sign">
											<a href='#' class="button purple" style="color: white;">BID</a>
										</div>
									</div>
								</li>

								<li>
									<div class="top">
										<h1>ULTRA</h1>
										<div class="circle">$99</div>
									</div>
									<div class="bottom">
										<p>
											<span>Unlimited</span> users
										</p>
										<p>
											<span>Unlimited</span> projects
										</p>
										<p>
											<span>Unlimited</span> amount of space
										</p>
										<p>
											<span>Unlimited</span> e-mail accounts
										</p>
										<div class="sign">
											<a href='#' class='button'>BID</a>
										</div>
									</div>
								</li>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
