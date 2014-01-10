function pushNotification(type) {
	var userId = $("#userId").val();
	var json = {};
	var jsonPayload = setPayload(type);
	json.userId = userId;
	json.payload = jsonPayload;
	
	console.log(JSON.stringify(JSON.stringify(json)));

	if (json) {
		$.ajax({
			url : "push",
			type : "POST",
			//dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(json),
			success : function(data) {
				console.log("Push notification  response  code: "+data.statusInfo.statusCode + " message: "+ data.statusInfo.statusMessage);
				var html;
				jQuery('#sectionError').html('');
				
				if(data.statusInfo.statusCode == 202)
					html = "<div id=\"response\" class=\"alert alert-success\">Push Notification send sucessful</div>";
				
				else 
					html = "<div id=\"response\" class=\"alert alert-error\">Error to send Push Notification </div>";
				
				
	            $('#sectionError').append(html);

			}
			,
			   error: function (request, status, error) {
			        alert(request.responseText);
			   }
		});

	}
}

function setPayload( type) {
	var json = {};
	switch (type) {
	case 1:
		json.type = 1;
		break;
	case 2:
		json.type = 2;
		json.message = $("#textmessage").val();
		json.company = $("#selectorCompany").val();
		break;

	case 3:
		json.type = 3;
		json.questionId = getCurrentQuestion();
		break;
	}
	return json;
}