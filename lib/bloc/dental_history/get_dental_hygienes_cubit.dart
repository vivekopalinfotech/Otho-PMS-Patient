import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_dental_hygiens_response.dart';
import 'get_dental_hygienes_state.dart';



class GetDentalHygienesCubit extends Cubit<GetDentalHygienesState> {
  final ApiProvider _apiProvider;
  GetDentalHygienesCubit(this._apiProvider) : super(GetDentalHygienesInitial());

  Future<void> getGetDentalHygienes() async {
    try {
      emit(GetDentalHygienesLoading());

      GetDentalHygieneResponse getDentalHygieneResponse = await _apiProvider.getDentalHygienes();

      emit(GetDentalHygienesSuccess(getDentalHygieneResponse));
    } catch (e) {
      emit(GetDentalHygienesError(e.toString()));
    }
  }
}
