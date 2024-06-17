
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/auth/change_password_state.dart';
import 'package:ortho_pms_patient/responses/change_password_response.dart';


class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ApiProvider _apiProvider;
  ChangePasswordCubit(this._apiProvider) : super(ChangePasswordInitial());

  Future<void> ChangePassword(currentPassword,email,newPassword) async {
    try {
      emit(ChangePasswordLoading());

      ChangePasswordResponse changePasswordResponse = await _apiProvider.changePassword(currentPassword,email,newPassword);

      emit(ChangePasswordSuccess(changePasswordResponse));
    } catch (e) {
      emit(ChangePasswordError(e.toString()));
    }
  }
}
