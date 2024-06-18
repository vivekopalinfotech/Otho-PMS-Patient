import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/get_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/get_patient_contact_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_contact_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';

class PrimaryContactForm extends StatefulWidget {
  const PrimaryContactForm({super.key});

  @override
  State<PrimaryContactForm> createState() => _PrimaryContactFormState();
}

class _PrimaryContactFormState extends State<PrimaryContactForm> {
  TextEditingController prefixController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController suffixController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<String> primaryPhone = ['Home', 'Work', 'Mobile'];
  List<String> relation = ['Spouse', 'Parent', 'sibling', 'Friend', 'Colleague', 'Dependant'];
  var primaryPhoneType;
  var selectedPhoneType;
  var relationship;
  var selectedRelationship;
  bool isWarned = false;

  bool isLoading = true;

  List primaryContact = [];
  String? selectedPrefix;
  receivedPrefixFromChild(String data) {
    setState(() {
      selectedPrefix = data;
      print(selectedPrefix);
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPatientContactCubit>(context).GetPatientContact();
  }

  List<String> prefixes = ['Dr.', 'Prof.', 'Miss.', 'Sir.'];
  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    var maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              'Primary Contact',
              style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
            )),
        body: MultiBlocListener(
          listeners: [
            BlocListener<GetPatientContactCubit, GetPatientContactState>(listener: (context, state) async {
              if (state is GetPatientContactSuccess) {
                setState(() {
                  isLoading = false;
                  primaryContact.addAll(state.getPrimaryContactResponse.patientContact);
                  firstNameController.text = state.getPrimaryContactResponse.patientContact.first.patientContactFirstName;
                  middleNameController.text = state.getPrimaryContactResponse.patientContact.first.patientContactMiddleName;
                  lastNameController.text = state.getPrimaryContactResponse.patientContact.first.patientContactLastName;
                  prefixController.text = state.getPrimaryContactResponse.patientContact.first.patientContactPrefix;
                  suffixController.text = state.getPrimaryContactResponse.patientContact.first.patientContactSuffixName;
                  phoneController.text = state.getPrimaryContactResponse.patientContact.first.patientContactPrimaryPhone;
                  emailController.text = state.getPrimaryContactResponse.patientContact.first.patientContactPrimaryEmailAddress;
                  dobController.text = AppConstants.formatedDate(state.getPrimaryContactResponse.patientContact.first.patientContactDob.toString());
                  selectedPhoneType = state.getPrimaryContactResponse.patientContact.first.patientContactPrimaryType;
                  selectedRelationship = state.getPrimaryContactResponse.patientContact.first.patientContactRelationToPatient;
                  selectedPrefix = state.getPrimaryContactResponse.patientContact.first.patientContactPrefix;
                });
              }
              if (state is GetPatientContactLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is GetPatientContactError) {}
            }),
            BlocListener<SavePatientContactCubit, SavePatientContactState>(listener: (context, state) async {
              if (state is SavePatientContactSuccess) {
                setState(() {
                  isLoading = false;
                  Navigator.of(context).pop(true);
                });
              }
              if (state is SavePatientContactLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is SavePatientContactError) {}
            }),
          ],
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    Container(
                      height: maxHeight,
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(AppConstants.HP),
                        child: Column(
                          children: [
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
                            ConstantTextFormField(
                              'First Name',
                              firstNameController,
                              TextInputType.text,
                            ),
                            ConstantTextFormField(
                              'Middle Name',
                              middleNameController,
                              TextInputType.text,
                            ),
                            ConstantTextFormField(
                              'Last Name',
                              lastNameController,
                              TextInputType.text,
                            ),
                            ConstantTextFormField(
                              'Suffix',
                              suffixController,
                              TextInputType.text,
                            ),
                            ConstantTextFormField(
                              'Date of Birth',
                              dobController,
                              TextInputType.datetime,
                              readOnly: true,
                            ),
                            ConstantTextFormField(
                              'Email Address',
                              emailController,
                              TextInputType.emailAddress,
                            ),
                            ConstantTextFormField(
                              'Primary phone',
                              phoneController,
                              TextInputType.phone,
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Primary Phone Type",
                                    style: GoogleFonts.inter(
                                        fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                SizedBox(height: 8),
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
                                SizedBox(height: 8),
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
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(AppConstants.HP),
                              child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<SavePatientContactCubit>(context).savePatientContact(
                                        primaryContact.first.isActive,
                                        primaryContact.first.isPrimary,
                                        null,
                                        AppConstants.parsedDate(dobController.text),
                                        firstNameController.text,
                                        primaryContact.first.patientContactId,
                                        middleNameController.text,
                                        lastNameController.text,
                                        primaryContact.first.patientContactPreferredName,
                                        primaryContact.first.patientContactPrimaryPhoneExt,
                                        selectedPrefix,
                                        emailController.text,
                                        phoneController.text,
                                        selectedPhoneType ?? '',
                                        selectedRelationship ?? '',
                                        suffixController.text);
                                  },
                                  child: Text('Save Primary Contact')),
                            ))
                        : SizedBox()
                  ],
                ),
        ));
  }
}
