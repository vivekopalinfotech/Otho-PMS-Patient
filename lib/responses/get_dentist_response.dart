
class GetDentistResponse {
  final List<Dentist> dentist;

  GetDentistResponse({
    required this.dentist,
  });

  factory GetDentistResponse.fromJson(List<dynamic> json) {
    return GetDentistResponse(
      dentist: json.map((e) => Dentist.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class Dentist {
  int dentistId;
  int practiceId;
  dynamic dentistPrefix;
  String dentistFirstName;
  dynamic dentistMiddleName;
  String dentistLastName;
  dynamic dentistSuffixName;
  dynamic dentistDisplayName;
  dynamic dentistPreferredName;
  String dentistOfficeName;
  dynamic dentistPrimaryPhone;
  dynamic dentistPrimaryEmailAddress;
  dynamic dentistOfficeAddress1;
  dynamic dentistOfficeAddress2;
  dynamic dentistOfficeSuite;
  dynamic dentistOfficeCity;
  dynamic dentistOfficeState;
  dynamic dentistOfficeZipcode;
  dynamic dentistNotes;
  dynamic specializationId;
  bool isActive;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String dentistFullName;
  dynamic specializationName;
  dynamic specializationDescription;

  Dentist({
    required this.dentistId,
    required this.practiceId,
    required this.dentistPrefix,
    required this.dentistFirstName,
    required this.dentistMiddleName,
    required this.dentistLastName,
    required this.dentistSuffixName,
    required this.dentistDisplayName,
    required this.dentistPreferredName,
    required this.dentistOfficeName,
    required this.dentistPrimaryPhone,
    required this.dentistPrimaryEmailAddress,
    required this.dentistOfficeAddress1,
    required this.dentistOfficeAddress2,
    required this.dentistOfficeSuite,
    required this.dentistOfficeCity,
    required this.dentistOfficeState,
    required this.dentistOfficeZipcode,
    required this.dentistNotes,
    required this.specializationId,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.dentistFullName,
    required this.specializationName,
    required this.specializationDescription,
  });

  factory Dentist.fromJson(Map<String, dynamic> json) => Dentist(
    dentistId: json['dentistId'],
    practiceId: json['practiceId'],
    dentistPrefix: json['dentistPrefix'],
    dentistFirstName: json['dentistFirstName'],
    dentistMiddleName: json['dentistMiddleName'],
    dentistLastName: json['dentistLastName'],
    dentistSuffixName: json['dentistSuffixName'],
    dentistDisplayName: json['dentistDisplayName'],
    dentistPreferredName: json['dentistPreferredName'],
    dentistOfficeName: json['dentistOfficeName'],
    dentistPrimaryPhone: json['dentistPrimaryPhone'],
    dentistPrimaryEmailAddress: json['dentistPrimaryEmailAddress'],
    dentistOfficeAddress1: json['dentistOfficeAddress1'],
    dentistOfficeAddress2: json['dentistOfficeAddress2'],
    dentistOfficeSuite: json['dentistOfficeSuite'],
    dentistOfficeCity: json['dentistOfficeCity'],
    dentistOfficeState: json['dentistOfficeState'],
    dentistOfficeZipcode: json['dentistOfficeZipcode'],
    dentistNotes: json['dentistNotes'],
    specializationId: json['specializationId'],
    isActive: json['isActive'],
    createdDate: DateTime.parse(json['createdDate']),
    modifiedDate: DateTime.parse(json['modifiedDate']),
    createdByUserId: json['createdByUserId'],
    modifiedByUserId: json['modifiedByUserId'],
    dentistFullName: json['dentistFullName'],
    specializationName: json['specializationName'],
    specializationDescription: json['specializationDescription'],
  );

  Map<String, dynamic> toJson() => {
    'dentistId': dentistId,
    'practiceId': practiceId,
    'dentistPrefix': dentistPrefix,
    'dentistFirstName': dentistFirstName,
    'dentistMiddleName': dentistMiddleName,
    'dentistLastName': dentistLastName,
    'dentistSuffixName': dentistSuffixName,
    'dentistDisplayName': dentistDisplayName,
    'dentistPreferredName': dentistPreferredName,
    'dentistOfficeName': dentistOfficeName,
    'dentistPrimaryPhone': dentistPrimaryPhone,
    'dentistPrimaryEmailAddress': dentistPrimaryEmailAddress,
    'dentistOfficeAddress1': dentistOfficeAddress1,
    'dentistOfficeAddress2': dentistOfficeAddress2,
    'dentistOfficeSuite': dentistOfficeSuite,
    'dentistOfficeCity': dentistOfficeCity,
    'dentistOfficeState': dentistOfficeState,
    'dentistOfficeZipcode': dentistOfficeZipcode,
    'dentistNotes': dentistNotes,
    'specializationId': specializationId,
    'isActive': isActive,
    'createdDate': createdDate.toIso8601String(),
    'modifiedDate': modifiedDate.toIso8601String(),
    'createdByUserId': createdByUserId,
    'modifiedByUserId': modifiedByUserId,
    'dentistFullName': dentistFullName,
    'specializationName': specializationName,
    'specializationDescription': specializationDescription,
  };
}
