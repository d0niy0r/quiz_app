class ExamStartModel {
  int id;
  String fullName;
  int groupId;
  int theme;
  int? countRightAnswers;

  ExamStartModel({
    required this.id,
    required this.fullName,
    required this.groupId,
    required this.theme,
    this.countRightAnswers,
  });

  factory ExamStartModel.fromMap(Map<String, dynamic> json) => ExamStartModel(
        id: json["id"],
        fullName: json["full_name"],
        groupId: json["group"],
        theme: json["theme"],
        countRightAnswers: json["count_right_answers"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "full_name": fullName,
        "group": groupId,
        "theme": theme,
        "count_right_answers": countRightAnswers,
      };
}
