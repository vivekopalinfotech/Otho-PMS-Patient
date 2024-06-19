import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/dentist/get_dentist_cubit.dart';
import 'package:ortho_pms_patient/bloc/dentist/get_dentist_state.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_patient_referral_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_patient_referral_detail_state.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_referral_categories_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_referral_categories_state.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_referral_sub_category_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/get_referral_sub_category_state.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/save_patient_referral_detail_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/save_patient_referral_detail_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';

class Referral extends StatefulWidget {
  const Referral({super.key});

  @override
  State<Referral> createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  String selectedCategory = "My Dentist";
  String referralNotesPass = "";
  var referralSubCategoryIdPass;
  var referredDentistIdPass;
  var selectedCategoryId;
  var selectedSubCategory;
  var selectedSubCategoryId;
  String? selectedDentist;
  int? selectedDentistId;
  List dentists = [];
  List categories = [];
  List socialMedia = [];
  List advertisement = [];
  List internetSearch = [];
  TextEditingController friendFamilyController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  TextEditingController referralNotesController = TextEditingController();
  bool isLoading = false;
  bool alert = false;
  Future getData() async {
    BlocProvider.of<GetReferralCategoryCubit>(context).GetReferralCategory();
    BlocProvider.of<GetDentistCubit>(context).GetDentist();
    BlocProvider.of<GetReferralSubCategoryCubit>(context).GetReferralSubCategory();
  }

  @override
  void initState() {
    super.initState();
    getData().whenComplete(() => BlocProvider.of<GetPatientReferralDetailCubit>(context).GetPatientReferralDetail());
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    var maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              'Referral Information',
              style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
            )),
        body: MultiBlocListener(
            listeners: [
              BlocListener<GetReferralCategoryCubit, GetReferralCategoryState>(listener: (context, state) async {
                if (state is GetReferralCategorySuccess) {
                  setState(() {
                    categories.addAll(state.getReferralCategoryResponse.referralCategory);
                  });
                }
                if (state is GetReferralCategoryLoading) {}
                if (state is GetReferralCategoryError) {}
              }),
              BlocListener<GetReferralSubCategoryCubit, GetReferralSubCategoryState>(listener: (context, state) async {
                if (state is GetReferralSubCategorySuccess) {
                  socialMedia.clear();
                  advertisement.clear();
                  internetSearch.clear();
                  setState(() {
                    socialMedia.addAll(state.getReferralSubCategoryResponse.referralSubCategory.where((element) => element.referralCategoryName == 'Social Media').toList());
                    advertisement.addAll(state.getReferralSubCategoryResponse.referralSubCategory.where((element) => element.referralCategoryName == 'Advertisement').toList());
                    internetSearch.addAll(state.getReferralSubCategoryResponse.referralSubCategory.where((element) => element.referralCategoryName == 'Internet Search').toList());
                  });
                }
                if (state is GetReferralSubCategoryLoading) {}
                if (state is GetReferralSubCategoryError) {}
              }),
              BlocListener<GetDentistCubit, GetDentistState>(listener: (context, state) async {
                if (state is GetDentistSuccess) {
                  setState(() {
                    dentists.addAll(state.getDentistResponse.dentist);
                  });
                }
                if (state is GetDentistLoading) {}
                if (state is GetDentistError) {}
              }),
              BlocListener<SavePatientReferralDetailCubit, SavePatientReferralDetailState>(listener: (context, state) async {
                if (state is SavePatientReferralDetailSuccess) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pop(context);
                }
                if (state is SavePatientReferralDetailLoading) {
                  setState(() {
                    isLoading = true;
                  });
                }
                if (state is SavePatientReferralDetailError) {
                  setState(() {
                    isLoading = false;
                  });
                }
              }),
            ],
            child: BlocConsumer<GetPatientReferralDetailCubit, GetPatientReferralDetailState>(
              listener: (context, state) async {
                if (state is GetPatientReferralDetailSuccess) {
                  setState(() {
                    selectedCategory = state.patientReferralDetailResponse.referralCategoryName;
                    selectedCategoryId = state.patientReferralDetailResponse.referralCategoryId;
                    selectedDentistId = state.patientReferralDetailResponse.referredDentistId;

                    if (state.patientReferralDetailResponse.referralCategoryName == 'Social Media' ||
                        state.patientReferralDetailResponse.referralCategoryName == 'Advertisement' ||
                        state.patientReferralDetailResponse.referralCategoryName == 'Internet Search') {
                      selectedSubCategoryId = state.patientReferralDetailResponse.referralSubCategoryId;
                      selectedSubCategory = state.patientReferralDetailResponse.referralSubCategoryName;
                    }
                    selectedDentist = '${state.patientReferralDetailResponse.dentistLastName}, ${state.patientReferralDetailResponse.dentistFirstName}';
                    referralNotesController.text = state.patientReferralDetailResponse.referralNotes;
                  });
                }
                if (state is GetPatientReferralDetailLoading) {}
                if (state is GetPatientReferralDetailError) {}
              },
              builder: (context, state) {
                if (state is GetPatientReferralDetailSuccess) {
                  return isLoading
                      ? ReferralLoading()
                      : Stack(children: [
                          Container(
                              height: maxHeight,
                              width: double.maxFinite,
                              child: SingleChildScrollView(
                                  padding: EdgeInsets.all(AppConstants.HP),
                                  child: Column(children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text('Whom may we thank for referring you to our office?',
                                          style: GoogleFonts.inter(
                                              fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      SizedBox(height: 16),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: categories.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              setState(() {
                                                referralNotesController.clear();
                                                selectedCategory = categories[index].referralCategoryName;
                                                selectedCategoryId = categories[index].referralCategoryId;
                                              });
                                              BlocProvider.of<GetReferralSubCategoryCubit>(context).GetReferralSubCategory();
                                            },
                                            child: radioButton(
                                              selectedCategory == categories[index].referralCategoryName,
                                              categories[index].referralCategoryName,
                                            ),
                                          );
                                        },
                                      ),
                                    ]),
                                    SizedBox(height: 16),
                                    Card(
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: EdgeInsets.all(16),
                                          child: selectedCategory == 'My Dentist'
                                              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                  Text('Dentist',
                                                      style: GoogleFonts.inter(
                                                          fontSize: AppConstants.NORMAL,
                                                          fontWeight: FontWeight.bold,
                                                          color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                                  SizedBox(height: 8),
                                                  Container(
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColor.secondarySeedColor)),
                                                      child: DropdownButton<String>(
                                                        isDense: false,
                                                        itemHeight: 50,
                                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                                                        borderRadius: BorderRadius.circular(4),
                                                        hint: Text('Select Dentist'),
                                                        alignment: Alignment.centerLeft,
                                                        isExpanded: true,
                                                        underline: SizedBox(),
                                                        value: selectedDentist,
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            selectedDentist = newValue.toString();
                                                            selectedDentistId = dentists.firstWhere((element) => element.dentistFullName == selectedDentist).dentistId;
                                                          });
                                                        },
                                                        items: dentists.map((dynamic dentist) {
                                                          return DropdownMenuItem<String>(
                                                            value: dentist.dentistFullName,
                                                            child: Text(dentist.dentistFullName),
                                                          );
                                                        }).toList(),
                                                      ))
                                                ])
                                              : selectedCategory == 'Social Media'
                                                  ? _subCategories('Which social media app?', socialMedia)
                                                  : selectedCategory == 'Advertisement'
                                                      ? _subCategories('Where did you see/hear about us?', advertisement)
                                                      : selectedCategory == 'Internet Search'
                                                          ? _subCategories('How did you find us online?', internetSearch)
                                                          : selectedCategory == 'Friend / Family'
                                                              ? _textFieldCategories('Whom may we thank for referring you to our office field?', 'First Name, Last Name', friendFamilyController)
                                                              : selectedCategory == 'Other'
                                                                  ? _textFieldCategories(
                                                                      "What's the other way you heard about our practice?", "What's the other way you heard about our practice?", otherController)
                                                                  : SizedBox(),
                                        )),
                                    SizedBox(height: 60),
                                  ]))),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: ElevatedButton(
                                onPressed: () {
                                  print(state.patientReferralDetailResponse.patientReferralId);
                                  print(selectedCategoryId);
                                  referralSubCategoryIdPass = selectedCategoryId == 1 ? null : selectedSubCategoryId;
                                  print(referralSubCategoryIdPass);
                                  referredDentistIdPass = (selectedCategoryId == 1 ? selectedDentistId : null);
                                  print(referredDentistIdPass);

                                  BlocProvider.of<SavePatientReferralDetailCubit>(context).savePatientReferralDetails(
                                      state.patientReferralDetailResponse.patientReferralId, selectedCategoryId, referralNotesController.text, referralSubCategoryIdPass, referredDentistIdPass);
                                },
                                child: Text('Save Referral Information')),
                          )
                        ]);
                } else {
                  return ReferralLoading();
                }
              },
            )));
  }

  Widget _textFieldCategories(title, hint, controller) {
    var brightness = Theme.of(context).brightness;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
      SizedBox(height: 16),
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: ConstantTextFormField(
          hint,
          controller,
          TextInputType.text,
          hideTitle: true,
          alertText: alert ? selectedCategory : null,
        ),
      ),
    ]);
  }

  Widget _subCategories(title, list) {
    var brightness = Theme.of(context).brightness;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
      SizedBox(height: 16),
      _items(list),
      ConstantTextFormField('Referral Detail', referralNotesController, TextInputType.text)
    ]);
  }

  Widget _items(list) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, childAspectRatio: 3),
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedSubCategory = list[index].referralSubCategoryName;
              selectedSubCategoryId = list[index].referralSubCategoryId;
            });
          },
          child: radioButton(
            selectedSubCategoryId == list[index].referralSubCategoryId,
            list[index].referralSubCategoryName,
          ),
        );
      },
    );
  }
}
