import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_dental_history_response.dart';

import 'save_patient_dental_history_state.dart';

class SaveDentalHistoryCubit extends Cubit<SaveDentalHistoryState> {
  final ApiProvider _apiProvider;
  SaveDentalHistoryCubit(this._apiProvider) : super(SaveDentalHistoryInitial());

  Future<void> savePatientDentalHistory(
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
      dentalHygienes,
      habits) async {
    try {
      emit(SaveDentalHistoryLoading());

      GetDentalHistoryResponse saveDentalHistoryResponse = await _apiProvider.SavePatientDentalHistory(
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
          dentalHygienes,
          habits);

      emit(SaveDentalHistorySuccess(saveDentalHistoryResponse));
    } catch (e) {
      emit(SaveDentalHistoryError(e.toString()));
    }
  }
}
