class Question {
  int id;
  String questionContent;
  String choice1;
  String choice2;
  String choice3;
  String choice4;
  String topic;

  Question({
    required this.id,
    required this.questionContent,
    required this.choice1,
    required this.choice2,
    required this.choice3,
    required this.choice4,
    required this.topic,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    return Question(
        id: id,
        questionContent: json['questionContent'],
        choice1: json['choice1'],
        choice2: json['choice2'],
        choice3: json['choice3'],
        choice4: json['choice4'],
        topic: json['topic']);
  }

  static List questionList(List question_api) {
    List questions = [];
    for (var i = 0; i < question_api.length; i++) {
      questions.add(Question.fromJson(question_api[i]));
    }

    return questions;
  }
}
