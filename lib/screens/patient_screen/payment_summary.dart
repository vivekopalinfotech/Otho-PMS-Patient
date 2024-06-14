import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/get_patient_exam_by_patient_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/get_patient_exam_by_patient_id_state.dart';

class PaymentSummary extends StatefulWidget {
  final patientId;
  const PaymentSummary({super.key, this.patientId});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  int _currentIndex = 0;
  int totalIndex = 0;
  double val = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme
        .of(context)
        .brightness;

    return Card(
      color: brightness == Brightness.dark ? AppColor.blackColor : AppColor.whiteColor,
      child: BlocConsumer<GetPatientExamByPatientIdCubit, GetPatientExamByPatientIdState>(listener: (context, state) async {
        if (state is GetPatientExamByPatientIdSuccess) {}
        if (state is GetPatientExamByPatientIdError) {
          print(state.message);
        }
      }, builder: (context, state) {
        if (state is GetPatientExamByPatientIdSuccess) {
          return Column(
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(AppConstants.HP),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SvgPicture.asset('assets/images/payment_summary.svg', colorFilter: ColorFilter.srgbToLinearGamma(),),
                          SizedBox(width: 8),
                          Flexible(
                              child: Text(
                                'Payment Summary',
                                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: AppConstants.LARGE, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor,),
                              ))
                        ]),
                        SizedBox(height: 16),

                      Stack(
                        children: [
                         Container(
                        height: 200,width: double.maxFinite,
                           child:
                           Image.asset('assets/images/norecord.png',),
                         ),
                          Positioned(
                            top: 20,left: 0,right: 16,bottom: 0,
                            child: Center(
                              child: Text('No Record',style: GoogleFonts.inter(fontSize:AppConstants.XSMALL,color:AppColor.blackColor),),
                            )
                          )
                        ],
                      )
                      ],
                    ),
                  ),
                )
              ]);
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          );
        }
      }),
    );
  }


}