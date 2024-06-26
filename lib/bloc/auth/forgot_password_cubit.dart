import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/auth/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ApiProvider _apiProvider;
  ForgotPasswordCubit(this._apiProvider) : super(ForgotPasswordInitial());

  Future<void> forgotPassword(email) async {
    try {
      emit(ForgotPasswordLoading());

      String forgotPasswordResponse = await _apiProvider.forgotPassword(email);

      emit(ForgotPasswordSuccess(forgotPasswordResponse));
    } catch (e) {
      emit(ForgotPasswordError(e.toString()));
    }
  }
}
