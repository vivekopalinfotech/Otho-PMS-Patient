import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';

class AddAccountDialog extends StatefulWidget {
  const AddAccountDialog({super.key});

  @override
  State<AddAccountDialog> createState() => _AddAccountDialogState();
}

class _AddAccountDialogState extends State<AddAccountDialog> {
  TextEditingController accountController = TextEditingController();
  TextEditingController routingController = TextEditingController();
  TextEditingController personController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return AlertDialog(
        insetPadding: EdgeInsets.all(16),
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: brightness == Brightness.dark ? AppColor.bgDarkColor : AppColor.whiteColor,
        title:  Container(
            width: double.maxFinite,
            child: Column(
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
                  padding: EdgeInsets.only(left: AppConstants.HP, right: AppConstants.HP, bottom: AppConstants.HP),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formField("Account Number *", accountController, TextInputType.number),
                      SizedBox(height: 16),
                      formField("Routing Number *", routingController, TextInputType.number),
                      SizedBox(height: 16),
                      formField("Billing Person Name *", personController, TextInputType.text),
                      SizedBox(height: 16),
                      accountController.text.isNotEmpty && routingController.text.isNotEmpty && personController.text.isNotEmpty ?
                      ElevatedButton(onPressed: () {}, child: Text('Save',style: GoogleFonts.inter(),)) : SizedBox()
                    ],
                  ),
                )
              ],
            ),

        ));
  }


}
