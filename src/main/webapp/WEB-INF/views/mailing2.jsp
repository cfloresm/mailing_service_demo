<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Mailing</title>

<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.2.1/pure-min.css">
<link rel="stylesheet" href="css/application.css" type="text/css">

</head>
<body>
	<div class="pure-g-r">
		<div class="pure-u-1-6"></div>

		<div class="pure-u-2-3">

			<div class="header">
				<h1>Mailing</h1>
			</div>

			<div class="content">

				<div id="sectionError"></div>
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
						<!-- 						
						<pre id="fileDisplayArea">	</pre>
 						-->
						<br />
					</div>
					<div>
						<label class="control-label">Subject</label>
					</div>
					<textarea id="mailSubject" rows="1"> </textarea>
					<div>
						<label class="control-label">Body</label>
					</div>
					<textarea id="mailBody" rows="10"> </textarea>

					<br /> <br />

					<div id="messageButton" class="control-group">
						<input class="btn btn-large btn-primary" type="button"
							onclick="sendData();" value="Send Mail" />
					</div>

				</div>
			</div>

		</div>
	</div>
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
			
			var select = $("#selector").val();
			var destinatary = document.getElementById("mailDestinatary").value;
			
			if(select==1){
				//SI SE SELECCIONO EL ENVIO SIMPLE SE BORRA EL ARRAY Y SE ENVIA UN SOLO VALOR
				mails.length = 0;
				mails.push($.trim(destinatary));
			}
			
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

			fileInput.addEventListener('change',
					function(e) {
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
										maillines = maillines
												+ $.trim(lines[i]) + '\n';
									}
								}
								fileDisplayArea.innerText = maillines;

							};

						} else {
							fileDisplayArea.innerText = "File not supported!"
						}
					});
		}
	</script>


</body>
</html>

