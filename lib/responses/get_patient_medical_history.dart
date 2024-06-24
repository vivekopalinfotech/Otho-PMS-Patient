class GetMedicalHistoryResponse {
  final List<MedicalHistory> medicalHistory;
  final List<MedicalCondition> medicalConditions;
  final List<Allergy> allergies;

  GetMedicalHistoryResponse({
    required this.medicalHistory,
    required this.medicalConditions,
    required this.allergies,
  });

  factory GetMedicalHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetMedicalHistoryResponse(
      medicalHistory: (json['medicalHistory'] as List).map((medicalHistory) => MedicalHistory.fromJson(medicalHistory)).toList(),
      medicalConditions: (json['medicalConditions'] as List).map((medicalConditions) => MedicalCondition.fromJson(medicalConditions)).toList(),
      allergies: (json['allergies'] as List).map((allergies) => Allergy.fromJson(allergies)).toList(),
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
  String createdDate;
  String modifiedDate;
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
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      hasPrimaryDentist: json['hasPrimaryDentist'],
      primaryDentistId: json['primaryDentistId'],
    );
  }
}

class MedicalCondition {
  int patientMedicalConditionId;
  int patientId;
  int medicalConditionId;
  String otherMedicalConditions;
  bool isAnythingPrivate;
  String patientMedicalConditionNotes;
  bool isActive;
  String createdDate;
  String modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  String medicalConditionName;

  MedicalCondition({
    required this.patientMedicalConditionId,
    required this.patientId,
    required this.medicalConditionId,
    required this.otherMedicalConditions,
    required this.isAnythingPrivate,
    required this.patientMedicalConditionNotes,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.medicalConditionName,
  });

  factory MedicalCondition.fromJson(Map<String, dynamic> json) {
    return MedicalCondition(
      patientMedicalConditionId: json['patientMedicalConditionId'],
      patientId: json['patientId'],
      medicalConditionId: json['medicalConditionId'],
      otherMedicalConditions: json['otherMedicalConditions'],
      isAnythingPrivate: json['isAnythingPrivate'],
      patientMedicalConditionNotes: json['patientMedicalConditionNotes'],
      isActive: json['isActive'],
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      medicalConditionName: json['medicalConditionName'],
    );
  }
}

class Allergy {
  int patientAllergyId;
  int patientId;
  int allergyId;
  String otherAllergies;
  bool isActive;
  String createdDate;
  String modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String patientGuid;
  String allergyName;
  String allergyDescription;

  Allergy({
    required this.patientAllergyId,
    required this.patientId,
    required this.allergyId,
    required this.otherAllergies,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.patientGuid,
    required this.allergyName,
    required this.allergyDescription,
  });

  factory Allergy.fromJson(Map<String, dynamic> json) {
    return Allergy(
      patientAllergyId: json['patientAllergyId'],
      patientId: json['patientId'],
      allergyId: json['allergyId'],
      otherAllergies: json['otherAllergies'],
      isActive: json['isActive'],
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      patientGuid: json['patientGuid'],
      allergyName: json['allergyName'],
      allergyDescription: json['allergyDescription'],
    );
  }
}

class MedicalHistoryResponse {
  List<MedicalHistory> medicalHistory;
  List<MedicalCondition> medicalConditions;
  List<Allergy> allergies;

  MedicalHistoryResponse({
    required this.medicalHistory,
    required this.medicalConditions,
    required this.allergies,
  });

  factory MedicalHistoryResponse.fromJson(Map<String, dynamic> json) {
    List<MedicalHistory> medicalHistoryList = [];
    if (json['medicalHistory'] != null) {
      json['medicalHistory'].forEach((v) {
        medicalHistoryList.add(MedicalHistory.fromJson(v));
      });
    }

    List<MedicalCondition> medicalConditionsList = [];
    if (json['medicalConditions'] != null) {
      json['medicalConditions'].forEach((v) {
        medicalConditionsList.add(MedicalCondition.fromJson(v));
      });
    }

    List<Allergy> allergiesList = [];
    if (json['allergies'] != null) {
      json['allergies'].forEach((v) {
        allergiesList.add(Allergy.fromJson(v));
      });
    }

    return MedicalHistoryResponse(
      medicalHistory: medicalHistoryList,
      medicalConditions: medicalConditionsList,
      allergies: allergiesList,
    );
  }
}
