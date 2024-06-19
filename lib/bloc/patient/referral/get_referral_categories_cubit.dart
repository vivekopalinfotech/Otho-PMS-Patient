import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_referral_categories_Response.dart';
import 'get_referral_categories_state.dart';

class GetReferralCategoryCubit extends Cubit<GetReferralCategoryState> {
  final ApiProvider _apiProvider;
  GetReferralCategoryCubit(this._apiProvider) : super(GetReferralCategoryInitial());

  Future<void> GetReferralCategory() async {
    try {
      emit(GetReferralCategoryLoading());

      GetReferralCategoryResponse getReferralCategoryResponse = await _apiProvider.getReferralCategories();

      emit(GetReferralCategorySuccess(getReferralCategoryResponse));
    } catch (e) {
      emit(GetReferralCategoryError(e.toString()));
    }
  }
}
