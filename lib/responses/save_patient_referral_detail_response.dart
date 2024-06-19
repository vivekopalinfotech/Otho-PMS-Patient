class SavePatientReferralDetailResponse {
  int patientReferralId;
  int patientId;
  int? referralCategoryId;
  int? referralSubCategoryId;
  int? referredPatientId;
  int? referredDentistId;
  String referralNotes;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  String patientFirstName;
  String patientLastName;
  String referralCategoryName;
  String? referralSubCategoryName;
  int? dentistId;
  String? dentistFirstName;
  String? dentistLastName;
  String? referredPatientFirstName;
  String? referredPatientLastName;

  SavePatientReferralDetailResponse({
    required this.patientReferralId,
    required this.patientId,
    required this.referralCategoryId,
    this.referralSubCategoryId,
    this.referredPatientId,
    required this.referredDentistId,
    required this.referralNotes,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.patientFirstName,
    required this.patientLastName,
    required this.referralCategoryName,
    this.referralSubCategoryName,
    required this.dentistId,
    required this.dentistFirstName,
    required this.dentistLastName,
    this.referredPatientFirstName,
    this.referredPatientLastName,
  });

  factory SavePatientReferralDetailResponse.fromJson(Map<String, dynamic> json) {
    return SavePatientReferralDetailResponse(
      patientReferralId: json['patientReferralId'],
      patientId: json['patientId'],
      referralCategoryId: json['referralCategoryId'],
      referralSubCategoryId: json['referralSubCategoryId'],
      referredPatientId: json['referredPatientId'],
      referredDentistId: json['referredDentistId'],
      referralNotes: json['referralNotes'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      patientFirstName: json['patientFirstName'],
      patientLastName: json['patientLastName'],
      referralCategoryName: json['referralCategoryName'],
      referralSubCategoryName: json['referralSubCategoryName'],
      dentistId: json['dentistId'],
      dentistFirstName: json['dentistFirstName'],
      dentistLastName: json['dentistLastName'],
      referredPatientFirstName: json['referredPatientFirstName'],
      referredPatientLastName: json['referredPatientLastName'],
    );
  }
}
