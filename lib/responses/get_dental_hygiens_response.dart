
class GetDentalHygieneResponse {
  final List<DentalHygiene> dentalHygiene;

  GetDentalHygieneResponse({
    required this.dentalHygiene,
  });

  factory GetDentalHygieneResponse.fromJson(List<dynamic> json) {
    return GetDentalHygieneResponse(
      dentalHygiene: json.map((e) => DentalHygiene.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}


class DentalHygiene {
  int dentalHygieneId;
  int? practiceId;
  String dentalHygieneName;
  String dentalHygieneDescription;
  String dentalHygieneTooltip;
  bool isActive;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;

  DentalHygiene({
    required this.dentalHygieneId,
    this.practiceId,
    required this.dentalHygieneName,
    required this.dentalHygieneDescription,
    required this.dentalHygieneTooltip,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
  });

  factory DentalHygiene.fromJson(Map<String, dynamic> json) {
    return DentalHygiene(
      dentalHygieneId: json['dentalHygieneId'],
      practiceId: json['practiceId'],
      dentalHygieneName: json['dentalHygieneName'],
      dentalHygieneDescription: json['dentalHygieneDescription'],
      dentalHygieneTooltip: json['dentalHygieneTooltip'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
    );
  }
}
