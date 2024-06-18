import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ConstantLoader extends StatefulWidget {
  final baseColor;
  final highlightColor;
  final width;
  final double borderRadius;
  final double containerHeight;
  final  containerColor;
  final  type;
  const ConstantLoader({super.key, this.baseColor, this.highlightColor, required this.borderRadius, required this.containerHeight,  this.containerColor, this.width, this.type});

  @override
  State<ConstantLoader> createState() => _ConstantLoaderState();
}

class _ConstantLoaderState extends State<ConstantLoader> {
  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Shimmer.fromColors(
      baseColor: widget.baseColor != null ? widget.baseColor : brightness == Brightness.dark
          ?  AppColor.bgDarkColor.withOpacity(.3) : AppColor.secondaryLightColor.withOpacity(.5),
      highlightColor: widget.highlightColor != null
          ? widget.highlightColor
          : brightness == Brightness.dark
          ? AppColor.secondarySeedColor.withOpacity(.1)
          : AppColor.secondaryLightColor.withOpacity(.1),
      child: Card(
        child: Container(
          width: widget.width != null ? widget.width : double.maxFinite,

          height: widget.containerHeight,
          decoration: BoxDecoration(borderRadius:
          widget.type == 'only'?
          BorderRadius.only(
              topLeft: Radius.circular(widget.borderRadius),
              topRight: Radius.circular(widget.borderRadius)
          ):
          BorderRadius.circular(widget.borderRadius), color: widget.containerColor!= null?widget.containerColor:brightness == Brightness.dark?AppColor.blackColor:AppColor.whiteColor),
        ),
      ),
    );
  }
}
