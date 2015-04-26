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
			$("#categoryOverview tbody #add").append("<tr> <td>"+ word1 +"</td> <td>"+ word2 +"</td> <td></td> </tr>");
		}
	}	
	});
}
