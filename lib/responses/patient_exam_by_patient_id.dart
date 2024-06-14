class PatientExamByPatientIdResponse {
  final List<PatientExam> patientExam;

  PatientExamByPatientIdResponse({
    required this.patientExam,
  });

  factory PatientExamByPatientIdResponse.fromJson(List<dynamic> json) {
    return PatientExamByPatientIdResponse(
      patientExam: json.map((e) => PatientExam.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'patientExam': patientExam.map((e) => e.toJson()).toList(),
  };
}




class PatientExam {
  int patientExamId;
  int practiceId;
  int practiceLocationId;
  int patientId;
  int providerId;
  int practiceAppointmentTypeId;
  int patientExamStatusId;
  int patientExamResultId;
  dynamic examNotes;
  dynamic generalNotes;
  DateTime patientExamDate;
  dynamic examTypeId;
  bool isActive;
  dynamic nonOsreference;
  DateTime createdDate;
  DateTime modifiedDate;
  String? createdByUserId;
  String? modifiedByUserId;
  String? patientGuid;
  String? practiceAppointmentName;
  int practiceAppointmentDuration;
  dynamic practiceAppointmentColor;
  String? patientExamStatusName;
  String? patientExamStatusDescription;
  String? patientExamResultName;
  String? patientExamResultDescription;
  String? patientExamResultCategoryName;
  String? patientExamResultCategoryDescription;
  dynamic actualChairId;
  bool isPatientAppointmentActive;
  bool isAddedToClipboard;
  bool isAppointmentConfirmed;
  bool isVirtualAppointment;
  int originalChairId;
  int patientAppointmentDuration;
  int patientAppointmentId;
  String? patientAppointmentNotes;
  int patientAppointmentStatusId;
  DateTime patientAppointmentTime;
  dynamic patientCheckInTime;
  dynamic patientCheckOutTime;
  String? patientCurrentLocation;
  dynamic patientDismissedTime;
  dynamic patientSeatedTime;
  bool isExamFlowRequired;
  bool isExamRequired;
  bool trackUntilContractSigned;
  dynamic practiceAppointmentGroupColor;
  dynamic practiceAppointmentGroupDescription;
  int practiceAppointmentGroupDuration;
  String? practiceAppointmentGroupName;
  String? providerName;
  String? providerInitials;
  String? providerLicenseNumber;
  String? providerNotes;
  String? providerNpi;
  String? practiceLocationName;
  dynamic patientTreatmentPlanStartDate;
  dynamic patientTreatmentPlanCost;
  dynamic patientTreatmentPlanEndDate;
  dynamic patientResponsibility;
  dynamic totalInsuranceResponsibility;
  dynamic patientTreatmentPlanMinimumDuration;
  dynamic patientTreatmentPlanMaximumDuration;
  dynamic totalDiscount;
  dynamic totalAdditionalCost;
  dynamic totalCourtesies;
  dynamic totalNetworkDiscount;
  dynamic treatmentPlanNotes;
  dynamic practiceTreatmentTypeName;
  dynamic practiceTreatmentTypeDescription;
  dynamic practiceTreatmentOptionName;
  dynamic practiceTreatmentOptionDescription;
  dynamic practiceTreatmentOptionMinimumDuration;
  dynamic practiceTreatmentOptionMaximumDuration;
  dynamic practiceTreatmentOptionMinimumDownPayment;
  dynamic practiceTreatmentOptionProviderFee;
  String? dentistName;
  dynamic dentistDisplayName;
  String? dentistFullName;
  String? dentistOfficeName;
  dynamic dentistPreferredName;
  dynamic dentistNotes;
  dynamic patientTreatmentContractId;
  dynamic treatmentContractDateOfContractSigned;
  dynamic patientTreatmentPlanId;
  bool hasServiceContract;
  bool hasPaymentPlan;

  PatientExam({
    required this.patientExamId,
    required this.practiceId,
    required this.practiceLocationId,
    required this.patientId,
    required this.providerId,
    required this.practiceAppointmentTypeId,
    required this.patientExamStatusId,
    required this.patientExamResultId,
    required this.examNotes,
    required this.generalNotes,
    required this.patientExamDate,
    required this.examTypeId,
    required this.isActive,
    required this.nonOsreference,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.practiceAppointmentName,
    required this.practiceAppointmentDuration,
    required this.practiceAppointmentColor,
    required this.patientExamStatusName,
    required this.patientExamStatusDescription,
    required this.patientExamResultName,
    required this.patientExamResultDescription,
    required this.patientExamResultCategoryName,
    required this.patientExamResultCategoryDescription,
    required this.actualChairId,
    required this.isPatientAppointmentActive,
    required this.isAddedToClipboard,
    required this.isAppointmentConfirmed,
    required this.isVirtualAppointment,
    required this.originalChairId,
    required this.patientAppointmentDuration,
    required this.patientAppointmentId,
    required this.patientAppointmentNotes,
    required this.patientAppointmentStatusId,
    required this.patientAppointmentTime,
    required this.patientCheckInTime,
    required this.patientCheckOutTime,
    required this.patientCurrentLocation,
    required this.patientDismissedTime,
    required this.patientSeatedTime,
    required this.isExamFlowRequired,
    required this.isExamRequired,
    required this.trackUntilContractSigned,
    required this.practiceAppointmentGroupColor,
    required this.practiceAppointmentGroupDescription,
    required this.practiceAppointmentGroupDuration,
    required this.practiceAppointmentGroupName,
    required this.providerName,
    required this.providerInitials,
    required this.providerLicenseNumber,
    required this.providerNotes,
    required this.providerNpi,
    required this.practiceLocationName,
    required this.patientTreatmentPlanStartDate,
    required this.patientTreatmentPlanCost,
    required this.patientTreatmentPlanEndDate,
    required this.patientResponsibility,
    required this.totalInsuranceResponsibility,
    required this.patientTreatmentPlanMinimumDuration,
    required this.patientTreatmentPlanMaximumDuration,
    required this.totalDiscount,
    required this.totalAdditionalCost,
    required this.totalCourtesies,
    required this.totalNetworkDiscount,
    required this.treatmentPlanNotes,
    required this.practiceTreatmentTypeName,
    required this.practiceTreatmentTypeDescription,
    required this.practiceTreatmentOptionName,
    required this.practiceTreatmentOptionDescription,
    required this.practiceTreatmentOptionMinimumDuration,
    required this.practiceTreatmentOptionMaximumDuration,
    required this.practiceTreatmentOptionMinimumDownPayment,
    required this.practiceTreatmentOptionProviderFee,
    required this.dentistName,
    required this.dentistDisplayName,
    required this.dentistFullName,
    required this.dentistOfficeName,
    required this.dentistPreferredName,
    required this.dentistNotes,
    required this.patientTreatmentContractId,
    required this.treatmentContractDateOfContractSigned,
    required this.patientTreatmentPlanId,
    required this.hasServiceContract,
    required this.hasPaymentPlan,
  });


  factory PatientExam.fromJson(Map<String, dynamic> json) {
    return PatientExam(
      patientExamId: json['patientExamId'],
      practiceId: json['practiceId'],
      practiceLocationId: json['practiceLocationId'],
      patientId: json['patientId'],
      providerId: json['providerId'],
      practiceAppointmentTypeId: json['practiceAppointmentTypeId'],
      patientExamStatusId: json['patientExamStatusId'],
      patientExamResultId: json['patientExamResultId'],
      examNotes: json['examNotes'],
      generalNotes: json['generalNotes'],
      patientExamDate: DateTime.parse(json['patientExamDate']),
      examTypeId: json['examTypeId'],
      isActive: json['isActive'],
      nonOsreference: json['nonOsreference'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'].toString(),
      modifiedByUserId: json['modifiedByUserId'].toString(),
      patientGuid: json['patientGuid'].toString(),
      practiceAppointmentName: json['practiceAppointmentName'].toString(),
      practiceAppointmentDuration: json['practiceAppointmentDuration'],
      practiceAppointmentColor: json['practiceAppointmentColor'],
      patientExamStatusName: json['patientExamStatusName'].toString(),
      patientExamStatusDescription: json['patientExamStatusDescription'].toString(),
      patientExamResultName: json['patientExamResultName'].toString(),
      patientExamResultDescription: json['patientExamResultDescription'].toString(),
      patientExamResultCategoryName:
      json['patientExamResultCategoryName'].toString(),
      patientExamResultCategoryDescription:
      json['patientExamResultCategoryDescription'].toString(),
      actualChairId: json['actualChairId'],
      isPatientAppointmentActive: json['isPatientAppointmentActive'],
      isAddedToClipboard: json['isAddedToClipboard'],
      isAppointmentConfirmed: json['isAppointmentConfirmed'],
      isVirtualAppointment: json['isVirtualAppointment'],
      originalChairId: json['originalChairId'],
      patientAppointmentDuration: json['patientAppointmentDuration'],
      patientAppointmentId: json['patientAppointmentId'],
      patientAppointmentNotes: json['patientAppointmentNotes'].toString(),
      patientAppointmentStatusId: json['patientAppointmentStatusId'],
      patientAppointmentTime: DateTime.parse(json['patientAppointmentTime']),
      patientCheckInTime: json['patientCheckInTime'],
      patientCheckOutTime: json['patientCheckOutTime'],
      patientCurrentLocation: json['patientCurrentLocation'],
      patientDismissedTime: json['patientDismissedTime'],
      patientSeatedTime: json['patientSeatedTime'],
      isExamFlowRequired: json['isExamFlowRequired'],
      isExamRequired: json['isExamRequired'],
      trackUntilContractSigned: json['trackUntilContractSigned'],
      practiceAppointmentGroupColor: json['practiceAppointmentGroupColor'],
      practiceAppointmentGroupDescription:
      json['practiceAppointmentGroupDescription'],
      practiceAppointmentGroupDuration:
      json['practiceAppointmentGroupDuration'],
      practiceAppointmentGroupName: json['practiceAppointmentGroupName'],
      providerName: json['providerName'],
      providerInitials: json['providerInitials'],
      providerLicenseNumber: json['providerLicenseNumber'],
      providerNotes: json['providerNotes'],
      providerNpi: json['providerNpi'],
      practiceLocationName: json['practiceLocationName'],
      patientTreatmentPlanStartDate: json['patientTreatmentPlanStartDate'],
      patientTreatmentPlanCost: json['patientTreatmentPlanCost'],
      patientTreatmentPlanEndDate: json['patientTreatmentPlanEndDate'],
      patientResponsibility: json['patientResponsibility'],
      totalInsuranceResponsibility: json['totalInsuranceResponsibility'],
      patientTreatmentPlanMinimumDuration:
      json['patientTreatmentPlanMinimumDuration'],
      patientTreatmentPlanMaximumDuration:
      json['patientTreatmentPlanMaximumDuration'],
      totalDiscount: json['totalDiscount'],
      totalAdditionalCost: json['totalAdditionalCost'],
      totalCourtesies: json['totalCourtesies'],
      totalNetworkDiscount: json['totalNetworkDiscount'],
      treatmentPlanNotes: json['treatmentPlanNotes'],
      practiceTreatmentTypeName: json['practiceTreatmentTypeName'],
      practiceTreatmentTypeDescription:
      json['practiceTreatmentTypeDescription'],
      practiceTreatmentOptionName: json['practiceTreatmentOptionName'],
      practiceTreatmentOptionDescription:
      json['practiceTreatmentOptionDescription'],
      practiceTreatmentOptionMinimumDuration:
      json['practiceTreatmentOptionMinimumDuration'],
      practiceTreatmentOptionMaximumDuration:
      json['practiceTreatmentOptionMaximumDuration'],
      practiceTreatmentOptionMinimumDownPayment:
      json['practiceTreatmentOptionMinimumDownPayment'],
      practiceTreatmentOptionProviderFee:
      json['practiceTreatmentOptionProviderFee'],
      dentistName: json['dentistName'],
      dentistDisplayName: json['dentistDisplayName'],
      dentistFullName: json['dentistFullName'],
      dentistOfficeName: json['dentistOfficeName'],
      dentistPreferredName: json['dentistPreferredName'],
      dentistNotes: json['dentistNotes'],
      patientTreatmentContractId: json['patientTreatmentContractId'],
      treatmentContractDateOfContractSigned:
      json['treatmentContractDateOfContractSigned'],
      patientTreatmentPlanId: json['patientTreatmentPlanId'],
      hasServiceContract: json['hasServiceContract'],
      hasPaymentPlan: json['hasPaymentPlan'],
    );
  }


  Map<String, dynamic> toJson() => {
    "patientExamId": patientExamId,
    "practiceId": practiceId,
    "practiceLocationId": practiceLocationId,
    "patientId": patientId,
    "providerId": providerId,
    "practiceAppointmentTypeId": practiceAppointmentTypeId,
    "patientExamStatusId": patientExamStatusId,
    "patientExamResultId": patientExamResultId,
    "examNotes": examNotes,
    "generalNotes": generalNotes,
    "patientExamDate": patientExamDate.toIso8601String(),
    "examTypeId": examTypeId,
    "isActive": isActive,
    "nonOsreference": nonOsreference,
    "createdDate": createdDate.toIso8601String(),
    "modifiedDate": modifiedDate.toIso8601String(),
    "createdByUserId": createdByUserId,
    "modifiedByUserId": modifiedByUserId,
    "patientGuid": patientGuid,
    "practiceAppointmentName": practiceAppointmentName,
    "practiceAppointmentDuration": practiceAppointmentDuration,
    "practiceAppointmentColor": practiceAppointmentColor,
    "patientExamStatusName": patientExamStatusName,
    "patientExamStatusDescription": patientExamStatusDescription,
    "patientExamResultName": patientExamResultName,
    "patientExamResultDescription": patientExamResultDescription,
    "patientExamResultCategoryName": patientExamResultCategoryName,
    "patientExamResultCategoryDescription":
    patientExamResultCategoryDescription,
    "actualChairId": actualChairId,
    "isPatientAppointmentActive": isPatientAppointmentActive,
    "isAddedToClipboard": isAddedToClipboard,
    "isAppointmentConfirmed": isAppointmentConfirmed,
    "isVirtualAppointment": isVirtualAppointment,
    "originalChairId": originalChairId,
    "patientAppointmentDuration": patientAppointmentDuration,
    "patientAppointmentId": patientAppointmentId,
    "patientAppointmentNotes": patientAppointmentNotes,
    "patientAppointmentStatusId": patientAppointmentStatusId,
    "patientAppointmentTime": patientAppointmentTime.toIso8601String(),
    "patientCheckInTime": patientCheckInTime,
    "patientCheckOutTime": patientCheckOutTime,
    "patientCurrentLocation": patientCurrentLocation,
    "patientDismissedTime": patientDismissedTime,
    "patientSeatedTime": patientSeatedTime,
    "isExamFlowRequired": isExamFlowRequired,
    "isExamRequired": isExamRequired,
    "trackUntilContractSigned": trackUntilContractSigned,
    "practiceAppointmentGroupColor": practiceAppointmentGroupColor,
    "practiceAppointmentGroupDescription":
    practiceAppointmentGroupDescription,
    "practiceAppointmentGroupDuration": practiceAppointmentGroupDuration,
    "practiceAppointmentGroupName": practiceAppointmentGroupName,
    "providerName": providerName,
    "providerInitials": providerInitials,
    "providerLicenseNumber": providerLicenseNumber,
    "providerNotes": providerNotes,
    "providerNpi": providerNpi,
    "practiceLocationName": practiceLocationName,
    "patientTreatmentPlanStartDate": patientTreatmentPlanStartDate,
    "patientTreatmentPlanCost": patientTreatmentPlanCost,
    "patientTreatmentPlanEndDate": patientTreatmentPlanEndDate,
    "patientResponsibility": patientResponsibility,
    "totalInsuranceResponsibility": totalInsuranceResponsibility,
    "patientTreatmentPlanMinimumDuration":
    patientTreatmentPlanMinimumDuration,
    "patientTreatmentPlanMaximumDuration":
    patientTreatmentPlanMaximumDuration,
    "totalDiscount": totalDiscount,
    "totalAdditionalCost": totalAdditionalCost,
    "totalCourtesies": totalCourtesies,
    "totalNetworkDiscount": totalNetworkDiscount,
    "treatmentPlanNotes": treatmentPlanNotes,
    "practiceTreatmentTypeName": practiceTreatmentTypeName,
    "practiceTreatmentTypeDescription": practiceTreatmentTypeDescription,
    "practiceTreatmentOptionName": practiceTreatmentOptionName,
    "practiceTreatmentOptionDescription":
    practiceTreatmentOptionDescription,
    "practiceTreatmentOptionMinimumDuration":
    practiceTreatmentOptionMinimumDuration,
    "practiceTreatmentOptionMaximumDuration":
    practiceTreatmentOptionMaximumDuration,
    "practiceTreatmentOptionMinimumDownPayment":
    practiceTreatmentOptionMinimumDownPayment,
    "practiceTreatmentOptionProviderFee":
    practiceTreatmentOptionProviderFee,
    "dentistName": dentistName,
    "dentistDisplayName": dentistDisplayName,
    "dentistFullName": dentistFullName,
    "dentistOfficeName": dentistOfficeName,
    "dentistPreferredName": dentistPreferredName,
    "dentistNotes": dentistNotes,
    "patientTreatmentContractId": patientTreatmentContractId,
    "treatmentContractDateOfContractSigned":
    treatmentContractDateOfContractSigned,
    "patientTreatmentPlanId": patientTreatmentPlanId,
    "hasServiceContract": hasServiceContract,
    "hasPaymentPlan": hasPaymentPlan,
  };
}
