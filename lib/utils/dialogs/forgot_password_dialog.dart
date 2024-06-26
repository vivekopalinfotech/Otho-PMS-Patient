import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/auth/forgot_password_cubit.dart';
import 'package:ortho_pms_patient/bloc/auth/forgot_password_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({super.key});

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          Navigator.of(context).pop(true);
          showSnackBar(context, state.msg, '');
        }
        if (state is ForgotPasswordLoading) {}
        if (state is ForgotPasswordError) {
          showSnackBar(context, state.message, 'Error');
        }
      },
      child: AlertDialog(
          insetPadding: EdgeInsets.all(16),
          titlePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: brightness == Brightness.dark ? AppColor.bgDarkColor : AppColor.whiteColor,
          title: Card(
              margin: EdgeInsets.zero,
              child: Container(
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
                          Text(
                            'Forgot password',
                            style: GoogleFonts.inter(fontSize: AppConstants.TITLE, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          ConstantTextFormField(
                            'Email Address',
                            emailController,
                            TextInputType.emailAddress,
                            hideTitle: true,
                            onchange: (value) {
                              setState(() {
                                emailController.text = value;
                              });
                            },
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(emailController.value.text.isNotEmpty ? colorScheme.primaryContainer : colorScheme.tertiaryContainer),
                                  elevation: MaterialStatePropertyAll(emailController.value.text.isNotEmpty ? 2 : 0)),
                              onPressed: () {
                                BlocProvider.of<ForgotPasswordCubit>(context).forgotPassword(emailController.value.text);
                              },
                              child: Text(
                                'Send Link',
                                style: GoogleFonts.inter(color: emailController.value.text.isNotEmpty ? colorScheme.primary : colorScheme.tertiary),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
