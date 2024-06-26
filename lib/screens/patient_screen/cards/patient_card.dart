import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/dentist/dentist_profile_cubit.dart';
import 'package:ortho_pms_patient/bloc/dentist/dentist_profile_state.dart';
import 'package:ortho_pms_patient/screens/dentist/dentist_profile.dart';
import 'package:ortho_pms_patient/screens/patient_screen/forms/chief_complaint.dart';
import 'package:ortho_pms_patient/screens/patient_screen/forms/frp.dart';
import 'package:ortho_pms_patient/screens/patient_screen/forms/insurance.dart';
import 'package:ortho_pms_patient/screens/patient_screen/forms/medical_history.dart';
import 'package:ortho_pms_patient/screens/patient_screen/forms/patient_info/patient_info.dart';
import 'package:ortho_pms_patient/screens/patient_screen/forms/referral.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';

class PatientCard extends StatefulWidget {
  final patient;
  const PatientCard({super.key, this.patient});

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  String abbreviation = '';
  List dentist = [];

  @override
  void initState() {
    super.initState();

  }
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
      PC('R', widget.patient.hasReferral ? AppColor.successColor : AppColor.errorColor),
    ];
    return Card(
      child: Container(
        padding: EdgeInsets.all(AppConstants.HP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                circleTitle(abbreviation, 50, 50, AppConstants.TITLE, AppColor.primaryColor.withOpacity(.2)),
                SizedBox(width: 8),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.patient.patientLastName},${widget.patient.patientFirstName}',
                      style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: AppConstants.NORMAL, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor),
                    ),
                    Text(
                      '${widget.patient.patientGender} - ${widget.patient.patientAge} years ${AppConstants.calculateDateDifference(widget.patient.patientDob.toString())}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: AppConstants.SMALL,
                      ),
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
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstants.SMALL,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            widget.patient.patientAddress1!='null' && widget.patient.patientState!= 'null'?
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                ),
                SizedBox(width: 8),
                Flexible(child: Text(
                  '${widget.patient.patientAddress1}, ${widget.patient.patientCity}, ${widget.patient.patientState}, ${widget.patient.patientZip}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstants.SMALL,
                  ),
                ))
              ],
            ):SizedBox(),
            SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/doctor.svg',
                  color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor,
                ),
                SizedBox(width: 8),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async{
                      await  BlocProvider.of<DentistProfileCubit>(context).dentistProfile(widget.patient.primaryDentistId);
                        showDialog(context: context, builder: (context) =>
                            BlocConsumer<DentistProfileCubit, DentistProfileState>(listener: (context, state) async {
                              if (state is DentistProfileSuccess) {

                              }},builder: (context,state){
                              if (state is DentistProfileSuccess) {
                                return DentistProfile(dentist: state.dentistProfileResponse.dentist);
                              }else {
                                return SizedBox();
                              }
                            },
                            ));
                        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DentistProfile()));
                      },
                      child: Text('${widget.patient.primaryDentistName}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: AppConstants.SMALL,
                            color: AppColor.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                            decorationColor: AppColor.primaryColor,
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
                          if (index == 0) {
                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => PatientInfo(patient:widget.patient)));
                          } else if (index == 1) {
                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FRP(dob:AppConstants.checkAdult(widget.patient.patientDob.toString()))));
                          } else if (index == 2) {
                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => MedicalHistoryForm()));
                          } else if (index == 3) {
                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => ChiefComplaint()));
                          }else if (index == 4) {
                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => InsuranceForm(patientName: '${widget.patient.patientLastName},${widget.patient.patientFirstName}')));
                          } else if (index == 5) {
                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => Referral()));
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
