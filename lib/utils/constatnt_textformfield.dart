import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';

class ConstantTextFormField extends StatefulWidget {
  final title;
  final readOnly;
  final formKey;

  final TextEditingController controller;
  final TextInputType textInputType;
  const ConstantTextFormField(this.title, this.controller, this.textInputType, {super.key, this.readOnly, this.formKey});

  @override
  State<ConstantTextFormField> createState() => _ConstantTextFormFieldState();
}

class _ConstantTextFormFieldState extends State<ConstantTextFormField> {
  String _password = '';
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
        widget.controller.text = ' ${DateFormat('MM/dd/yyyy').format(_selectedDate!)}';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly ?? false,
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
            if (widget.title == 'Current Password' || widget.title == 'New Password' ) {
              if (value == null || value.isEmpty) {
                return '${widget.title} is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              if (value.contains(' ')) {
                return 'Password cannot contain spaces';
              }
              if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                return 'Password must contain at least one letter';
              }
              if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value)) {
                return 'Password must contain at least one letter and one digit';
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
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.secondarySeedColor)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.primarySeedColor))),
        )
      ],
    );
  }
}
