import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_allergies.dart';
import 'get_allergies_state.dart';



class GetAllergiesCubit extends Cubit<GetAllergiesState> {
  final ApiProvider _apiProvider;
  GetAllergiesCubit(this._apiProvider) : super(GetAllergiesInitial());

  Future<void> getAllergies() async {
    try {
      emit(GetAllergiesLoading());

      GetAllergyResponse allergiesResponse = await _apiProvider.getAllergies();

      emit(GetAllergiesSuccess(allergiesResponse));
    } catch (e) {
      emit(GetAllergiesError(e.toString()));
    }
  }
}
