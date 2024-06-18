import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:riff_switch/riff_switch.dart';

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

removeAllHtmlTags(String htmlText) {
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

radioButton(selected, list) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1.5, color: selected ? AppColor.primarySeedColor : AppColor.secondarySeedColor)),
            padding: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColor.primarySeedColor : Colors.transparent,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(list,
              style: GoogleFonts.inter(
                fontSize: AppConstants.SMALL,
                fontWeight: FontWeight.w500,
              ))
        ],
      ));
}

circleTitle(abbreviation, double height, double width, double fontSize, Color color) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    child: Center(
      child: Text(
        abbreviation,
        style: GoogleFonts.inter(color: AppColor.primarySeedColor, fontSize: fontSize, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

checkBox(isMark, title) {
  return Row(
    children: [
      isMark
          ? Image.asset(
              'assets/images/mark.png',
              height: 24,
              width: 24,
            )
          : Icon(Icons.check_box_outline_blank_rounded, color: AppColor.secondarySeedColor),
      SizedBox(width: 16),
      Text(title,
          style: GoogleFonts.inter(
            fontSize: AppConstants.NORMAL,
            fontWeight: FontWeight.w500,
          )),
    ],
  );
}

class ConstantSwitch extends StatefulWidget {
  bool val;
  final RiffSwitchType riffSwitchType;
  final  width;
  final  height;
  final onChange;
  ConstantSwitch({super.key, required this.val,  this.width,  this.height, required this.riffSwitchType, this.onChange});

  @override
  State<ConstantSwitch> createState() => _ConstantSwitchState();
}

class _ConstantSwitchState extends State<ConstantSwitch> {
  @override
  Widget build(BuildContext context) {
    return RiffSwitch(
      value: widget.val,
      onChanged: widget.onChange ??
          (bool newValue) {
            setState(() {
              widget.val = newValue;
            });
          },
      type: widget.riffSwitchType,
      activeText: Text(''),
      inactiveText: Text(''),
      enableSlide: true,
      width: widget.width??40,
      height: widget.height??18,
      thumbMargin: 2,
      activeTrackColor: AppColor.primarySeedColor,
      animateToggle: true,
    );
  }
}
