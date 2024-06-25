import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_habits_response.dart';

import 'get_habits_state.dart';

class GetHabitsCubit extends Cubit<GetHabitsState> {
  final ApiProvider _apiProvider;
  GetHabitsCubit(this._apiProvider) : super(GetHabitsInitial());

  Future<void> getGetHabits() async {
    try {
      emit(GetHabitsLoading());

      GetHabitsResponse getHabitsResponse = await _apiProvider.getHabits();

      emit(GetHabitsSuccess(getHabitsResponse));
    } catch (e) {
      emit(GetHabitsError(e.toString()));
    }
  }
}
