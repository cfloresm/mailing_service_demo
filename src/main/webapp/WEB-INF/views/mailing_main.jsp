<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mailing</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>

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
					<a href="logout">Log Out</a>
				</h2>
			</div>

		</div>
		<!-- end of templatemo_site_title_bar -->

	</div>
	<!-- end of templatemo_site_title_bar_wrapper -->

	<div id="templatemo_content_wrapper_outter">

		<div id="templatemo_content_wrapper_inner">

			<div id="templatemo_content_top"></div>

			<div id="templatemo_content">

				<div class="center">

					<form action="" id="email-form" class="form-horizontal">
						<fieldset>

							<div class="control-group">
								<label class="control-label" for="type">Type</label>
								<div class="controls">
									<select id="selector" class="selectpicker"
										onchange="selectItem()">
										<option value=""></option>
										<option value="1">Simple Mail</option>
										<option value="2">Batch Mail</option>
									</select>
								</div>
							</div>
							<div id="mailSection">

								<div class="control-group" id="mailDestinataryDiv">
									<label class="control-label" for="email">Email Address</label>
									<div class="controls">
										<input type="text" class="input-xxlarge" name="email" id="email">
									</div>
								</div>

								<div class="control-group" id="csvFileChooser">
									<label class="control-label" for="txtfile">Select a
										text file:</label>
									<div class="controls">
										<input type="file" id="file">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="subject">Subject</label>
									<div class="controls">
										<input type="text" class="input-xxlarge" name="subject"	id="subject">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="message">Your Message</label>
									<div class="controls">
										<textarea class="ckeditor input-xxlarge" name="message" id="message"></textarea>
									</div>
								</div>

								<div class="center_bottom" align="right">
									<button class="btn btn-danger btn-large" onclick="sendData();"> Send Mail</button>
								</div>

							</div>
							<!-- end of mailsection -->

				</fieldset>
				</form>
				</div>
				<br />
			</div>
			<!-- end of templatemo_content -->

			<div id="templatemo_content_bottom"></div>

		</div>
		<!-- end of templatemo_content_wrapper_inner -->

	</div>
	<!-- end of templatemo_content_wrapper_outter -->

	<div id="templatemo_footer_wrapper">

		<div id="templatemo_footer"></div>
		<!-- end of footer -->
	</div>

	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
	<script type="text/javascript" src="js/ajaxRequest.js"></script>
	<script type="text/javascript" src="js/polling.js"></script>
	<!-- Validate Plugin -->
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/ckeditor/ckeditor.js"></script>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#mailSection").hide();

					$('#email-form').validate(
							{
								rules : {
									email : {
										required : true,
										email : true
									},
									subject : {
										minlength : 2,
										required : true
									},
									message : {
										minlength : 2,
										required : true
									}
								},
								highlight : function(element) {
									$(element).closest('.control-group')
											.removeClass('success').addClass(
													'error');
								},
								success : function(element) {
									element.text('OK!').addClass('valid')
											.closest('.control-group')
											.removeClass('error').addClass(
													'success');
								}
							});

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
			var destinatary = document.getElementById("email").value;

			if (select == 1) {
				//SI SE SELECCIONO EL ENVIO SIMPLE SE BORRA EL ARRAY Y SE ENVIA UN SOLO VALOR
				mails.length = 0;
				mails.push($.trim(destinatary));
			}

			jsonmail.destinataries = mails;
			jsonmail.subject = document.getElementById("subject").value;
			jsonmail.body = document.getElementById("message").value;

			console.log(JSON.stringify(jsonmail));

			$.ajax({
				type : "POST",
				url : "/api/sendmail",
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
			var fileInput = document.getElementById('file');
			//			var fileDisplayArea = document.getElementById('fileDisplayArea');

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
								//								fileDisplayArea.innerText = maillines;
							};

						} else {
							fileDisplayArea.innerText = "File not supported!"
						}
					});
		};
	</script>

</body>
</html>