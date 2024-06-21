import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';

class ConstantTextFormField extends StatefulWidget {
  final title;
  final readOnly;
  final formKey;
  final maxLines;
  final hideTitle;
  final alertText;
  final extController;
  final TextEditingController controller;
  final TextInputType textInputType;
  const ConstantTextFormField(
    this.title,
    this.controller,
    this.textInputType, {
    super.key,
    this.readOnly,
    this.formKey,
    this.maxLines,
    this.hideTitle,
    this.alertText,
    this.extController,
  });

  @override
  State<ConstantTextFormField> createState() => _ConstantTextFormFieldState();
}

class _ConstantTextFormFieldState extends State<ConstantTextFormField> {
  DateTime? _selectedDate;
  bool isOpen = false;
  bool _isObscure = true;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: 'Select Date of Birth',
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = '${DateFormat('MM/dd/yyyy').format(_selectedDate!)}';
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hideTitle == true
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(widget.title,
                      style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor))),
          widget.title == 'Primary Phone' || widget.title == 'Secondary Phone'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                        controller: widget.controller,
                        readOnly: widget.readOnly ?? false,
                        maxLines: widget.maxLines ?? 1,
                        obscureText: widget.title == 'Current Password' || widget.title == 'New Password' || widget.title == 'Re-Type New Password' ? _isObscure : false,
                        onChanged: (value) {
                          setState(() {
                            widget.controller.text;
                          });
                        },
                        onTap: () {
                          if (widget.title == 'Date of Birth') {
                            setState(() {
                              _selectDate(context);
                            });
                          }
                        },
                        keyboardType: widget.textInputType,
                        validator: (value) {
                          if (widget.title == 'Current Password' || widget.title == 'New Password' || widget.title == 'Re-Type New Password') {
                            if (widget.controller.text.isEmpty) {
                              return '${widget.title} is required';
                            }
                            if (widget.controller.text.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            if (widget.controller.text.contains(' ')) {
                              return 'Password cannot contain spaces';
                            }
                            if (!RegExp(r'[a-zA-Z]').hasMatch(widget.controller.text)) {
                              return 'Password must contain at least one letter';
                            }
                            if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(widget.controller.text)) {
                              return 'Password must contain at least one letter and one digit';
                            }
                            if (widget.title == "What's the other way you heard about our practice?" || widget.title == "First Name, Last Name") {
                              if (widget.controller.text.isEmpty) {
                                return '${widget.title} is required.';
                              }
                            }
                            return null;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: widget.title == 'Current Password' || widget.title == 'New Password' || widget.title == 'Re-Type New Password'
                                ? InkWell(
                                    radius: 15,
                                    child: Icon(
                                      _isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    })
                                : SizedBox(),
                            hintText: widget.title,
                            border: OutlineInputBorder(borderSide: BorderSide(color: AppColor.secondarySeedColor)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.alertText == true ? Colors.redAccent : AppColor.secondarySeedColor)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.alertText == true ? Colors.redAccent : AppColor.primaryColor))),
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      flex: 1,
                        child: TextFormField(
                      controller: widget.extController,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      decoration: InputDecoration(
                        hintText: 'Ext',
                        isDense: true,
                        counterText: '',
                        border: OutlineInputBorder(borderSide: BorderSide(color: AppColor.secondarySeedColor)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.alertText == true ? Colors.redAccent : AppColor.secondarySeedColor)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.alertText == true ? Colors.redAccent : AppColor.primaryColor)),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter a 4-digit extension';
                      //   }
                      //   if (value.length != 4) {
                      //     return 'Extension must be exactly 4 digits';
                      //   }
                      //   return null;
                      // },
                    )
                    )
                  ],
                )
              : TextFormField(
                  controller: widget.controller,
                  readOnly: widget.readOnly ?? false,
                  maxLines: widget.maxLines ?? 1,
                  obscureText: widget.title == 'Current Password' || widget.title == 'New Password' || widget.title == 'Re-Type New Password' ? _isObscure : false,
                  onChanged: (value) {
                    setState(() {
                      widget.controller.text;
                    });
                  },
                  onTap: () {
                    if (widget.title == 'Date of Birth') {
                      setState(() {
                        _selectDate(context);
                      });
                    }
                  },
                  keyboardType: widget.textInputType,
                  validator: (value) {
                    if (widget.title == 'Current Password' || widget.title == 'New Password' || widget.title == 'Re-Type New Password') {
                      if (widget.controller.text.isEmpty) {
                        return '${widget.title} is required';
                      }
                      if (widget.controller.text.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      if (widget.controller.text.contains(' ')) {
                        return 'Password cannot contain spaces';
                      }
                      if (!RegExp(r'[a-zA-Z]').hasMatch(widget.controller.text)) {
                        return 'Password must contain at least one letter';
                      }
                      if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(widget.controller.text)) {
                        return 'Password must contain at least one letter and one digit';
                      }
                      if (widget.title == "What's the other way you heard about our practice?" || widget.title == "First Name, Last Name") {
                        if (widget.controller.text.isEmpty) {
                          return '${widget.title} is required.';
                        }
                      }
                      return null;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      suffixIcon: widget.title == 'Current Password' || widget.title == 'New Password' || widget.title == 'Re-Type New Password'
                          ? InkWell(
                              radius: 15,
                              child: Icon(
                                _isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                              ),
                              onTap: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              })
                          : SizedBox(),
                      hintText: widget.title,
                      border: OutlineInputBorder(borderSide: BorderSide(color: AppColor.secondarySeedColor)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.alertText == true ? Colors.redAccent : AppColor.secondarySeedColor)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.alertText == true ? Colors.redAccent : AppColor.primaryColor))),
                ),
          widget.alertText == true ?   Padding(padding: EdgeInsets.only(top: 4),
          child: Text('${widget.title} is required.',style: GoogleFonts.inter(fontSize:AppConstants.SMALL,color:Colors.redAccent),),
          ):SizedBox()
        ],
      ),
    );
  }
}
