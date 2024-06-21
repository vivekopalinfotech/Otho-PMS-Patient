
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_insurance_companies.dart';
import 'practice_insurance_companies_state.dart';

class PracticeInsuranceCompanyCubit extends Cubit<PracticeInsuranceCompanyState> {
  final ApiProvider _apiProvider;
  PracticeInsuranceCompanyCubit(this._apiProvider) : super(PracticeInsuranceCompanyInitial());

  Future<void> getPracticeInsuranceCompany() async {
    try {
      emit(PracticeInsuranceCompanyLoading());

      PracticeInsuranceCompanyResponse practiceInsuranceCompanyResponse = await _apiProvider.getPracticeInsuranceCompanies();

      emit(PracticeInsuranceCompanySuccess(practiceInsuranceCompanyResponse));
    } catch (e) {
      emit(PracticeInsuranceCompanyError(e.toString()));
    }
  }
}
