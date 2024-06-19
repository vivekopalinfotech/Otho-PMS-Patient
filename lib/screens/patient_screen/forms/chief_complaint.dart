import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/get_chief_Complaint_types_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/get_chief_Complaint_types_state.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/get_chief_complaint_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/get_chief_complaint_detail_state.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/save_chief_complaint_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/save_chief_complaint_detail_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';

class ChiefComplaint extends StatefulWidget {
  const ChiefComplaint({super.key});

  @override
  State<ChiefComplaint> createState() => _ChiefComplaintState();
}

class _ChiefComplaintState extends State<ChiefComplaint> {
  String? selectedType;
  int? selectedTypeId;
  List types = [];
  TextEditingController notesController = TextEditingController();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetChiefCompliantTypesCubit>(context).GetChiefCompliantTypes().whenComplete(() => BlocProvider.of<GetChiefCompliantDetailCubit>(context).GetChiefCompliantDetail());
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
              'Chief Complaint',
              style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
            )),
        body: MultiBlocListener(
            listeners: [
              BlocListener<GetChiefCompliantTypesCubit, GetChiefCompliantTypesState>(listener: (context, state) async {
                if (state is GetChiefCompliantTypesSuccess) {
                  setState(() {
                    isLoading = false;
                    types.addAll(state.getChiefCompliantTypesResponse.chiefComplaintTypes);
                  });
                }
                if (state is GetChiefCompliantTypesLoading) {

                }
                if (state is GetChiefCompliantTypesError) {
                }
              }),
              BlocListener<SaveChiefCompliantDetailCubit, SaveChiefCompliantDetailState>(listener: (context, state) async {
                if (state is SaveChiefCompliantDetailSuccess) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pop(context);
                }
                if (state is SaveChiefCompliantDetailLoading) {
                  setState(() {
                    isLoading = true;
                  });
                }
                if (state is SaveChiefCompliantDetailError) {
                  setState(() {
                    isLoading = false;
                  });
                  showSnackBar(context, state.message);
                }
              }),
            ],
            child: BlocConsumer<GetChiefCompliantDetailCubit, GetChiefCompliantDetailState>(
              listener: (context, state) async {
                if (state is GetChiefCompliantDetailSuccess) {
                  setState(() {
                    isLoading = false;
                    selectedType = state.chiefCompliantDetailResponse.chiefComplaintTypeName;
                    selectedTypeId = state.chiefCompliantDetailResponse.chiefComplaintTypeId;
                    notesController.text = state.chiefCompliantDetailResponse.patientChiefComplaintNotes;
                  });
                }
                if (state is GetChiefCompliantDetailLoading) {
                  setState(() {
                    isLoading = true;
                  });
                }
                if (state is GetChiefCompliantDetailError) {
                  setState(() {
                    isLoading = false;
                  });
                  showSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is GetChiefCompliantDetailSuccess) {
                  return isLoading
                      ? FieldsLoading()
                      : Stack(children: [
                          Container(
                              height: maxHeight,
                              width: double.maxFinite,
                              child: SingleChildScrollView(
                                  padding: EdgeInsets.all(AppConstants.HP),
                                  child: Column(children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text('What brings you into our office? ',
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
                                            hint: Text('Select'),
                                            alignment: Alignment.centerLeft,
                                            isExpanded: true,
                                            underline: SizedBox(),
                                            value: selectedType,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedType = newValue.toString();
                                                selectedTypeId = types.firstWhere((element) => element.chiefComplaintTypeName == selectedType).chiefComplaintTypeId;
                                              });
                                            },
                                            items: types.map((dynamic type) {
                                              return DropdownMenuItem<String>(
                                                value: type.chiefComplaintTypeName,
                                                child: Text(type.chiefComplaintTypeName),
                                              );
                                            }).toList(),
                                          ))
                                    ]),
                                    SizedBox(height: 16),
                                    ConstantTextFormField(
                                      'Notes',
                                      notesController,
                                      TextInputType.text,
                                      maxLines: 3,
                                    )
                                  ]))),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<SaveChiefCompliantDetailCubit>(context)
                                      .savePatientChiefComplaintDetails(selectedTypeId, state.chiefCompliantDetailResponse.patientChiefComplaintId, notesController.text);
                                },
                                child: Text('Save Chief Complaint')),
                          )
                        ]);
                } else {
                  return FieldsLoading();
                }
              },
            )));
  }
}
