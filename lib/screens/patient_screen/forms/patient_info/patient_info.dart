import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/screens/patient_screen/forms/patient_info/emergency_contact.dart';
import 'primary_contact.dart';

class PatientInfo extends StatefulWidget {
  final patient;
  const PatientInfo({super.key, this.patient});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0,
              title: Text(
                'Patient Information',
                style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
              ),
              bottom: TabBar(labelPadding: EdgeInsets.all(8), padding: EdgeInsets.all(8), tabs: [
                Text('Primary Contact'),
                Text('Emergency Contact'),
              ]),
            ),
            body: TabBarView(
              children: [PrimaryContact(), EmergencyContact(patient:widget.patient)],
            )));
  }
}
