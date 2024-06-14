// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/auth/login_cubit.dart';
import 'package:ortho_pms_patient/bloc/auth/login_state.dart';
import 'package:ortho_pms_patient/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool agree = false;

  toggle() {
    setState(() {
      agree = !agree;
    });
  }

  bool _isObscure = true;
  bool _isLoading = false;
  bool _isLogin = true;
  bool? biometric;

  String login = '';
  String email = '';
  String biometricPassword = '';
  String biometricEmail = '';
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      login = sharedPreferences.getString('login').toString();
      email = sharedPreferences.getString('email').toString();
      biometricEmail = sharedPreferences.getString('biometricEmail').toString();
      biometricPassword = sharedPreferences.getString('biometricPassword').toString();
      biometric = email == biometricEmail ? sharedPreferences.getBool('biometric') : false;
    });
    if (login == 'true') {
      setState(() {
        _isLogin = true;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    redirectPageName: 'dashboardPage',
                    userEmail: email,
                  )));
    } else {
      setState(() {
        _isLogin = false;
      });
      Future.delayed(const Duration(seconds: 2), () {
        _checkBiometrics();
        if (biometric == true) {
          _authenticate();
        }
      });
    }
  }

  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometrics = [];
  String _authorized = 'Not Authorized';
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await _localAuth.canCheckBiometrics;
    } catch (e) {
      print(e);
      canCheckBiometrics = false;
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });

    if (_canCheckBiometrics) {
      List<BiometricType> availableBiometrics;
      try {
        availableBiometrics = await _localAuth.getAvailableBiometrics();
      } catch (e) {
        print(e);
        availableBiometrics = [];
      }
      setState(() {
        _availableBiometrics = availableBiometrics;
      });
    }
  }

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access your account',
        options: AuthenticationOptions(biometricOnly: true, useErrorDialogs: true, stickyAuth: true, sensitiveTransaction: true),
      );
    } catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    });

    if (authenticated) {
      BlocProvider.of<LogInCubit>(context).logIn(
        biometricEmail,
        biometricPassword,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        body: BlocConsumer<LogInCubit, LogInState>(listener: (context, state) async {
      if (state is LogInSuccess) {
        setState(() {
          _isLoading = false;
        });
        if (state.logInResponse.valid == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainScreen(
                        redirectPageName: 'dashboardPage',
                        userEmail: state.logInResponse.email.toString(),
                      )));
          SharedPreferences sharedPreference = await SharedPreferences.getInstance();
          sharedPreference.setString("login", 'true');
          sharedPreference.setString("email", state.logInResponse.email.toString());
          sharedPreference.setString("token", state.logInResponse.accessToken.toString());
        } else {
          showSnackBar(context, 'Invalid Email or Password');
        }
      }
      if (state is LogInError) {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(context, 'Invalid Email or Password');
      }
      if (state is LogInLoading) {
        setState(() {
          _isLoading = true;
        });
      }
    }, builder: (context, state) {
      return _isLogin
          ? Center(
              child: CircularProgressIndicator(
              color: colorScheme.surfaceTint,
            ))
          : Stack(
              children: [
                Opacity(
                  opacity: .6,
                  child: Container(
                    height: maxHeight,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/login_bg.png'), fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                    bottom: 36,
                    left: 0,
                    right: 0,
                    child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: AppConstants.HP),
                        color: colorScheme.onPrimary,
                        child: Container(
                          padding: const EdgeInsets.all(AppConstants.HP),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Patient Login',
                                style: GoogleFonts.inter(
                                  fontSize: AppConstants.HEADING2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Patient username',
                                style: GoogleFonts.inter(
                                  fontSize: AppConstants.NORMAL,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 8),
                              MediaQuery(
                                  data: MediaQuery.of(context).copyWith(devicePixelRatio: 1, textScaler: const TextScaler.linear(1)),
                                  child: TextFormField(
                                    cursorColor: colorScheme.primary,
                                    controller: usernameController,
                                    keyboardType: TextInputType.emailAddress,
                                    scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                    onChanged: (value) {
                                      setState(() {
                                        usernameController.text;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: AppConstants.HP, vertical: AppConstants.VP),
                                        hintText: 'Patient username',
                                        hintStyle: GoogleFonts.inter(fontSize: AppConstants.LARGE, fontWeight: FontWeight.normal, color: colorScheme.outlineVariant),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: colorScheme.primary)),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: colorScheme.outlineVariant))),
                                    style: GoogleFonts.inter(
                                      fontSize: AppConstants.NORMAL,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )),
                              const SizedBox(height: 20),
                              Text(
                                'Password',
                                style: GoogleFonts.inter(
                                  fontSize: AppConstants.NORMAL,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 8),
                              MediaQuery(
                                  data: MediaQuery.of(context).copyWith(
                                    textScaler: const TextScaler.linear(1),
                                  ),
                                  child: TextFormField(
                                    cursorColor: colorScheme.primary,
                                    obscureText: _isObscure,
                                    controller: passwordController,
                                    scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                    onChanged: (value) {
                                      setState(() {
                                        passwordController.text;
                                      });
                                    },
                                    onTap: () {},
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: AppConstants.HP, vertical: AppConstants.VP),
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.normal, color: colorScheme.outlineVariant),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: colorScheme.primary)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: colorScheme.outlineVariant)),
                                      suffixIcon: InkWell(
                                          radius: 15,
                                          child: Icon(
                                            _isObscure ? Icons.visibility : Icons.visibility_off,
                                            color: colorScheme.outlineVariant,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          }),
                                    ),
                                    style: GoogleFonts.inter(
                                      fontSize: AppConstants.SMALL,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      toggle();
                                    },
                                    child: Icon(
                                      agree ? Icons.check_box : Icons.check_box_outline_blank,
                                      color: agree ? colorScheme.primary : colorScheme.tertiary,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      "I have read and understand the End User License Agreement and Privacy Policy",
                                      textScaler: const TextScaler.linear(1),
                                      style: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.normal),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              _isLoading
                                  ? Center(
                                      child: LinearProgressIndicator(
                                      color: colorScheme.surfaceTint,
                                      borderRadius: BorderRadius.circular(10),
                                    ))
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(agree ? colorScheme.primaryContainer : colorScheme.tertiaryContainer),
                                          elevation: MaterialStatePropertyAll(agree ? 2 : 0)),
                                      onPressed: () {
                                        if (agree) {
                                          if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                                            BlocProvider.of<LogInCubit>(context).logIn(
                                              usernameController.text.toString(),
                                              passwordController.text.toString(),
                                            );
                                          } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(usernameController.text.toString()) &&
                                              usernameController.text.isNotEmpty &&
                                              passwordController.text.isNotEmpty) {
                                            showSnackBar(context, "Please check your Email Id");
                                            return;
                                          } else {
                                            showSnackBar(context, usernameController.text.isEmpty ? 'Please enter your email address' : 'Please enter your password');
                                          }
                                        }
                                      },
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.inter(color: agree ? colorScheme.primary : colorScheme.tertiary),
                                      )),
                            ],
                          ),
                        )))
              ],
            );
    }));
  }
}
