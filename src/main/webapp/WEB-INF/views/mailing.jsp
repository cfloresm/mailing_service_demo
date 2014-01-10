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

	function sendData() {
		var jsonmail = {};
		jsonmail.destinataries = mails;
		jsonmail.subject = document.getElementById("mailSubject").value;
		jsonmail.body = document.getElementById("mailBody").value;
		console.log(JSON.stringify(jsonmail));

		$.ajax({
			type : "POST",
			url : "sendmail",
			contentType : "application/json",
			data : JSON.stringify(jsonmail),
			//data : "mails="+mails,  //multiple array, just add something like "&b="+b ...
			success : function(response) {
				// do something ... 
				alery('Sent');
			},
			error : function(e) {
				alert('Error X: ' + e);
			}
		});
	}

	var mails = [];
	window.onload = function() {
		var fileInput = document.getElementById('fileInput');
		var fileDisplayArea = document.getElementById('fileDisplayArea');

		fileInput.addEventListener('change', function(e) {
			var file = fileInput.files[0];
			var textType = /text.*/;

			if (file.type.match(textType)) {
				var reader = new FileReader();

				reader.readAsText(file);

				reader.onload = function(e) {
					var maillines = "";
					var lines = reader.result.split(/\n/);
					;
					for (var i = 0; i < lines.length; i++) {
						if (/\S/.test(lines[i])) {
							mails.push($.trim(lines[i]));
							maillines = maillines + $.trim(lines[i]) + '\n';
						}
					}
					fileDisplayArea.innerText = maillines;

					//for (var i=0; i < mails.length; i++) {
					//   alert(i+"-  "+mails[i]);
					// }	
				};

			} else {
				fileDisplayArea.innerText = "File not supported!"
			}
		});
	}
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
					<div>
						Select a text file: <input type="file" id="fileInput">
					</div>
					<pre id="fileDisplayArea">	</pre>
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
						onclick="sendData();" value="Send Mail" />
				</div>

			</div>

		</form:form>
	</div>
</body>
</html>
