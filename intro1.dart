void main(){

	var studentData = {"Kehinde": 27, "Emmanuel": 80, "David": 93, "Quadri": 14, "Joshua": 56, "Iyanuoluwa": 43};
	var studentNames = studentData.keys.toList();
	var studentScores = studentData.values.toList();

	for (var name in studentNames){
		print(name);
	}
	for (var score in studentScores){
		print(score);
	}
}
