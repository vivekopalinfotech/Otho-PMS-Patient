import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/utils/loader/constant_loader.dart';

class LoadingList extends StatelessWidget {
  final height;
  const LoadingList({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      padding: EdgeInsets.all(AppConstants.HP),
      itemBuilder: (context, index) {
        return  ConstantLoader(borderRadius: 10.0,containerHeight: height??135.0,);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 16);
      },
    );
  }
}


class DashboardLoading extends StatelessWidget {
  const DashboardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.HP),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstantLoader(borderRadius: 10.0, containerHeight: 200.0),
              SizedBox(height: 16),
              ConstantLoader(borderRadius: 10.0, containerHeight: 180.0),
              SizedBox(height: 16),
              ConstantLoader(borderRadius: 10.0, containerHeight: 220.0),
              SizedBox(height: 16),
              ConstantLoader(borderRadius: 10.0, containerHeight: 150.0)
            ],
          ),
        )
    );
  }
}
