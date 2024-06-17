import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/history/patient_exam_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/history/patient_exam_history_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExamHistory extends StatefulWidget {
  const ExamHistory({super.key});

  @override
  State<ExamHistory> createState() => _ExamHistoryState();
}

class _ExamHistoryState extends State<ExamHistory> {

  getData() async {
    String patientId = '';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    patientId = preferences.getString('patientId').toString();
    BlocProvider.of<GetPatientExamHistoryCubit>(context).getGetPatientExamHistory(patientId);
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetPatientExamHistoryCubit, GetPatientExamHistoryState>(listener: (context, state) async {
      if (state is GetPatientExamHistoryError) {
        print(state.message);
      }
      if (state is GetPatientExamHistorySuccess) {}
    }, builder: (context, state) {
    if (state is GetPatientExamHistorySuccess) {
    return  ListView.separated(
        shrinkWrap: true,
        itemCount: state.patientExamResponse.examHistory.length,
        padding: EdgeInsets.all(AppConstants.HP),
        itemBuilder: (context,index){
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _rowBuild('EXAM DATE', "${AppConstants.convertDate(state.patientExamResponse.examHistory[index].patientExamDate.toString())}", 'EXAM RESULT', "${state.patientExamResponse.examHistory[index].patientExamResultName}"),
                  SizedBox(height: 8),
                  _rowBuild('EXAM STATUS', "${state.patientExamResponse.examHistory[index].patientExamStatusName}", 'EXAM NOTES', "${state.patientExamResponse.examHistory[index].examNotes??''}"),
                  SizedBox(height: 8),
                  _item('APPOINTMENT NAME', '${state.patientExamResponse.examHistory[index].practiceAppointmentName}')

                ],
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
    },);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      );
    }
    });
  }
  Widget _rowBuild(item1,value1,item2,value2){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child:  _item(item1, value1),),
        Flexible(
          child:  _item(item2, value2),)
      ],
    );
  }

  Widget _item(key,value){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(key,
            style: GoogleFonts.inter(
              fontSize: AppConstants.XSMALL,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(height: 4),
        Row(
          children: [
            Flexible(child:   Text(
              value,
              style: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.w500, color: AppColor.primarySeedColor),
            ),)
          ],
        )
      ],
    );
  }
}
