import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/screens/policy_screen.dart';

class PaymentSummary extends StatefulWidget {

  const PaymentSummary({super.key,});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {


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
     // color: brightness == Brightness.dark ? AppColor.blackColor : AppColor.whiteColor,
      child:  Column(
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
                              child:InkWell(
                                onTap: (){
                                  Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => PolicyScreen()));
                                },
                                child:  Text(
                                  'Payment Summary',
                                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: AppConstants.LARGE, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor,),
                                ),
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
              ])

    );
  }


}