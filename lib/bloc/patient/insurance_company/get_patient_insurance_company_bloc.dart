
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/insurance_response.dart';

import 'get_patient_insurance_company_state.dart';

class GetPatientInsuranceCompanyCubit extends Cubit<GetPatientInsuranceCompanyState> {
  final ApiProvider _apiProvider;
  GetPatientInsuranceCompanyCubit(this._apiProvider) : super(GetPatientInsuranceCompanyInitial());

  Future<void> getGetPatientInsuranceCompany(patientId) async {
    try {
      emit(GetPatientInsuranceCompanyLoading());

      InsuranceResponse insuranceResponse = await _apiProvider.getPatientInsuranceCompanies(patientId);

      emit(GetPatientInsuranceCompanySuccess(insuranceResponse));
    } catch (e) {
      emit(GetPatientInsuranceCompanyError(e.toString()));
    }
  }
}
