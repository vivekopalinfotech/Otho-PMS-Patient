import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/states_response.dart';
import 'get_states_state.dart';


class GetStatesCubit extends Cubit<GetStatesState> {
  final ApiProvider _apiProvider;
  GetStatesCubit(this._apiProvider) : super(GetStatesInitial());

  Future<void> getStates() async {
    try {
      emit(GetStatesLoading());

      StatesResponse statesResponse = await _apiProvider.getStates();

      emit(GetStatesSuccess(statesResponse));
    } catch (e) {
      emit(GetStatesError(e.toString()));
    }
  }
}
