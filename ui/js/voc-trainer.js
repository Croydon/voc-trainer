function get_attribute(attribute)
{
	return $("#"+attribute).html();
}

function save_word_to_category() 
{
	var word1 = $("input[name=word1]").val();	
	var word2 = $("input[name=word2]").val();	
	
	var langID1 = get_attribute("lang1");
	var langID2 = get_attribute("lang2");
	
	var category = get_attribute("categoryID");
	

	$.post("/addwordtocategory/"+category, {word1: word1, word2: word2, langID1: langID1, langID2: langID2, categoryID: category}, function(data) {
	{
		if (data["status"] == 0)
		{
			alert("Sorry. An error is occurred.");
		}
		else
		{
			$("#categoryOverview tbody").prepend("<tr> <td>"+ word1 +"</td> <td>"+ word2 +"</td> <td></td> </tr>");
			$("input[name=word1]").val("");	
			$("input[name=word2]").val("");	
			$("input[name=word1]").focus();
		}
	}	
	});
}

function training_start()
{
	wordAmount = Object.keys(wordUnits).length;
	$("span[id=trainingAmountWords]").html(wordAmount);
	
	trainingI = 0;
	
	training_load_word();
}

function training_load_word()
{
	$("span[id=trainingCurrentProgress]").html(trainingI + 1);
	
	currentWordUnit = wordUnits[trainingI];
	
	$.getJSON("/getword", {wordUnitID: currentWordUnit}).success( function(data) 
	{
		if(data["status"] == 0)
		{
			alert("Some error occured :(");
			return false;
		}
		
		currentWord = data["word"];
		$("input[id=trainingWord]").val(currentWord);
	});
}

currentChecking = false;

function training_check_word()
{
	if(currentChecking == true) { return false; } 
	
	currentAnswer = $("input[name=wordTranslation]").val();
	currentChecking = true;
	$.getJSON("/checkword", {wordUnitID: currentWordUnit, userAnswer: currentAnswer}).success( function(data) 
	{
		if(data["status"] == 0)
		{
			alert("Some error occured :(");
			return false;
		}
		
		if(data["correct"] == 0)
		{
			// The user answer is wrong
			$("#trainingResults tbody").prepend("<tr class='danger'> <td>"+ data['correctWord'] +"</td> <td>"+ currentAnswer +"</td> <td>"+ currentWord +"</td> </tr>");
		}
		else
		{
			// The user answer is right
			$("#trainingResults tbody").prepend("<tr class='success'> <td>"+ data['correctWord'] +"</td> <td>"+ currentAnswer +"</td> <td>"+ currentWord +"</td> </tr>");
		}
		
		$("input[name=wordTranslation]").val("");
		$("input[name=wordTranslation]").focus();
		currentChecking = false;
		trainingI++;
		training_load_word();
	});	
	
	return false;
}
