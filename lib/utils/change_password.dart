import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/auth/change_password_cubit.dart';
import 'package:ortho_pms_patient/bloc/auth/change_password_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/constant_loader.dart';

class ChangePassword extends StatefulWidget {
  final email;
  const ChangePassword({super.key, this.email});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypeNewPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email;
  }

  bool isLoading = false;
  List<String> guidelines = ['At least 8 characters long', 'Password cannot contain any spaces', 'At least 1 uppercase and/or 1 lowercase letters', 'At least 1 number and alphabet character'];
  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    var maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              'Change your password',
              style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
            )),
        body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) async {
              if (state is ChangePasswordSuccess) {
                setState(() {
                  showSnackBar(context, 'Password Successfully Changed.');
                  Navigator.pop(context);
                });
              }
              if (state is ChangePasswordLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is ChangePasswordError) {
                setState(() {
                  showSnackBar(context, state.message);
                });
              }
            },
            child: Stack(children: [
              Container(
                  height: maxHeight,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ConstantTextFormField(
                                    'Email',
                                    emailController,
                                    TextInputType.text,
                                  ),
                                  ConstantTextFormField(
                                    'Current Password',
                                    currentPasswordController,
                                    TextInputType.text,
                                  ),
                                  ConstantTextFormField(
                                    'New Password',
                                    newPasswordController,
                                    TextInputType.text,
                                  ),
                                  ConstantTextFormField(
                                    'Re-Type New Password',
                                    retypeNewPasswordController,
                                    TextInputType.text,
                                  ),
                                  SizedBox(height: 16)
                                ],
                              ),
                            ),
                            Container(
                              color: AppColor.primaryColor.withOpacity(.2),
                              padding: EdgeInsets.all(AppConstants.HP),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password Guidelines',
                                    style: GoogleFonts.inter(fontSize: AppConstants.HEADING3, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 16),
                                  ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: guidelines.length,
                                    itemBuilder: (context, index) {
                                      return RichText(
                                          text: TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.check,
                                          size: 18,
                                        )),
                                        TextSpan(text: '  ${guidelines[index]}', style: GoogleFonts.inter(color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor))
                                      ]));
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return SizedBox(height: 8);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 60),
                          ],
                        ),
                      ))),
              _formKey.currentState != null
                  ? _formKey.currentState!.validate()
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(AppConstants.HP),
                            child: isLoading
                                ? ConstantLoader(borderRadius: 100.0, containerHeight: 40.0)
                                : ElevatedButton(
                                    onPressed: () {
                                      if (newPasswordController.text != retypeNewPasswordController.text) {
                                        showSnackBar(context, 'New Password & Re-Type New Password must be same.');
                                      } else {
                                        BlocProvider.of<ChangePasswordCubit>(context).ChangePassword(currentPasswordController.text, emailController.text, newPasswordController.text);
                                      }
                                    },
                                    child: Text('Change Password')),
                          ))
                      : SizedBox()
                  : SizedBox()
            ])));
  }
}
