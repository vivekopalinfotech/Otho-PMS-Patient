import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/get_patient_exam_by_patient_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/get_patient_insurance_company_bloc.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_state.dart';
import 'package:ortho_pms_patient/screens/auth/login_screen.dart';
import 'package:ortho_pms_patient/screens/patient_screen/insurance.dart';
import 'package:ortho_pms_patient/screens/patient_screen/patient_card.dart';
import 'package:ortho_pms_patient/screens/patient_screen/patient_exam_card.dart';
import 'package:ortho_pms_patient/screens/patient_screen/payment_summary.dart';

import 'package:ortho_pms_patient/utils/app_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientScreen extends StatefulWidget {
  final email;
  const PatientScreen({super.key, this.email});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String abbreviation = '';

  List patientExam = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PatientCubit>(context).getPatientByEmail(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.email);

    return BlocListener<PatientCubit, PatientState>(
        listener: (context, state) async {
          if (state is PatientSuccess) {
            SharedPreferences sharedPreference = await SharedPreferences.getInstance();
            setState(() {
              sharedPreference.setString('practiceId', state.patientResponse.patient.first.practiceId.toString());
              sharedPreference.setString('practiceGuid', state.patientResponse.patient.first.patientGuid.toString());
            });

            BlocProvider.of<PatientByIdCubit>(context).getPatientById(state.patientResponse.patient.first.patientId.toString());
          }
          if (state is PatientError) {
            SharedPreferences sharedPreference = await SharedPreferences.getInstance();
            setState(() {
              sharedPreference.setString("login", 'false');
              Future.delayed(Duration(seconds: 2), () {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              });
            });
          }
        },
        child: BlocConsumer<PatientByIdCubit, PatientByIdState>(listener: (context, state) async {
          if (state is PatientByIdError) {
            print(state.message);
          }
          if (state is PatientByIdSuccess) {
            BlocProvider.of<GetPatientExamByPatientIdCubit>(context).getGetPatientExamByPatientId(state.patientByIdResponse.patientById.first.patientId);
            BlocProvider.of<GetPatientInsuranceCompanyCubit>(context).getGetPatientInsuranceCompany(state.patientByIdResponse.patientById.first.patientId);

            setState(() {
              abbreviation =
                  '${state.patientByIdResponse.patientById.first.patientLastName!.substring(0, 1).toUpperCase()}${state.patientByIdResponse.patientById.first.patientFirstName!.substring(0, 1).toUpperCase()}';
            });
          }
        }, builder: (context, state) {
          if (state is PatientByIdSuccess) {
            return Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('${state.patientByIdResponse.patientById.first.patientLastName} ${state.patientByIdResponse.patientById.first.patientFirstName}'),
                ),
                drawer: AppDrawer(
                  abbreviation: abbreviation,
                  email: state.patientByIdResponse.patientById.first.patientPrimaryEmailAddress,
                  name: '${state.patientByIdResponse.patientById.first.patientLastName} ${state.patientByIdResponse.patientById.first.patientFirstName}',
                  scaffoldKey: _scaffoldKey,
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.all(AppConstants.HP),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PatientCard(patient: state.patientByIdResponse.patientById.first),
                      SizedBox(height: 16),
                      PatientExamCard(patientId: state.patientByIdResponse.patientById.first.patientId),
                      SizedBox(height: 16),
                      PaymentSummary(
                        patientId: state.patientByIdResponse.patientById.first.patientId,
                      ),
                      SizedBox(height: 16),
                      Insurance(
                        patientId: state.patientByIdResponse.patientById.first.patientId,
                      )
                    ],
                  ),
                ));
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
        }));
  }
}
