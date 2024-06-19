import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/get_patient_frp_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/get_patient_frp_state.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/save_patient_frp_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/save_patient_frp_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';

import 'package:riff_switch/riff_switch.dart';

class FRP extends StatefulWidget {
  final dob;
  const FRP({super.key, this.dob});

  @override
  State<FRP> createState() => _FRPState();
}

class _FRPState extends State<FRP> {
  TextEditingController prefixController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController suffixController = TextEditingController();
  TextEditingController preferredNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneExtController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController secondaryPhoneController = TextEditingController();
  TextEditingController secondaryPhoneExtController = TextEditingController();

  List<String> primaryPhone = ['Home', 'Work', 'Mobile'];
  List<String> relation = ['Spouse', 'Parent', 'Child', 'sibling', 'Friend', 'Colleague', 'Other', 'Dependant'];
  List<String> frp = ['Yes', 'No'];
  List<String> prefixes = [
    'Mr.',
    'Mrs.',
    'Ms.',
    'Dr.',
    'Prof.',
    'Miss.',
    'Sir.',
  ];
  var secondaryPhoneType;
  var selectedPhoneType;
  var relationship;
  var selectedRelationship;
  var selectedFrp;
  bool isWarned = false;
  bool isEmail = false;
  bool isText = false;
  bool user = true;
  bool add = false;
  bool isLoading = true;
  List primaryFRP = [];
  String? selectedPrefix;

  bool isPrimary = false;
  bool readOnly = true;
  bool createFrpUser = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPatientFRPCubit>(context).GetPatientFRP();
    print(widget.dob);
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    var maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              'Financial Responsible Person',
              style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
            )),
        body: MultiBlocListener(
          listeners: [
            BlocListener<GetPatientFRPCubit, GetPatientFRPState>(listener: (context, state) async {
              if (state is GetPatientFRPSuccess) {
                primaryFRP.clear();
                setState(() {
                  isLoading = false;
                  primaryFRP.addAll(state.getPatientFRPResponse.patientFinancialResponsiblePerson);
                  firstNameController.text = primaryFRP.first.patientFinancialResponsiblePersonFirstName;
                  emailController.text = primaryFRP.first.patientPrimaryEmailAddress;
                  middleNameController.text = primaryFRP.first.patientFinancialResponsiblePersonMiddleName ?? '';
                  lastNameController.text = primaryFRP.first.patientFinancialResponsiblePersonLastName;
                  prefixController.text = primaryFRP.first.patientFinancialResponsiblePersonPrefix ?? '';
                  suffixController.text = primaryFRP.first.patientFinancialResponsiblePersonSuffixName ?? '';
                  phoneController.text = primaryFRP.first.patientFinancialResponsiblePersonPrimaryPhone;
                  phoneExtController.text = primaryFRP.first.patientFinancialResponsiblePersonPrimaryPhoneExt;
                  secondaryPhoneController.text = primaryFRP.first.patientFinancialResponsiblePersonSecondaryPhone;
                  secondaryPhoneExtController.text = primaryFRP.first.patientFinancialResponsiblePersonSecondaryPhoneExt;
                  preferredNameController.text = primaryFRP.first.patientFinancialResponsiblePersonPreferredName ?? '';
                  dobController.text = AppConstants.formatedDate(primaryFRP.first.patientFinancialResponsiblePersonDob.toString());
                  selectedPhoneType = primaryFRP.first.patientFinancialResponsiblePersonPrimaryType;
                  secondaryPhoneType = primaryFRP.first.patientFinancialResponsiblePersonSecondaryType;
                  selectedRelationship = primaryFRP.first.patientFinancialResponsiblePersonRelationToPatient;
                  selectedPrefix = primaryFRP.first.patientFinancialResponsiblePersonPrefix == 'Gujarat ' ? null : primaryFRP.first.patientFinancialResponsiblePersonPrefix;
                  isEmail = primaryFRP.first.isPatientAgreedToContactFrpviaEmail;
                  isText = primaryFRP.first.isPatientAgreedToContactFrpviaText;
                  isPrimary = primaryFRP.first.isPrimary;
                  createFrpUser = primaryFRP.first.createFrpUser;
                  address1Controller.text = primaryFRP.first.patientFinancialResponsiblePersonAddress1;
                  address2Controller.text = primaryFRP.first.patientFinancialResponsiblePersonAddress2 ?? '';
                  cityController.text = primaryFRP.first.patientFinancialResponsiblePersonCity ?? '';
                  stateController.text = primaryFRP.first.patientFinancialResponsiblePersonState ?? '';
                  zipcodeController.text = primaryFRP.first.patientFinancialResponsiblePersonZip ?? '';

                  if (widget.dob) {
                    setState(() {
                      selectedFrp = frp[0];
                    });
                  } else {
                    setState(() {
                      selectedFrp = frp[1];
                    });
                  }
                });
              }
              if (state is GetPatientFRPLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is GetPatientFRPError) {
                setState(() {
                  isLoading = false;
                });
                showSnackBar(context, state.message);
              }
            }),
            BlocListener<SavePatientFRPCubit, SavePatientFRPState>(listener: (context, state) async {
              if (state is SavePatientFRPSuccess) {
                setState(() {
                  isLoading = false;
                  Navigator.of(context).pop();
                });
              }
              if (state is SavePatientFRPLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is SavePatientFRPError) {
                setState(() {
                  isLoading = false;
                });
                showSnackBar(context, state.message);
              }
            }),
          ],
          child: isLoading
              ? FieldsLoading()
              : Stack(
                  children: [
                    Container(
                      height: maxHeight,
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(AppConstants.HP),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Is the patient going to be financially responsible, if treatment is recommended? ",
                                    style: GoogleFonts.inter(
                                        fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                SizedBox(height: 16),
                                GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100, mainAxisExtent: 40),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: frp.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        if (widget.dob) {
                                          setState(() {
                                            selectedFrp = frp[index];
                                          });
                                        } else {
                                          setState(() {
                                            selectedFrp = frp[1];
                                          });
                                        }
                                      },
                                      child: radioButton(
                                        selectedFrp == frp[index],
                                        frp[index],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Center(
                              child: Text("Patient could not be financially responsible when He/She is below 18 years old.",
                                  style:
                                      GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(user
                                                ? AppColor.primaryColor
                                                : brightness == Brightness.dark
                                                    ? AppColor.secondaryDarkColor
                                                    : AppColor.secondaryLightColor),
                                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8))),
                                        onPressed: () {
                                          setState(() {
                                            user = true;
                                            add = false;
                                            firstNameController.text = primaryFRP.first.patientFinancialResponsiblePersonFirstName;
                                            emailController.text = primaryFRP.first.patientPrimaryEmailAddress;
                                            middleNameController.text = primaryFRP.first.patientFinancialResponsiblePersonMiddleName ?? '';
                                            lastNameController.text = primaryFRP.first.patientFinancialResponsiblePersonLastName;
                                            prefixController.text = primaryFRP.first.patientFinancialResponsiblePersonPrefix ?? '';
                                            suffixController.text = primaryFRP.first.patientFinancialResponsiblePersonSuffixName ?? '';
                                            phoneController.text = primaryFRP.first.patientFinancialResponsiblePersonPrimaryPhone;
                                            phoneExtController.text = primaryFRP.first.patientFinancialResponsiblePersonPrimaryPhoneExt;
                                            secondaryPhoneController.text = primaryFRP.first.patientFinancialResponsiblePersonSecondaryPhone;
                                            secondaryPhoneExtController.text = primaryFRP.first.patientFinancialResponsiblePersonSecondaryPhoneExt;
                                            preferredNameController.text = primaryFRP.first.patientFinancialResponsiblePersonPreferredName ?? '';
                                            dobController.text = AppConstants.formatedDate(primaryFRP.first.patientFinancialResponsiblePersonDob.toString());
                                            selectedPhoneType = primaryFRP.first.patientFinancialResponsiblePersonPrimaryType;
                                            secondaryPhoneType = primaryFRP.first.patientFinancialResponsiblePersonSecondaryType;
                                            selectedRelationship = primaryFRP.first.patientFinancialResponsiblePersonRelationToPatient;
                                            selectedPrefix = primaryFRP.first.patientFinancialResponsiblePersonPrefix == "Gujarat " ? null : primaryFRP.first.patientFinancialResponsiblePersonPrefix;
                                            isEmail = primaryFRP.first.isPatientAgreedToContactFrpviaEmail;
                                            isText = primaryFRP.first.isPatientAgreedToContactFrpviaText;
                                            isPrimary = primaryFRP.first.isPrimary;
                                            address1Controller.text = primaryFRP.first.patientFinancialResponsiblePersonAddress1;
                                            address2Controller.text = primaryFRP.first.patientFinancialResponsiblePersonAddress2 ?? '';
                                            cityController.text = primaryFRP.first.patientFinancialResponsiblePersonCity ?? '';
                                            stateController.text = primaryFRP.first.patientFinancialResponsiblePersonState ?? '';
                                            zipcodeController.text = primaryFRP.first.patientFinancialResponsiblePersonZip ?? '';
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            circleTitle('CV', 30, 30, AppConstants.NORMAL, user ? AppColor.whiteColor : AppColor.primaryColor.withOpacity(.2)),
                                            SizedBox(width: 8),
                                            Flexible(
                                              child: Text(
                                                'Vyas,Chitrang',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: AppConstants.NORMAL,
                                                    color: user
                                                        ? AppColor.whiteColor
                                                        : brightness == Brightness.dark
                                                            ? AppColor.whiteColor
                                                            : AppColor.blackColor),
                                              ),
                                            )
                                          ],
                                        ))),
                                Flexible(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(add
                                            ? AppColor.primaryColor
                                            : brightness == Brightness.dark
                                                ? AppColor.secondaryDarkColor
                                                : AppColor.secondaryLightColor)),
                                    onPressed: () {
                                      setState(() {
                                        user = false;
                                        add = true;
                                        isEmail = false;
                                        isText = false;
                                        emailController.clear();
                                        firstNameController.clear();
                                        middleNameController.clear();
                                        lastNameController.clear();
                                        prefixController.clear();
                                        suffixController.clear();
                                        phoneController.clear();
                                        phoneExtController.clear();
                                        emailController.clear();
                                        preferredNameController.clear();
                                        dobController.clear();
                                        selectedPhoneType = null;
                                        secondaryPhoneType = null;
                                        selectedRelationship = null;
                                        selectedPrefix = null;
                                        address1Controller.clear();
                                        address2Controller.clear();
                                        cityController.clear();
                                        zipcodeController.clear();
                                        secondaryPhoneController.clear();
                                        secondaryPhoneExtController.clear();
                                      });
                                    },
                                    child: Text(
                                      'Add Person',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppConstants.NORMAL,
                                          color: add
                                              ? AppColor.whiteColor
                                              : brightness == Brightness.dark
                                                  ? AppColor.whiteColor
                                                  : AppColor.blackColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                user
                                    ? SizedBox()
                                    : Row(
                                        children: [
                                          ConstantSwitch(
                                            val: createFrpUser,
                                            riffSwitchType: RiffSwitchType.simple,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Create User',
                                              style: GoogleFonts.inter(
                                                  fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                        ],
                                      ),
                                SizedBox(width: 16),
                                Row(
                                  children: [
                                    ConstantSwitch(val: isPrimary, riffSwitchType: RiffSwitchType.simple),
                                    SizedBox(width: 8),
                                    Text('Is Primary',
                                        style: GoogleFonts.inter(
                                            fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            ConstantTextFormField('Email Address', emailController, TextInputType.emailAddress, readOnly: createFrpUser ? false : readOnly),
                            SizedBox(height: 8),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('Prefix',
                                  style:
                                      GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                              SizedBox(height: 8),
                              Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColor.secondarySeedColor)),
                                  child: DropdownButton<String>(
                                    isDense: false,
                                    itemHeight: 50,
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                                    borderRadius: BorderRadius.circular(4),
                                    hint: Text('Prefix'),
                                    alignment: Alignment.centerLeft,
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    value: selectedPrefix,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedPrefix = newValue.toString();
                                        prefixController.text = selectedPrefix.toString();
                                      });
                                    },
                                    items: prefixes.map((String prefix) {
                                      return DropdownMenuItem<String>(
                                        value: prefix,
                                        child: Text(prefix),
                                      );
                                    }).toList(),
                                  ))
                            ]),
                            SizedBox(height: 16),
                            ConstantTextFormField('First Name', firstNameController, TextInputType.text),
                            ConstantTextFormField('Middle Name', middleNameController, TextInputType.text),
                            ConstantTextFormField('Last Name', lastNameController, TextInputType.text),
                            ConstantTextFormField('Suffix', suffixController, TextInputType.text),
                            ConstantTextFormField('Date of Birth', dobController, TextInputType.datetime, readOnly: true),
                            ConstantTextFormField('Preferred Name', preferredNameController, TextInputType.text),
                            ConstantTextFormField(
                              'Primary Phone',
                              phoneController,
                              TextInputType.phone,
                              extController: phoneExtController,
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Primary Phone Type",
                                    style: GoogleFonts.inter(
                                        fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                SizedBox(height: 16),
                                GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2.2),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: primaryPhone.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          selectedPhoneType = primaryPhone[index];
                                        });
                                      },
                                      child: radioButton(
                                        selectedPhoneType == primaryPhone[index],
                                        primaryPhone[index],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Relationship",
                                    style: GoogleFonts.inter(
                                        fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                SizedBox(height: 16),
                                GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2.2),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: relation.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          selectedRelationship = relation[index];
                                        });
                                      },
                                      child: radioButton(
                                        selectedRelationship == relation[index],
                                        relation[index],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Communication",
                                    style: GoogleFonts.inter(
                                        fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            isEmail = !isEmail;
                                          });
                                        },
                                        child: checkBox(isEmail, 'Email', 18.0,18.0,18.0)),
                                    SizedBox(width: 40),
                                    InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            isText = !isText;
                                          });
                                        },
                                        child: checkBox(isText, 'Text', 18.0,18.0,18.0))
                                  ],
                                ),
                                SizedBox(height: 16),
                                ConstantTextFormField('Address Line 1', address1Controller, TextInputType.text),
                                ConstantTextFormField('Address Line 2', address2Controller, TextInputType.text),
                                ConstantTextFormField('City', cityController, TextInputType.text),
                                ConstantTextFormField('State', stateController, TextInputType.text),
                                ConstantTextFormField('Zip Code', zipcodeController, TextInputType.number),
                                ConstantTextFormField(
                                  'Secondary Phone',
                                  secondaryPhoneController,
                                  TextInputType.phone,
                                  extController: secondaryPhoneExtController,
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Secondary Phone Type",
                                    style: GoogleFonts.inter(
                                        fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                SizedBox(height: 16),
                                GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2.2),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: primaryPhone.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          secondaryPhoneType = primaryPhone[index];
                                        });
                                      },
                                      child: radioButton(
                                        secondaryPhoneType == primaryPhone[index],
                                        primaryPhone[index],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 60),
                          ],
                        ),
                      ),
                    ),
                    selectedPhoneType != null &&
                            selectedRelationship != null &&
                            firstNameController.text.isNotEmpty &&
                            lastNameController.text.isNotEmpty &&
                            emailController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty
                        ? Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<SavePatientFRPCubit>(context).savePatientFRP(
                                      AppConstants.checkAdult(primaryFRP.first.patientFinancialResponsiblePersonDob.toString()),
                                      primaryFRP.first.patientFinancialResponsiblePersonId,
                                      selectedPrefix,
                                      firstNameController.text,
                                      middleNameController.text.isEmpty ? null : middleNameController.text,
                                      lastNameController.text,
                                      suffixController.text.isEmpty ? null : suffixController.text,
                                      preferredNameController.text,
                                      AppConstants.parsedDate(dobController.text),
                                      address1Controller.text,
                                      address2Controller.text.isEmpty ? null : address2Controller.text,
                                      cityController.text,
                                      stateController.text,
                                      primaryFRP.first.patientFinancialResponsiblePersonStateAbbreviation,
                                      zipcodeController.text,
                                      phoneController.text,
                                      phoneExtController.text,
                                      selectedPhoneType ?? '',
                                      secondaryPhoneController.text,
                                      secondaryPhoneExtController.text,
                                      secondaryPhoneType ?? '',
                                      selectedRelationship ?? '',
                                      createFrpUser,
                                      primaryFRP.first.isActive,
                                      isPrimary,
                                      null,
                                      null,
                                      0,
                                      isEmail,
                                      isText,
                                      emailController.text,
                                      false);
                                },
                                child: Text('Save Responsible Person')),
                          )
                        : SizedBox()
                  ],
                ),
        ));
  }
}
