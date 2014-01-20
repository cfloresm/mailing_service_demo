<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mailing</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-responsive.min.css" rel="styleshgoogeet" type="text/css">
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
<link href="js/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css">

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
					<a href="logout">Salir</a>
				</h2>
			</div>

		</div>
		<!-- end of templatemo_site_title_bar -->

	</div>
	<!-- end of templatemo_site_title_bar_wrapper -->

<<<<<<< HEAD
=======
	<div id="templatemo_content_wrapper_outter">

		<div id="templatemo_content_wrapper_inner">

			<div id="templatemo_content_top"></div>

			<div id="templatemo_content">

				<div class="center">


					<form id="email-form" class="form-horizontal">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="type">Tipo</label>
								<div class="controls">
									<div class="btn-group">
										<button id="btn-simple" type="button"
											class="btn btn-danger active"
											onClick="showSimpleMailing()">Simple</button>
										<button id="btn-batch" type="button"
											class="btn btn-danger" onClick="showBatchMailing()">Batch</button>
									</div>
								</div>
							</div>
							<!-- 							
							<div class="control-group">
								<label class="control-label" for="type">Tipo</label>
								<div class="controls">
									<select id="selector" class="selectpicker"
										onchange="selectItem()">
										<option value=""></option>
										<option value="1">Simple Mail</option>
										<option value="2">Batch Mail</option>
									</select>
								</div>
							</div>
 -->
							<div id="mailSection">
								<div class="control-group" id="mailDestinataryDiv">
									<label class="control-label" for="email">Destinatario</label>
									<div class="controls">
										<input type="text" class="input-xxlarge" name="email"
											id="email">
									</div>
								</div>

								<div class="control-group" id="csvFileChooser" style="display: none;">
>>>>>>> Removed ComboBox for mailing type selection. Added Bootstrap buttons

	<div class="center">

<<<<<<< HEAD
		<form id="form-email" class="form-email">
			<fieldset>
				<div class="control-group">
					<div class="controls">
						<select id="selector" class="selectpicker" onchange="selectItem()">
							<option value=""></option>
							<option value="1">Simple Mail</option>
							<option value="2">Batch Mail</option>
						</select>
					</div>
				</div>
				<div id="mailSection" style="display: none;">

					<div class="control-group" id="mailDestinataryDiv">
						<div class="controls">
							<input type="text" class="input-xxlarge" name="email" id="email" placeholder="Destinatario" >
						</div>
					</div>

					<div class="control-group" id="csvFileChooser">
						<div class="controls">
							<input type="file" name="file" style="display: none;" id="file"  />
							<div class="input-append">
								<!-- 
											-->
								<a id="fileButton" class="btn btn-warning" 
									onclick="$('#file').click();">Seleccione archivo</a> 
									<input placeholder="Destinatarios"
									type="text" name="subfile" id="subfile" class="input-xlarge"
									readonly>
=======
										<input type="file" name="file" style="display: none;"
											id="file" />
										<div class="input-append">
											<!-- 
											-->
											<a id="fileButton" class="btn btn-warning"
												onclick="$('#file').click();">Seleccione archivo</a> <input
												type="text" name="subfile" id="subfile" class="input-xlarge"
												readonly>

										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="subject">Asunto</label>
									<div class="controls">
										<input type="text" class="input-xxlarge" name="subject"
											id="subject">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="message">Mensaje</label>
									<div class="controls">
										<textarea class="ckeditor input-xxlarge" name="message"
											id="message"></textarea>
									</div>
								</div>

								<div class="center_bottom" align="right">
									<button class="btn btn-danger btn-large">ENVIAR</button>
								</div>
>>>>>>> Removed ComboBox for mailing type selection. Added Bootstrap buttons

							</div>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<input type="text" class="input-xxlarge" name="subject"
								id="subject" placeholder="Asunto" >
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<textarea class="ckeditor input-xxlarge" name="message"
								id="message" ></textarea>
						</div>
					</div>

					<div class="center_bottom" align="right">
						<button class="btn btn-danger btn-large">Enviar</button>
					</div>

				</div>
				<!-- end of mailsection -->

			</fieldset>
		</form>

	</div>
	<br />

	<div id="footer">

	</div>

	<!-- ALERT MESSAGES -->
	<div id="question" align="center" class="center_alert"
		style="display: none;">
		<p class="title"></p>
		<br />
		<div class="center_bottom" align="center">
			<input class="btn btn-danger btn-large confirm yes" value="ENVIAR" />
			<input class="btn btn-danger btn-large confirm no" value="CANCELAR" />
		</div>
	</div>

	<div id="success" align="center" class="center_alert"
		style="display: none;">
		<p class="title"></p>
		<img src="images/flat-mail-icon_ok.png"> <br /> <input
			class="btn btn-danger btn-large confirm yes" value="ACEPTAR" />
	</div>

	<div id="error" align="center" class="center_alert_error"
		style="display: none;">
		<p class="title"></p>
		<img src="images/flat-mail-icon_error.png"> <br /> <input
			class="btn btn-danger btn-large confirm yes" value="ACEPTAR" />
	</div>

	<div id="loading" align="center" class="center_loading"
		style="display: none;">
		<img src="images/loading.gif">
	</div>

	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
	<script type="text/javascript" src="js/ajaxRequest.js"></script>
	<script type="text/javascript" src="js/polling.js"></script>
	<!-- Validate Plugin -->
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="js/fancybox/jquery.fancybox.js"></script>
	<!--  -->

	<script type="text/javascript" src="js/mailing_main.js"></script>

</body>
</html>