import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/get_chief_Complaint_types_state.dart';
import 'package:ortho_pms_patient/responses/get_chief_complaint_types.dart';

class GetChiefCompliantTypesCubit extends Cubit<GetChiefCompliantTypesState> {
  final ApiProvider _apiProvider;
  GetChiefCompliantTypesCubit(this._apiProvider) : super(GetChiefCompliantTypesInitial());

  Future<void> GetChiefCompliantTypes() async {
    try {
      emit(GetChiefCompliantTypesLoading());

      GetChiefCompliantTypesResponse getChiefCompliantTypesResponse = await _apiProvider.getChiefCompliantTypes();

      emit(GetChiefCompliantTypesSuccess(getChiefCompliantTypesResponse));
    } catch (e) {
      emit(GetChiefCompliantTypesError(e.toString()));
    }
  }
}
