<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />

<style>
    #chatsection{
    width: 500px;
    border: 1px solid #000000;
    margin: 0 auto;
    text-align: center;
    }
</style>
<title>Log In</title>
</head>
<body onload='document.loginForm.username.focus();'>


	<div id="templatemo_site_title_bar_wrapper">

		<div id="templatemo_site_title_bar">

			<div class="site_title_left">

				<div id="site_title">
					<h1>
						<a href="#">Mailing <span>Prosa mailing</span></a>
					</h1>
				</div>

			</div>

			<div class="site_title_right">
				<h2>
					<a href="#">Log Out</a>
				</h2>
			</div>

		</div>
		<!-- end of templatemo_site_title_bar -->

	</div>
	<!-- end of templatemo_site_title_bar_wrapper -->

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
		
		<div id="templatemo_footer_wrapper">

		<div id="templatemo_footer"></div>
		<!-- end of footer -->
	</div>
	
	
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	
</body>
</html>