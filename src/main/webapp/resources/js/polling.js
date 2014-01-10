function poll() {
	var currentQuestion = getCurrentQuestion();
	var userId = $("#userId").val();
	var answerInfo = {} ;
	answerInfo.userId = userId;
	answerInfo.question = currentQuestion;
	
	$.ajax({
		   error: function (request, status, error) {
		        alert('Error ' +error);
		   },
		success : function(data) {
			switch (data.questionId) {
			case 1:
				alert("Mensaje Recibido");
				$("#question" + data.questionId).show();
				$("#answer" + data.questionId).show();
				$("[id*=answer"+data.answerId+"question"+"]").hide();
				$("#answer" + data.answerId + "question" + data.questionId).show();
				$("#answer" + data.answerId + "question" + data.questionId)
						.attr('checked', true);
				$("#question2").show();
				actualquestion = 1;
				break;
			case 2:
				alert("Mensaje Recibido");
				$("#question" + data.questionId).show();
				$("#answer" + data.questionId).show();
				$("[id*=answer"+data.answerId+"question"+"]").hide();
				$("#answer" + data.answerId + "question" + data.questionId).show();
				$("#answer" + data.answerId + "question" + data.questionId)
						.attr('checked', true);
				$("#question3").show();
				actualquestion = 2;
				break;
			case 3:
				alert("Mensaje Recibido");
				$("#question" + data.questionId).show();
				$("#answer" + data.questionId).show();
				$("[id*=answer"+data.answerId+"question"+"]").hide();
				$("#answer" + data.answerId + "question" + data.questionId).show();
				$("#answer" + data.answerId + "question" + data.questionId)
						.attr('checked', true);
				actualquestion = 3;
				break;
			}
		},
		dataType : "json",
		timeout : 20000,
	    data: JSON.stringify(answerInfo),
		contentType : "application/json",
		type : "POST",
		url : "poolanswer"
	});
}
