// This file contains all event handlers for ui elements

$(document).ready(function() {
	
	// Add a word to a category
		//$("#saveWordToCategory").click(function() { save_word_to_category(); return false; });	
		$("#saveWordForm").submit(function() { save_word_to_category(); return false; });
});