
class GetPatientFRPResponse {
  final List<PatientFinancialResponsiblePerson> patientFinancialResponsiblePerson;

  GetPatientFRPResponse({
    required this.patientFinancialResponsiblePerson,
  });

  factory GetPatientFRPResponse.fromJson(List<dynamic> json) {
    return GetPatientFRPResponse(
      patientFinancialResponsiblePerson: json.map((e) => PatientFinancialResponsiblePerson.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}



class PatientFinancialResponsiblePerson {
  int patientFinancialResponsiblePersonId;
  int patientId;
  dynamic patientFinancialResponsiblePersonPrefix;
  String patientFinancialResponsiblePersonFirstName;
  dynamic patientFinancialResponsiblePersonMiddleName;
  String patientFinancialResponsiblePersonLastName;
  dynamic patientFinancialResponsiblePersonSuffixName;
  dynamic patientFinancialResponsiblePersonDisplayName;
  dynamic patientFinancialResponsiblePersonPreferredName;
  DateTime patientFinancialResponsiblePersonDob;
  String patientFinancialResponsiblePersonAddress1;
  dynamic patientFinancialResponsiblePersonAddress2;
  String patientFinancialResponsiblePersonCity;
  String patientFinancialResponsiblePersonState;
  String patientFinancialResponsiblePersonStateAbbreviation;
  String patientFinancialResponsiblePersonZip;
  String patientFinancialResponsiblePersonPrimaryPhone;
  dynamic patientFinancialResponsiblePersonPrimaryPhoneExt;
  String patientFinancialResponsiblePersonPrimaryType;
  String patientFinancialResponsiblePersonPrimaryEmailAddress;
  String patientFinancialResponsiblePersonSecondaryPhone;
  String patientFinancialResponsiblePersonSecondaryPhoneExt;
  String patientFinancialResponsiblePersonSecondaryType;
  String patientFinancialResponsiblePersonRelationToPatient;
  bool isPatientAgreedToContactFrpviaEmail;
  bool isPatientAgreedToContactFrpviaText;
  bool isActive;
  bool createFrpUser;
  bool isPrimary;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  String patientFirstName;
  String patientLastName;
  String patientPrimaryPhone;
  String patientPrimaryEmailAddress;
  int practiceId;
  String patientFinancialResponsiblePersonFormattedPrimaryPhone;
  String patientFinancialResponsiblePersonFormattedSecondaryPhone;

  PatientFinancialResponsiblePerson({
    required this.patientFinancialResponsiblePersonId,
    required this.patientId,
    required this.patientFinancialResponsiblePersonPrefix,
    required this.patientFinancialResponsiblePersonFirstName,
    required this.patientFinancialResponsiblePersonMiddleName,
    required this.patientFinancialResponsiblePersonLastName,
    required this.patientFinancialResponsiblePersonSuffixName,
    required this.patientFinancialResponsiblePersonDisplayName,
    required this.patientFinancialResponsiblePersonPreferredName,
    required this.patientFinancialResponsiblePersonDob,
    required this.patientFinancialResponsiblePersonAddress1,
    required this.patientFinancialResponsiblePersonAddress2,
    required this.patientFinancialResponsiblePersonCity,
    required this.patientFinancialResponsiblePersonState,
    required this.patientFinancialResponsiblePersonStateAbbreviation,
    required this.patientFinancialResponsiblePersonZip,
    required this.patientFinancialResponsiblePersonPrimaryPhone,
    required this.patientFinancialResponsiblePersonPrimaryPhoneExt,
    required this.patientFinancialResponsiblePersonPrimaryType,
    required this.patientFinancialResponsiblePersonPrimaryEmailAddress,
    required this.patientFinancialResponsiblePersonSecondaryPhone,
    required this.patientFinancialResponsiblePersonSecondaryPhoneExt,
    required this.patientFinancialResponsiblePersonSecondaryType,
    required this.patientFinancialResponsiblePersonRelationToPatient,
    required this.isPatientAgreedToContactFrpviaEmail,
    required this.isPatientAgreedToContactFrpviaText,
    required this.isActive,
    required this.createFrpUser,
    required this.isPrimary,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.patientFirstName,
    required this.patientLastName,
    required this.patientPrimaryPhone,
    required this.patientPrimaryEmailAddress,
    required this.practiceId,
    required this.patientFinancialResponsiblePersonFormattedPrimaryPhone,
    required this.patientFinancialResponsiblePersonFormattedSecondaryPhone,
  });

  factory PatientFinancialResponsiblePerson.fromJson(Map<String, dynamic> json) {
    return PatientFinancialResponsiblePerson(
      patientFinancialResponsiblePersonId: json['patientFinancialResponsiblePersonId'],
      patientId: json['patientId'],
      patientFinancialResponsiblePersonPrefix: json['patientFinancialResponsiblePersonPrefix'],
      patientFinancialResponsiblePersonFirstName: json['patientFinancialResponsiblePersonFirstName'],
      patientFinancialResponsiblePersonMiddleName: json['patientFinancialResponsiblePersonMiddleName'],
      patientFinancialResponsiblePersonLastName: json['patientFinancialResponsiblePersonLastName'],
      patientFinancialResponsiblePersonSuffixName: json['patientFinancialResponsiblePersonSuffixName'],
      patientFinancialResponsiblePersonDisplayName: json['patientFinancialResponsiblePersonDisplayName'],
      patientFinancialResponsiblePersonPreferredName: json['patientFinancialResponsiblePersonPreferredName'],
      patientFinancialResponsiblePersonDob: DateTime.parse(json['patientFinancialResponsiblePersonDob']),
      patientFinancialResponsiblePersonAddress1: json['patientFinancialResponsiblePersonAddress1'],
      patientFinancialResponsiblePersonAddress2: json['patientFinancialResponsiblePersonAddress2'],
      patientFinancialResponsiblePersonCity: json['patientFinancialResponsiblePersonCity'],
      patientFinancialResponsiblePersonState: json['patientFinancialResponsiblePersonState'],
      patientFinancialResponsiblePersonStateAbbreviation: json['patientFinancialResponsiblePersonStateAbbreviation'],
      patientFinancialResponsiblePersonZip: json['patientFinancialResponsiblePersonZip'],
      patientFinancialResponsiblePersonPrimaryPhone: json['patientFinancialResponsiblePersonPrimaryPhone'],
      patientFinancialResponsiblePersonPrimaryPhoneExt: json['patientFinancialResponsiblePersonPrimaryPhoneExt'],
      patientFinancialResponsiblePersonPrimaryType: json['patientFinancialResponsiblePersonPrimaryType'],
      patientFinancialResponsiblePersonPrimaryEmailAddress: json['patientFinancialResponsiblePersonPrimaryEmailAddress'],
      patientFinancialResponsiblePersonSecondaryPhone: json['patientFinancialResponsiblePersonSecondaryPhone'],
      patientFinancialResponsiblePersonSecondaryPhoneExt: json['patientFinancialResponsiblePersonSecondaryPhoneExt'],
      patientFinancialResponsiblePersonSecondaryType: json['patientFinancialResponsiblePersonSecondaryType'],
      patientFinancialResponsiblePersonRelationToPatient: json['patientFinancialResponsiblePersonRelationToPatient'],
      isPatientAgreedToContactFrpviaEmail: json['isPatientAgreedToContactFrpviaEmail'],
      isPatientAgreedToContactFrpviaText: json['isPatientAgreedToContactFrpviaText'],
      isActive: json['isActive'],
      createFrpUser: json['createFrpUser'],
      isPrimary: json['isPrimary'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      patientFirstName: json['patientFirstName'],
      patientLastName: json['patientLastName'],
      patientPrimaryPhone: json['patientPrimaryPhone'],
      patientPrimaryEmailAddress: json['patientPrimaryEmailAddress'],
      practiceId: json['practiceId'],
      patientFinancialResponsiblePersonFormattedPrimaryPhone: json['patientFinancialResponsiblePersonFormattedPrimaryPhone'],
      patientFinancialResponsiblePersonFormattedSecondaryPhone: json['patientFinancialResponsiblePersonFormattedSecondaryPhone'],
    );
  }
}
