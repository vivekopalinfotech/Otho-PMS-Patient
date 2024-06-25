import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/dental_history/get_dental_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/dental_history/get_dental_history_state.dart';
import 'package:ortho_pms_patient/bloc/dental_history/get_dental_hygienes_cubit.dart';
import 'package:ortho_pms_patient/bloc/dental_history/get_dental_hygienes_state.dart';
import 'package:ortho_pms_patient/bloc/dental_history/save_patient_dental_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/dental_history/save_patient_dental_history_state.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/habits/get_habits_cubit.dart';
import 'package:ortho_pms_patient/habits/get_habits_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DentalHistoryForm extends StatefulWidget {
  const DentalHistoryForm({
    super.key,
  });
  @override
  State<DentalHistoryForm> createState() => _DentalHistoryFormState();
}

class _DentalHistoryFormState extends State<DentalHistoryForm> {
  TextEditingController patientHygienesController = TextEditingController();
  TextEditingController patientHabitsController = TextEditingController();
  bool hasPatientBeenEvaluatedForOrthodonticTreatment = false;
  bool hasPatientEverHadInjuryOnFaceMouthChin = false;
  bool hasPatientEverHadAdenoidsOrTonsilsRemoved = false;
  bool hasPatientEverInformedAboutPermanentTooth = false;
  bool hasPatientEverHasTenderness = false;
  bool hasPatientTakenAntibioticPriorToDenalVisit = false;
  bool hasPatientEverHadProblemsWithDentalWork = false;

  TextEditingController hasPatientBeenEvaluatedForOrthodonticTreatmentController = TextEditingController();
  TextEditingController hasPatientEverHadInjuryOnFaceMouthChinController = TextEditingController();
  TextEditingController hasPatientEverHadAdenoidsOrTonsilsRemovedController = TextEditingController();
  TextEditingController hasPatientEverInformedAboutPermanentToothController = TextEditingController();
  TextEditingController hasPatientEverHasTendernessController = TextEditingController();
  TextEditingController hasPatientTakenAntibioticPriorToDenalVisitController = TextEditingController();
  TextEditingController hasPatientEverHadProblemsWithDentalWorkController = TextEditingController();
  var patientId;
  final List selectedhygienes = [];
  final List selectedHabits = [];
  var paasHabits = [];
  var paasHygienes = [];
  bool isLoading = true;
  List medicalHistory = [];
  List medicalhygienes = [];
  List medicalHabits = [];
  List hygienes = [];
  List habits = [];
  List<PatientHas> patientHas = [];
  String hygiene = '';
  String habit = '';

  void _itemChange(int dentalHygieneId, bool isChecked, bool isActive) {
    setState(() {
      if (isChecked) {
        if (!selectedhygienes.contains(dentalHygieneId)) {
          selectedhygienes.add(dentalHygieneId);
        }

        bool alreadyAdded = paasHygienes.any((hygiene) => hygiene["dentalHygieneId"] == dentalHygieneId);
        if (!alreadyAdded) {
          paasHygienes.add({
            "patientDentalHygieneId": 0,
            "patientId": patientId,
            "dentalHygieneId": dentalHygieneId,
            "otherDentalHygiene": "",
            "isActive": isActive,
          });
        }
      } else {
        selectedhygienes.remove(dentalHygieneId);
        paasHygienes.removeWhere((hygiene) => hygiene["dentalHygieneId"] == dentalHygieneId);
      }
    });
  }

  void _habitsChange(int habitId, bool isChecked, bool isActive) {
    setState(() {
      if (isChecked) {
        if (!selectedHabits.contains(habitId)) {
          selectedHabits.add(habitId);
        }

        bool alreadyAdded = paasHabits.any((habits) => habits["habitId"] == habitId);
        if (!alreadyAdded) {
          paasHabits.add({
            "patientHabitId": 0,
            "patientId": patientId,
            "habitId": habitId,
            "otherHabits": "",
            "isActive": isActive,
          });
        }
      } else {
        selectedHabits.remove(habitId);
        paasHabits.removeWhere((habits) => habits["habitId"] == habitId);
      }
    });
  }

  bool agree = false;
  bool alert = false;

  toggle() {
    setState(() {
      alert = false;
      agree = !agree;
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
    BlocProvider.of<GetHabitsCubit>(context).getGetHabits();

    BlocProvider.of<GetDentalHistoryCubit>(context).getPatientDentalHistory();
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
              'Dental History',
              style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
            )),
        body: MultiBlocListener(
          listeners: [
            BlocListener<GetDentalHistoryCubit, GetDentalHistoryState>(listener: (context, state) async {
              if (state is GetDentalHistorySuccess) {
                medicalHistory.clear();
                medicalhygienes.clear();
                medicalHabits.clear();
                setState(() {
                  isLoading = false;
                  medicalHistory.addAll(state.getDentalHistoryResponse.medicalHistory);
                  medicalhygienes.addAll(state.getDentalHistoryResponse.dentalHygienes);
                  medicalHabits.addAll(state.getDentalHistoryResponse.habit);

                  hasPatientBeenEvaluatedForOrthodonticTreatment = medicalHistory.first.hasPatientBeenEvaluatedForOrthodonticTreatment;
                  hasPatientBeenEvaluatedForOrthodonticTreatmentController.text = medicalHistory.first.patientBeenEvaluatedForOrthodonticTreatmentNotes;

                  hasPatientEverHadInjuryOnFaceMouthChin = medicalHistory.first.hasPatientEverHadInjuryOnFaceMouthChin;
                  hasPatientEverHadInjuryOnFaceMouthChinController.text = medicalHistory.first.hasPatientEverHadInjuryOnFaceMouthChinNotes;

                  hasPatientEverHadAdenoidsOrTonsilsRemoved = medicalHistory.first.hasPatientEverHadAdenoidsOrTonsilsRemoved;
                  hasPatientEverHadAdenoidsOrTonsilsRemovedController.text = medicalHistory.first.hasPatientEverHadAdenoidsOrTonsilsRemovedNotes;

                  hasPatientEverInformedAboutPermanentTooth = medicalHistory.first.hasPatientEverInformedAboutPermanentTooth;
                  hasPatientEverInformedAboutPermanentToothController.text = medicalHistory.first.hasPatientEverInformedAboutPermanentToothNotes;

                  hasPatientEverHasTenderness = medicalHistory.first.hasPatientEverHasTenderness;
                  hasPatientEverHasTendernessController.text = medicalHistory.first.hasPatientEverHasTendernessNotes;

                  hasPatientTakenAntibioticPriorToDenalVisit = medicalHistory.first.hasPatientTakenAntibioticPriorToDenalVisit;
                  hasPatientTakenAntibioticPriorToDenalVisitController.text = medicalHistory.first.hasPatientTakenAntibioticPriorToDenalVisitNotes;

                  hasPatientEverHadProblemsWithDentalWork = medicalHistory.first.hasPatientEverHadProblemsWithDentalWork;
                  hasPatientEverHadProblemsWithDentalWorkController.text = medicalHistory.first.hasPatientEverHadProblemsWithDentalWorkNotes;

                  for (var hygiene in medicalhygienes) {
                    selectedhygienes.add(hygiene.dentalHygieneId);
                    print(selectedhygienes);
                    paasHygienes.addAll([
                      {
                        "patientDentalHygieneId": hygiene.patientDentalHygieneId,
                        "patientId": patientId,
                        "dentalHygieneId": hygiene.dentalHygieneId,
                        "otherDentalHygiene": hygiene.otherDentalHygiene,
                        "isActive": hygiene.isActive,
                      }
                    ]);
                  }
                  print('--> ${paasHygienes}');

                  for (var habit in medicalHabits) {
                    selectedHabits.add(habit.habitId);

                    selectedHabits.add(habit.habitId);
                    print(selectedHabits);

                    paasHabits.addAll([
                      {
                        "patientHabitId": habit.patientHabitId,
                        "patientId": patientId,
                        "habitId": habit.habitId,
                        "otherHabits": habit.otherHabits,
                        "isActive": habit.isActive,
                      }
                    ]);
                  }
                  print('--> ${paasHabits}');
                });
                BlocProvider.of<GetDentalHygienesCubit>(context).getGetDentalHygienes();
              }
              if (state is GetDentalHistoryError) {
                print(state.message);
              }
            }),
            BlocListener<GetHabitsCubit, GetHabitsState>(listener: (context, state) async {
              if (state is GetHabitsSuccess) {
                setState(() {
                  habits.addAll(state.getHabitsResponse.habits);
                });
              }
              if (state is GetHabitsLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is GetHabitsError) {}
            }),
            BlocListener<GetDentalHygienesCubit, GetDentalHygienesState>(listener: (context, state) async {
              if (state is GetDentalHygienesSuccess) {
                setState(() {
                  hygienes.addAll(state.getDentalHygieneResponse.dentalHygiene);
                  patientHas = [
                    PatientHas(
                      "Been evaluated for Orthodontic treatment before",
                      hasPatientBeenEvaluatedForOrthodonticTreatment,
                      hasPatientBeenEvaluatedForOrthodonticTreatmentController,
                    ),
                    PatientHas("Ever received an injury to the face, mouth, teeth, or chin", hasPatientEverHadInjuryOnFaceMouthChin, hasPatientEverHadInjuryOnFaceMouthChinController),
                    PatientHas(
                      "Had their adenoids or tonsils removed",
                      hasPatientEverHadAdenoidsOrTonsilsRemoved,
                      hasPatientEverHadAdenoidsOrTonsilsRemovedController,
                    ),
                    PatientHas(
                      "Been informed about any missing or extra permanent teeth",
                      hasPatientEverInformedAboutPermanentTooth,
                      hasPatientEverInformedAboutPermanentToothController,
                    ),
                    PatientHas(
                      "Had any pain, tenderness, and/or clicking in the temporomandibular joint (TMJ)",
                      hasPatientEverHasTenderness,
                      hasPatientEverHasTendernessController,
                    ),
                    PatientHas(
                      "Been told to take an antibiotic prior to dental visits",
                      hasPatientTakenAntibioticPriorToDenalVisit,
                      hasPatientTakenAntibioticPriorToDenalVisitController,
                    ),
                    PatientHas(
                      "Had problems with previous dental work",
                      hasPatientEverHadProblemsWithDentalWork,
                      hasPatientEverHadProblemsWithDentalWorkController,
                    ),
                  ];
                });
              }
              if (state is GetDentalHygienesLoading) {}
              if (state is GetDentalHygienesError) {}
            }),
            BlocListener<SaveDentalHistoryCubit, SaveDentalHistoryState>(listener: (context, state) async {
              if (state is SaveDentalHistorySuccess) {
                setState(() {

                  Navigator.of(context).pop(true);
                  Navigator.of(context).pop(true);
                  BlocProvider.of<PatientByIdCubit>(context).getPatientById(patientId);
                  isLoading = false;
                });
              }
              if (state is SaveDentalHistoryLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is SaveDentalHistoryError) {
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
                                  padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                                  child: multipleSelect('Dental Hygiene(Click all that apply)', hygienes, (context, index) {
                                    return multipleSelectItem((isChecked) async {
                                      _itemChange(hygienes[index].dentalHygieneId, isChecked, hygienes[index].isActive);
                                      hygiene = selectedhygienes.toString();
                                      if (selectedhygienes.contains(6)) {
                                        setState(() {
                                          selectedhygienes.clear();
                                          paasHygienes.clear();

                                          if (index == 5) {
                                            selectedhygienes.add(6);
                                          } else {
                                            selectedhygienes.remove(6);
                                          }
                                        });
                                      }

                                      print(paasHygienes);
                                    }, selectedhygienes.contains(hygienes[index].dentalHygieneId), hygienes[index].dentalHygieneName);
                                  }, patientHygienesController, 'Please make any other comments that may be helpful'),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                                  child: multipleSelect('Did/Does the patient have any of the following habits?(Click all that apply)', habits, (context, index) {
                                    return multipleSelectItem((isChecked) async {
                                      _habitsChange(habits[index].habitId, isChecked, habits[index].isActive);
                                      habit = selectedHabits.toString();

                                      if (selectedHabits.contains(10)) {
                                        setState(() {
                                          selectedHabits.clear();
                                          paasHabits.clear();

                                          if (index == 9) {
                                            selectedHabits.add(10);
                                          } else {
                                            selectedHabits.remove(10);
                                          }
                                        });
                                      }

                                      print(paasHabits);
                                    }, selectedHabits.contains(habits[index].habitId), habits[index].habitName);
                                  }, patientHabitsController, 'Please make any other comments that may be helpful'),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: AppConstants.HP),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                        child: Text('Please indicate if the patient has:(Click all that apply)',
                                            style: GoogleFonts.inter(
                                                fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      ),
                                      SizedBox(height: 16),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.symmetric(horizontal: AppConstants.HP),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: patientHas.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () {
                                                setState(() {
                                                  patientHas[index].value = !patientHas[index].value;

                                                  print(patientHas[0].value);
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      patientHas[index].value ? activeIcon() : inactiveIcon(),
                                                      SizedBox(width: 16),
                                                      Flexible(
                                                        child: Text(patientHas[index].title),
                                                      )
                                                    ],
                                                  ),
                                                  patientHas[index].value
                                                      ? ConstantTextFormField(
                                                          patientHas[index].title,
                                                          patientHas[index].controller,
                                                          TextInputType.text,
                                                          hideTitle: true,
                                                          hint: '',
                                                        )
                                                      : SizedBox(),
                                                ],
                                              ));
                                        },
                                        separatorBuilder: (BuildContext context, int index) {
                                          return SizedBox(height: 16);
                                        },
                                      ),
                                    ]))),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                    padding: EdgeInsets.all(AppConstants.HP),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text('Confirm',
                                          style: GoogleFonts.inter(
                                              fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      SizedBox(height: 16),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              toggle();
                                            },
                                            child: agree ? activeIcon() : inactiveIcon(),
                                          ),
                                          const SizedBox(width: 8),
                                          Flexible(
                                            child: Text(
                                              "I confirm the accuracy of the patient information provided and understand its confidentiality. I will promptly update the office regarding any changes to the patient's medical status. I authorize the orthodontic staff to perform necessary services.",
                                              textScaler: const TextScaler.linear(1),
                                              style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.normal),
                                            ),
                                          )
                                        ],
                                      ),
                                      if (alert)
                                        Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Authorization is required.",
                                            textScaler: const TextScaler.linear(1),
                                            style: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.normal, color: Colors.redAccent),
                                          ),
                                        )
                                    ]))),
                            SizedBox(height: 16),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
                                ),
                                onPressed: () {
                                  if (agree) {
                                    BlocProvider.of<SaveDentalHistoryCubit>(context).savePatientDentalHistory(
                                        medicalHistory.first.patientMedicalHistoryId,
                                        medicalHistory.first.lastDentalAppointment ?? '',
                                        medicalHistory.first.currentPhysicalHealth ?? '',
                                        medicalHistory.first.currentMedications,
                                        medicalHistory.first.isPatientOnBirthControl,
                                        medicalHistory.first.patientPregnant,
                                        medicalHistory.first.patientPregnantWeekAlong,
                                        medicalHistory.first.hasPrimaryDentist,
                                        medicalHistory.first.primaryDentistId,
                                        medicalHistory.first.isPatientUnderPhysicianCareForMedicalProblems,
                                        medicalHistory.first.patientUnderPhysicianCareForMedicalProblemsDescription1,
                                        medicalHistory.first.patientUnderPhysicianCareForMedicalProblemsDescription2,
                                        medicalHistory.first.patientUnderPhysicianCareForMedicalProblemsDescription3,
                                        medicalHistory.first.patientUnderPhysicianCareForMedicalProblemsDescription4,
                                        medicalHistory.first.hasPatientTakenBoniva,
                                        medicalHistory.first.hasPatientTakenActonel,
                                        medicalHistory.first.hasPatientTakenFosamax,
                                        medicalHistory.first.hasPatientTakenOther,
                                        medicalHistory.first.patientTakenAnyOtherBisphosphonate,
                                        patientHas[0].value,
                                        hasPatientBeenEvaluatedForOrthodonticTreatmentController.text,
                                        patientHas[1].value,
                                        hasPatientEverHadInjuryOnFaceMouthChinController.text,
                                        patientHas[2].value,
                                        hasPatientEverHadAdenoidsOrTonsilsRemovedController.text,
                                        patientHas[3].value,
                                        hasPatientEverInformedAboutPermanentToothController.text,
                                        patientHas[4].value,
                                        hasPatientEverHasTendernessController.text,
                                        patientHas[5].value,
                                        hasPatientTakenAntibioticPriorToDenalVisitController.text,
                                        patientHas[6].value,
                                        hasPatientEverHadProblemsWithDentalWorkController.text,
                                        paasHygienes,
                                        paasHabits);
                                  } else {
                                    setState(() {
                                      alert = true;
                                    });
                                  }
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
