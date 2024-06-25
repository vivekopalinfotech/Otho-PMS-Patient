import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/medical_history/save_medical_history_state.dart';
import 'package:ortho_pms_patient/responses/get_patient_medical_history.dart';

class SaveMedicalHistoryCubit extends Cubit<SaveMedicalHistoryState> {
  final ApiProvider _apiProvider;
  SaveMedicalHistoryCubit(this._apiProvider) : super(SaveMedicalHistoryInitial());

  Future<void> savePatientMedicalHistory(
      patientMedicalHistoryId,
      lastDentalAppointment,
      currentPhysicalHealth,
      currentMedications,
      isPatientOnBirthControl,
      patientPregnant,
      patientPregnantWeekAlong,
      hasPrimaryDentist,
      primaryDentistId,
      isPatientUnderPhysicianCareForMedicalProblems,
      patientUnderPhysicianCareForMedicalProblemsDescription1,
      patientUnderPhysicianCareForMedicalProblemsDescription2,
      patientUnderPhysicianCareForMedicalProblemsDescription3,
      patientUnderPhysicianCareForMedicalProblemsDescription4,
      hasPatientTakenBoniva,
      hasPatientTakenActonel,
      hasPatientTakenFosamax,
      hasPatientTakenOther,
      noneOfTheAboveMedications,
      patientTakenAnyOtherBisphosphonate,
      hasPatientBeenEvaluatedForOrthodonticTreatment,
      patientBeenEvaluatedForOrthodonticTreatmentNotes,
      hasPatientEverHadInjuryOnFaceMouthChin,
      hasPatientEverHadInjuryOnFaceMouthChinNotes,
      hasPatientEverHadAdenoidsOrTonsilsRemoved,
      hasPatientEverHadAdenoidsOrTonsilsRemovedNotes,
      hasPatientEverInformedAboutPermanentTooth,
      hasPatientEverInformedAboutPermanentToothNotes,
      hasPatientEverHasTenderness,
      hasPatientEverHasTendernessNotes,
      hasPatientTakenAntibioticPriorToDenalVisit,
      hasPatientTakenAntibioticPriorToDenalVisitNotes,
      hasPatientEverHadProblemsWithDentalWork,
      hasPatientEverHadProblemsWithDentalWorkNotes,
      allergies,
      medicalConditions) async {
    try {
      emit(SaveMedicalHistoryLoading());

      GetMedicalHistoryResponse saveMedicalHistoryResponse = await _apiProvider.SavePatientMedicalHistory(
          patientMedicalHistoryId,
          lastDentalAppointment,
          currentPhysicalHealth,
          currentMedications,
          isPatientOnBirthControl,
          patientPregnant,
          patientPregnantWeekAlong,
          hasPrimaryDentist,
          primaryDentistId,
          isPatientUnderPhysicianCareForMedicalProblems,
          patientUnderPhysicianCareForMedicalProblemsDescription1,
          patientUnderPhysicianCareForMedicalProblemsDescription2,
          patientUnderPhysicianCareForMedicalProblemsDescription3,
          patientUnderPhysicianCareForMedicalProblemsDescription4,
          hasPatientTakenBoniva,
          hasPatientTakenActonel,
          hasPatientTakenFosamax,
          hasPatientTakenOther,
          noneOfTheAboveMedications,
          patientTakenAnyOtherBisphosphonate,
          hasPatientBeenEvaluatedForOrthodonticTreatment,
          patientBeenEvaluatedForOrthodonticTreatmentNotes,
          hasPatientEverHadInjuryOnFaceMouthChin,
          hasPatientEverHadInjuryOnFaceMouthChinNotes,
          hasPatientEverHadAdenoidsOrTonsilsRemoved,
          hasPatientEverHadAdenoidsOrTonsilsRemovedNotes,
          hasPatientEverInformedAboutPermanentTooth,
          hasPatientEverInformedAboutPermanentToothNotes,
          hasPatientEverHasTenderness,
          hasPatientEverHasTendernessNotes,
          hasPatientTakenAntibioticPriorToDenalVisit,
          hasPatientTakenAntibioticPriorToDenalVisitNotes,
          hasPatientEverHadProblemsWithDentalWork,
          hasPatientEverHadProblemsWithDentalWorkNotes,
          allergies,
          medicalConditions);

      emit(SaveMedicalHistorySuccess(saveMedicalHistoryResponse));
    } catch (e) {
      emit(SaveMedicalHistoryError(e.toString()));
    }
  }
}
