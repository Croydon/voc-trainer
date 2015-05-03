// This file contains all event handlers for ui elements

$(document).ready(function() {
	
	// Add a word to a category	
		$("#saveWordForm").submit(function() { save_word_to_category(); return false; });
		
	// Training
		$("#trainingForm").submit(function() { training_check_word(); return false; });

});
