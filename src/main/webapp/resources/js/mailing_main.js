$(document).ready(
		//setting validation rules (js/jquery.validate.min.js)
		function() {
			$('#email-form').validate(
					{
						rules : {
							email : {
								required : true,
								email : true
							},
							subfile :{
								minlength : 2,
								required : true
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
						},
						submitHandler: function(form) {
							prepareData();
						}
					});
			//prevents form submit on hit enter
			$('#email-form').bind("keypress", function(e) {
				if (e.keyCode == 13) {
					return false;
				}
			});
		});

//show/hide batch/single mailing views
//function selectItem() {
//	$("#mailSection").hide();
//	var select = $("#selector").val();
//
//	switch (select) {
//	case "0":
//		$("#mailSection").hide();
//		break;
//	case "1":
//		$("#mailSection").show();
//		$("#mailDestinataryDiv").show();
//		$("#csvFileChooser").hide();
//		break;
//	case "2":
//		$("#mailSection").show();
//		$("#csvFileChooser").show();
//		$("#mailDestinataryDiv").hide();
//		break;
//	}
//}

function showSimpleMailing(){
	$("#mailSection").show();
	$("#mailDestinataryDiv").show();
	$("#csvFileChooser").hide();
	var buttonSimple = $("#btn-simple");
	var buttonBatch = $("#btn-batch");
	buttonSimple.addClass('active');
	buttonBatch.removeClass('active');	
}

function showBatchMailing(){
	$("#mailSection").show();
	$("#csvFileChooser").show();
	$("#mailDestinataryDiv").hide();
	var buttonSimple = $("#btn-simple");
	var buttonBatch = $("#btn-batch");
	buttonSimple.removeClass('active');
	buttonBatch.addClass('active');	
}

//very functional method, cancels the submit on a form
//$(function() {
//$("#email-form").on("submit", function(e) {
//e.preventDefault(); // cancel the submission
//});
//});

//send mail question
function prepareData(){
	question("CONFIRME ENVIO DE MENSAJE", true, function(resp) {
		if(resp){
			setTimeout(function() {
				console.log("WAITING!!!!");
				loading(); //shows loading animation
			}, 100);

			setTimeout(function() {
				console.log("SENDING!!!!");
				sendData(); //sending mail
			}, 1000);
		}
	});
}

function sendData() {
	var jsonmail = {}; //json data to post

	//var select = $("#selector").val();
	var destinatary = document.getElementById("email").value;
	var buttonSimple = $("#btn-simple");

//	if (select == 1) {
	if(buttonSimple.hasClass('active')){
	//SI SE SELECCIONO EL ENVIO SIMPLE SE BORRA EL ARRAY Y SE ENVIA UN SOLO VALOR
		console.log("simple");
		mails.length = 0;
		mails.push($.trim(destinatary));
	}
	jsonmail.recipients = mails;
	jsonmail.subject = document.getElementById("subject").value;
	jsonmail.message = CKEDITOR.instances['message'].getData();

	var jsonstring = JSON.stringify(jsonmail);
	console.log(jsonstring);

	//alert(jsonstring);

	//sending ajax post
	$.ajax({
		url : "api/sendmail",
		type : "POST",
		contentType : "application/json",
		data : jsonstring,
		success : function(data) {
			console.log("SUCESS!!!!");
			$.fancybox.close();
			successMessage("MENSAJE ENVIADO", true, function(resp) {
				self.location="mailing";
			});
		},
		error : function(error) {
			console.log("ERROR!!!!");
			$.fancybox.close();
			errorMessage("ERROR AL ENVIAR MENSAJE", true, function(resp) {
			});
		}
	});

};

//success message
function successMessage(msg, modal, callback) {
	$.fancybox("#success", {
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

//error message
function errorMessage(msg, modal, callback) {
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

//question message
function question(msg, modal, callback) {
	$.fancybox("#question", {
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

//shows loading animation
function loading() {
	$.fancybox("#loading", {
		modal : true
	});
};

//READ TXT FILE
var mails = new Array(); //Here we going to save mails
function readTxtFile(){
	var fileInput = document.getElementById('file');
	mails.length = 0; //limpiando el array

	var file = fileInput.files[0];
	var textType = /text.*/;

	if (file.type.match(textType)) {
		
		var filename = fileInput.value;
		filename = filename.split(/(\\|\/)/g).pop();
		console.log(filename);
		$('#subfile').val(filename);
//		$('#fileButton').text(filename);
		
		var reader = new FileReader();

		reader.readAsText(file);

		reader.onload = function(e) {
			var lines = reader.result.split(/\n/);

			for (var i = 0; i < lines.length; i++) {
				if (/\S/.test(lines[i])) {
					mails.push($.trim(lines[i]));
				}
			}

			for(var x=0; x < mails.length; x++){
				console.log(mails[x]);
			}
		};

	} else {
		//NOT A TXT FILE
		
	}
};

//ON FILE LOADING
$('#file').change(function(){
	readTxtFile();
});

