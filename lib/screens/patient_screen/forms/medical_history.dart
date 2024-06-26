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
import 'package:ortho_pms_patient/bloc/medical_history/save_medical_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/medical_history/save_medical_history_state.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';
import 'package:riff_switch/riff_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dental_history.dart';

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
  List<Medications> medication = [];

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
  bool hasPatientTakenBoniva = false;
  bool hasPatientTakenActonel = false;
  bool hasPatientTakenFosamax = false;
  bool hasPatientTakenOther = false;

  String? selectedDentist;
  int? selectedDentistId;
  List medicalHistory = [];
  List medicalAllergies = [];
  List dentists = [];
  List allergies = [];
  List medicalConditions = [];
  List conditions = [];
  var newList = [];
  var paasAllergies = [];
  var paasMedicalConditions = [];
  Set paas = {};
  String allergy = '';
  String medicalCondition = '';
  String selectedMed = '';

  void _itemChange(int allergyId, bool isChecked, bool isActive) {
    setState(() {
      if (isChecked) {
        if (!selectedAllergies.contains(allergyId)) {
          selectedAllergies.add(allergyId);
        }

        bool alreadyAdded = paasAllergies.any((allergy) => allergy["allergyId"] == allergyId);
        if (!alreadyAdded) {
          paasAllergies.add({
            "patientAllergyId": 0,
            "patientId": patientId,
            "allergyId": allergyId,
            "otherAllergies": "",
            "isActive": isActive,
          });
        }
      } else {
        selectedAllergies.remove(allergyId);
        paasAllergies.removeWhere((allergy) => allergy["allergyId"] == allergyId);
      }
    });
  }

  void _medicalConditionsChange(int medicalConditionsId, bool isChecked, bool isActive) {
    setState(() {
      if (isChecked) {
        if (!selectedMedicalConditions.contains(medicalConditionsId)) {
          selectedMedicalConditions.add(medicalConditionsId);
        }

        bool alreadyAdded = paasMedicalConditions.any((medicalConditions) => medicalConditions["medicalConditionId"] == medicalConditionsId);
        if (!alreadyAdded) {
          paasMedicalConditions.add({
            "patientMedicalConditionId": 0,
            "patientId": patientId,
            "medicalConditionId": medicalConditionsId,
            "otherMedicalConditions": "",
            "isAnythingPrivate": false,
            "patientMedicalConditionNotes": "",
            "isActive": isActive,
          });
        }
      } else {
        selectedMedicalConditions.remove(medicalConditionsId);
        paasMedicalConditions.removeWhere((medicalConditions) => medicalConditions["medicalConditionId"] == medicalConditionsId);
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
    BlocProvider.of<GetDentistCubit>(context).GetDentist();
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
                  conditions.addAll(state.medicalHistoryResponse.medicalConditions);
                if(medicalHistory.isNotEmpty){
                  isPrimary = medicalHistory.first.hasPrimaryDentist;
                  selectedDentistId = medicalHistory.first.primaryDentistId;
                  selectedDentalAppointment = medicalHistory.first.lastDentalAppointment;
                  selectedPhysicalHealth = medicalHistory.first.currentPhysicalHealth;
                  selectedBirthControl = medicalHistory.first.isPatientOnBirthControl == false ? birthControl[1] : birthControl[0];
                  selectedProblems = medicalHistory.first.isPatientUnderPhysicianCareForMedicalProblems == false ? birthControl[1] : birthControl[0];
                  selectedPregnant = medicalHistory.first.patientPregnant;
                  currentMedicationsController.text = medicalHistory.first.currentMedications;

                  hasPatientTakenBoniva = medicalHistory.first.hasPatientTakenBoniva;
                  hasPatientTakenActonel = medicalHistory.first.hasPatientTakenActonel;
                  hasPatientTakenFosamax = medicalHistory.first.hasPatientTakenFosamax;
                  hasPatientTakenOther = medicalHistory.first.hasPatientTakenOther;
                }
                if(conditions.isNotEmpty){
                  doctorDiscussion = conditions.first.isAnythingPrivate == false ? birthControl[1] : birthControl[0];
                }
                  paasAllergies.clear();
                  for (var allergy in medicalAllergies) {
                    selectedAllergies.add(allergy.allergyId);
                    print(selectedAllergies);

                    paasAllergies.addAll([
                      {"patientAllergyId": allergy.patientAllergyId, "patientId": patientId, "allergyId": allergy.allergyId, "otherAllergies": allergy.otherAllergies, "isActive": allergy.isActive}
                    ]);
                  }
                  print('--> ${paasAllergies}');

                  for (var medicalConditions in conditions) {
                    selectedMedicalConditions.add(medicalConditions.medicalConditionId);

                    selectedMedicalConditions.add(medicalConditions.medicalConditionId);
                    print(selectedMedicalConditions);

                    paasMedicalConditions.addAll([
                      {
                        "patientMedicalConditionId": medicalConditions.patientMedicalConditionId,
                        "patientId": patientId,
                        "medicalConditionId": medicalConditions.medicalConditionId,
                        "otherMedicalConditions": medicalConditions.otherMedicalConditions,
                        "isAnythingPrivate": medicalConditions.isAnythingPrivate,
                        "patientMedicalConditionNotes": medicalConditions.patientMedicalConditionNotes,
                        "isActive": medicalConditions.isActive,
                      }
                    ]);
                  }
                  print('--> ${paasMedicalConditions}');
                  medication = [
                    Medications(
                      "Boniva",
                      hasPatientTakenBoniva,
                    ),
                    Medications(
                      "Actonel",
                      hasPatientTakenActonel,
                    ),
                    Medications("Fosamax", hasPatientTakenFosamax),
                    Medications("None of the above", hasPatientTakenOther),
                  ];
                });

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
            BlocListener<SaveMedicalHistoryCubit, SaveMedicalHistoryState>(listener: (context, state) async {
              if (state is SaveMedicalHistorySuccess) {
                Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => DentalHistoryForm())).whenComplete(() => setState(() {
                      isLoading = false;
                    }));
              }
              if (state is SaveMedicalHistoryLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is SaveMedicalHistoryError) {
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
                                  child: multipleSelect('Allergies(Click all that apply)', allergies, (context, index) {
                                    return multipleSelectItem((isChecked) async {
                                      _itemChange(allergies[index].allergyId, isChecked, allergies[index].isActive);
                                      if (selectedAllergies.contains(9)) {
                                        setState(() {
                                          selectedAllergies.clear();
                                          paasAllergies.clear();

                                          if (index == 8) {
                                            selectedAllergies.add(9);
                                          } else {
                                            selectedAllergies.remove(9);
                                          }
                                        });
                                      }

                                      print(paasAllergies);
                                    }, selectedAllergies.contains(allergies[index].allergyId), allergies[index].allergyName);
                                  }, patientAllergiesController, 'Please list any other allergies that the patient has:'),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                                  child: multipleSelect('Medication', medication, (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                      child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              medication[index].value = !medication[index].value;

                                              if (index == 3) {
                                                setState(() {
                                                  medication[0].value = false;
                                                  medication[1].value = false;
                                                  medication[2].value = false;
                                                });
                                              } else {
                                                medication[3].value = false;
                                              }
                                              print(medication[0].value);
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  medication[index].value ? activeIcon() : inactiveIcon(),
                                                  SizedBox(width: 16),
                                                  Flexible(
                                                    child: Text(medication[index].title),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                    );
                                  }, patientAllergies2Controller, 'Please list any other allergies that the patient has:'),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      multipleSelect('Does the patient have any of the following medical conditions?(click all that apply)', medicalConditions, (context, index) {
                                        return multipleSelectItem((isChecked) async {
                                          _medicalConditionsChange(medicalConditions[index].medicalConditionId, isChecked, medicalConditions[index].isActive);

                                          if (selectedMedicalConditions.contains(31)) {
                                            selectedMedicalConditions.clear();
                                            paasMedicalConditions.clear();
                                            if (index == 30) {
                                              setState(() {
                                                selectedMedicalConditions.add(31);
                                              });
                                            } else {
                                              setState(() {
                                                selectedMedicalConditions.remove(31);
                                              });
                                            }
                                          }
                                          print(paasMedicalConditions);
                                        }, selectedMedicalConditions.contains(medicalConditions[index].medicalConditionId), medicalConditions[index].medicalConditionName);
                                      }, patientMedicalProblemsController, 'Please describe any serious medical problems the patient has experienced:'),
                                      SizedBox(height: 16),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                        child: subCategories("Is there anything you would like to discuss with the doctor in private?", birthControl, (context, index) {
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
                                      ),
                                    ]))),
                            SizedBox(height: 16),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
                                ),
                                onPressed: () {
                                  BlocProvider.of<SaveMedicalHistoryCubit>(context).savePatientMedicalHistory(
                                      medicalHistory.isNotEmpty? medicalHistory.first.patientMedicalHistoryId:0,
                                      selectedDentalAppointment ?? '',
                                      selectedPhysicalHealth ?? '',
                                      currentMedicationsController.text,
                                      selectedBirthControl == 'No' ? false : true,
                                      selectedPregnant ?? '',
                                      medicalHistory.first.patientPregnantWeekAlong,
                                      isPrimary,
                                      selectedDentistId,
                                      selectedProblems == 'No' ? false : true,
                                      medicalHistory.first.patientUnderPhysicianCareForMedicalProblemsDescription1,
                                      medicalHistory.first.patientUnderPhysicianCareForMedicalProblemsDescription2,
                                      medicalHistory.first.patientUnderPhysicianCareForMedicalProblemsDescription3,
                                      medicalHistory.first.patientUnderPhysicianCareForMedicalProblemsDescription4,
                                      medication[0].value,
                                      medication[1].value,
                                      medication[2].value,
                                      medication[3].value,
                                      medication[3].value,
                                      patientAllergies2Controller.text,
                                      medicalHistory.first.hasPatientBeenEvaluatedForOrthodonticTreatment,
                                      medicalHistory.first.patientBeenEvaluatedForOrthodonticTreatmentNotes,
                                      medicalHistory.first.hasPatientEverHadInjuryOnFaceMouthChin,
                                      medicalHistory.first.hasPatientEverHadInjuryOnFaceMouthChinNotes,
                                      medicalHistory.first.hasPatientEverHadAdenoidsOrTonsilsRemoved,
                                      medicalHistory.first.hasPatientEverHadAdenoidsOrTonsilsRemovedNotes,
                                      medicalHistory.first.hasPatientEverInformedAboutPermanentTooth,
                                      medicalHistory.first.hasPatientEverInformedAboutPermanentToothNotes,
                                      medicalHistory.first.hasPatientEverHasTenderness,
                                      medicalHistory.first.hasPatientEverHasTendernessNotes,
                                      medicalHistory.first.hasPatientTakenAntibioticPriorToDenalVisit,
                                      medicalHistory.first.hasPatientTakenAntibioticPriorToDenalVisitNotes,
                                      medicalHistory.first.hasPatientEverHadProblemsWithDentalWork,
                                      medicalHistory.first.hasPatientEverHadProblemsWithDentalWorkNotes,
                                      paasAllergies,
                                      paasMedicalConditions);
                                },
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

  Widget multipleSelectItem(onChanged, value, listTitle) {
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
          activeIcon: activeIcon(),
          onChanged: onChanged,
          value: value,
          inactiveIcon: inactiveIcon(),
        ),
        Flexible(
            child: Padding(
          padding: EdgeInsets.only(top: 10, right: 16),
          child: Text(listTitle),
        ))
      ],
    );
  }
}
