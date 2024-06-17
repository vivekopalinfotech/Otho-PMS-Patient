import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/screens/dentist/dentist_profile.dart';
import 'package:ortho_pms_patient/screens/patient_screen/forms/primary_contact.dart';

class PatientCard extends StatefulWidget {
  final patient;
  const PatientCard({super.key, this.patient});

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  String abbreviation = '';

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    abbreviation = '${widget.patient.patientLastName.substring(0, 1).toUpperCase()}${widget.patient.patientFirstName.substring(0, 1).toUpperCase()}';


    List<PC> cards = [
      PC(
        'PC',
        widget.patient.hasPrimaryContact ? AppColor.successColor : AppColor.errorColor,
      ),
      PC('F', widget.patient.hasFinancialResponsiblePerson ? AppColor.successColor : AppColor.errorColor),
      PC('M', widget.patient.medicalHistoryStatus == 'Valid' ? AppColor.successColor : AppColor.errorColor),
      PC('CC', widget.patient.hasChiefComplaint ? AppColor.successColor : AppColor.errorColor),
      PC('I', widget.patient.hasInsurance ? AppColor.successColor : AppColor.errorColor),
    ];
    return Card(

      child: Container(
        padding: EdgeInsets.all(AppConstants.HP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle, color:AppColor.primarySeedColor.withOpacity(.2)),
                  child: Center(
                    child: Text(
                      abbreviation,
                      style: GoogleFonts.inter(color: AppColor.primarySeedColor
                          , fontSize: AppConstants.TITLE, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.patient.patientLastName},${widget.patient.patientFirstName}',
                      style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: AppConstants.NORMAL, color: brightness == Brightness.dark?AppColor.whiteColor:AppColor.blackColor),
                    ),
                    Text(
                      '${widget.patient.patientGender} - ${widget.patient.patientAge} years',
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL,),
                    )
                  ],
                ))
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.mail,

                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  '${widget.patient.patientPrimaryEmailAddress}',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL,),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset('assets/images/doctor.svg',color: brightness == Brightness.dark?AppColor.whiteColor:AppColor.blackColor,),
                SizedBox(width: 8),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  GestureDetector(

                    onTap: (){
                      showDialog(context: context, builder: (context) => DentistProfile());
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DentistProfile()));
                    },
                    child:   Text('${widget.patient.primaryDentistName}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: AppConstants.SMALL,
                          color: AppColor.primarySeedColor,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed,
                          decorationColor: AppColor.primarySeedColor,
                        )),
                  )
                  ],
                ))
              ],
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  height: 58,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.separated(
                    itemCount: cards.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if(index == 0){
                            Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => PrimaryContactForm()));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              decoration: BoxDecoration(
                                color: cards[index].color.withOpacity(.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  cards[index].title,
                                  style: GoogleFonts.inter(color: cards[index].color),
                                ),
                              ),
                            )
                          ],
                        )),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 8);
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class PC {
  final title;
  final color;

  PC(this.title, this.color);
}
