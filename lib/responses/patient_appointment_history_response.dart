class PatientAppointmentResponse {
  final List<Appointment> appointment;

  PatientAppointmentResponse({
    required this.appointment,
  });

  factory PatientAppointmentResponse.fromJson(List<dynamic> json) {
    return PatientAppointmentResponse(
      appointment: json.map((e) => Appointment.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}


class Appointment {
  int patientAppointmentHistoryId;
  int patientAppointmentId;
  int patientId;
  int practiceId;
  int practiceLocationId;
  int practiceAppointmentTypeId;
  int providerId;
  DateTime patientAppointmentTime;
  int patientAppointmentDuration;
  int patientAppointmentStatusId;
  String? patientAppointmentNotes;
  bool isAddedToClipboard;
  bool isImported;
  bool isVirtualAppointment;
  bool isAppointmentConfirmed;
  int originalChairId;
  String? actualChairId;
  bool isActive;
  String? patientCurrentLocation;
  DateTime createdDate;
  DateTime modifiedDate;
  String? createdByUserId;
  String? modifiedByUserId;
  String? practiceAppointmentName;
  String? practiceAppointmentDescription;
  String? practiceAppointmentGroupName;
  String? practiceAppointmentGroupDescription;
  String? practiceLocationName;
  String? patientAppointmentStatusName;
  String? modifiedBy;
  String? providerName;
  String? providerInitials;
  String? providerLicenseNumber;
  String? providerNotes;
  String? providerNpi;

  Appointment({
    required this.patientAppointmentHistoryId,
    required this.patientAppointmentId,
    required this.patientId,
    required this.practiceId,
    required this.practiceLocationId,
    required this.practiceAppointmentTypeId,
    required this.providerId,
    required this.patientAppointmentTime,
    required this.patientAppointmentDuration,
    required this.patientAppointmentStatusId,
    required this.patientAppointmentNotes,
    required this.isAddedToClipboard,
    required this.isImported,
    required this.isVirtualAppointment,
    required this.isAppointmentConfirmed,
    required this.originalChairId,
    required this.actualChairId,
    required this.isActive,
    required this.patientCurrentLocation,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.practiceAppointmentName,
    required this.practiceAppointmentDescription,
    required this.practiceAppointmentGroupName,
    required this.practiceAppointmentGroupDescription,
    required this.practiceLocationName,
    required this.patientAppointmentStatusName,
    required this.modifiedBy,
    required this.providerName,
    required this.providerInitials,
    required this.providerLicenseNumber,
    required this.providerNotes,
    required this.providerNpi,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      patientAppointmentHistoryId: json['patientAppointmentHistoryId'],
      patientAppointmentId: json['patientAppointmentId'],
      patientId: json['patientId'],
      practiceId: json['practiceId'],
      practiceLocationId: json['practiceLocationId'],
      practiceAppointmentTypeId: json['practiceAppointmentTypeId'],
      providerId: json['providerId'],
      patientAppointmentTime: DateTime.parse(json['patientAppointmentTime']),
      patientAppointmentDuration: json['patientAppointmentDuration'],
      patientAppointmentStatusId: json['patientAppointmentStatusId'],
      patientAppointmentNotes: json['patientAppointmentNotes'].toString(),
      isAddedToClipboard: json['isAddedToClipboard'],
      isImported: json['isImported'],
      isVirtualAppointment: json['isVirtualAppointment'],
      isAppointmentConfirmed: json['isAppointmentConfirmed'],
      originalChairId: json['originalChairId'],
      actualChairId: json['actualChairId'].toString(),
      isActive: json['isActive'],
      patientCurrentLocation: json['patientCurrentLocation'].toString(),
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'].toString(),
      modifiedByUserId: json['modifiedByUserId'].toString(),
      practiceAppointmentName: json['practiceAppointmentName'].toString(),
      practiceAppointmentDescription: json['practiceAppointmentDescription'].toString(),
      practiceAppointmentGroupName: json['practiceAppointmentGroupName'].toString(),
      practiceAppointmentGroupDescription:
      json['practiceAppointmentGroupDescription'].toString(),
      practiceLocationName: json['practiceLocationName'].toString(),
      patientAppointmentStatusName: json['patientAppointmentStatusName'].toString(),
      modifiedBy: json['modifiedBy'].toString(),
      providerName: json['providerName'].toString(),
      providerInitials: json['providerInitials'].toString(),
      providerLicenseNumber: json['providerLicenseNumber'].toString(),
      providerNotes: json['providerNotes'].toString(),
      providerNpi: json['providerNpi'].toString(),
    );
  }
}
