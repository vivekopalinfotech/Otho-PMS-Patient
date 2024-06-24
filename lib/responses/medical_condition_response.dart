class MedicalConditionResponse {
  final List<MedicalCondition> medicalCondition;

  MedicalConditionResponse({
    required this.medicalCondition,
  });

  factory MedicalConditionResponse.fromJson(List<dynamic> json) {
    return MedicalConditionResponse(
      medicalCondition: json.map((e) => MedicalCondition.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class MedicalCondition {
  int medicalConditionId;
  int? practiceId; 
  String medicalConditionName;
  String medicalConditionDescription;
  String medicalConditionTooltip;
  bool isActive;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;

  MedicalCondition({
    required this.medicalConditionId,
    this.practiceId,
    required this.medicalConditionName,
    required this.medicalConditionDescription,
    required this.medicalConditionTooltip,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
  });

  factory MedicalCondition.fromJson(Map<String, dynamic> json) {
    return MedicalCondition(
      medicalConditionId: json['medicalConditionId'],
      practiceId: json['practiceId'],
      medicalConditionName: json['medicalConditionName'],
      medicalConditionDescription: json['medicalConditionDescription'],
      medicalConditionTooltip: json['medicalConditionTooltip'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
    );
  }
}
