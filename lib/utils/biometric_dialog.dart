import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class BiometricDialog extends StatefulWidget {
  final Function(LocalAuthentication) localAuth;
  final Function(bool) filled;

  final Function(bool) val;
  final Function(bool) canCheckBiometrics;
  const BiometricDialog({super.key, required this.localAuth, required this.filled, required this.val, required this.canCheckBiometrics});

  @override
  State<BiometricDialog> createState() => _BiometricDialogState();
}

class _BiometricDialogState extends State<BiometricDialog> {
  String encryptPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  String _authorized = '';
  final LocalAuthentication localAuth = LocalAuthentication();
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await localAuth.authenticate(
        localizedReason: 'Authenticate to access your account',
        options: AuthenticationOptions(biometricOnly: true, useErrorDialogs: true),
      );
    } catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    });
  }

  String email = '';
  bool val = false;
  bool filled = false;
  bool isNotMatch = false;
  bool _canCheckBiometrics = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        textScaleFactor: 1,
        style: GoogleFonts.lato(color: colorScheme.primary, fontSize: 16),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Submit", textScaleFactor: 1, style: GoogleFonts.lato(color: colorScheme.primary, fontSize: 16)),
      onPressed: () async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        email = sharedPreferences.getString('email').toString();
        print(email);

        if (passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty) {
          if (passwordController.text == confirmPasswordController.text) {
            setState(() {
              filled = true;
              val = true;
              sharedPreferences.setBool('biometric', val);

              sharedPreferences.setString('biometricEmail', email);
              sharedPreferences.setString('biometricPassword', passwordController.text);
              isNotMatch = false;
            });
            passwordController.text = encryptPassword(passwordController.text);
            confirmPasswordController.text = encryptPassword(confirmPasswordController.text);
            Navigator.of(context, rootNavigator: true).pop();
            passwordController.clear();
            confirmPasswordController.clear();

            widget.val(val);
            widget.filled(filled);
            widget.localAuth(localAuth);
            widget.canCheckBiometrics(_canCheckBiometrics);
          } else {
            setState(() {
              isNotMatch = true;
            });
          }
        }
      },
    );
    return AlertDialog(
      elevation: 16,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),

      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),

        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 50,
                )),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                'For Biometric Authentication, please Enter Your Email and Password.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 40,
              child: TextField(

                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter Password ',
                    hintStyle: GoogleFonts.inter(fontSize: AppConstants.NORMAL),
                    contentPadding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: colorScheme.primary))),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 40,
              child: TextField(
                cursorColor: colorScheme.primary,
                controller: confirmPasswordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Confirm Password ',
                    hintStyle: GoogleFonts.inter(fontSize: AppConstants.NORMAL),
                    contentPadding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: colorScheme.primary))),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (isNotMatch)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    'Password and Confirm Password must be same.',
                    style: GoogleFonts.inter(color: Colors.red, fontSize: AppConstants.SMALL),
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                cancelButton,
                continueButton,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
