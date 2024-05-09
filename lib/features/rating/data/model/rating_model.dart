import 'dart:convert';

class RatingModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  RatingModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  RatingModel copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<Result>? results,
  }) =>
      RatingModel(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory RatingModel.fromJson(String str) => RatingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RatingModel.fromMap(Map<String, dynamic> json) => RatingModel(
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
  int? id;
  String? fullName;
  int? group;
  int? theme;
  int? countRightAnswers;

  Result({
    this.id,
    this.fullName,
    this.group,
    this.theme,
    this.countRightAnswers,
  });

  Result copyWith({
    int? id,
    String? fullName,
    int? group,
    int? theme,
    int? countRightAnswers,
  }) =>
      Result(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        group: group ?? this.group,
        theme: theme ?? this.theme,
        countRightAnswers: countRightAnswers ?? this.countRightAnswers,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    fullName: json["full_name"],
    group: json["group"],
    theme: json["theme"],
    countRightAnswers: json["count_right_answers"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "full_name": fullName,
    "group": group,
    "theme": theme,
    "count_right_answers": countRightAnswers,
  };
}
