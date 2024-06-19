import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';

class PatientExamCard extends StatefulWidget {
  final patientExam;
  const PatientExamCard({super.key, this.patientExam,});

  @override
  State<PatientExamCard> createState() => _PatientExamCardState();
}

class _PatientExamCardState extends State<PatientExamCard> {
  int _currentIndex = 0;
  int totalIndex = 0;
  double val = 0.0;
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;

    return Card(
    
      child:  Column(
            children: [
              CarouselSlider.builder(
                carouselController: carouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  autoPlayInterval: const Duration(seconds: 4),
                  enlargeCenterPage: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayInFiniteScroll: true,
                  pauseAutoPlayOnTouch: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                itemCount: widget.patientExam.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  totalIndex = index;
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(AppConstants.HP),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            SvgPicture.asset(
                              'assets/images/doctor.svg',
                              color: AppColor.primaryColor,
                            ),
                            SizedBox(width: 8),
                            Flexible(
                                child: Text(
                              '${widget.patientExam[_currentIndex].providerName}',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.NORMAL,
                                color: AppColor.primaryColor,
                              ),
                            ))
                          ]),
                          SizedBox(height: 8),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Flexible(
                                  child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColor.primaryColor.withOpacity(.06)),
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: AppColor.primaryColor.withOpacity(0.3),
                                    inactiveTrackColor: AppColor.primaryColor.withOpacity(0.3),
                                    trackShape: RoundedRectSliderTrackShape(),
                                    trackHeight: 4.0,
                                    disabledInactiveTickMarkColor: Colors.transparent,
                                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0, disabledThumbRadius: 16),
                                    thumbColor: AppColor.primaryColor,
                                    overlayColor: AppColor.primaryColor.withAlpha(32),
                                    overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                                    tickMarkShape: RoundSliderTickMarkShape(),
                                    activeTickMarkColor: Colors.transparent,
                                    inactiveTickMarkColor: Colors.transparent,
                                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: AppColor.primaryColor,
                                    valueIndicatorTextStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Slider(
                                    value: val,
                                    min: -10,
                                    max: 10,
                                    divisions: 6,
                                    label: val.round().toString(),
                                    onChanged: (value) {
                                      setState(() {
                                        val = value;
                                      });
                                    },
                                  ),
                                ),
                              )),
                              SizedBox(width: 16),
                              Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColor.primaryColor.withOpacity(.1)),
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                  child: Column(
                                    children: [
                                      Text(
                                        '# ${AppConstants.formatedDate(widget.patientExam[_currentIndex].patientExamDate.toString())}',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppConstants.SMALL,
                                        ),
                                      ),
                                      Text(
                                        'Exam Date',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/images/location.svg',color: brightness == Brightness.dark?AppColor.whiteColor:AppColor.blackColor),
                                    SizedBox(width: 8),
                                    Text(
                                      '${widget.patientExam[_currentIndex].practiceLocationName}',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL,),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    Text(
                                      '\$',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.LARGE,),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '${widget.patientExam[_currentIndex].hasServiceContract == false ? 'No Contract' : ''}',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL,),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/heartbeat.svg', color: brightness == Brightness.dark?AppColor.whiteColor:AppColor.blackColor ),
                              SizedBox(width: 8),
                              Text(
                                'No Active treatment - (0 To 0)',
                                style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              _buildDot(widget.patientExam.length)
            ],
          )
    );
  }

  Widget _buildDot(length) {
    var brightness = Theme.of(context).brightness;

    return Container(
      height: 10,
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: 16),
      child: Align(
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    carouselController.animateToPage(
                      index,
                      curve: Curves.easeIn,
                    );
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: index == _currentIndex ? 25 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: index == _currentIndex
                          ? AppColor.primaryColor
                          : brightness == Brightness.dark
                              ? AppColor.secondaryDarkColor
                              : AppColor.secondaryLightColor,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class PC {
  final title;
  final color;

  PC(this.title, this.color);
}
