import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/auth/logiut_cubit.dart';
import 'package:ortho_pms_patient/screens/auth/login_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'biometric_authentication_screen.dart';

class AppDrawer extends StatelessWidget {
  final scaffoldKey;
  final name;
  final email;
  final abbreviation;
  const AppDrawer({super.key, this.scaffoldKey, this.name, this.abbreviation, this.email});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Drawer(
        shape: OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20)), borderSide: BorderSide.none),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(AppConstants.HP),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    scaffoldKey.currentState!.closeDrawer();
                  },
                  child: const Icon(Icons.clear),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: evenItemColor),
                    child: Center(
                      child: Text(
                        abbreviation,
                        style: GoogleFonts.inter(color: colorScheme.primary, fontSize: AppConstants.TITLE, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${name}',
                        style: GoogleFonts.inter(fontWeight:FontWeight.bold,fontSize:AppConstants.NORMAL,color:colorScheme.onSurface),
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      // RichText(text: TextSpan(
                      //     text: 'ClinID : ',
                      //     style: GoogleFonts.roboto(color: AppColor.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: AppConstants.SMALL),
                      //     children: [
                      //       TextSpan(
                      //         text: 'rpatelmdd',
                      //         style: GoogleFonts.roboto(color: AppColor.blackColor,fontWeight: FontWeight.bold,fontSize: AppConstants.SMALL),
                      //       )
                      //     ]
                      // )),

                      const SizedBox(
                        height: 4,
                      ),
                      Text('${email}', style: GoogleFonts.inter(fontWeight:FontWeight.w500,fontSize:AppConstants.SMALL,color:colorScheme.secondary)),
                    ],
                  ))
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  right: 50,
                ),
                child: Divider(
                  height: 100,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BioMetricAuthScreen()));

                },
                child: Row(
                  children: [
                    Icon(
                      Icons.fingerprint,
                      size: 24,
                        color: colorScheme.secondary
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Biometric Authentication',
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.LARGE),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  BlocProvider.of<LogoutCubit>(context).logout();
                  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
                  sharedPreference.setString("login", 'false');
                  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/logout.png',
                      height: 24,
                      cacheWidth: 48,
                      cacheHeight: 48,
                      color: colorScheme.secondary
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Log out',
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.LARGE),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
