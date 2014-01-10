function getCurrentQuestion() {
	var currentQuestion;

	if ($('#answer1').is(':visible') && !($('#answer2').is(':visible'))) {
		currentQuestion = 2;
	} else if ($('#answer2').is(':visible') && !($('#answer3').is(':visible'))) {
		currentQuestion = 3;
	} else
		currentQuestion = 1;

	return currentQuestion;
}