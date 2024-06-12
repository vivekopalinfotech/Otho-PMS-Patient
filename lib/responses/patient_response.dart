class PatientResponse {
  final List<Patient> patient;

  PatientResponse({
    required this.patient,
  });

  factory PatientResponse.fromJson(List<dynamic> json) {
    return PatientResponse(
      patient: json.map((e) => Patient.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}



class Patient {
  final int patientId;
  final String patientGuid;
  final int practiceId;
  final String practiceName;
  final String patientPrefix;
  final String patientFirstName;
  final String patientMiddleName;
  final String patientLastName;
  final String patientName;
  final String patientDisplayName;
  final String? patientPreferredName;
  final String? patientSuffixName;
  final String patientGender;
  final String patientMaritalStatus;
  final int patientAge;
  final String patientLanguagePreference;
  final bool hasPrimaryDentist;
  final int primaryDentistId;
  final String patientPrimaryPhone;
  final String patientPrimaryType;
  final String? patientPrimaryPhoneExt;
  final String patientPrimaryEmailAddress;
  final String? patientSecondaryPhone;
  final String patientSecondaryPhoneType;
  final String? patientSecondaryPhoneExt;
  final String? patientSecondaryEmailAddress;
  final String? patientAddress1;
  final String? patientAddress2;
  final String? patientCity;
  final String? patientState;
  final String? patientZip;
  final String patientEmergencyContactFirstName;
  final String patientEmergencyContactLastName;
  final String patientEmergencyContactRelationship;
  final String? patientEmergencyContactFormattedDob;
  final String patientEmergencyContactPhone;
  final String patientEmergencyContactPhoneType;
  final String patientEmergencyContactPhoneExt;
  final bool isAssociatedPatient;
  final String associatedPatientRelationship;
  final bool isPatientAgreedToContactViaEmail;
  final bool isPatientAgreedToContactViaText;
  final bool isPatientAgreedToMedicalConditions;
  final bool isPatientAgreedToPolicy;
  final bool isPatientAgreedToPracticePolicies;
  final DateTime patientCreatedDate;
  final String? providerLicenseNumber;
  final String? providerNotes;
  final String? providerNpi;
  final String primaryDentistFirstName;
  final String primaryDentistLastName;
  final String primaryDentistName;
  final String? primaryDentistContactNumber;
  final String primaryDentistOfficeName;
  final String? primaryDentistOfficeAddress;
  final String? primaryDentistOfficeCity;
  final String? primaryDentistOfficeState;
  final String? primaryDentistOfficeZipcode;
  final String? primaryDentistEmailAddress;
  final String? primaryDentistPhoneNumber;
  final String patientNotes;
  final String? patientStateAbbreviation;
  final int? patientStatusId;
  final int practiceLocationId;
  final String practiceLocationName;
  final String? patientHobbiesInterests;
  final String patientStudentStatus;
  final String? patientStatus;
  final String? patientStatusDescription;
  final bool isPatientFrp;
  final String practicePrimaryLocationName;
  final String practicePrimaryLocationAddress;
  final String practicePrimaryLocationCity;
  final String practicePrimaryLocationState;
  final String? practicePrimaryLocationStateAbbreviation;
  final String practicePrimaryLocationZip;
  final String patientFormattedDob;
  final DateTime patientDob;
  final DateTime? patientEmergencyContactDob;
  final int patientLocationId;
  final String patientLocationName;

  Patient({
    required this.patientId,
    required this.patientGuid,
    required this.practiceId,
    required this.practiceName,
    required this.patientPrefix,
    required this.patientFirstName,
    required this.patientMiddleName,
    required this.patientLastName,
    required this.patientName,
    required this.patientDisplayName,
    this.patientPreferredName,
    this.patientSuffixName,
    required this.patientGender,
    required this.patientMaritalStatus,
    required this.patientAge,
    required this.patientLanguagePreference,
    required this.hasPrimaryDentist,
    required this.primaryDentistId,
    required this.patientPrimaryPhone,
    required this.patientPrimaryType,
    this.patientPrimaryPhoneExt,
    required this.patientPrimaryEmailAddress,
    this.patientSecondaryPhone,
    required this.patientSecondaryPhoneType,
    this.patientSecondaryPhoneExt,
    this.patientSecondaryEmailAddress,
    this.patientAddress1,
    this.patientAddress2,
    this.patientCity,
    this.patientState,
    this.patientZip,
    required this.patientEmergencyContactFirstName,
    required this.patientEmergencyContactLastName,
    required this.patientEmergencyContactRelationship,
    this.patientEmergencyContactFormattedDob,
    required this.patientEmergencyContactPhone,
    required this.patientEmergencyContactPhoneType,
    required this.patientEmergencyContactPhoneExt,
    required this.isAssociatedPatient,
    required this.associatedPatientRelationship,
    required this.isPatientAgreedToContactViaEmail,
    required this.isPatientAgreedToContactViaText,
    required this.isPatientAgreedToMedicalConditions,
    required this.isPatientAgreedToPolicy,
    required this.isPatientAgreedToPracticePolicies,
    required this.patientCreatedDate,
    this.providerLicenseNumber,
    this.providerNotes,
    this.providerNpi,
    required this.primaryDentistFirstName,
    required this.primaryDentistLastName,
    required this.primaryDentistName,
    this.primaryDentistContactNumber,
    required this.primaryDentistOfficeName,
    this.primaryDentistOfficeAddress,
    this.primaryDentistOfficeCity,
    this.primaryDentistOfficeState,
    this.primaryDentistOfficeZipcode,
    this.primaryDentistEmailAddress,
    this.primaryDentistPhoneNumber,
    required this.patientNotes,
    this.patientStateAbbreviation,
    this.patientStatusId,
    required this.practiceLocationId,
    required this.practiceLocationName,
    this.patientHobbiesInterests,
    required this.patientStudentStatus,
    this.patientStatus,
    this.patientStatusDescription,
    required this.isPatientFrp,
    required this.practicePrimaryLocationName,
    required this.practicePrimaryLocationAddress,
    required this.practicePrimaryLocationCity,
    required this.practicePrimaryLocationState,
    this.practicePrimaryLocationStateAbbreviation,
    required this.practicePrimaryLocationZip,
    required this.patientFormattedDob,
    required this.patientDob,
    this.patientEmergencyContactDob,
    required this.patientLocationId,
    required this.patientLocationName,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      patientId: json['patientId'],
      patientGuid: json['patientGuid'],
      practiceId: json['practiceId'],
      practiceName: json['practiceName'],
      patientPrefix: json['patientPrefix'],
      patientFirstName: json['patientFirstName'],
      patientMiddleName: json['patientMiddleName'],
      patientLastName: json['patientLastName'],
      patientName: json['patientName'],
      patientDisplayName: json['patientDisplayName'],
      patientPreferredName: json['patientPreferredName'],
      patientSuffixName: json['patientSuffixName'],
      patientGender: json['patientGender'],
      patientMaritalStatus: json['patientMaritalStatus'],
      patientAge: json['patientAge'],
      patientLanguagePreference: json['patientLanguagePreference'],
      hasPrimaryDentist: json['hasPrimaryDentist'],
      primaryDentistId: json['primaryDentistId'],
      patientPrimaryPhone: json['patientPrimaryPhone'],
      patientPrimaryType: json['patientPrimaryType'],
      patientPrimaryPhoneExt: json['patientPrimaryPhoneExt'],
      patientPrimaryEmailAddress: json['patientPrimaryEmailAddress'],
      patientSecondaryPhone: json['patientSecondaryPhone'],
      patientSecondaryPhoneType: json['patientSecondaryPhoneType'],
      patientSecondaryPhoneExt: json['patientSecondaryPhoneExt'],
      patientSecondaryEmailAddress: json['patientSecondaryEmailAddress'],
      patientAddress1: json['patientAddress1'],
      patientAddress2: json['patientAddress2'],
      patientCity: json['patientCity'],
      patientState: json['patientState'],
      patientZip: json['patientZip'],
      patientEmergencyContactFirstName: json['patientEmergencyContactFirstName'],
      patientEmergencyContactLastName: json['patientEmergencyContactLastName'],
      patientEmergencyContactRelationship: json['patientEmergencyContactRelationship'],
      patientEmergencyContactFormattedDob: json['patientEmergencyContactFormattedDob'],
      patientEmergencyContactPhone: json['patientEmergencyContactPhone'],
      patientEmergencyContactPhoneType: json['patientEmergencyContactPhoneType'],
      patientEmergencyContactPhoneExt: json['patientEmergencyContactPhoneExt'],
      isAssociatedPatient: json['isAssociatedPatient'],
      associatedPatientRelationship: json['associatedPatientRelationship'],
      isPatientAgreedToContactViaEmail: json['isPatientAgreedToContactViaEmail'],
      isPatientAgreedToContactViaText: json['isPatientAgreedToContactViaText'],
      isPatientAgreedToMedicalConditions: json['isPatientAgreedToMedicalConditions'],
      isPatientAgreedToPolicy: json['isPatientAgreedToPolicy'],
      isPatientAgreedToPracticePolicies: json['isPatientAgreedToPracticePolicies'],
      patientCreatedDate: DateTime.parse(json['patientCreatedDate']),
      providerLicenseNumber: json['providerLicenseNumber'],
      providerNotes: json['providerNotes'],
      providerNpi: json['providerNpi'],
      primaryDentistFirstName: json['primaryDentistFirstName'],
      primaryDentistLastName: json['primaryDentistLastName'],
      primaryDentistName: json['primaryDentistName'],
      primaryDentistContactNumber: json['primaryDentistContactNumber'],
      primaryDentistOfficeName: json['primaryDentistOfficeName'],
      primaryDentistOfficeAddress: json['primaryDentistOfficeAddress'],
      primaryDentistOfficeCity: json['primaryDentistOfficeCity'],
      primaryDentistOfficeState: json['primaryDentistOfficeState'],
      primaryDentistOfficeZipcode: json['primaryDentistOfficeZipcode'],
      primaryDentistEmailAddress: json['primaryDentistEmailAddress'],
      primaryDentistPhoneNumber: json['primaryDentistPhoneNumber'],
      patientNotes: json['patientNotes'],
      patientStateAbbreviation: json['patientStateAbbreviation'],
      patientStatusId: json['patientStatusId'],
      practiceLocationId: json['practiceLocationId'],
      practiceLocationName: json['practiceLocationName'],
      patientHobbiesInterests: json['patientHobbiesInterests'],
      patientStudentStatus: json['patientStudentStatus'],
      patientStatus: json['patientStatus'],
      patientStatusDescription: json['patientStatusDescription'],
      isPatientFrp: json['isPatientFrp'],
      practicePrimaryLocationName: json['practicePrimaryLocationName'],
      practicePrimaryLocationAddress: json['practicePrimaryLocationAddress'],
      practicePrimaryLocationCity: json['practicePrimaryLocationCity'],
      practicePrimaryLocationState: json['practicePrimaryLocationState'],
      practicePrimaryLocationStateAbbreviation: json['practicePrimaryLocationStateAbbreviation'],
      practicePrimaryLocationZip: json['practicePrimaryLocationZip'],
      patientFormattedDob: json['patientFormattedDob'],
      patientDob: DateTime.parse(json['patientDob']),
      patientEmergencyContactDob: json['patientEmergencyContactDob'] != null ? DateTime.parse(json['patientEmergencyContactDob']) : null,
      patientLocationId: json['patientLocationId'],
      patientLocationName: json['patientLocationName'],
    );
  }
}
