
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/login_response.dart';

import 'login_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final ApiProvider _apiProvider;
  LogInCubit(this._apiProvider) : super(LogInInitial());

  Future<void> logIn(
      String userName,
      String password,
      ) async {
    try {
      emit(LogInLoading());

      LogInResponse logInResponse = await _apiProvider.logIn(userName, password);

      emit(LogInSuccess(logInResponse));
    } catch (e) {
      emit(LogInError(e.toString()));
    }
  }
}
