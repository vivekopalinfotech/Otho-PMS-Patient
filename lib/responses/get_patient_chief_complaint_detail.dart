class ChiefComplaintDetailResponse {
  int patientChiefComplaintId;
  int patientId;
  int chiefComplaintTypeId;
  String patientChiefComplaintNotes;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  String chiefComplaintTypeName;
  String patientFirstName;
  String patientLastName;
  int practiceId;

  ChiefComplaintDetailResponse({
    required this.patientChiefComplaintId,
    required this.patientId,
    required this.chiefComplaintTypeId,
    required this.patientChiefComplaintNotes,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.chiefComplaintTypeName,
    required this.patientFirstName,
    required this.patientLastName,
    required this.practiceId,
  });

  factory ChiefComplaintDetailResponse.fromJson(Map<String, dynamic> json) {
    return ChiefComplaintDetailResponse(
      patientChiefComplaintId: json['patientChiefComplaintId'],
      patientId: json['patientId'],
      chiefComplaintTypeId: json['chiefComplaintTypeId'],
      patientChiefComplaintNotes: json['patientChiefComplaintNotes'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      chiefComplaintTypeName: json['chiefComplaintTypeName'],
      patientFirstName: json['patientFirstName'],
      patientLastName: json['patientLastName'],
      practiceId: json['practiceId'],
    );
  }
}
