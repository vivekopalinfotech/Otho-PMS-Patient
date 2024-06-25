import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:riff_switch/riff_switch.dart';

import 'constatnt_textformfield.dart';

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
      backgroundColor: AppColor.primaryColor,
      duration: const Duration(milliseconds: 2000),
      content: Center(
          child: Text(
        message,
        textScaler: TextScaler.linear(1),
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(color: AppColor.tertiarySeedColor),
      ))));
}

radioButton(selected, list) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1.5, color: selected ? AppColor.primaryColor : AppColor.secondarySeedColor)),
            padding: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColor.primaryColor : Colors.transparent,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 16),
          Flexible(
              child: Text(list,
                  style: GoogleFonts.inter(
                    fontSize: AppConstants.SMALL,
                    fontWeight: FontWeight.w500,
                  )))
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
        style: GoogleFonts.inter(color: AppColor.primaryColor, fontSize: fontSize, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

checkBox(isMark, title, size, height, width) {
  return Row(
    children: [
      isMark
          ? Image.asset(
              'assets/images/mark.png',
              height: height,
              width: width,
            )
          : Icon(
              Icons.check_box_outline_blank_rounded,
              color: AppColor.secondarySeedColor,
              size: 18,
            ),
      SizedBox(width: size),
      Flexible(
        child: Text(title,
            style: GoogleFonts.inter(
              fontSize: AppConstants.SMALL,
              fontWeight: FontWeight.w500,
            )),
      )
    ],
  );
}

class ConstantSwitch extends StatefulWidget {
  bool val;
  final RiffSwitchType riffSwitchType;
  final width;
  final height;
  final onChange;
  ConstantSwitch({super.key, required this.val, this.width, this.height, required this.riffSwitchType, this.onChange});

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
      width: widget.width ?? 40,
      height: widget.height ?? 18,
      thumbMargin: 2,
      activeTrackColor: AppColor.primaryColor,
      animateToggle: true,
    );
  }
}

class SelectedOptions extends StatelessWidget {
  final title1;
  final selected1;
  final icon1;
  final onPressed1;
  final title2;
  final selected2;
  final icon2;
  final onPressed2;
  const SelectedOptions({super.key, this.title1, this.selected1, this.icon1, this.onPressed1, this.title2, this.selected2, this.icon2, this.onPressed2});

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(selected1
                        ? AppColor.primaryColor
                        : brightness == Brightness.dark
                            ? AppColor.secondaryDarkColor
                            : AppColor.secondaryLightColor),
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: AppConstants.HP))),
                onPressed: onPressed1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        title1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: AppConstants.NORMAL,
                            color: selected1
                                ? AppColor.whiteColor
                                : brightness == Brightness.dark
                                    ? AppColor.whiteColor
                                    : AppColor.blackColor),
                      ),
                    ),
                    icon1
                        ? Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Image.asset(
                              'assets/images/edit.png',
                              height: 18,
                              width: 18,
                              color: selected1
                                  ? AppColor.whiteColor
                                  : brightness == Brightness.dark
                                      ? AppColor.whiteColor
                                      : AppColor.blackColor,
                            ),
                          )
                        : SizedBox()
                  ],
                ))),
        SizedBox(width: 16),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(selected2
                  ? AppColor.primaryColor
                  : brightness == Brightness.dark
                      ? AppColor.secondaryDarkColor
                      : AppColor.secondaryLightColor),
              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: AppConstants.HP))),
          onPressed: onPressed2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title2,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstants.NORMAL,
                    color: selected2
                        ? AppColor.whiteColor
                        : brightness == Brightness.dark
                            ? AppColor.whiteColor
                            : AppColor.blackColor),
              ),
              icon2
                  ? Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Icon(Icons.add_rounded,
                          size: 20,
                          color: selected2
                              ? AppColor.whiteColor
                              : brightness == Brightness.dark
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor),
                    )
                  : SizedBox()
            ],
          ),
        )
      ],
    );
  }
}

subCategories(title, list, itemBuilder) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(title,
        style: GoogleFonts.inter(
          fontSize: AppConstants.NORMAL,
          fontWeight: FontWeight.bold,
        )),
    SizedBox(height: 16),
    GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2.2),
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: itemBuilder,
    ),
  ]);
}

insuranceCompany(icon, title, subtitle) {
  return Row(
    children: [
      SvgPicture.asset(
        icon,
        width: 80,
      ),
      SizedBox(width: 16),
      Flexible(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Text(subtitle, style: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ))
    ],
  );
}

multipleSelect(title, list, itemBuilder, controller, hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(padding: EdgeInsets.symmetric(horizontal: AppConstants.HP), child: Text(title, style: GoogleFonts.inter(fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold))),
      SizedBox(height: 16),
      GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
        ),
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: itemBuilder,
      ),
      Padding(padding: EdgeInsets.symmetric(horizontal: AppConstants.HP), child: ConstantTextFormField(hint, controller, TextInputType.text)),
    ],
  );
}

activeIcon() {
  return Image.asset(
    'assets/images/mark.png',
    height: 24,
    width: 24,
  );
}

inactiveIcon() {
  return Image.asset(
    'assets/images/unchecked.png',
    height: 24,
    width: 24,
    color: AppColor.secondarySeedColor,
  );
}

class PatientHas {
  final title;
  bool value;
  TextEditingController controller;
  PatientHas(this.title, this.value, this.controller);
}

class Medications {
  final title;
  bool value;

  Medications(this.title, this.value);
}
