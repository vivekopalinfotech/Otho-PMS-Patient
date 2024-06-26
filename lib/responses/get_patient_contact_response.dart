
class GetPrimaryContactResponse {
  final List<PatientContact> patientContact;

  GetPrimaryContactResponse({
    required this.patientContact,
  });

  factory GetPrimaryContactResponse.fromJson(List<dynamic> json) {
    return GetPrimaryContactResponse(
      patientContact: json.map((e) => PatientContact.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}


class PatientContact {
  int patientContactId;
  int patientId;
  String patientContactPrefix;
  String patientContactFirstName;
  String patientContactMiddleName;
  String patientContactLastName;
  dynamic patientContactSuffixName;
  dynamic patientContactDisplayName;
  dynamic patientContactPreferredName;
  String patientContactGender;
  DateTime patientContactDob;
  String patientContactPrimaryPhone;
  dynamic patientContactPrimaryPhoneExt;
  String patientContactPrimaryType;
  String patientContactPrimaryEmailAddress;
  String patientContactRelationToPatient;
  bool isActive;
  bool isPrimary;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  int practiceId;
  String patientContactFormattedPrimaryPhone;

  PatientContact({
    required this.patientContactId,
    required this.patientId,
    required this.patientContactPrefix,
    required this.patientContactFirstName,
    required this.patientContactMiddleName,
    required this.patientContactLastName,
    required this.patientContactSuffixName,
    required this.patientContactDisplayName,
    required this.patientContactPreferredName,
    required this.patientContactGender,
    required this.patientContactDob,
    required this.patientContactPrimaryPhone,
    required this.patientContactPrimaryPhoneExt,
    required this.patientContactPrimaryType,
    required this.patientContactPrimaryEmailAddress,
    required this.patientContactRelationToPatient,
    required this.isActive,
    required this.isPrimary,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.practiceId,
    required this.patientContactFormattedPrimaryPhone,
  });

  factory PatientContact.fromJson(Map<String, dynamic> json) {
    return PatientContact(
      patientContactId: json['patientContactId'],
      patientId: json['patientId'],
      patientContactPrefix: json['patientContactPrefix'],
      patientContactFirstName: json['patientContactFirstName'],
      patientContactMiddleName: json['patientContactMiddleName'],
      patientContactLastName: json['patientContactLastName'],
      patientContactSuffixName: json['patientContactSuffixName']??'',
      patientContactDisplayName: json['patientContactDisplayName']??'',
      patientContactPreferredName: json['patientContactPreferredName']??'',
      patientContactGender: json['patientContactGender'],
      patientContactDob: DateTime.parse(json['patientContactDob']),
      patientContactPrimaryPhone: json['patientContactPrimaryPhone'],
      patientContactPrimaryPhoneExt: json['patientContactPrimaryPhoneExt']??'',
      patientContactPrimaryType: json['patientContactPrimaryType'],
      patientContactPrimaryEmailAddress: json['patientContactPrimaryEmailAddress'],
      patientContactRelationToPatient: json['patientContactRelationToPatient'],
      isActive: json['isActive'],
      isPrimary: json['isPrimary'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      practiceId: json['practiceId'],
      patientContactFormattedPrimaryPhone: json['patientContactFormattedPrimaryPhone'],
    );
  }
}
