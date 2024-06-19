import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/utils/dialogs/add_account_dialog.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController grpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Scaffold(

      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: IconThemeData(size: 24.0, color: AppColor.whiteColor),
        backgroundColor: AppColor.primaryColor,
        visible: true,
        spacing: 8,
        childPadding: EdgeInsets.symmetric(vertical: 8),
        curve: Curves.bounceInOut,
        children: [
          SpeedDialChild(
            backgroundColor: brightness == Brightness.dark ? AppColor.bgDarkColor : AppColor.whiteColor,
            labelBackgroundColor: brightness == Brightness.dark ? AppColor.bgDarkColor : AppColor.whiteColor,
            child: Image.asset(
              'assets/images/bank.png',
              height: 24,
              width: 24,
              color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor,
            ),
            label: 'Add ACH'.toUpperCase(),
            labelStyle: GoogleFonts.rubik(fontSize: AppConstants.SMALL),
            onTap: () {
              showDialog(context: context, builder: (context) => AddAccountDialog());

            },
          ),
          SpeedDialChild(
            backgroundColor: brightness == Brightness.dark ? AppColor.bgDarkColor : AppColor.whiteColor,
            labelBackgroundColor: brightness == Brightness.dark ? AppColor.bgDarkColor : AppColor.whiteColor,
            child: Image.asset(
              'assets/images/card.png',
              height: 24,
              width: 24,
              color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor,
            ),
            label: 'Add Card'.toUpperCase(),
            labelStyle: GoogleFonts.rubik(fontSize: AppConstants.SMALL),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      insetPadding: EdgeInsets.all(16),
                      titlePadding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      backgroundColor: brightness == Brightness.dark ? AppColor.bgDarkColor : AppColor.whiteColor,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.primaryColor.withOpacity(.1))),
                              constraints: BoxConstraints(maxHeight: 30, minHeight: 30, maxWidth: 30, minWidth: 30),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              icon: Icon(Icons.close, size: 16, color: AppColor.primaryColor)),
                          Padding(
                            padding: EdgeInsets.only(left: AppConstants.HP, bottom: AppConstants.HP, right: AppConstants.HP),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Image.asset(
                                  'assets/images/warning.png',
                                  height: 20,
                                  width: 20,
                                )),
                                TextSpan(
                                  text:
                                      "  Please note that a required merchant configuration is missing. In order to process payments successfully, it's essential to set up the merchant configuration. If you require assistance or have any questions, please reach out to our support team for prompt assistance. Thank you for your attention to this matter.",
                                  style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, height: 2, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor),
                                ),
                              ]),
                            ),
                          )
                        ],
                      )));
            },
          ),
        ],
      ),
    );
  }
}
