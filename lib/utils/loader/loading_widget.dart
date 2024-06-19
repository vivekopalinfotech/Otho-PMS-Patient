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


class ReferralLoading extends StatefulWidget {
  const ReferralLoading({super.key});

  @override
  State<ReferralLoading> createState() => _ReferralLoadingState();
}

class _ReferralLoadingState extends State<ReferralLoading> {
  @override
  Widget build(BuildContext context) {
    return  Container(

        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap:  true,
          itemCount: 3,
          padding: EdgeInsets.symmetric(horizontal:AppConstants.HP,vertical: AppConstants.HP),
          itemBuilder: (BuildContext context, int index) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ConstantLoader(borderRadius: 0.0, containerHeight: 16.0),
              ConstantLoader(borderRadius: 0.0, containerHeight: 16.0,width: 200.0,),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return   ConstantLoader(borderRadius: 0.0, containerHeight: 25.0);
                },
              ),]);
          }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
        },
        ));
  }
}


class FieldsLoading extends StatefulWidget {
  const FieldsLoading({super.key});

  @override
  State<FieldsLoading> createState() => _FieldsLoadingState();
}

class _FieldsLoadingState extends State<FieldsLoading> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemBuilder: (context,index){
      return  Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
       ConstantLoader(borderRadius: 0.0, containerHeight: 14.0,width: 100.0,),
        SizedBox(height: 8),
            ConstantLoader(borderRadius: 10.0, containerHeight: 50.0),
      ]);
    }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
    },);
  }
}
