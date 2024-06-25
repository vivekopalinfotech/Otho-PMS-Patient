class GetDentalHistoryResponse {
  final List<Habit> habit;
  final List<DentalHygiene> dentalHygienes;
  final List<MedicalHistory> medicalHistory;

  GetDentalHistoryResponse({
    required this.habit,
    required this.dentalHygienes,
    required this.medicalHistory,
  });

  factory GetDentalHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetDentalHistoryResponse(
      habit: (json['habits'] as List).map((habit) => Habit.fromJson(habit)).toList(),
      dentalHygienes: (json['dentalHygienes'] as List).map((dentalHygiene) => DentalHygiene.fromJson(dentalHygiene)).toList(),
      medicalHistory: (json['medicalHistory'] as List).map((medicalHistory) => MedicalHistory.fromJson(medicalHistory)).toList(),
    );
  }
}

class Habit {
  int patientHabitId;
  int patientId;
  int habitId;
  String otherHabits;
  bool isActive;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  String habitName;

  Habit({
    required this.patientHabitId,
    required this.patientId,
    required this.habitId,
    required this.otherHabits,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.habitName,
  });

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      patientHabitId: json['patientHabitId'],
      patientId: json['patientId'],
      habitId: json['habitId'],
      otherHabits: json['otherHabits'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      habitName: json['habitName'],
    );
  }
}

class DentalHygiene {
  int patientDentalHygieneId;
  int patientId;
  int dentalHygieneId;
  String otherDentalHygiene;
  bool isActive;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  String dentalHygieneName;

  DentalHygiene({
    required this.patientDentalHygieneId,
    required this.patientId,
    required this.dentalHygieneId,
    required this.otherDentalHygiene,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.dentalHygieneName,
  });

  factory DentalHygiene.fromJson(Map<String, dynamic> json) {
    return DentalHygiene(
      patientDentalHygieneId: json['patientDentalHygieneId'],
      patientId: json['patientId'],
      dentalHygieneId: json['dentalHygieneId'],
      otherDentalHygiene: json['otherDentalHygiene'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      dentalHygieneName: json['dentalHygieneName'],
    );
  }
}

class MedicalHistory {
  int patientMedicalHistoryId;
  int patientId;
  String lastDentalAppointment;
  String currentPhysicalHealth;
  String currentMedications;
  bool isPatientOnBirthControl;
  String patientPregnant;
  int patientPregnantWeekAlong;
  bool isPatientUnderPhysicianCareForMedicalProblems;
  String patientUnderPhysicianCareForMedicalProblemsDescription1;
  String patientUnderPhysicianCareForMedicalProblemsDescription2;
  String patientUnderPhysicianCareForMedicalProblemsDescription3;
  String patientUnderPhysicianCareForMedicalProblemsDescription4;
  bool hasPatientTakenBoniva;
  bool hasPatientTakenActonel;
  bool hasPatientTakenFosamax;
  bool hasPatientTakenOther;
  String patientTakenAnyOtherBisphosphonate;
  bool hasPatientBeenEvaluatedForOrthodonticTreatment;
  String patientBeenEvaluatedForOrthodonticTreatmentNotes;
  bool hasPatientEverHadInjuryOnFaceMouthChin;
  String hasPatientEverHadInjuryOnFaceMouthChinNotes;
  bool hasPatientEverHadAdenoidsOrTonsilsRemoved;
  String hasPatientEverHadAdenoidsOrTonsilsRemovedNotes;
  bool hasPatientEverInformedAboutPermanentTooth;
  String hasPatientEverInformedAboutPermanentToothNotes;
  bool hasPatientEverHasTenderness;
  String hasPatientEverHasTendernessNotes;
  bool hasPatientTakenAntibioticPriorToDenalVisit;
  String hasPatientTakenAntibioticPriorToDenalVisitNotes;
  bool hasPatientEverHadProblemsWithDentalWork;
  String hasPatientEverHadProblemsWithDentalWorkNotes;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  bool hasPrimaryDentist;
  int primaryDentistId;

  MedicalHistory({
    required this.patientMedicalHistoryId,
    required this.patientId,
    required this.lastDentalAppointment,
    required this.currentPhysicalHealth,
    required this.currentMedications,
    required this.isPatientOnBirthControl,
    required this.patientPregnant,
    required this.patientPregnantWeekAlong,
    required this.isPatientUnderPhysicianCareForMedicalProblems,
    required this.patientUnderPhysicianCareForMedicalProblemsDescription1,
    required this.patientUnderPhysicianCareForMedicalProblemsDescription2,
    required this.patientUnderPhysicianCareForMedicalProblemsDescription3,
    required this.patientUnderPhysicianCareForMedicalProblemsDescription4,
    required this.hasPatientTakenBoniva,
    required this.hasPatientTakenActonel,
    required this.hasPatientTakenFosamax,
    required this.hasPatientTakenOther,
    required this.patientTakenAnyOtherBisphosphonate,
    required this.hasPatientBeenEvaluatedForOrthodonticTreatment,
    required this.patientBeenEvaluatedForOrthodonticTreatmentNotes,
    required this.hasPatientEverHadInjuryOnFaceMouthChin,
    required this.hasPatientEverHadInjuryOnFaceMouthChinNotes,
    required this.hasPatientEverHadAdenoidsOrTonsilsRemoved,
    required this.hasPatientEverHadAdenoidsOrTonsilsRemovedNotes,
    required this.hasPatientEverInformedAboutPermanentTooth,
    required this.hasPatientEverInformedAboutPermanentToothNotes,
    required this.hasPatientEverHasTenderness,
    required this.hasPatientEverHasTendernessNotes,
    required this.hasPatientTakenAntibioticPriorToDenalVisit,
    required this.hasPatientTakenAntibioticPriorToDenalVisitNotes,
    required this.hasPatientEverHadProblemsWithDentalWork,
    required this.hasPatientEverHadProblemsWithDentalWorkNotes,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.hasPrimaryDentist,
    required this.primaryDentistId,
  });

  factory MedicalHistory.fromJson(Map<String, dynamic> json) {
    return MedicalHistory(
      patientMedicalHistoryId: json['patientMedicalHistoryId'],
      patientId: json['patientId'],
      lastDentalAppointment: json['lastDentalAppointment'],
      currentPhysicalHealth: json['currentPhysicalHealth'],
      currentMedications: json['currentMedications'],
      isPatientOnBirthControl: json['isPatientOnBirthControl'],
      patientPregnant: json['patientPregnant'],
      patientPregnantWeekAlong: json['patientPregnantWeekAlong'],
      isPatientUnderPhysicianCareForMedicalProblems: json['isPatientUnderPhysicianCareForMedicalProblems'],
      patientUnderPhysicianCareForMedicalProblemsDescription1: json['patientUnderPhysicianCareForMedicalProblemsDescription1'],
      patientUnderPhysicianCareForMedicalProblemsDescription2: json['patientUnderPhysicianCareForMedicalProblemsDescription2'],
      patientUnderPhysicianCareForMedicalProblemsDescription3: json['patientUnderPhysicianCareForMedicalProblemsDescription3'],
      patientUnderPhysicianCareForMedicalProblemsDescription4: json['patientUnderPhysicianCareForMedicalProblemsDescription4'],
      hasPatientTakenBoniva: json['hasPatientTakenBoniva'],
      hasPatientTakenActonel: json['hasPatientTakenActonel'],
      hasPatientTakenFosamax: json['hasPatientTakenFosamax'],
      hasPatientTakenOther: json['hasPatientTakenOther'],
      patientTakenAnyOtherBisphosphonate: json['patientTakenAnyOtherBisphosphonate'],
      hasPatientBeenEvaluatedForOrthodonticTreatment: json['hasPatientBeenEvaluatedForOrthodonticTreatment'],
      patientBeenEvaluatedForOrthodonticTreatmentNotes: json['patientBeenEvaluatedForOrthodonticTreatmentNotes'],
      hasPatientEverHadInjuryOnFaceMouthChin: json['hasPatientEverHadInjuryOnFaceMouthChin'],
      hasPatientEverHadInjuryOnFaceMouthChinNotes: json['hasPatientEverHadInjuryOnFaceMouthChinNotes'],
      hasPatientEverHadAdenoidsOrTonsilsRemoved: json['hasPatientEverHadAdenoidsOrTonsilsRemoved'],
      hasPatientEverHadAdenoidsOrTonsilsRemovedNotes: json['hasPatientEverHadAdenoidsOrTonsilsRemovedNotes'],
      hasPatientEverInformedAboutPermanentTooth: json['hasPatientEverInformedAboutPermanentTooth'],
      hasPatientEverInformedAboutPermanentToothNotes: json['hasPatientEverInformedAboutPermanentToothNotes'],
      hasPatientEverHasTenderness: json['hasPatientEverHasTenderness'],
      hasPatientEverHasTendernessNotes: json['hasPatientEverHasTendernessNotes'],
      hasPatientTakenAntibioticPriorToDenalVisit: json['hasPatientTakenAntibioticPriorToDenalVisit'],
      hasPatientTakenAntibioticPriorToDenalVisitNotes: json['hasPatientTakenAntibioticPriorToDenalVisitNotes'],
      hasPatientEverHadProblemsWithDentalWork: json['hasPatientEverHadProblemsWithDentalWork'],
      hasPatientEverHadProblemsWithDentalWorkNotes: json['hasPatientEverHadProblemsWithDentalWorkNotes'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      hasPrimaryDentist: json['hasPrimaryDentist'],
      primaryDentistId: json['primaryDentistId'],
    );
  }
}

