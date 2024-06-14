import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/utils/biometric_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BioMetricAuthScreen extends StatefulWidget {
  const BioMetricAuthScreen({super.key});

  @override
  State<BioMetricAuthScreen> createState() => _BioMetricAuthScreenState();
}

class _BioMetricAuthScreenState extends State<BioMetricAuthScreen> {
  LocalAuthentication localAuth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometrics = [];
  String _authorized = '';
  String email = '';
  String biometricEmail = '';
  bool val = false;
  bool filled = false;
  bool isNotMatch = false;

  receivedLocalAuthFromChild(LocalAuthentication data) {
    setState(() {
      localAuth = data;
    });
  }

  receivedFilledFromChild(bool data) {
    setState(() {
      filled = data;
    });
  }

  receivedValFromChild(bool data) {
    setState(() {
      val = data;
    });
  }

  receivedCanCheckBiometricsFromChild(bool data) {
    setState(() {
      _canCheckBiometrics = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
    getData();
  }

  getData() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    email = sharedPreference.getString('email').toString();
    biometricEmail = sharedPreference.getString('biometricEmail').toString();
    val = (email == biometricEmail ? sharedPreference.getBool('biometric') : false)!;
    sharedPreference.getBool('biometric')!;
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await localAuth.canCheckBiometrics;
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
        availableBiometrics = await localAuth.getAvailableBiometrics();
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
      authenticated = await localAuth.authenticate(
        localizedReason: 'Authenticate to access your account',
        options: AuthenticationOptions(biometricOnly: false, useErrorDialogs: true),
      );
    } catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    });
  }

  @override
  Widget build(BuildContext context) {
    var brightness= Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 12),
              child: Image.asset(
                'assets/images/back.png',
                height: 21,
                width: 11.15,
                fit: BoxFit.contain,
                color: brightness == Brightness.dark?AppColor.whiteColor:AppColor.blackColor,
              ),
            )),
        elevation: 2,
        title: Text(
          'Biometric Authentication',
          style: GoogleFonts.inter(
            fontSize: AppConstants.TITLE,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Biometric Authentication',
                    style: GoogleFonts.inter(
                      fontSize: AppConstants.NORMAL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Switch.adaptive(
                  value: val,
                  // activeColor: AppColor.primaryColor,
                  // inactiveThumbColor: AppColor.disabledColor,
                  // inactiveTrackColor: AppColor.disabledColor.withOpacity(.16),
                  onChanged: (value) async {
                    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

                    if (val == true) {
                      setState(() {
                        val = value;
                        sharedPreference.setBool('biometric', false);
                      });
                    } else {
                      val = false;
                      filled == false;
                      sharedPreference.setBool('biometric', val);
                      showAlertDialog(context);
                    }
                  },
                )
              ],
            ),
            Divider(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Quickly and easily see and use your account. You won't need to tell us your password each time, but you'll need to enter it periodically to confirm your identity.\n\nSharing your device with anyone who has enabled Biometric Authentication or knows your passcode gives them access tn your account. We don't recommend using this feature if you share your device.\n\nTurn off/on this feature anytime from here.",
                  style: GoogleFonts.inter(
                    fontSize: AppConstants.SMALL,
                    fontWeight: FontWeight.normal,
                    wordSpacing: 1.2,
                    color: AppColor.secondarySeedColor
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BiometricDialog(localAuth: receivedLocalAuthFromChild, filled: receivedFilledFromChild, val: receivedValFromChild, canCheckBiometrics: receivedCanCheckBiometricsFromChild);
      },
    ).whenComplete(() => setState(() {
          if (val) {
            _authenticate();
          }
        }));
  }
}
