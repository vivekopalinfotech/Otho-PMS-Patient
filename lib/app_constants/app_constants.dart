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

  static bool checkAdult(String originalDateStr) {
    DateTime birthDate = DateTime.parse(originalDateStr);
    DateTime eighteenYearsAgo = DateTime.now().subtract(Duration(days: 18 * 365));
    bool isOver18YearsAgo = birthDate.isBefore(eighteenYearsAgo);
    print('Is over 18 years ago: $isOver18YearsAgo');
    return isOver18YearsAgo;
  }

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
