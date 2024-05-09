import 'dart:convert';

class GroupModel {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  GroupModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  GroupModel copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<Result>? results,
  }) =>
      GroupModel(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory GroupModel.fromJson(String str) => GroupModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GroupModel.fromMap(Map<String, dynamic> json) => GroupModel(
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

  Result({
    this.id,
    this.name,
  });

  Result copyWith({
    int? id,
    String? name,
  }) =>
      Result(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
