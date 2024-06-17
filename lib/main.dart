import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/bloc/auth/change_password_cubit.dart';
import 'package:ortho_pms_patient/bloc/auth/logiut_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/get_patient_exam_by_patient_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/get_patient_insurance_company_bloc.dart';
import 'package:ortho_pms_patient/bloc/patient/history/patient_appointment_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/history/patient_exam_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/get_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/screens/auth/login_screen.dart';
import 'bloc/auth/login_cubit.dart';
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
