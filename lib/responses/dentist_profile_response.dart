class DentistProfileResponse {
  final List<Dentist> dentist;

  DentistProfileResponse({
    required this.dentist,
  });

  factory DentistProfileResponse.fromJson(List<dynamic> json) {
    return DentistProfileResponse(
      dentist: json.map((e) => Dentist.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}


class Dentist {
  int dentistId;
  int practiceId;
  dynamic dentistPrefix;
  dynamic dentistFirstName;
  dynamic dentistMiddleName;
  dynamic dentistLastName;
  dynamic dentistSuffixName;
  dynamic dentistDisplayName;
  dynamic dentistPreferredName;
  dynamic dentistOfficeName;
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
  dynamic createdDate;
  dynamic modifiedDate;
  dynamic createdByUserId;
  dynamic modifiedByUserId;
  dynamic dentistFullName;
  dynamic specializationName;
  dynamic specializationDescription;

  Dentist({
    required this.dentistId,
    required this.practiceId,
    this.dentistPrefix,
    this.dentistFirstName,
    this.dentistMiddleName,
    this.dentistLastName,
    this.dentistSuffixName,
    this.dentistDisplayName,
    this.dentistPreferredName,
    this.dentistOfficeName,
    this.dentistPrimaryPhone,
    this.dentistPrimaryEmailAddress,
    this.dentistOfficeAddress1,
    this.dentistOfficeAddress2,
    this.dentistOfficeSuite,
    this.dentistOfficeCity,
    this.dentistOfficeState,
    this.dentistOfficeZipcode,
    this.dentistNotes,
    this.specializationId,
    required this.isActive,
    this.createdDate,
    this.modifiedDate,
    this.createdByUserId,
    this.modifiedByUserId,
    this.dentistFullName,
    this.specializationName,
    this.specializationDescription,
  });

  factory Dentist.fromJson(Map<String, dynamic> json) {
    return Dentist(
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
  }
}
