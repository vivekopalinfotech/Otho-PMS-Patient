import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_dental_history_response.dart';
import 'get_dental_history_state.dart';



class GetDentalHistoryCubit extends Cubit<GetDentalHistoryState> {
  final ApiProvider _apiProvider;
  GetDentalHistoryCubit(this._apiProvider) : super(GetDentalHistoryInitial());

  Future<void> getPatientDentalHistory() async {
    try {
      emit(GetDentalHistoryLoading());

      GetDentalHistoryResponse getDentalHistoryResponse = await _apiProvider.getPatientDentalHistory();

      emit(GetDentalHistorySuccess(getDentalHistoryResponse));
    } catch (e) {
      emit(GetDentalHistoryError(e.toString()));
    }
  }
}
