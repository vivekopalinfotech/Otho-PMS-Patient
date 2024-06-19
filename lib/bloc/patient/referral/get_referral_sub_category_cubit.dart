import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_referral_sub_categories_response.dart';

import 'get_referral_sub_category_state.dart';


class GetReferralSubCategoryCubit extends Cubit<GetReferralSubCategoryState> {
  final ApiProvider _apiProvider;
  GetReferralSubCategoryCubit(this._apiProvider) : super(GetReferralSubCategoryInitial());

  Future<void> GetReferralSubCategory() async {
    try {
      emit(GetReferralSubCategoryLoading());

      GetReferralSubCategoryResponse getReferralSubCategoryResponse = await _apiProvider.getReferralSubCategories();

      emit(GetReferralSubCategorySuccess(getReferralSubCategoryResponse));
    } catch (e) {
      emit(GetReferralSubCategoryError(e.toString()));
    }
  }
}
