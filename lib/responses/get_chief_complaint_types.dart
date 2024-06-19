
class GetChiefCompliantTypesResponse {
  final List<ChiefComplaintType> chiefComplaintTypes;

  GetChiefCompliantTypesResponse({
    required this.chiefComplaintTypes,
  });

  factory GetChiefCompliantTypesResponse.fromJson(List<dynamic> json) {
    return GetChiefCompliantTypesResponse(
      chiefComplaintTypes: json.map((e) => ChiefComplaintType.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}




class ChiefComplaintType {
  int chiefComplaintTypeId;
  int? practiceId;
  String chiefComplaintTypeName;
  String chiefComplaintTypeDescription;
  String chiefComplaintTypeTooltip;
  bool isActive;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;

  ChiefComplaintType({
    required this.chiefComplaintTypeId,
    this.practiceId,
    required this.chiefComplaintTypeName,
    required this.chiefComplaintTypeDescription,
    required this.chiefComplaintTypeTooltip,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
  });

  factory ChiefComplaintType.fromJson(Map<String, dynamic> json) {
    return ChiefComplaintType(
      chiefComplaintTypeId: json['chiefComplaintTypeId'],
      practiceId: json['practiceId'],
      chiefComplaintTypeName: json['chiefComplaintTypeName'],
      chiefComplaintTypeDescription: json['chiefComplaintTypeDescription'],
      chiefComplaintTypeTooltip: json['chiefComplaintTypeTooltip'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
    );
  }
}
