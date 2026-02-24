class AnswerModel {
  final String question;
  final String answer;
  final String date;

  AnswerModel({
    required this.question,
    required this.answer,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'question': question,
    'answer': answer,
    'date': date,
  };

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      question: json['question'],
      answer: json['answer'],
      date: json['date'],
    );
  }
}