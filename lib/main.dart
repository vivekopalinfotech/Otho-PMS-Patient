import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/bloc/allergies/get_allergies_cubit.dart';
import 'package:ortho_pms_patient/bloc/auth/change_password_cubit.dart';
import 'package:ortho_pms_patient/bloc/auth/forgot_password_cubit.dart';
import 'package:ortho_pms_patient/bloc/auth/logiut_cubit.dart';
import 'package:ortho_pms_patient/bloc/dental_history/get_dental_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/dental_history/get_dental_hygienes_cubit.dart';
import 'package:ortho_pms_patient/bloc/dental_history/save_patient_dental_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/dentist/dentist_profile_cubit.dart';
import 'package:ortho_pms_patient/bloc/dentist/get_dentist_cubit.dart';
import 'package:ortho_pms_patient/bloc/medical_condition/medical_condition_cubit.dart';
import 'package:ortho_pms_patient/bloc/medical_history/get_medical_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/medical_history/save_medical_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/get_chief_complaint_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/save_chief_complaint_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/get_patient_frp_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/save_patient_frp_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/practice_insurance_companies_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_emergency_contact_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_exam/get_patient_exam_by_patient_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/get_patient_insurance_company_bloc.dart';
import 'package:ortho_pms_patient/bloc/patient/history/patient_appointment_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/history/patient_exam_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/get_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_patient_referral_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_referral_categories_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_referral_sub_category_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/save_patient_referral_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/policy/get_policy_cubit.dart';
import 'package:ortho_pms_patient/bloc/policy/get_practice_policies_cubit.dart';
import 'package:ortho_pms_patient/bloc/states/get_states_cubit.dart';
import 'package:ortho_pms_patient/habits/get_habits_cubit.dart';
import 'package:ortho_pms_patient/screens/auth/login_screen.dart';
import 'bloc/auth/login_cubit.dart';
import 'bloc/patient/chief_complaint/get_chief_Complaint_types_cubit.dart';
import 'bloc/patient/patient_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = ApiProvider();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LogInCubit(repository),
          ),
          BlocProvider(
            create: (context) => ForgotPasswordCubit(repository),
          ),
          BlocProvider(
            create: (context) => LogoutCubit(repository),
          ),
          BlocProvider(
            create: (context) => ChangePasswordCubit(repository),
          ),
          BlocProvider(
            create: (context) => PatientCubit(repository),
          ),
          BlocProvider(
            create: (context) => PatientByIdCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPatientExamByPatientIdCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPatientInsuranceCompanyCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPatientAppointmentHistoryCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPatientExamHistoryCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPatientContactCubit(repository),
          ),
          BlocProvider(
            create: (context) => SavePatientContactCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPatientFRPCubit(repository),
          ),
          BlocProvider(
            create: (context) => SavePatientFRPCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetChiefCompliantTypesCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetChiefCompliantDetailCubit(repository),
          ),
          BlocProvider(
            create: (context) => SaveChiefCompliantDetailCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetReferralCategoryCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPatientReferralDetailCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetDentistCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetReferralSubCategoryCubit(repository),
          ),
          BlocProvider(
            create: (context) => SavePatientReferralDetailCubit(repository),
          ),
          BlocProvider(
            create: (context) => SavePatientEmergencyContactCubit(repository),
          ),
          BlocProvider(
            create: (context) => PracticeInsuranceCompanyCubit(repository),
          ),
          BlocProvider(
            create: (context) => SavePatientInsuranceCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetStatesCubit(repository),
          ),
          BlocProvider(
            create: (context) => DentistProfileCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetAllergiesCubit(repository),
          ),
          BlocProvider(
            create: (context) => MedicalConditionCubit(repository),
          ),
          BlocProvider(
            create: (context) => MedicalHistoryCubit(repository),
          ),
          BlocProvider(
            create: (context) => SaveMedicalHistoryCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetDentalHygienesCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetHabitsCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetDentalHistoryCubit(repository),
          ),
          BlocProvider(
            create: (context) => SaveDentalHistoryCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPolicyCubit(repository),
          ),
          BlocProvider(
            create: (context) => GetPracticePoliciesCubit(repository),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: ThemeData(
            colorScheme: AppColor.schemeLight,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: AppColor.schemeDark,
            useMaterial3: true,
          ),
          home: const LoginScreen(),
        ));
  }
}
