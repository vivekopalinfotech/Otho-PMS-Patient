class PatientExamHistoryResponse {
  final List<PatientExamHistory> examHistory;

  PatientExamHistoryResponse({
    required this.examHistory,
  });

  factory PatientExamHistoryResponse.fromJson(List<dynamic> json) {
    return PatientExamHistoryResponse(
      examHistory: json.map((e) => PatientExamHistory.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}


class PatientExamHistory {
  int patientExamHistoryId;
  int patientExamId;
  int practiceId;
  int practiceLocationId;
  int patientId;
  int providerId;
  int practiceAppointmentTypeId;
  int patientExamStatusId;
  int patientExamResultId;
  dynamic examNotes;
  String? generalNotes;
  DateTime patientExamDate;
  bool isActive;
  dynamic nonOsreference;
  DateTime createdDate;
  DateTime modifiedDate;
  String? createdByUserId;
  String? modifiedByUserId;
  String? patientGuid;
  String? practiceAppointmentName;
  int practiceAppointmentDuration;
  String? practiceAppointmentColor;
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
  String? practiceAppointmentGroupColor;
  dynamic practiceAppointmentGroupDescription;
  int practiceAppointmentGroupDuration;
  String? practiceAppointmentGroupName;
  String? providerName;
  String? providerInitials;
  String? providerLicenseNumber;
  String? providerNotes;
  String? providerNpi;
  String? practiceLocationName;
  String? patientAppointmentStatusName;
  String? modifiedBy;

  PatientExamHistory({
    required this.patientExamHistoryId,
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
    required this.patientAppointmentStatusName,
    required this.modifiedBy,
  });

  factory PatientExamHistory.fromJson(Map<String, dynamic> json) {
    return PatientExamHistory(
      patientExamHistoryId: json['patientExamHistoryId'],
      patientExamId: json['patientExamId'],
      practiceId: json['practiceId'],
      practiceLocationId: json['practiceLocationId'],
      patientId: json['patientId'],
      providerId: json['providerId'],
      practiceAppointmentTypeId: json['practiceAppointmentTypeId'],
      patientExamStatusId: json['patientExamStatusId'],
      patientExamResultId: json['patientExamResultId'],
      examNotes: json['examNotes'],
      generalNotes: json['generalNotes'].toString(),
      patientExamDate: DateTime.parse(json['patientExamDate']),
      isActive: json['isActive'],
      nonOsreference: json['nonOsreference'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'].toString(),
      modifiedByUserId: json['modifiedByUserId'].toString(),
      patientGuid: json['patientGuid'].toString(),
      practiceAppointmentName: json['practiceAppointmentName'].toString(),
      practiceAppointmentDuration: json['practiceAppointmentDuration'],
      practiceAppointmentColor: json['practiceAppointmentColor'].toString(),
      patientExamStatusName: json['patientExamStatusName'].toString(),
      patientExamStatusDescription: json['patientExamStatusDescription'].toString(),
      patientExamResultName: json['patientExamResultName'].toString(),
      patientExamResultDescription: json['patientExamResultDescription'].toString(),
      patientExamResultCategoryName: json['patientExamResultCategoryName'].toString(),
      patientExamResultCategoryDescription: json['patientExamResultCategoryDescription'].toString(),
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
      patientCurrentLocation: json['patientCurrentLocation'].toString(),
      patientDismissedTime: json['patientDismissedTime'],
      patientSeatedTime: json['patientSeatedTime'],
      isExamFlowRequired: json['isExamFlowRequired'],
      isExamRequired: json['isExamRequired'],
      trackUntilContractSigned: json['trackUntilContractSigned'],
      practiceAppointmentGroupColor: json['practiceAppointmentGroupColor'].toString(),
      practiceAppointmentGroupDescription: json['practiceAppointmentGroupDescription'],
      practiceAppointmentGroupDuration: json['practiceAppointmentGroupDuration'],
      practiceAppointmentGroupName: json['practiceAppointmentGroupName'].toString(),
      providerName: json['providerName'].toString(),
      providerInitials: json['providerInitials'].toString(),
      providerLicenseNumber: json['providerLicenseNumber'].toString(),
      providerNotes: json['providerNotes'].toString(),
      providerNpi: json['providerNpi'].toString(),
      practiceLocationName: json['practiceLocationName'].toString(),
      patientAppointmentStatusName: json['patientAppointmentStatusName'].toString(),
      modifiedBy: json['modifiedBy'].toString(),
    );
  }
}

