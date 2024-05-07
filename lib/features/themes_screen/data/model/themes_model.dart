import 'dart:convert';

class ThemeModel {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  ThemeModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  ThemeModel copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<Result>? results,
  }) =>
      ThemeModel(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory ThemeModel.fromJson(String str) => ThemeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ThemeModel.fromMap(Map<String, dynamic> json) => ThemeModel(
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
  final String? name;
  final int? questionsCount;

  Result({
    this.id,
    this.name,
    this.questionsCount,
  });

  Result copyWith({
    int? id,
    String? name,
    int? questionsCount,
  }) =>
      Result(
        id: id ?? this.id,
        name: name ?? this.name,
        questionsCount: questionsCount ?? this.questionsCount,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    questionsCount: json["questions_count"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "questions_count": questionsCount,
  };
}
