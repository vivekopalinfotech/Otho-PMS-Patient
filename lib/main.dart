import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/screens/auth/login_screen.dart';
import 'bloc/auth/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Repository();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LogInCubit(repository),
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
