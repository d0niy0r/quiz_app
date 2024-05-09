import 'dart:convert';

class CheckQuestionsModel {
  bool? isCorrect;
  int? correctAnswer;

  CheckQuestionsModel({
    this.isCorrect,
    this.correctAnswer,
  });

  CheckQuestionsModel copyWith({
    bool? isCorrect,
    int? correctAnswer,
  }) =>
      CheckQuestionsModel(
        isCorrect: isCorrect ?? this.isCorrect,
        correctAnswer: correctAnswer ?? this.correctAnswer,
      );

  factory CheckQuestionsModel.fromJson(String str) => CheckQuestionsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckQuestionsModel.fromMap(Map<String, dynamic> json) => CheckQuestionsModel(
    isCorrect: json["is_correct"],
    correctAnswer: json["correct_answer"],
  );

  Map<String, dynamic> toMap() => {
    "is_correct": isCorrect,
    "correct_answer": correctAnswer,
  };
}
