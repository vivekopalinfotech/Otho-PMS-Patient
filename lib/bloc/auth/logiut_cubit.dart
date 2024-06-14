
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';


import 'logout_state.dart';
class LogoutCubit extends Cubit<LogoutState> {
  final ApiProvider _apiProvider;
  LogoutCubit(this._apiProvider) : super(LogoutInitial());

  Future<void> logout() async {
    try {
      emit(LogoutLoading());

      String logoutResponse = await _apiProvider.logout();

      emit(LogoutSuccess(logoutResponse));
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }}