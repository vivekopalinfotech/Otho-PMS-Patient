import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_dentist_response.dart';
import 'get_dentist_state.dart';

class GetDentistCubit extends Cubit<GetDentistState> {
  final ApiProvider _apiProvider;
  GetDentistCubit(this._apiProvider) : super(GetDentistInitial());

  Future<void> GetDentist() async {
    try {
      emit(GetDentistLoading());

      GetDentistResponse getDentistResponse = await _apiProvider.getDentist();

      emit(GetDentistSuccess(getDentistResponse));
    } catch (e) {
      emit(GetDentistError(e.toString()));
    }
  }
}
