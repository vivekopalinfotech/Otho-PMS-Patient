class GetAllergyResponse {
  final List<Allergy> allergy;

  GetAllergyResponse({
    required this.allergy,
  });

  factory GetAllergyResponse.fromJson(List<dynamic> json) {
    return GetAllergyResponse(
      allergy: json.map((e) => Allergy.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class Allergy {
  final int allergyId;
  final int? practiceId;
  final String allergyName;
  final String allergyDescription;
  final String allergyTooltip;
  final bool isActive;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdByUserId;
  final String modifiedByUserId;

  Allergy({
    required this.allergyId,
    this.practiceId,
    required this.allergyName,
    required this.allergyDescription,
    required this.allergyTooltip,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
  });

  factory Allergy.fromJson(Map<String, dynamic> json) {
    return Allergy(
      allergyId: json['allergyId'] ?? 0,
      practiceId: json['practiceId'],
      allergyName: json['allergyName'] ?? '',
      allergyDescription: json['allergyDescription'] ?? '',
      allergyTooltip: json['allergyTooltip'] ?? '',
      isActive: json['isActive'] ?? false,
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'] ?? '',
      modifiedByUserId: json['modifiedByUserId'] ?? '',
    );
  }
}
