import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/allergies/get_allergies_cubit.dart';
import 'package:ortho_pms_patient/bloc/allergies/get_allergies_state.dart';
import 'package:ortho_pms_patient/bloc/dentist/get_dentist_cubit.dart';
import 'package:ortho_pms_patient/bloc/dentist/get_dentist_state.dart';
import 'package:ortho_pms_patient/bloc/medical_condition/medical_condition_cubit.dart';
import 'package:ortho_pms_patient/bloc/medical_condition/medical_condition_state.dart';
import 'package:ortho_pms_patient/bloc/medical_history/get_medical_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/medical_history/get_medical_history_state.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';
import 'package:riff_switch/riff_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalHistoryForm extends StatefulWidget {
  const MedicalHistoryForm({
    super.key,
  });
  @override
  State<MedicalHistoryForm> createState() => _MedicalHistoryFormState();
}

class _MedicalHistoryFormState extends State<MedicalHistoryForm> {
  TextEditingController currentMedicationsController = TextEditingController();

  TextEditingController patientAllergiesController = TextEditingController();
  TextEditingController patientMedicalProblemsController = TextEditingController();
  TextEditingController patientAllergies2Controller = TextEditingController();

  List<String> physicalHealth = ['Good', 'Fair', 'Poor'];
  List<String> birthControl = ['Yes', 'No'];
  List<String> pregnant = ['Unsure', 'No', 'Yes'];
  List<String> dentalAppointment = ['Less than 6 Months', 'Between 6 Months and 12 Months', 'Between 12 Months and 18 Months', 'Between 18 Months and 24 Months', 'Longer than 24 Months'];
  List<String> medication = ['Boniva', 'Actonel', 'Fosamax', 'None of the above'];
  var patientId;
  var selectedPhysicalHealth;
  var selectedBirthControl;
  var selectedProblems;
  var doctorDiscussion;
  var selectedPregnant;

  String? selectedDentalAppointment;
  final List selectedAllergies = [];
  final List selectedMedicalConditions = [];
  final List selectedMedication = [];

  bool isPrimary = false;
  bool isLoading = true;

  String? selectedDentist;
  int? selectedDentistId;
  List medicalHistory = [];
  List medicalAllergies = [];
  List dentists = [];
  List allergies = [];
  List medicalConditions = [];

  String allergy = '';
  String medicalCondition = '';
  String selectedMed = '';

  void _itemChange(itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedAllergies.add(itemValue);
      } else {
        selectedAllergies.remove(itemValue);
      }
    });
  }

  void _medicationChange(itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedMedication.add(itemValue);
      } else {
        selectedMedication.remove(itemValue);
      }
    });
  }

  void _medicalConditionsChange(itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedMedicalConditions.add(itemValue);
      } else {
        selectedMedicalConditions.remove(itemValue);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    patientId = preferences.getString('patientId');
    BlocProvider.of<GetAllergiesCubit>(context).getAllergies();

    BlocProvider.of<MedicalConditionCubit>(context).getMedicalConditions();
    BlocProvider.of<MedicalHistoryCubit>(context).getMedicalHistory();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    var maxHeight = MediaQuery.of(context).size.height;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              'Medical History',
              style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
            )),
        body: MultiBlocListener(
          listeners: [
            BlocListener<MedicalHistoryCubit, MedicalHistoryState>(listener: (context, state) async {
              if (state is MedicalHistorySuccess) {
                medicalHistory.clear();
                medicalAllergies.clear();
                setState(() {
                  isLoading = false;
                  medicalHistory.addAll(state.medicalHistoryResponse.medicalHistory);
                  medicalAllergies.addAll(state.medicalHistoryResponse.allergies);
                  isPrimary = medicalHistory.first.hasPrimaryDentist;
                  selectedDentistId = medicalHistory.first.primaryDentistId;
                  selectedDentalAppointment = medicalHistory.first.lastDentalAppointment;
                  selectedPhysicalHealth = medicalHistory.first.currentPhysicalHealth;
                  selectedBirthControl = medicalHistory.first.isPatientOnBirthControl == false?birthControl[1]:birthControl[0];
                  selectedProblems = medicalHistory.first.isPatientUnderPhysicianCareForMedicalProblems == false?birthControl[1]:birthControl[0];
                  selectedPregnant = medicalHistory.first.patientPregnant;
                  currentMedicationsController.text = medicalHistory.first.currentMedications;

                });
                BlocProvider.of<GetDentistCubit>(context).GetDentist();
              }
              if (state is MedicalHistoryError) {
                print(state.message);
              }
            }),
            BlocListener<MedicalConditionCubit, MedicalConditionState>(listener: (context, state) async {
              if (state is MedicalConditionSuccess) {
                setState(() {
                  medicalConditions.addAll(state.medicalConditionResponse.medicalCondition);
                });
              }
              if (state is MedicalConditionLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is MedicalConditionError) {}
            }),
            BlocListener<GetDentistCubit, GetDentistState>(listener: (context, state) async {
              if (state is GetDentistSuccess) {
                setState(() {
                  dentists.addAll(state.getDentistResponse.dentist);
                  selectedDentist = state.getDentistResponse.dentist.where((element) => element.dentistId == selectedDentistId).first.dentistFullName.toString();
                });
              }
              if (state is GetDentistLoading) {}
              if (state is GetDentistError) {}
            }),
            BlocListener<GetAllergiesCubit, GetAllergiesState>(listener: (context, state) async {
              if (state is GetAllergiesSuccess) {
                setState(() {
                  allergies.addAll(state.allergiesResponse.allergy);
                });
              }
              if (state is GetAllergiesLoading) {}
              if (state is GetAllergiesError) {}
            }),
            BlocListener<SavePatientInsuranceCubit, SavePatientInsuranceState>(listener: (context, state) async {
              if (state is SavePatientInsuranceSuccess) {
                setState(() {
                  isLoading = false;
                  Navigator.of(context).pop(true);
                  BlocProvider.of<PatientByIdCubit>(context).getPatientById(patientId);
                });
              }
              if (state is SavePatientInsuranceLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is SavePatientInsuranceError) {
                setState(() {
                  isLoading = false;
                });
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.all(AppConstants.HP),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('General information',
                                          style: GoogleFonts.inter(
                                              fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Primary Dentist',
                                              style: GoogleFonts.inter(
                                                  fontSize: AppConstants.SMALL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                          SizedBox(width: 8),
                                          ConstantSwitch(val: isPrimary, riffSwitchType: RiffSwitchType.simple),
                                          SizedBox(width: 8),
                                          Text('No Primary Dentist',
                                              style: GoogleFonts.inter(
                                                  fontSize: AppConstants.SMALL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      SizedBox(height: 8),
                                      Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColor.secondarySeedColor)),
                                          child: DropdownButton<String>(
                                            isDense: false,
                                            itemHeight: 50,
                                            padding: EdgeInsets.symmetric(horizontal: 12),
                                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                                            borderRadius: BorderRadius.circular(4),
                                            hint: Text('Select Dentist'),
                                            alignment: Alignment.centerLeft,
                                            isExpanded: true,
                                            underline: SizedBox(),
                                            value: selectedDentist,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedDentist = newValue.toString();
                                                selectedDentistId = dentists.firstWhere((element) => element.dentistFullName == selectedDentist).dentistId;
                                              });
                                            },
                                            items: dentists.map((dynamic dentist) {
                                              return DropdownMenuItem<String>(
                                                value: dentist.dentistFullName,
                                                child: Text(dentist.dentistFullName),
                                              );
                                            }).toList(),
                                          )),
                                      SizedBox(height: 16),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Text('Last Dental Appointment',
                                            style: GoogleFonts.inter(
                                                fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                        SizedBox(height: 8),
                                        Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColor.secondarySeedColor)),
                                            child: DropdownButton<String>(
                                              isDense: false,
                                              itemHeight: 50,
                                              padding: EdgeInsets.symmetric(horizontal: 12),
                                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                                              borderRadius: BorderRadius.circular(4),
                                              hint: Text('Select Last Dental Appointment'),
                                              alignment: Alignment.centerLeft,
                                              isExpanded: true,
                                              underline: SizedBox(),
                                              value: selectedDentalAppointment,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedDentalAppointment = newValue.toString();
                                                });
                                              },
                                              items: dentalAppointment.map((String dentalAppointment) {
                                                return DropdownMenuItem<String>(
                                                  value: dentalAppointment,
                                                  child: Text(dentalAppointment),
                                                );
                                              }).toList(),
                                            ))
                                      ]),
                                      SizedBox(height: 16),
                                      subCategories("Current Physical Health", physicalHealth, (context, index) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              selectedPhysicalHealth = physicalHealth[index];
                                            });
                                          },
                                          child: radioButton(
                                            selectedPhysicalHealth == physicalHealth[index],
                                            physicalHealth[index],
                                          ),
                                        );
                                      }),
                                      SizedBox(height: 16),
                                      subCategories("Is the patient on birth control", birthControl, (context, index) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              selectedBirthControl = birthControl[index];
                                            });
                                          },
                                          child: radioButton(
                                            selectedBirthControl == birthControl[index],
                                            birthControl[index],
                                          ),
                                        );
                                      }),
                                      SizedBox(height: 16),
                                      subCategories("Is the patient pregnant", pregnant, (context, index) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              selectedPregnant = pregnant[index];
                                            });
                                          },
                                          child: radioButton(
                                            selectedPregnant == pregnant[index],
                                            pregnant[index],
                                          ),
                                        );
                                      }),
                                      ConstantTextFormField('Current Medications', currentMedicationsController, TextInputType.text),
                                      SizedBox(height: 16),
                                      subCategories("Is the patient currently under the care of a physician for any medical problems?", birthControl, (context, index) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              selectedProblems = birthControl[index];
                                            });
                                          },
                                          child: radioButton(
                                            selectedProblems == birthControl[index],
                                            birthControl[index],
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                          child: Text('Allergies(Click all that apply)',
                                              style: GoogleFonts.inter(
                                                  fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor))),
                                      SizedBox(height: 16),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.5,
                                        ),
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: allergies.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GFCheckbox(
                                                type: GFCheckboxType.basic,
                                                activeBgColor: Colors.transparent,
                                                inactiveBgColor: Colors.transparent,
                                                activeBorderColor: Colors.transparent,
                                                inactiveBorderColor: Colors.transparent,
                                                size: 24,
                                                activeIcon: Image.asset(
                                                  'assets/images/mark.png',
                                                ),
                                                onChanged: (isChecked) async {

                                                  _itemChange(allergies[index].allergyId, isChecked);
                                                  allergy = selectedAllergies
                                                      .toString()
                                                      .replaceAll(
                                                        '[',
                                                        '',
                                                      )
                                                      .replaceAll(']', '');
                                                  print(allergy);
                                                },
                                                value: selectedAllergies.contains(allergies[index].allergyId),
                                                inactiveIcon: Image.asset(
                                                  'assets/images/unchecked.png',
                                                ),
                                              ),
                                              Flexible(
                                                  child: Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Text(allergies[index].allergyName),
                                              ))
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                          child: ConstantTextFormField('Please list any other allergies that the patient has:', patientAllergiesController, TextInputType.text)),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                          child: Text('Medication',
                                              style: GoogleFonts.inter(
                                                  fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor))),
                                      SizedBox(height: 16),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.5,
                                        ),
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: medication.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GFCheckbox(
                                                type: GFCheckboxType.basic,
                                                activeBgColor: Colors.transparent,
                                                inactiveBgColor: Colors.transparent,
                                                activeBorderColor: Colors.transparent,
                                                inactiveBorderColor: Colors.transparent,
                                                size: 24,
                                                activeIcon: Image.asset(
                                                  'assets/images/mark.png',
                                                ),
                                                onChanged: (isChecked) async {
                                                  _medicationChange(medication[index], isChecked);

                                                  selectedMed = selectedMedication
                                                      .toString()
                                                      .replaceAll(
                                                        '[',
                                                        '',
                                                      )
                                                      .replaceAll(']', '');
                                                  print(selectedMed);
                                                },
                                                value: selectedMedication.contains(medication[index]),
                                                inactiveIcon: Image.asset(
                                                  'assets/images/unchecked.png',
                                                ),
                                              ),
                                              Flexible(
                                                  child: Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Text(medication[index]),
                                              ))
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                          child: ConstantTextFormField('Please list any other allergies that the patient has:', patientAllergies2Controller, TextInputType.text)),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                        child: Text('Does the patient have any of the following medical conditions?(click all that apply)',
                                            style: GoogleFonts.inter(
                                                fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      ),
                                      SizedBox(height: 16),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.5,
                                        ),
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: medicalConditions.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GFCheckbox(
                                                activeBgColor: Colors.transparent,
                                                inactiveBgColor: Colors.transparent,
                                                activeBorderColor: Colors.transparent,
                                                inactiveBorderColor: Colors.transparent,
                                                size: 24,
                                                activeIcon: Image.asset(
                                                  'assets/images/mark.png',
                                                ),
                                                onChanged: (isChecked) async {
                                                  _medicalConditionsChange(medicalConditions[index].medicalConditionId, isChecked);

                                                  medicalCondition = selectedAllergies
                                                      .toString()
                                                      .replaceAll(
                                                        '[',
                                                        '',
                                                      )
                                                      .replaceAll(']', '');
                                                  print(medicalCondition);
                                                },
                                                value: selectedMedicalConditions.contains(medicalConditions[index].medicalConditionId),
                                                inactiveIcon: Image.asset(
                                                  'assets/images/unchecked.png',
                                                ),
                                              ),
                                              Flexible(
                                                  child: Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Text(medicalConditions[index].medicalConditionName),
                                              ))
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ConstantTextFormField('Please describe any serious medical problems the patient has experienced:', patientMedicalProblemsController, TextInputType.text),
                                              subCategories("Is there anything you would like to discuss with the doctor in private?", birthControl, (context, index) {
                                                return InkWell(
                                                  splashColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  onTap: () {
                                                    setState(() {
                                                      doctorDiscussion = birthControl[index];
                                                    });
                                                  },
                                                  child: radioButton(
                                                    doctorDiscussion == birthControl[index],
                                                    birthControl[index],
                                                  ),
                                                );
                                              }),
                                            ],
                                          )),
                                    ]))),
                            SizedBox(height: 16),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
                                ),
                                onPressed: () {},
                                child: Text('Save & Continue'),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ));
  }
}
