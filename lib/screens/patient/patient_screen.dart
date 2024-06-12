import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientScreen extends StatefulWidget {
  final email;
  const PatientScreen({super.key, this.email});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  String abbreviation = '';
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PatientCubit>(context).getPatient(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return  BlocConsumer<PatientCubit, PatientState>(listener: (context, state) async {
      if (state is PatientError) {
        showSnackBar(context, state.message);

      }
      if (state is PatientError) {

      }
      if (state is PatientSuccess) {

        setState(() {
          abbreviation = '${state.patientResponse.patient.first.patientLastName.substring(0, 1).toUpperCase()}${state.patientResponse.patient.first.patientFirstName.substring(0, 1).toUpperCase()}';

        });
      }
    }, builder: (context, state) {
    if (state is PatientSuccess) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '${state.patientResponse.patient.first.patientLastName} ${state.patientResponse.patient.first.patientFirstName}'
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.HP),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: colorScheme.onPrimary,
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
                            decoration: BoxDecoration(shape: BoxShape.circle, color: evenItemColor),
                            child: Center(
                              child: Text(
                                abbreviation,
                                style: GoogleFonts.inter(color: colorScheme.primary, fontSize: AppConstants.TITLE, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                         Flexible(child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text( '${state.patientResponse.patient.first.patientLastName},${state.patientResponse.patient.first.patientFirstName}',
                               style: GoogleFonts.inter(fontWeight:FontWeight.bold,fontSize:AppConstants.NORMAL,color:colorScheme.onSurface),),
                             Text( '${state.patientResponse.patient.first.patientGender} - ${state.patientResponse.patient.first.patientAge} years',
                               style: GoogleFonts.inter(fontWeight:FontWeight.w500,fontSize:AppConstants.SMALL,color:colorScheme.secondary),)
                           ],
                         ))
                        ],
                      ),
                      SizedBox(height: 8),
             Row(
               children: [
                 Icon(Icons.mail,color: colorScheme.secondary,size: 18,),
                 Text( ' ${state.patientResponse.patient.first.patientPrimaryEmailAddress}',
                   style: GoogleFonts.inter(fontWeight:FontWeight.w500,fontSize:AppConstants.SMALL,color:colorScheme.secondary),)
               ],
             ),  
                      SizedBox(height: 8),
             Row(
               children: [
               SvgPicture.asset('assets/images/doctor.svg',),
                 Text( ' ${state.patientResponse.patient.first.primaryDentistName}',
                   style: GoogleFonts.inter(fontWeight:FontWeight.w500,fontSize:AppConstants.SMALL,color:colorScheme.secondary,),)
               ],
             ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ));
    }else{
      return CircularProgressIndicator();
    }
    });
  }
}
