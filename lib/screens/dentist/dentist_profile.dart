import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';

import '../../app_color/app_colors.dart';

class DentistProfile extends StatefulWidget {
  final dentist;
  const DentistProfile({super.key, this.dentist});

  @override
  State<DentistProfile> createState() => _DentistProfileState();
}

class _DentistProfileState extends State<DentistProfile> {
  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    List<Item> items = [
      Item('Dentist Name', '${widget.dentist.first.dentistFullName??''}'),
      Item('Office', '${widget.dentist.first.dentistOfficeName??''}'),
      Item('Phone', '${widget.dentist.first.dentistPrimaryPhone??''}'),
      Item('Email', '${widget.dentist.first.dentistPrimaryEmailAddress??''}'),
      Item('Specialization', '${widget.dentist.first.specializationName??''}'),
      Item('Notes', '${widget.dentist.first.dentistNotes??''}'),
    ];
    return AlertDialog(
      insetPadding: EdgeInsets.all(AppConstants.HP),
      titlePadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      title: Container(
        height: 250,
        width: double.maxFinite,
        child: Card(
            margin: EdgeInsets.zero,
            color: brightness == Brightness.dark ? AppColor.bgDarkColor : AppColor.whiteColor,
            child: Padding(
                padding: EdgeInsets.only(left: AppConstants.HP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(
                          'Dentist Profile',
                          style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: AppConstants.LARGE, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor),
                        )),
                        IconButton(
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.primaryColor.withOpacity(.1))),
                            constraints: BoxConstraints(maxHeight: 24, minHeight: 24, maxWidth: 24, minWidth: 24),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            icon: Icon(Icons.close, size: 16, color: AppColor.primaryColor))
                      ],
                    ),
                    Container(
                      child: ListView.separated(
                        itemCount: items.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 8),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  items[index].key,
                                  style:
                                      GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.NORMAL, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor),
                                ),
                              ),
                              Flexible(
                                child:
                                    Text(items[index].value, style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 12);
                        },
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}

class Item {
  final key;
  final value;

  Item(this.key, this.value);
}
