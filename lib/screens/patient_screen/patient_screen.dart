import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_exam/get_patient_exam_by_patient_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/get_patient_insurance_company_bloc.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/get_patient_insurance_company_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_exam/get_patient_exam_by_patient_id_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_state.dart';
import 'package:ortho_pms_patient/screens/auth/login_screen.dart';
import 'package:ortho_pms_patient/screens/patient_screen/cards/insurance_card.dart';
import 'package:ortho_pms_patient/screens/patient_screen/cards/patient_card.dart';
import 'package:ortho_pms_patient/screens/patient_screen/cards/patient_exam_card.dart';
import 'package:ortho_pms_patient/screens/patient_screen/cards/payment_summary_card.dart';
import 'package:ortho_pms_patient/utils/app_drawer.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';
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

  List patient = [];
  List patientExam = [];
  List patientInsurance = [];
  bool isLoading = true;
  bool isRefreshing = false;



  Future<void> _refreshData(patientId) async {
    setState(() {
      isRefreshing = true;
    });
    final patientCubit = BlocProvider.of<PatientCubit>(context);
    final examCubit = BlocProvider.of<GetPatientExamByPatientIdCubit>(context);
    final insuranceCubit = BlocProvider.of<GetPatientInsuranceCompanyCubit>(context);

    await patientCubit.getPatientByEmail(widget.email);

    await Future.wait([
      examCubit.getGetPatientExamByPatientId(patientId),
      insuranceCubit.getGetPatientInsuranceCompany(patientId),
    ]).whenComplete(() => setState(() {
          isRefreshing = false;
        }));
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PatientCubit>(context).getPatientByEmail(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.email);

    return MultiBlocListener(
        listeners: [
          BlocListener<PatientCubit, PatientState>(listener: (context, state) async {
            if (state is PatientSuccess) {
              SharedPreferences sharedPreference = await SharedPreferences.getInstance();
              setState(() {
                sharedPreference.setString('practiceId', state.patientResponse.patient.first.practiceId.toString());
                sharedPreference.setString('practiceGuid', state.patientResponse.patient.first.patientGuid.toString());
                sharedPreference.setString('patientId', state.patientResponse.patient.first.patientId.toString());
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
          }),
          BlocListener<PatientByIdCubit, PatientByIdState>(listener: (context, state) async {
            if (state is PatientByIdError) {
              print(state.message);
            }
            if (state is PatientByIdSuccess) {
              BlocProvider.of<GetPatientExamByPatientIdCubit>(context).getGetPatientExamByPatientId(state.patientByIdResponse.patientById.first.patientId);
              BlocProvider.of<GetPatientInsuranceCompanyCubit>(context).getGetPatientInsuranceCompany(state.patientByIdResponse.patientById.first.patientId);
              patient.clear();
              setState(() {
                patient.addAll(state.patientByIdResponse.patientById);
                abbreviation =
                    '${state.patientByIdResponse.patientById.first.patientLastName!.substring(0, 1).toUpperCase()}${state.patientByIdResponse.patientById.first.patientFirstName!.substring(0, 1).toUpperCase()}';
              });
            }
          }),
          BlocListener<GetPatientExamByPatientIdCubit, GetPatientExamByPatientIdState>(listener: (context, state) async {
            if (state is GetPatientExamByPatientIdSuccess) {
              patientExam.clear();
              setState(() {
                patientExam.addAll(state.patientExamByPatientIdResponse.patientExam);
              });
            }
            if (state is GetPatientExamByPatientIdError) {
              print(state.message);
            }
          }),
          BlocListener<GetPatientInsuranceCompanyCubit, GetPatientInsuranceCompanyState>(listener: (context, state) async {
            if (state is GetPatientInsuranceCompanySuccess) {
              patientInsurance.clear();
              setState(() {
                isLoading = false;
                patientInsurance.addAll(state.insuranceResponse.insurance);
              });
            }
            if (state is GetPatientInsuranceCompanyError) {
              print(state.message);
            }
          }),
        ],
        child: isLoading
            ? DashboardLoading()
            : Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(centerTitle: true, title: Text('${patient.first.patientLastName} ${patient.first.patientFirstName}', style: GoogleFonts.inter(fontSize: AppConstants.HEADING3))),
                drawer: AppDrawer(
                  abbreviation: abbreviation,
                  email: patient.first.patientPrimaryEmailAddress,
                  name: '${patient.first.patientLastName} ${patient.first.patientFirstName}',
                  scaffoldKey: _scaffoldKey,
                ),
                body:

                    CustomRefreshIndicator(
                        onRefresh: () async {
                          await _refreshData(patient.first.patientId);
                        },
                        builder: (BuildContext context, Widget child, IndicatorController controller) {
                          return Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              if (controller.isDragging || controller.isArmed || controller.isLoading || isRefreshing)
                                Positioned(
                                  top: 35.0 * controller.value, // Indicator movement
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: CupertinoActivityIndicator(),
                                  ),
                                ),
                              Transform.translate(
                                offset: Offset(0, 100.0 * controller.value),
                                child: child,
                              ),
                            ],
                          );
                        },
                        child: SingleChildScrollView(
                          primary: false,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(AppConstants.HP),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PatientCard(patient: patient.first),
                              SizedBox(height: 16),
                              patientExam.isNotEmpty?PatientExamCard(patientExam: patientExam):SizedBox(),
                              SizedBox(height: 16),
                              PaymentSummary(),
                              SizedBox(height: 16),
                              patientInsurance.isNotEmpty? Insurance(patientInsurance: patientInsurance, patient: patient.first):SizedBox()
                            ],
                          ),
                        ))));
  }
}
