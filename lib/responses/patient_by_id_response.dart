

class PatientByIdResponse {
  final List<PatientById> patientById;

  PatientByIdResponse({
    required this.patientById,
  });

  factory PatientByIdResponse.fromJson(List<dynamic> json) {
    return PatientByIdResponse(
      patientById: json.map((e) => PatientById.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'patientById': patientById.map((e) => e.toJson()).toList(),
  };
}

class PatientById {
  String? patientId;
  String? patientGuid;
  String? practiceId;
  String? practiceName;
  String? patientPrefix;
  String? patientFirstName;
  String? patientMiddleName;
  String? patientLastName;
  String? patientName;
  String? patientDisplayName;
  String? patientPreferredName;
  String? patientSuffixName;
  String? patientGender;
  String? patientMaritalStatus;
  String? patientDob;
  String? patientAge;
  String? patientLanguagePreference;
  bool hasPrimaryDentist;
  String? primaryDentistId;
  String? patientPrimaryPhone;
  String? patientPrimaryType;
  String? patientPrimaryPhoneExt;
  String? patientPrimaryEmailAddress;
  String? patientSecondaryPhone;
  String? patientSecondaryPhoneType;
  String? patientSecondaryPhoneExt;
  String? patientSecondaryEmailAddress;
  String? patientAddress1;
  String? patientAddress2;
  String? patientCity;
  String? patientState;
  String? patientZip;
  String? patientEmergencyContactFirstName;
  String? patientEmergencyContactLastName;
  String? patientEmergencyContactRelationship;
  String? patientEmergencyContactDob;
  String? patientEmergencyContactPhone;
  String? patientEmergencyContactPhoneType;
  String? patientEmergencyContactPhoneExt;
  bool? isAssociatedPatient;
  String? associatedPatientRelationship;
  bool isPatientAgreedToContactViaEmail;
  bool isPatientAgreedToContactViaText;
  bool isPatientAgreedToMedicalConditions;
  bool isPatientAgreedToPolicy;
  bool isPatientAgreedToPracticePolicies;
  String? patientCreatedDate;
  String? providerLicenseNumber;
  String? providerNotes;
  String? providerNpi;
  String? primaryDentistFirstName;
  String? primaryDentistLastName;
  String? primaryDentistName;
  String? primaryDentistContactNumber;
  String? primaryDentistOffice;
  String? primaryDentistOfficeAddress;
  String? primaryDentistOfficeCity;
  String? primaryDentistOfficeState;
  String? primaryDentistOfficeZipcode;
  String? primaryDentistEmailAddress;
  String? primaryDentistPhone;
  String? patientNotes;
  String? patientStateAbbreviation;
  String? patientStatusId;
  String practiceLocationId;
  String? practiceLocationName;
  String? patientHobbiesInterests;
  String? patientStudentStatus;
  String? patientStatusName;
  String? patientStatusDescription;
  bool hasPrimaryContact;
  bool hasFinancialResponsiblePerson;
  bool hasMedicalConditions;
  bool hasDentalHygiene;
  bool hasHabits;
  bool hasReferral;
  bool hasChiefComplaint;
  bool hasInsurance;
  String? medicalHistoryStatus;
  bool isPatientFrp;
  dynamic hasPaymentPlan;
  dynamic hasTreatmentContract;
  bool isPatientHasAllergy;
  String? practicePrimaryLocationName;
  String? practicePrimaryLocationAddress;
  String? practicePrimaryLocationCity;
  String? practicePrimaryLocationState;
  String? practicePrimaryLocationStateAbbreviation;
  String? practicePrimaryLocationZip;
  String? patientFinancialResponsiblePersonLastName;
  String? patientFinancialResponsiblePersonFirstName;
  String? patientFinancialResponsiblePersonAddress1;
  String? patientFinancialResponsiblePersonAddress2;
  String? patientFinancialResponsiblePersonCity;
  String? patientFinancialResponsiblePersonState;
  String? patientFinancialResponsiblePersonStateAbbreviation;
  String? patientFinancialResponsiblePersonZip;
  String? patientFinancialResponsiblePersonDisplayName;
  String? patientFinancialResponsiblePersonPreferredName;
  String? patientFinancialResponsiblePersonMiddleName;
  String? patientFinancialResponsiblePersonDob;
  String? patientFinancialResponsiblePersonPrimaryEmailAddress;
  String? patientFinancialResponsiblePersonPrimaryPhone;
  String? patientContactFirstName;
  String? patientContactLastName;
  String? patientContactDob;
  String? patientContactPreferredName;
  String? patientContactGender;
  String? patientContactDisplayName;
  String? patientContactMiddleName;
  String? patientContactPrimaryEmailAddress;
  String? patientContactPrimaryPhone;
  String? patientFormattedDob;
  String? patientEligibilityStatusName;
  bool isDdsnotOnFile;
  String? ddsprimaryDentistName;

  PatientById({
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
    required this.patientPreferredName,
    required this.patientSuffixName,
    required this.patientGender,
    required this.patientMaritalStatus,
    required this.patientDob,
    required this.patientAge,
    required this.patientLanguagePreference,
    required this.hasPrimaryDentist,
    required this.primaryDentistId,
    required this.patientPrimaryPhone,
    required this.patientPrimaryType,
    required this.patientPrimaryPhoneExt,
    required this.patientPrimaryEmailAddress,
    required this.patientSecondaryPhone,
    required this.patientSecondaryPhoneType,
    required this.patientSecondaryPhoneExt,
    required this.patientSecondaryEmailAddress,
    required this.patientAddress1,
    required this.patientAddress2,
    required this.patientCity,
    required this.patientState,
    required this.patientZip,
    required this.patientEmergencyContactFirstName,
    required this.patientEmergencyContactLastName,
    required this.patientEmergencyContactRelationship,
    required this.patientEmergencyContactDob,
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
    required this.providerLicenseNumber,
    required this.providerNotes,
    required this.providerNpi,
    required this.primaryDentistFirstName,
    required this.primaryDentistLastName,
    required this.primaryDentistName,
    required this.primaryDentistContactNumber,
    required this.primaryDentistOffice,
    required this.primaryDentistOfficeAddress,
    required this.primaryDentistOfficeCity,
    required this.primaryDentistOfficeState,
    required this.primaryDentistOfficeZipcode,
    required this.primaryDentistEmailAddress,
    required this.primaryDentistPhone,
    required this.patientNotes,
    required this.patientStateAbbreviation,
    required this.patientStatusId,
    required this.practiceLocationId,
    required this.practiceLocationName,
    required this.patientHobbiesInterests,
    required this.patientStudentStatus,
    required this.patientStatusName,
    required this.patientStatusDescription,
    required this.hasPrimaryContact,
    required this.hasFinancialResponsiblePerson,
    required this.hasMedicalConditions,
    required this.hasDentalHygiene,
    required this.hasHabits,
    required this.hasReferral,
    required this.hasChiefComplaint,
    required this.hasInsurance,
    required this.medicalHistoryStatus,
    required this.isPatientFrp,
    required this.hasPaymentPlan,
    required this.hasTreatmentContract,
    required this.isPatientHasAllergy,
    required this.practicePrimaryLocationName,
    required this.practicePrimaryLocationAddress,
    required this.practicePrimaryLocationCity,
    required this.practicePrimaryLocationState,
    required this.practicePrimaryLocationStateAbbreviation,
    required this.practicePrimaryLocationZip,
    required this.patientFinancialResponsiblePersonLastName,
    required this.patientFinancialResponsiblePersonFirstName,
    required this.patientFinancialResponsiblePersonAddress1,
    required this.patientFinancialResponsiblePersonAddress2,
    required this.patientFinancialResponsiblePersonCity,
    required this.patientFinancialResponsiblePersonState,
    required this.patientFinancialResponsiblePersonStateAbbreviation,
    required this.patientFinancialResponsiblePersonZip,
    required this.patientFinancialResponsiblePersonDisplayName,
    required this.patientFinancialResponsiblePersonPreferredName,
    required this.patientFinancialResponsiblePersonMiddleName,
    required this.patientFinancialResponsiblePersonDob,
    required this.patientFinancialResponsiblePersonPrimaryEmailAddress,
    required this.patientFinancialResponsiblePersonPrimaryPhone,
    required this.patientContactFirstName,
    required this.patientContactLastName,
    required this.patientContactDob,
    required this.patientContactPreferredName,
    required this.patientContactGender,
    required this.patientContactDisplayName,
    required this.patientContactMiddleName,
    required this.patientContactPrimaryEmailAddress,
    required this.patientContactPrimaryPhone,
    required this.patientFormattedDob,
    required this.patientEligibilityStatusName,
    required this.isDdsnotOnFile,
    required this.ddsprimaryDentistName,

});
  factory PatientById.fromJson(Map<String, dynamic> json) {
    return PatientById(
    patientId : json['patientId'].toString(),
    patientGuid : json['patientGuid'].toString(),
    practiceId : json['practiceId'].toString(),
    practiceName : json['practiceName'].toString(),
    patientPrefix : json['patientPrefix'].toString(),
    patientFirstName : json['patientFirstName'].toString(),
    patientMiddleName : json['patientMiddleName'].toString(),
    patientLastName : json['patientLastName'].toString(),
    patientName : json['patientName'].toString(),
    patientDisplayName : json['patientDisplayName'].toString(),
    patientPreferredName : json['patientPreferredName'].toString(),
    patientSuffixName : json['patientSuffixName'].toString(),
    patientGender : json['patientGender'].toString(),
    patientMaritalStatus : json['patientMaritalStatus'].toString(),
    patientDob : json['patientDob'].toString(),
    patientAge : json['patientAge'].toString(),
    patientLanguagePreference : json['patientLanguagePreference'].toString(),
    hasPrimaryDentist : json['hasPrimaryDentist'],
    primaryDentistId : json['primaryDentistId'].toString(),
    patientPrimaryPhone : json['patientPrimaryPhone'].toString(),
    patientPrimaryType : json['patientPrimaryType'].toString(),
    patientPrimaryPhoneExt : json['patientPrimaryPhoneExt'].toString(),
    patientPrimaryEmailAddress : json['patientPrimaryEmailAddress'].toString(),
    patientSecondaryPhone : json['patientSecondaryPhone'].toString(),
    patientSecondaryPhoneType : json['patientSecondaryPhoneType'].toString(),
    patientSecondaryPhoneExt : json['patientSecondaryPhoneExt'].toString(),
    patientSecondaryEmailAddress : json['patientSecondaryEmailAddress'].toString(),
    patientAddress1 : json['patientAddress1'].toString(),
    patientAddress2 : json['patientAddress2'].toString(),
    patientCity : json['patientCity'].toString(),
    patientState : json['patientState'].toString(),
    patientZip : json['patientZip'].toString(),
    patientEmergencyContactFirstName : json['patientEmergencyContactFirstName'].toString(),
    patientEmergencyContactLastName : json['patientEmergencyContactLastName'].toString(),
    patientEmergencyContactRelationship : json['patientEmergencyContactRelationship'].toString(),
    patientEmergencyContactDob : json['patientEmergencyContactDob'].toString(),
    patientEmergencyContactPhone : json['patientEmergencyContactPhone'].toString(),
    patientEmergencyContactPhoneType : json['patientEmergencyContactPhoneType'].toString(),
    patientEmergencyContactPhoneExt : json['patientEmergencyContactPhoneExt'].toString(),
    isAssociatedPatient : json['isAssociatedPatient'],
    associatedPatientRelationship : json['associatedPatientRelationship'].toString(),
    isPatientAgreedToContactViaEmail : json['isPatientAgreedToContactViaEmail'],
    isPatientAgreedToContactViaText : json['isPatientAgreedToContactViaText'],
    isPatientAgreedToMedicalConditions : json['isPatientAgreedToMedicalConditions'],
    isPatientAgreedToPolicy : json['isPatientAgreedToPolicy'],
    isPatientAgreedToPracticePolicies : json['isPatientAgreedToPracticePolicies'],
    patientCreatedDate : json['patientCreatedDate'].toString(),
    providerLicenseNumber : json['providerLicenseNumber'].toString(),
    providerNotes : json['providerNotes'].toString(),
    providerNpi : json['providerNpi'].toString(),
    primaryDentistFirstName : json['primaryDentistFirstName'].toString(),
    primaryDentistLastName : json['primaryDentistLastName'].toString(),
    primaryDentistName : json['primaryDentistName'].toString(),
    primaryDentistContactNumber : json['primaryDentistContactNumber'].toString(),
    primaryDentistOffice : json['primaryDentistOffice'].toString(),
    primaryDentistOfficeAddress : json['primaryDentistOfficeAddress'].toString(),
    primaryDentistOfficeCity : json['primaryDentistOfficeCity'].toString(),
    primaryDentistOfficeState : json['primaryDentistOfficeState'].toString(),
    primaryDentistOfficeZipcode : json['primaryDentistOfficeZipcode'].toString(),
    primaryDentistEmailAddress : json['primaryDentistEmailAddress'].toString(),
    primaryDentistPhone : json['primaryDentistPhone'].toString(),
    patientNotes : json['patientNotes'].toString(),
    patientStateAbbreviation : json['patientStateAbbreviation'].toString(),
    patientStatusId : json['patientStatusId'].toString(),
    practiceLocationId : json['practiceLocationId'].toString(),
    practiceLocationName : json['practiceLocationName'].toString(),
    patientHobbiesInterests : json['patientHobbiesInterests'].toString(),
    patientStudentStatus : json['patientStudentStatus'].toString(),
    patientStatusName : json['patientStatusName'].toString(),
    patientStatusDescription : json['patientStatusDescription'].toString(),
    hasPrimaryContact : json['hasPrimaryContact'],
    hasFinancialResponsiblePerson : json['hasFinancialResponsiblePerson'],
    hasMedicalConditions : json['hasMedicalConditions'],
    hasDentalHygiene : json['hasDentalHygiene'],
    hasHabits : json['hasHabits'],
    hasReferral : json['hasReferral'],
    hasChiefComplaint : json['hasChiefComplaint'],
    hasInsurance : json['hasInsurance'],
    medicalHistoryStatus : json['medicalHistoryStatus'].toString(),
    isPatientFrp : json['isPatientFrp'],
    hasPaymentPlan : json['hasPaymentPlan'].toString(),
    hasTreatmentContract : json['hasTreatmentContract'].toString(),
    isPatientHasAllergy : json['isPatientHasAllergy'],
    practicePrimaryLocationName : json['practicePrimaryLocationName'].toString(),
    practicePrimaryLocationAddress : json['practicePrimaryLocationAddress'].toString(),
    practicePrimaryLocationCity : json['practicePrimaryLocationCity'].toString(),
    practicePrimaryLocationState : json['practicePrimaryLocationState'].toString(),
    practicePrimaryLocationStateAbbreviation :
    json['practicePrimaryLocationStateAbbreviation'].toString(),
    practicePrimaryLocationZip : json['practicePrimaryLocationZip'].toString(),
    patientFinancialResponsiblePersonLastName :
    json['patientFinancialResponsiblePersonLastName'].toString(),
    patientFinancialResponsiblePersonFirstName :
    json['patientFinancialResponsiblePersonFirstName'].toString(),
    patientFinancialResponsiblePersonAddress1 :
    json['patientFinancialResponsiblePersonAddress1'].toString(),
    patientFinancialResponsiblePersonAddress2 :
    json['patientFinancialResponsiblePersonAddress2'].toString(),
    patientFinancialResponsiblePersonCity :
    json['patientFinancialResponsiblePersonCity'].toString(),
    patientFinancialResponsiblePersonState :
    json['patientFinancialResponsiblePersonState'].toString(),
    patientFinancialResponsiblePersonStateAbbreviation :
    json['patientFinancialResponsiblePersonStateAbbreviation'].toString(),
    patientFinancialResponsiblePersonZip :
    json['patientFinancialResponsiblePersonZip'].toString(),
    patientFinancialResponsiblePersonDisplayName :
    json['patientFinancialResponsiblePersonDisplayName'].toString(),
    patientFinancialResponsiblePersonPreferredName :
    json['patientFinancialResponsiblePersonPreferredName'].toString(),
    patientFinancialResponsiblePersonMiddleName :
    json['patientFinancialResponsiblePersonMiddleName'].toString(),
    patientFinancialResponsiblePersonDob : json['patientFinancialResponsiblePersonDob'].toString(),
    patientFinancialResponsiblePersonPrimaryEmailAddress :
    json['patientFinancialResponsiblePersonPrimaryEmailAddress'].toString(),
    patientFinancialResponsiblePersonPrimaryPhone :
    json['patientFinancialResponsiblePersonPrimaryPhone'].toString(),
    patientContactFirstName : json['patientContactFirstName'].toString(),
    patientContactLastName : json['patientContactLastName'].toString(),
    patientContactDob :  json['patientContactDob'].toString(),
    patientContactPreferredName : json['patientContactPreferredName'].toString(),
    patientContactGender : json['patientContactGender'].toString(),
    patientContactDisplayName : json['patientContactDisplayName'].toString(),
    patientContactMiddleName : json['patientContactMiddleName'].toString(),
    patientContactPrimaryEmailAddress :
    json['patientContactPrimaryEmailAddress'].toString(),
    patientContactPrimaryPhone : json['patientContactPrimaryPhone'].toString(),
    patientFormattedDob : json['patientFormattedDob'].toString(),
    patientEligibilityStatusName : json['patientEligibilityStatusName'].toString(),
    isDdsnotOnFile : json['isDdsnotOnFile'],
    ddsprimaryDentistName : json['ddsprimaryDentistName'].toString(),);
  }

  Map<String, dynamic> toJson() => {

    'patientId' : patientId,
    'patientGuid' : patientGuid,
    'practiceId' : practiceId,
    'practiceName' : practiceName,
    'patientPrefix' : patientPrefix,
    'patientFirstName' : patientFirstName,
    'patientMiddleName' : patientMiddleName,
    'patientLastName' : patientLastName,
    'patientName' : patientName,
    'patientDisplayName' : patientDisplayName,
    'patientPreferredName' : patientPreferredName,
    'patientSuffixName' : patientSuffixName,
    'patientGender' : patientGender,
    'patientMaritalStatus' : patientMaritalStatus,
    'patientDob' : patientDob,
    'patientAge' : patientAge,
    'patientLanguagePreference' : patientLanguagePreference,
    'hasPrimaryDentist' : hasPrimaryDentist,
    'primaryDentistId' : primaryDentistId,
    'patientPrimaryPhone' : patientPrimaryPhone,
    'patientPrimaryType' : patientPrimaryType,
    'patientPrimaryPhoneExt' : patientPrimaryPhoneExt,
    'patientPrimaryEmailAddress' : patientPrimaryEmailAddress,
    'patientSecondaryPhone' : patientSecondaryPhone,
    'patientSecondaryPhoneType' : patientSecondaryPhoneType,
    'patientSecondaryPhoneExt' : patientSecondaryPhoneExt,
    'patientSecondaryEmailAddress' : patientSecondaryEmailAddress,
    'patientAddress1' : patientAddress1,
    'patientAddress2' : patientAddress2,
    'patientCity' : patientCity,
    'patientState' : patientState,
    'patientZip' : patientZip,
    'patientEmergencyContactFirstName' :
        patientEmergencyContactFirstName,
    'patientEmergencyContactLastName' :
        patientEmergencyContactLastName,
    'patientEmergencyContactRelationship' :
        patientEmergencyContactRelationship,
    'patientEmergencyContactDob' :
        patientEmergencyContactDob,
    'patientEmergencyContactPhone' :
        patientEmergencyContactPhone,
    'patientEmergencyContactPhoneType' :
        patientEmergencyContactPhoneType,
    'patientEmergencyContactPhoneExt' :
        patientEmergencyContactPhoneExt,
    'isAssociatedPatient' : isAssociatedPatient,
    'associatedPatientRelationship' :
        associatedPatientRelationship,
    'isPatientAgreedToContactViaEmail' :
        isPatientAgreedToContactViaEmail,
    'isPatientAgreedToContactViaText' :
        isPatientAgreedToContactViaText,
    'isPatientAgreedToMedicalConditions' :
        isPatientAgreedToMedicalConditions,
    'isPatientAgreedToPolicy' : isPatientAgreedToPolicy,
    'isPatientAgreedToPracticePolicies' :
        isPatientAgreedToPracticePolicies,
    'patientCreatedDate' : patientCreatedDate,
    'providerLicenseNumber' : providerLicenseNumber,
    'providerNotes' : providerNotes,
    'providerNpi' : providerNpi,
    'primaryDentistFirstName' : primaryDentistFirstName,
    'primaryDentistLastName' : primaryDentistLastName,
    'primaryDentistName' : primaryDentistName,
    'primaryDentistContactNumber' : primaryDentistContactNumber,
    'primaryDentistOffice' : primaryDentistOffice,
    'primaryDentistOfficeAddress' : primaryDentistOfficeAddress,
    'primaryDentistOfficeCity' : primaryDentistOfficeCity,
    'primaryDentistOfficeState' : primaryDentistOfficeState,
    'primaryDentistOfficeZipcode' : primaryDentistOfficeZipcode,
    'primaryDentistEmailAddress' : primaryDentistEmailAddress,
    'primaryDentistPhone' : primaryDentistPhone,
    'patientNotes' : patientNotes,
    'patientStateAbbreviation' : patientStateAbbreviation,
    'patientStatusId' : patientStatusId,
    'practiceLocationId' : practiceLocationId,
    'practiceLocationName' : practiceLocationName,
    'patientHobbiesInterests' : patientHobbiesInterests,
    'patientStudentStatus' : patientStudentStatus,
    'patientStatusName' : patientStatusName,
    'patientStatusDescription' : patientStatusDescription,
    'hasPrimaryContact' : hasPrimaryContact,
    'hasFinancialResponsiblePerson' : hasFinancialResponsiblePerson,
    'hasMedicalConditions' : hasMedicalConditions,
    'hasDentalHygiene' : hasDentalHygiene,
    'hasHabits' : hasHabits,
    'hasReferral' : hasReferral,
    'hasChiefComplaint' : hasChiefComplaint,
    'hasInsurance' : hasInsurance,
    'medicalHistoryStatus' : medicalHistoryStatus,
    'isPatientFrp' : isPatientFrp,
    'hasPaymentPlan' : hasPaymentPlan,
    'hasTreatmentContract' : hasTreatmentContract,
    'isPatientHasAllergy' : isPatientHasAllergy,
    'practicePrimaryLocationName' : practicePrimaryLocationName,
    'practicePrimaryLocationAddress' :
        practicePrimaryLocationAddress,
    'practicePrimaryLocationCity' : practicePrimaryLocationCity,
    'practicePrimaryLocationState' : practicePrimaryLocationState,
    'practicePrimaryLocationStateAbbreviation' :
        practicePrimaryLocationStateAbbreviation,
    'practicePrimaryLocationZip' : practicePrimaryLocationZip,
    'patientFinancialResponsiblePersonLastName' :
        patientFinancialResponsiblePersonLastName,
    'patientFinancialResponsiblePersonFirstName' :
        patientFinancialResponsiblePersonFirstName,
    'patientFinancialResponsiblePersonAddress1' :
        patientFinancialResponsiblePersonAddress1,
    'patientFinancialResponsiblePersonAddress2' :
        patientFinancialResponsiblePersonAddress2,
    'patientFinancialResponsiblePersonCity' :
        patientFinancialResponsiblePersonCity,
    'patientFinancialResponsiblePersonState' :
        patientFinancialResponsiblePersonState,
    'patientFinancialResponsiblePersonStateAbbreviation' :
        patientFinancialResponsiblePersonStateAbbreviation,
    'patientFinancialResponsiblePersonZip' :
        patientFinancialResponsiblePersonZip,
    'patientFinancialResponsiblePersonDisplayName' :
        patientFinancialResponsiblePersonDisplayName,
    'patientFinancialResponsiblePersonPreferredName' :
        patientFinancialResponsiblePersonPreferredName,
    'patientFinancialResponsiblePersonMiddleName' :
        patientFinancialResponsiblePersonMiddleName,
    'patientFinancialResponsiblePersonDob' :
        patientFinancialResponsiblePersonDob,
    'patientFinancialResponsiblePersonPrimaryEmailAddress' :
        patientFinancialResponsiblePersonPrimaryEmailAddress,
    'patientFinancialResponsiblePersonPrimaryPhone' :
        patientFinancialResponsiblePersonPrimaryPhone,
    'patientContactFirstName' : patientContactFirstName,
    'patientContactLastName' : patientContactLastName,
    'patientContactDob' : patientContactDob,
    'patientContactPreferredName' : patientContactPreferredName,
    'patientContactGender' : patientContactGender,
    'patientContactDisplayName' : patientContactDisplayName,
    'patientContactMiddleName' : patientContactMiddleName,
    'patientContactPrimaryEmailAddress' :
        patientContactPrimaryEmailAddress,
    'patientContactPrimaryPhone' : patientContactPrimaryPhone,
    'patientFormattedDob' : patientFormattedDob,
    'patientEligibilityStatusName' : patientEligibilityStatusName,
    'isDdsnotOnFile' : isDdsnotOnFile,
    'ddsprimaryDentistName' : ddsprimaryDentistName,
  };
}

