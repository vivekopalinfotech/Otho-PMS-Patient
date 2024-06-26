import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_contact_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_contact_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_emergency_contact_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_emergency_contact_detail_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';

class EmergencyContact extends StatefulWidget {
  final patient;
  const EmergencyContact({super.key, this.patient});

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneExtController = TextEditingController();

  List<String> primaryPhone = ['Home', 'Work', 'Mobile'];
  List<String> relation = ['Spouse', 'Parent', 'sibling', 'Friend', 'Colleague', 'Dependant'];
  var primaryPhoneType;
  var selectedPhoneType;
  var relationship;
  var selectedRelationship;
  bool isWarned = false;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.patient.patientEmergencyContactFirstName;
    lastNameController.text = widget.patient.patientEmergencyContactLastName;
    phoneController.text = widget.patient.patientEmergencyContactPhone;
    dobController.text =widget.patient.patientEmergencyContactDob!= 'null'? AppConstants.formatedDate(widget.patient.patientEmergencyContactDob.toString()):"";
    selectedPhoneType = widget.patient.patientEmergencyContactPhoneType;
    selectedRelationship = widget.patient.patientEmergencyContactRelationship;
    phoneExtController.text = widget.patient.patientEmergencyContactPhoneExt??'';
  }

  List<String> prefixes = ['Dr.', 'Prof.', 'Miss.', 'Sir.'];
  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return  MultiBlocListener(
      listeners: [

        BlocListener<SavePatientEmergencyContactCubit, SavePatientEmergencyContactState>(listener: (context, state) async {
          if (state is SavePatientEmergencyContactSuccess) {
            setState(() {
              isLoading = false;
              Navigator.of(context).pop(true);
              BlocProvider.of<PatientByIdCubit>(context).getPatientById(widget.patient.patientId.toString());
            });
          }
          if (state is SavePatientEmergencyContactLoading) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is SavePatientEmergencyContactError) {
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
              'Date of Birth',
              dobController,
              TextInputType.datetime,
              readOnly: true,
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
                phoneController.value.text.isNotEmpty
                ?  Align(
              alignment: AlignmentDirectional.bottomEnd,
              child:  ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll( colorScheme.primaryContainer),
                ),
                onPressed: () {
                  BlocProvider.of<SavePatientEmergencyContactCubit>(context).savePatientEmergencyContactDetails( AppConstants.parsedDate(dobController.text.toString()), firstNameController.text, lastNameController.text, phoneController.text, phoneExtController.text,   selectedPhoneType ?? '',   selectedRelationship ?? '');
                },
                child: Text('Save Emergency Contact'),
              ),
            )
                : SizedBox()
          ],
        ),


      ),

    );
  }
}
