// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:ortho_pms_patient/app_color/app_colors.dart';

class AppConstants {
  static const HP = 16.0;
  static const VP = 16.0;
  static const BIG = 64.0;
  static const HEADING = 32.0;
  static const HEADING2 = 24.0;
  static const HEADING3 = 20.0;
  static const TITLE = 18.0;
  static const NORMAL = 14.0;
  static const LARGE = 16.0;
  static const SMALL = 12.0;
  static const XSMALL = 10.0;



  static String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('MM-dd-yyyy');
    return formatter.format(dateTime);
  }
  static String formatedDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('MM/dd/yyyy');
    return formatter.format(dateTime);
  }

  static String convertDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat("MM/dd/yyyy hh:mm a").format(dateTime);
    return formattedDate;
  }
  static String parsedDate(String dateString) {
    DateFormat inputFormat = DateFormat('MM/dd/yyyy');
    DateTime date = inputFormat.parse(dateString);
    DateFormat outputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
    String formattedDate = outputFormat.format(date);
    return formattedDate;
  }





  static String convertTo12HourFormat(String time) {
    DateTime dateTime = DateTime.parse(time);
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String period = hour < 12 ? 'AM' : 'PM';
    hour = hour % 12;
    if (hour == 0) {
      hour = 12;
    }
    String formattedTime = '$hour:${minute.toString().padLeft(2, '0')} $period';
    return formattedTime;
  }


  static String convertCurrentDate(String originalDateStr) {
    DateTime originalDate = DateTime.parse(originalDateStr);
    DateFormat outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    String formattedDate = outputFormat.format(originalDate.toUtc());
    return formattedDate;
  }

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }




}


loader(BuildContext context) {
  Loader.show(context,
      isSafeAreaOverlay: false,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: Center(
        child: CircularProgressIndicator(
          color: AppColor.blackColor,
        ),
      ),
      themeData: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
      overlayColor: Colors.black38);
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColor.primarySeedColor,
      duration: const Duration(milliseconds: 2000),
      content: Center(
          child: Text(
            message,
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(color: AppColor.tertiarySeedColor),
          ))));
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}