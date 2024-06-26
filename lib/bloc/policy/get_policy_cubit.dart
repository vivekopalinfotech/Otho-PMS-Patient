import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';

import 'package:ortho_pms_patient/responses/policy_response.dart';

import 'get_policy_state.dart';

class GetPolicyCubit extends Cubit<GetPolicyState> {
  final ApiProvider _apiProvider;
  GetPolicyCubit(this._apiProvider) : super(GetPolicyInitial());

  Future<void> getPolicy(practicePolicyId) async {
    try {
      emit(GetPolicyLoading());

      PolicyResponse policyResponse = await _apiProvider.getPolicy(practicePolicyId);

      emit(GetPolicySuccess(policyResponse));
    } catch (e) {
      emit(GetPolicyError(e.toString()));
    }
  }
}
