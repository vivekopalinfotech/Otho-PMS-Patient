import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/get_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/get_patient_contact_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_contact_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';

class PrimaryContact extends StatefulWidget {
  const PrimaryContact({super.key});

  @override
  State<PrimaryContact> createState() => _PrimaryContactState();
}

class _PrimaryContactState extends State<PrimaryContact> {
  TextEditingController prefixController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController suffixController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneExtController = TextEditingController();

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

  List<String> prefixes = ['Mr.', 'Dr.', 'Prof.', 'Miss.', 'Sir.'];
  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return  MultiBlocListener(
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
              phoneExtController.text = state.getPrimaryContactResponse.patientContact.first.patientContactPrimaryPhoneExt??'';
            });
          }
          if (state is GetPatientContactLoading) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is GetPatientContactError) {
            setState(() {
              isLoading = false;
            });
          }
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
          if (state is SavePatientContactError) {
            setState(() {
              isLoading = false;
            });
          }
        }),
      ],
      child:
      isLoading
          ? FieldsLoading()
          :
      SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.HP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              onchange: (value){
                setState(() {
                  firstNameController.text = value;
                });
              },
            ),
            ConstantTextFormField(
              'Middle Name',
              middleNameController,
              TextInputType.text,
              onchange: (value){
                setState(() {
                  middleNameController.text = value;
                });
              },
            ),
            ConstantTextFormField(
              'Last Name',
              lastNameController,
              TextInputType.text,
              onchange: (value){
                setState(() {
                  lastNameController.text = value;
                });
              },
            ),
            ConstantTextFormField(
              'Suffix',
              suffixController,
              TextInputType.text,
              onchange: (value){
                setState(() {
                  suffixController.text = value;
                });
              },
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
              onchange: (value){
                setState(() {
                  emailController.text = value;
                });
              },
            ),
            ConstantTextFormField(
              'Primary Phone',
              phoneController,
              TextInputType.phone,
              extController: phoneExtController,
              onchange: (value){
                setState(() {
                  phoneController.text = value;
                });
              },
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
            selectedPhoneType != null &&
                selectedRelationship != null &&
                firstNameController.value.text.isNotEmpty &&
                lastNameController.value.text.isNotEmpty &&
                emailController.value.text.isNotEmpty &&
                phoneController.value.text.isNotEmpty
                ?  Align(
              alignment: AlignmentDirectional.bottomEnd,
              child:  ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll( colorScheme.primaryContainer),
                ),
                onPressed: () {
                  BlocProvider.of<SavePatientContactCubit>(context).savePatientContact(
                      primaryContact.first.isActive,
                      primaryContact.first.isPrimary,
                      null,
                      AppConstants.parsedDate(dobController.text),
                      firstNameController.value.text,
                      primaryContact.first.patientContactId,
                      middleNameController.value.text,
                      lastNameController.value.text,
                      primaryContact.first.patientContactPreferredName,
                      phoneExtController.value.text,
                      selectedPrefix,
                      emailController.value.text,
                      phoneController.value.text,
                      selectedPhoneType ?? '',
                      selectedRelationship ?? '',
                      suffixController.value.text);
                },
                child: Text('Save Primary Contact'),
              ),
            )
                : SizedBox()
          ],
        ),


      ),

    );
  }
}
