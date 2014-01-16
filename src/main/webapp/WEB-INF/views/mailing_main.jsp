<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mailing</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet"
	type="text/css">
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">

<link href="js/fancybox/jquery.fancybox.css"
	rel="stylesheet" type="text/css">
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

					<form id="email-form" class="form-horizontal">
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
										<input type="text" class="input-xxlarge" name="email"
											id="email">
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
										<input type="text" class="input-xxlarge" name="subject"
											id="subject">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="message">Your Message</label>
									<div class="controls">
										<textarea class="ckeditor input-xxlarge" name="message"
											id="message"></textarea>
									</div>
								</div>

								<div class="center_bottom" align="right">
									<button class="btn btn-danger btn-large">Send Mail</button>
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


	<!-- ALERT MESSAGES -->
	<div id="confirm" align="center" class="center_alert" style="display: none;">
		<p class="title"></p>
		<img
			src="images/flat-mail-icon_ok.png">
		<br /> <input class="btn btn-danger btn-large confirm yes" value="CONTINUE" />
	</div>

	<div id="error" align="center" class="center_alert_error" style="display: none;">
		<p class="title"></p>
		<img
			src="images/flat-mail-icon_error.png">
		<br /> <input class="btn btn-danger btn-large confirm yes" value="CONTINUE" />
	</div>

	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
	<script type="text/javascript" src="js/ajaxRequest.js"></script>
	<script type="text/javascript" src="js/polling.js"></script>
	<!-- Validate Plugin -->
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/ckeditor/ckeditor.js"></script>
	<script src="js/fancybox/jquery.fancybox.js"></script>

	<script type="text/javascript">
		var erros = 0;
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

					$('#email-form').bind("keypress", function(e) {
						if (e.keyCode == 13) {
							return false;
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
		$(function() {
			$("#email-form").on("submit", function(e) {
				e.preventDefault(); // cancel the submission
				sendData();
			});
		});

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
			//jsonmail.body = document.getElementById("message").value;
			jsonmail.body = CKEDITOR.instances['message'].getData()

			var jsonstring = JSON.stringify(jsonmail);
			console.log(jsonstring);

			//alert(jsonstring);

			$.ajax({
				url : "api/sendmail",
				type : "POST",
				contentType : "application/json",
				data : jsonstring,
				success : function(data) {
					console.log(data);

					confirm("MAIL SENT!", true, function(resp) {
						self.location="mailing";
					});
				},
				error : function(error) {
					console.log("Error:");
					console.log(error);
				
					confirmError("SENDING ERROR!!", true, function(resp) {
						
					});
				}
			});

		};

		function sendData2() {
			confirmError("SENDING MAIL!", true, function(resp) {
				self.location="mailing";
			});
		}

		function confirm(msg, modal, callback) {
			$.fancybox("#confirm", {
				modal : modal,
				beforeShow : function() {
					$(".title").html(msg);
				},
				afterShow : function() {
					$(".confirm").on("click", function(event) {
						if ($(event.target).is(".yes")) {
							ret = true;
						} else if ($(event.target).is(".no")) {
							ret = false;
						}
						$.fancybox.close();
					});
				},
				afterClose : function() {
					callback.call(this, ret);
				}
			});
		};

		function confirmError(msg, modal, callback) {
			$.fancybox("#error", {
				modal : modal,
				beforeShow : function() {
					$(".title").html(msg);
				},
				afterShow : function() {
					$(".confirm").on("click", function(event) {
						if ($(event.target).is(".yes")) {
							ret = true;
						} else if ($(event.target).is(".no")) {
							ret = false;
						}
						$.fancybox.close();
					});
				},
				afterClose : function() {
					callback.call(this, ret);
				}
			});
		};

		
		var mails = [];
		window.onload = function() {
			var fileInput = document.getElementById('file');
			//			var fileDisplayArea = document.getElementById('fileDisplayArea');
			mails.length = 0; //limpiando el array
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