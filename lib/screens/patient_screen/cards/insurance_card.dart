import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';

class Insurance extends StatefulWidget {
  final patientInsurance;
  const Insurance({super.key, this.patientInsurance});

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  int totalIndex = 0;
  double val = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;

    return Card(
     // color: brightness == Brightness.dark ? AppColor.blackColor : AppColor.whiteColor,
      child:  Column(children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(AppConstants.HP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      SvgPicture.asset(
                        'assets/images/insurance.svg',
                        color: AppColor.primarySeedColor,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                          child: Text(
                        'Insurance',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.LARGE,
                          color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor,
                        ),
                      ))
                    ]),
                    SizedBox(height: 16),
                    Text(
                      '${widget.patientInsurance.first.practiceInsuranceCompanyName}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.NORMAL,
                        color: AppColor.primarySeedColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/location.svg',color: brightness == Brightness.dark?AppColor.whiteColor:AppColor.blackColor),
                        SizedBox(width: 8),
                        Text(
                          '${widget.patientInsurance.first.practiceInsuranceCompanyAddress1},${widget.patientInsurance.first.practiceInsuranceCompanyCity},${widget.patientInsurance.first.practiceInsuranceCompanyState},${widget.patientInsurance.first.practiceInsuranceCompanyZipcode}',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL,),
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Image.asset('assets/images/phone.png', height: 24,color: brightness == Brightness.dark?AppColor.whiteColor:AppColor.blackColor),
                              SizedBox(width: 8),
                              Text(
                                '${widget.patientInsurance.first.practiceInsuranceCompanyPhone}',
                                style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL,),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColor.primarySeedColor.withOpacity(.1)),
                          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          child: Center(
                            child: Text(
                              widget.patientInsurance.first.isActive ? 'Active' : 'Inactive',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.SMALL,
                                color: AppColor.primarySeedColor,
                              ),
                            ),
                          ),
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
