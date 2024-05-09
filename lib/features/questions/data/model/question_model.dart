import 'dart:convert';

class QuestionModel {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  QuestionModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  QuestionModel copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<Result>? results,
  }) =>
      QuestionModel(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory QuestionModel.fromJson(String str) => QuestionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromMap(Map<String, dynamic> json) => QuestionModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
  };
}

class Result {
  final int? id;
  final String? title;
  final List<Answer>? answers;

  Result({
    this.id,
    this.title,
    this.answers,
  });

  Result copyWith({
    int? id,
    String? title,
    List<Answer>? answers,
  }) =>
      Result(
        id: id ?? this.id,
        title: title ?? this.title,
        answers: answers ?? this.answers,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toMap())),
  };
}

class Answer {
  final int? id;
  final String? answer;
  final bool? isCorrect;

  Answer({
    this.id,
    this.answer,
    this.isCorrect,
  });

  Answer copyWith({
    int? id,
    String? answer,
    bool? isCorrect,
  }) =>
      Answer(
        id: id ?? this.id,
        answer: answer ?? this.answer,
        isCorrect: isCorrect ?? this.isCorrect,
      );

  factory Answer.fromJson(String str) => Answer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Answer.fromMap(Map<String, dynamic> json) => Answer(
    id: json["id"],
    answer: json["answer"],
    isCorrect: json["is_correct"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "answer": answer,
    "is_correct": isCorrect,
  };
}
