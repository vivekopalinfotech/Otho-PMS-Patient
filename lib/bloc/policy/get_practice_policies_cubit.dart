import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/policy/get_practice_policies_state.dart';
import 'package:ortho_pms_patient/responses/get_practice_policies_response.dart';


class GetPracticePoliciesCubit extends Cubit<GetPracticePoliciesState> {
  final ApiProvider _apiProvider;
  GetPracticePoliciesCubit(this._apiProvider) : super(GetPracticePoliciesInitial());

  Future<void> getPracticePolicies() async {
    try {
      emit(GetPracticePoliciesLoading());

      GetPracticePoliciesResponse getPracticePoliciesResponse = await _apiProvider.getPracticePolicies();

      emit(GetPracticePoliciesSuccess(getPracticePoliciesResponse));
    } catch (e) {
      emit(GetPracticePoliciesError(e.toString()));
    }
  }
}
