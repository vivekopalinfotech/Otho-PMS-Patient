class InsuranceResponse {
  final List<Insurance> insurance;

  InsuranceResponse({
    required this.insurance,
  });

  factory InsuranceResponse.fromJson(List<dynamic> json) {
    return InsuranceResponse(
      insurance: json.map((e) => Insurance.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}


class Insurance {
  final String patientInsuranceId;
  final String patientId;
  final String practiceInsuranceCompanyId;
  final String subscriberPrefix;
  final String subscriberFirstName;
  final String subscriberMiddleName;
  final String subscriberLastName;
  final String subscriberSuffix;
  final String subscriberPrimaryPhone;
  final String subscriberPrimaryPhoneType;
  final String subscriberPrimaryPhoneExt;
  final String subscriberSecondaryPhone;
  final String subscriberSecondaryPhoneType;
  final String subscriberSecondaryPhoneExt;
  final String subscriberDob;
  final String subscriberGender;
  final String subscriberRelationshipToPatient;
  final String subscriberSsn;
  final String subscriberAddress1;
  final String subscriberAddress2;
  final String subscriberCity;
  final String subscriberState;
  final String subscriberZip;
  final String subscriberGroupPlanNumber;
  final String subscriberMemberNumber;
  final String networkType;
  final String groupEmployerName;
  final bool isPrimary;
  final String deactivateInsuranceReason;
  final bool isActive;
  final bool isPolicyHolderSameAsPatient;
  final bool isPolicyHolderAddressSameAsPatient;
  final bool isVerified;
  final String verifiedDate;
  final String insuranceVerificationStatusId;
  final String createdDate;
  final String modifiedDate;
  final String createdByUserId;
  final String modifiedByUserId;
  final String nonOsreference;
  final String practiceInsuranceCompanyName;
  final String practiceInsuranceCompanyDescription;
  final String practiceInsuranceCompanyCode;
  final String practiceInsuranceCompanyAddress1;
  final String practiceInsuranceCompanyAddress2;
  final String practiceInsuranceCompanySuite;
  final String practiceInsuranceCompanyCity;
  final String practiceInsuranceCompanyState;
  final String practiceInsuranceCompanyZipcode;
  final String practiceInsuranceCompanyPhone;
  final String practiceInsuranceCompanyPhoneExt;
  final String practiceInsuranceCompanyPayorId;
  final bool practiceInsuranceCompanyIsMedicaid;
  final String practiceInsuranceCompanyPlanType;
  final String practiceId;
  final String lastPatientClaimId;

  Insurance({
    required this.patientInsuranceId,
    required this.patientId,
    required this.practiceInsuranceCompanyId,
    required this.subscriberPrefix,
    required this.subscriberFirstName,
    required this.subscriberMiddleName,
    required this.subscriberLastName,
    required this.subscriberSuffix,
    required this.subscriberPrimaryPhone,
    required this.subscriberPrimaryPhoneType,
    required this.subscriberPrimaryPhoneExt,
    required this.subscriberSecondaryPhone,
    required this.subscriberSecondaryPhoneType,
    required this.subscriberSecondaryPhoneExt,
    required this.subscriberDob,
    required this.subscriberGender,
    required this.subscriberRelationshipToPatient,
    required this.subscriberSsn,
    required this.subscriberAddress1,
    required this.subscriberAddress2,
    required this.subscriberCity,
    required this.subscriberState,
    required this.subscriberZip,
    required this.subscriberGroupPlanNumber,
    required this.subscriberMemberNumber,
    required this.networkType,
    required this.groupEmployerName,
    required this.isPrimary,
    required this.deactivateInsuranceReason,
    required this.isActive,
    required this.isPolicyHolderSameAsPatient,
    required this.isPolicyHolderAddressSameAsPatient,
    required this.isVerified,
    required this.verifiedDate,
    required this.insuranceVerificationStatusId,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.nonOsreference,
    required this.practiceInsuranceCompanyName,
    required this.practiceInsuranceCompanyDescription,
    required this.practiceInsuranceCompanyCode,
    required this.practiceInsuranceCompanyAddress1,
    required this.practiceInsuranceCompanyAddress2,
    required this.practiceInsuranceCompanySuite,
    required this.practiceInsuranceCompanyCity,
    required this.practiceInsuranceCompanyState,
    required this.practiceInsuranceCompanyZipcode,
    required this.practiceInsuranceCompanyPhone,
    required this.practiceInsuranceCompanyPhoneExt,
    required this.practiceInsuranceCompanyPayorId,
    required this.practiceInsuranceCompanyIsMedicaid,
    required this.practiceInsuranceCompanyPlanType,
    required this.practiceId,
    required this.lastPatientClaimId,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) {
    return Insurance(
      patientInsuranceId: json['patientInsuranceId'].toString(),
      patientId: json['patientId'].toString(),
      practiceInsuranceCompanyId: json['practiceInsuranceCompanyId'].toString(),
      subscriberPrefix: json['subscriberPrefix'].toString(),
      subscriberFirstName: json['subscriberFirstName'].toString(),
      subscriberMiddleName: json['subscriberMiddleName'].toString(),
      subscriberLastName: json['subscriberLastName'].toString(),
      subscriberSuffix: json['subscriberSuffix'].toString(),
      subscriberPrimaryPhone: json['subscriberPrimaryPhone'].toString(),
      subscriberPrimaryPhoneType: json['subscriberPrimaryPhoneType'].toString(),
      subscriberPrimaryPhoneExt: json['subscriberPrimaryPhoneExt'].toString(),
      subscriberSecondaryPhone: json['subscriberSecondaryPhone'].toString(),
      subscriberSecondaryPhoneType: json['subscriberSecondaryPhoneType'].toString(),
      subscriberSecondaryPhoneExt: json['subscriberSecondaryPhoneExt'].toString(),
      subscriberDob: json['subscriberDob'].toString(),
      subscriberGender: json['subscriberGender'].toString(),
      subscriberRelationshipToPatient:
      json['subscriberRelationshipToPatient'].toString(),
      subscriberSsn: json['subscriberSsn'].toString(),
      subscriberAddress1: json['subscriberAddress1'].toString(),
      subscriberAddress2: json['subscriberAddress2'].toString(),
      subscriberCity: json['subscriberCity'].toString(),
      subscriberState: json['subscriberState'].toString(),
      subscriberZip: json['subscriberZip'].toString(),
      subscriberGroupPlanNumber: json['subscriberGroupPlanNumber'].toString(),
      subscriberMemberNumber: json['subscriberMemberNumber'].toString(),
      networkType: json['networkType'].toString(),
      groupEmployerName: json['groupEmployerName'].toString(),
      isPrimary: json['isPrimary'],
      deactivateInsuranceReason: json['deactivateInsuranceReason'].toString(),
      isActive: json['isActive'],
      isPolicyHolderSameAsPatient: json['isPolicyHolderSameAsPatient'],
      isPolicyHolderAddressSameAsPatient:
      json['isPolicyHolderAddressSameAsPatient'],
      isVerified: json['isVerified'],
      verifiedDate: json['verifiedDate'].toString(),
      insuranceVerificationStatusId: json['insuranceVerificationStatusId'].toString(),
      createdDate: json['createdDate'].toString(),
      modifiedDate: json['modifiedDate'].toString(),
      createdByUserId: json['createdByUserId'].toString(),
      modifiedByUserId: json['modifiedByUserId'].toString(),
      nonOsreference: json['nonOsreference'].toString(),
      practiceInsuranceCompanyName: json['practiceInsuranceCompanyName'].toString(),
      practiceInsuranceCompanyDescription:
      json['practiceInsuranceCompanyDescription'].toString(),
      practiceInsuranceCompanyCode: json['practiceInsuranceCompanyCode'].toString(),
      practiceInsuranceCompanyAddress1:
      json['practiceInsuranceCompanyAddress1'].toString(),
      practiceInsuranceCompanyAddress2:
      json['practiceInsuranceCompanyAddress2'].toString(),
      practiceInsuranceCompanySuite: json['practiceInsuranceCompanySuite'].toString(),
      practiceInsuranceCompanyCity: json['practiceInsuranceCompanyCity'].toString(),
      practiceInsuranceCompanyState: json['practiceInsuranceCompanyState'].toString(),
      practiceInsuranceCompanyZipcode:
      json['practiceInsuranceCompanyZipcode'].toString(),
      practiceInsuranceCompanyPhone:
      json['practiceInsuranceCompanyPhone'].toString(),
      practiceInsuranceCompanyPhoneExt:
      json['practiceInsuranceCompanyPhoneExt'].toString(),
      practiceInsuranceCompanyPayorId:
      json['practiceInsuranceCompanyPayorId'].toString(),
      practiceInsuranceCompanyIsMedicaid:
      json['practiceInsuranceCompanyIsMedicaid'],
      practiceInsuranceCompanyPlanType:
      json['practiceInsuranceCompanyPlanType'].toString(),
      practiceId: json['practiceId'].toString(),
      lastPatientClaimId: json['lastPatientClaimId'].toString(),
    );
  }
}
