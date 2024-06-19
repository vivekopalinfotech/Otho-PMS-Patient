import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/history/patient_appointment_history_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/history/patient_appointment_history_state.dart';
import 'package:ortho_pms_patient/utils/loader/constant_loader.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  getData() async {
    String patientId = '';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    patientId = preferences.getString('patientId').toString();
    BlocProvider.of<GetPatientAppointmentHistoryCubit>(context).getGetPatientAppointmentHistory(patientId);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List appointment = [];
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      _refreshController.loadComplete();
    });
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetPatientAppointmentHistoryCubit, GetPatientAppointmentHistoryState>(
        listener: (context, state) async {
          if (state is GetPatientAppointmentHistoryError) {
            print(state.message);
          }
          if (state is GetPatientAppointmentHistorySuccess) {
            appointment.clear();
            setState(() {
              isLoading = false;
              appointment.addAll(state.patientAppointmentResponse.appointment);
            });
          }
        },
        child: isLoading
            ? LoadingList()
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                enableTwoLevel: false,
                footer: CustomFooter(
                  builder: (context, mode) {
                    return SizedBox();
                  },
                ),
                header: ClassicHeader(
                  completeText: '',
                  idleText: '',
                  releaseText: '',
                  refreshingText: '',
                  idleIcon: Icon(Icons.refresh),
                  completeIcon: CupertinoActivityIndicator(),
                  refreshingIcon: CupertinoActivityIndicator(),
                ),
                onRefresh: () async {
                  String patientId = '';
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  patientId = preferences.getString('patientId').toString();
                  BlocProvider.of<GetPatientAppointmentHistoryCubit>(context).getGetPatientAppointmentHistory(patientId).whenComplete(() => setState(() {
                        _refreshController.refreshCompleted();
                      }));
                },
                onLoading: _onLoading,
                controller: _refreshController,
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: appointment.length,
                  padding: EdgeInsets.all(AppConstants.HP),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _rowBuild('APPOINTMENT DATE', "${AppConstants.convertDate(appointment[index].patientAppointmentTime.toString())}", 'APPOINTMENT NAME',
                                "${appointment[index].practiceAppointmentName}"),
                            SizedBox(height: 8),
                            _rowBuild('PROVIDER NAME', "${appointment[index].providerName}", 'CONFIRMED', "${appointment[index].isAppointmentConfirmed ? 'Yes' : 'No'}"),
                            SizedBox(height: 8),
                            _rowBuild('NOTES', "${appointment[index].providerNotes}", 'LOCATION', "${appointment[index].practiceLocationName}"),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 16);
                  },
                )));
  }

  Widget _rowBuild(item1, value1, item2, value2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: _item(item1, value1),
        ),
        Flexible(
          child: _item(item2, value2),
        )
      ],
    );
  }

  Widget _item(key, value) {
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
            Flexible(
              child: Text(
                value,
                style: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
