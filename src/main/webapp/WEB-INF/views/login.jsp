<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<style>
    #chatsection{
    width: 500px;
    border: 1px solid #000000;
    margin: 0 auto;
    text-align: center;
    }
</style>
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<title>Log In</title>
</head>
<body onload='document.loginForm.username.focus();'>
	<div class="container">
	<form:form class="form-signin" action="authenticate" name="loginForm" modelAttribute="loginForm" method='post' accept-charset='UTF-8' >
		<c:if test="${not empty errorMsg }">
			<div class="alert alert-error">
				 <c:out value="${errorMsg}"></c:out><br>	
			</div>
		</c:if>
		<c:if test="${not empty infoMsg }">
			<div class="alert alert-success">
				<c:out value="${infoMsg}"></c:out><br>
			</div>
		</c:if>
	  	<div class="control-group">
	    	<label class="control-label" for="inputEmail">Email</label>
	    	<div class="controls">
			<form:input path="username" name="username" type="text" placeholder="Email"/><br/>
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
				<a href="signin">Sign In</a>
				<button type="submit" value="Log In" class="btn  btn-primary pull-right" >Log In</button>
		    </div>
		</div>
	</form:form>
	</div>
</body>
</html>