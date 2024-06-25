
class GetHabitsResponse {
  final List<Habits> habits;

  GetHabitsResponse({
    required this.habits,
  });

  factory GetHabitsResponse.fromJson(List<dynamic> json) {
    return GetHabitsResponse(
      habits: json.map((e) => Habits.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}


class Habits {
  int habitId;
  int? practiceId;
  String habitName;
  String habitDescription;
  String habitTooltip;
  bool isActive;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;

  Habits({
    required this.habitId,
    this.practiceId,
    required this.habitName,
    required this.habitDescription,
    required this.habitTooltip,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
  });

  factory Habits.fromJson(Map<String, dynamic> json) {
    return Habits(
      habitId: json['habitId'],
      practiceId: json['practiceId'],
      habitName: json['habitName'],
      habitDescription: json['habitDescription'],
      habitTooltip: json['habitTooltip'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
    );
  }
}
