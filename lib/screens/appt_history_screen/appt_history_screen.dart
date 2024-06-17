import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/screens/appt_history_screen/appointment.dart';
import 'package:ortho_pms_patient/screens/appt_history_screen/exam.dart';

class ApptHistoryScreen extends StatefulWidget {
  const ApptHistoryScreen({super.key});

  @override
  State<ApptHistoryScreen> createState() => _ApptHistoryScreenState();
}

class _ApptHistoryScreenState extends State<ApptHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Appointment History'),
              automaticallyImplyLeading: false,
              bottom: TabBar(
                  labelPadding: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8), tabs: [
                Text('Appointment History'),
                Text('Exam History'),
              ]),
            ),
            body: TabBarView(
              children: [
                Appointment(),
                ExamHistory(),
              ],
            )));
  }
}
