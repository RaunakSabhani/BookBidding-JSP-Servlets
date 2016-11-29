<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>

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
</head>
<body>
	<br>
	<div class="container">
		<h1>Edit Profile</h1>
		<hr>
		<div class="row">
			<!-- edit form column -->
			<div class="col-md-9 personal-info">
				<h3>Personal info</h3>

				<form class="form-horizontal" role="form" action="../UpdateProfile"
					method="post">
					<div class="form-group">
						<label class="col-lg-3 control-label">Name:</label>
						<div class="col-lg-8">
							<input id="name" name="name" class="form-control" type="text"
								value=<%=request.getAttribute("name")%>>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Email:</label>
						<div class="col-lg-8">
							<input id="email" name="email" class="form-control" type="text"
								value=<%=request.getAttribute("email")%>>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">Username:</label>
						<div class="col-md-8">
							<input id="username" name="username" class="form-control"
								type="text" value=<%=request.getAttribute("username")%>>
						</div>
					</div>
					<!-- Date input-->
					<div class="control-group">
						<label class="control-label" for="date">Birth Date:</label>
						<div class="controls">
							<input id="date" name="date" class="form-control" name="date"
								type="date" class="input-large" required=""
								value=<%=request.getAttribute("birthDate")%>>
						</div>
					</div>

					<!-- Multiple Radios (inline) -->
					<br>
					<div class="control-group">
						<label class="control-label" for="humancheck">Gender:</label>
						<div class="controls">
							<label class="radio inline" for="humancheck-0"> <input
								type="radio" id="gender" name="gender"
								${request.getAttribute("gendertype") == 1 ? 'checked' : ''}
								id="humancheck-0" value="M">Male
							</label> <label class="radio inline" for="humancheck-1"> <input
								type="radio" id="gender" name="gender"
								${request.getAttribute("gendertype") == 0 ? 'checked' : ''}
								id="humancheck-1" value="F">Female
							</label>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="lastlogindate">Last Login Date:</label>
						<div class="controls">
							<input id="lastlogindate" name="lastlogindate" class="form-control"
								type="date" class="input-large" disabled value=<%=request.getAttribute("lastLoginDate")%>>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="lastlogintime">Last Login Time:</label>
						<div class="controls">
							<input id="lastlogintime" name="lastlogintime" class="form-control"
								class="input-large" disabled value=<%=request.getAttribute("lastLoginTime")%>>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input type="submit" class="btn btn-primary" value="Save Changes">
							<span></span> <input type="reset" class="btn btn-default"
								value="Cancel">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>