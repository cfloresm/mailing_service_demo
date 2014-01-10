<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<style type="text/css">
.form-signin {
  max-width: 225px;
  padding: 19px 29px 49px 19px ;
 }
</style>
<title>Register</title>
</head>
<body>
	<div class="container">
		<form:form class="form-signin"  action="user" name="userForm" modelAttribute="userForm"  method='post' accept-charset='UTF-8' >
			<div class="control-group">
		    	<label class="control-label" for="inputEmail">Email</label>
		    	<div class="controls">
					<form:input path="email" name="email" type="text" placeholder="Email"/> <br/>
		    	</div>
		  	</div>
			<div class="control-group">
		    	<label class="control-label" for="inputUsername">Username</label>
		    	<div class="controls">
					<form:input path="username" name="username" type="text" placeholder="Username"/><br/>
		    	</div>
		  	</div>		
		  	<div class="control-group">
		    	<label class="control-label" for="inputPassword">Password</label>
		    	<div class="controls">
					<form:input path="password" name="password" type="password" placeholder="Password"/><br/>
		    	</div>
		  	</div>
			<div class="control-group">
				<div class="controls">
					<button  type="submit" class="btn  btn-primary pull-right">Sign In</button>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>