<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="js/app.js"></script>
<script type="text/javascript" src="js/ajaxRequest.js"></script>
<script type="text/javascript" src="js/polling.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#mailSection").hide();
	});

	function selectItem() {
		$("#mailSection").hide();
		var select = $("#selector").val();

		switch (select) {
		case "0":
			$("#mailSection").hide();
			break;
		case "1":
			$("#mailSection").show();
			$("#mailDestinataryDiv").show();
			$("#csvFileChooser").hide();
			break;
		case "2":
			$("#mailSection").show();
			$("#csvFileChooser").show();
			$("#mailDestinataryDiv").hide();
			break;
		}
	}

	$(document).on(
			'change',
			'.btn-file :file',
			function() {
				var input = $(this), numFiles = input.get(0).files ? input
						.get(0).files.length : 1, label = input.val().replace(
						/\\/g, '/').replace(/.*\//, '');
				input.trigger('fileselect', [ numFiles, label ]);
			});
</script>

<title>Log In</title>
</head>
<body>
	<div class="container">
		<form:form class="form-signin" action="pushnotification"
			name="mailInput" modelAttribute="mailInput" method='post'
			accept-charset='UTF-8'>
			<div id="sectionError"></div>
			<div class="control-group">
				<form:label path="userId" class="control-label" for="inputEmail">User:</form:label>
				<form:select class="selectpicker" data-style="btn-primary"
					path="userId" items="${users}">
				</form:select>
			</div>

			<div>
				<label class="control-label">Type</label> <select id="selector"
					class="selectpicker" onchange="selectItem()">
					<option value=""></option>
					<option value="1">Simple Mail</option>
					<option value="2">Batch Mail</option>
				</select>
			</div>
			<br />

			<div id="mailSection">
				<div id="mailDestinataryDiv">
					<div>
						<label class="control-label">Destinatary</label>
					</div>
					<textarea id="mailDestinatary" rows="1"> </textarea>
				</div>

				<div id="csvFileChooser">
					<span class="btn btn-default btn-file"> CSV File <input	type="file"> </span>
					<br/> <br/>
				</div>
				<div>
					<label class="control-label">Subject</label>
				</div>
				<textarea id="mailSubject" rows="1"> </textarea>
				<div>
					<label class="control-label">Body</label>
				</div>
				<textarea id="mailBody" rows="10"> </textarea>

				<br />

				<div id="messageButton" class="control-group">
					<input class="btn btn-large btn-primary" type="button"
						onclick="sendMessage();" value="Send Mail" />
				</div>

			</div>

		</form:form>
	</div>
</body>
</html>
