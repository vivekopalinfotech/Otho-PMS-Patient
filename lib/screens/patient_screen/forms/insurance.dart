import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/save_patient_frp_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/save_patient_frp_state.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/get_patient_insurance_company_bloc.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/get_patient_insurance_company_state.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/practice_insurance_companies_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/practice_insurance_companies_state.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_state.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_exam/get_patient_exam_by_patient_id_cubit.dart';
import 'package:ortho_pms_patient/bloc/states/get_states_cubit.dart';
import 'package:ortho_pms_patient/bloc/states/get_states_state.dart';
import 'package:ortho_pms_patient/utils/constant_widgets.dart';
import 'package:ortho_pms_patient/utils/constatnt_textformfield.dart';
import 'package:ortho_pms_patient/utils/loader/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsuranceForm extends StatefulWidget {
  final patientName;

  const InsuranceForm({
    super.key,
    this.patientName,
  });

  @override
  State<InsuranceForm> createState() => _InsuranceFormState();
}

class _InsuranceFormState extends State<InsuranceForm> {
  TextEditingController policyHolderMemberController = TextEditingController();
  TextEditingController socialSecurityMemberController = TextEditingController();
  TextEditingController prefixController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController suffixController = TextEditingController();

  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneExtController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController secondaryPhoneController = TextEditingController();
  TextEditingController secondaryPhoneExtController = TextEditingController();
  TextEditingController grpPlanController = TextEditingController();
  TextEditingController grpEmpNameController = TextEditingController();
  var selected;
  List<String> primaryPhone = ['Home', 'Work', 'Mobile'];
  List<String> relation = ['Spouse', 'Parent', 'Child', 'sibling', 'Friend', 'Colleague', 'Other', 'Dependant'];
  List<String> gender = ['Female', 'Male', 'Other'];
  List<String> networkType = ['DHMO', 'PPO', 'Premier'];
  List<String> prefixes = [
    'Mr.',
    'Mrs.',
    'Ms.',
    'Dr.',
    'Prof.',
    'Miss.',
    'Sir.',
  ];
  List states = [];
  var secondaryPhoneType;
  var selectedPhoneType;
  var relationship;
  var selectedRelationship;
  var selectedGender;
  var selectedFrp;
  bool isWarned = false;
  bool isAlert = false;

  bool currentCompany = true;
  bool isPatient = true;
  bool isPatientAdd = true;
  bool add = false;
  bool isLoading = true;
  List patient = [];
  String? selectedCompany;
  String? selectedCompanyPhone;
  var selectedCompanyId;
  String? selectedCompanyAddress;
  String? selectedCompanyAddress1;
  String? selectedCompanyAddress2;
  String? selectedCompanyCity;
  String? selectedCompanyState;
  String? selectedCompanyZipCode;
  String? selectedPrefix;
  String? selectedState;
  String? selectedNetWorkType;
  List patientInsurance = [];
  List patientInsuranceCompanies = [];
  bool isPrimary = false;
  bool readOnly = true;
  var patientId;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    patientId = preferences.getString('patientId');
    BlocProvider.of<GetStatesCubit>(context).getStates();
    BlocProvider.of<GetPatientInsuranceCompanyCubit>(context).getGetPatientInsuranceCompany(patientId);
    BlocProvider.of<PracticeInsuranceCompanyCubit>(context).getPracticeInsuranceCompany();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    var maxHeight = MediaQuery.of(context).size.height;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              'Patient Insurance',
              style: GoogleFonts.inter(fontSize: AppConstants.HEADING3),
            )),
        body: MultiBlocListener(
          listeners: [
            BlocListener<GetPatientInsuranceCompanyCubit, GetPatientInsuranceCompanyState>(listener: (context, state) async {
              if (state is GetPatientInsuranceCompanySuccess) {
                patientInsurance.clear();
                setState(() {
                  patientInsurance.addAll(state.insuranceResponse.insurance);

              if(patientInsurance.isNotEmpty){
                isPrimary = patientInsurance.first.isPrimary;
                selectedCompanyId = patientInsurance.first.practiceInsuranceCompanyId;
                selectedCompany =
                '${patientInsurance.first.practiceInsuranceCompanyName} - ${patientInsurance.first.practiceInsuranceCompanyAddress1},${patientInsurance.first.practiceInsuranceCompanyCity},${patientInsurance.first.practiceInsuranceCompanyState},${patientInsurance.first.practiceInsuranceCompanyZipcode}';
                selectedCompanyPhone = patientInsurance.first.practiceInsuranceCompanyPhone;
                selectedCompanyAddress =
                '${patientInsurance.first.practiceInsuranceCompanyAddress1},${patientInsurance.first.practiceInsuranceCompanyCity},${patientInsurance.first.practiceInsuranceCompanyState},${patientInsurance.first.practiceInsuranceCompanyZipcode}';
                selectedCompanyAddress1 = patientInsurance.first.practiceInsuranceCompanyAddress1;
                selectedCompanyAddress2 = patientInsurance.first.practiceInsuranceCompanyAddress2;
                selectedCompanyCity = patientInsurance.first.practiceInsuranceCompanyCity;
                selectedCompanyState = patientInsurance.first.practiceInsuranceCompanyState;
                selectedCompanyZipCode = patientInsurance.first.practiceInsuranceCompanyZipcode;
                selectedNetWorkType = patientInsurance.first.networkType;
                grpPlanController.text = patientInsurance.first.subscriberGroupPlanNumber;
                grpEmpNameController.text = patientInsurance.first.groupEmployerName;
              }else{
                add = true;

              }
                  isLoading = false;
                });
              }
              if (state is GetPatientInsuranceCompanyError) {
                print(state.message);
              }
            }),
            BlocListener<PracticeInsuranceCompanyCubit, PracticeInsuranceCompanyState>(listener: (context, state) async {
              if (state is PracticeInsuranceCompanySuccess) {
                setState(() {
                  patientInsuranceCompanies.addAll(state.practiceInsuranceCompanyResponse.practiceInsuranceCompany);
                });
              }
              if (state is PracticeInsuranceCompanyError) {
                print(state.message);
              }
            }),
            BlocListener<GetStatesCubit, GetStatesState>(listener: (context, state) async {
              if (state is GetStatesSuccess) {
                setState(() {
                  states.addAll(state.statesResponse.states);
                });
              }
              if (state is GetStatesError) {
                print(state.message);
              }
            }),
            BlocListener<SavePatientInsuranceCubit, SavePatientInsuranceState>(listener: (context, state) async {
              if (state is SavePatientInsuranceSuccess) {
                setState(() {
                  isLoading = false;
                  Navigator.of(context).pop(true);
                  BlocProvider.of<PatientByIdCubit>(context).getPatientById(patientId);
                });
              }
              if (state is SavePatientInsuranceLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is SavePatientInsuranceError) {
                setState(() {
                  isLoading = false;
                });
              }
            }),
          ],
          child: isLoading
              ? FieldsLoading()
              : Stack(
                  children: [
                    Container(
                      height: maxHeight,
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(AppConstants.HP),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.patientName, style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: AppColor.primaryColor)),
                            SizedBox(height: 16),
                            SelectedOptions(
                              title1:patientInsurance.isNotEmpty? patientInsurance.first.practiceInsuranceCompanyName:'',
                              selected1: currentCompany,
                              icon1: true,
                              onPressed1: () {
                                setState(() {
                                  currentCompany = true;
                                  add = false;
                                  BlocProvider.of<GetPatientInsuranceCompanyCubit>(context).getGetPatientInsuranceCompany(patientId);
                                  selectedCompany =
                                      '${patientInsurance.first.practiceInsuranceCompanyName} - ${patientInsurance.first.practiceInsuranceCompanyAddress1},${patientInsurance.first.practiceInsuranceCompanyCity},${patientInsurance.first.practiceInsuranceCompanyState},${patientInsurance.first.practiceInsuranceCompanyZipcode}';
                                  selectedCompanyPhone = patientInsurance.first.practiceInsuranceCompanyPhone;
                                  selectedCompanyId = patientInsurance.first.practiceInsuranceCompanyId;
                                  selectedCompanyAddress =
                                      '${patientInsurance.first.practiceInsuranceCompanyAddress1},${patientInsurance.first.practiceInsuranceCompanyCity},${patientInsurance.first.practiceInsuranceCompanyState},${patientInsurance.first.practiceInsuranceCompanyZipcode}';
                                  selectedCompanyAddress1 = patientInsurance.first.practiceInsuranceCompanyAddress1;
                                  selectedCompanyAddress2 = patientInsurance.first.practiceInsuranceCompanyAddress2;
                                  selectedCompanyCity = patientInsurance.first.practiceInsuranceCompanyCity;
                                  selectedCompanyState = patientInsurance.first.practiceInsuranceCompanyState;
                                  selectedCompanyZipCode = patientInsurance.first.practiceInsuranceCompanyZipcode;

                                  selectedNetWorkType = patientInsurance.first.networkType;
                                  grpPlanController.text = patientInsurance.first.subscriberGroupPlanNumber;
                                  grpEmpNameController.text = patientInsurance.first.groupEmployerName;
                                });
                              },
                              title2: 'Add New',
                              selected2: add,
                              icon2: true,
                              onPressed2: () {
                                setState(() {
                                  isPatient = false;
                                  isPatientAdd = false;
                                  currentCompany = false;
                                  selectedCompanyAddress1 = '';
                                  selectedCompanyAddress2 = null;
                                  selectedCompanyCity = '';
                                  selectedCompanyState = '';
                                  selectedCompanyZipCode = '';
                                  add = true;
                                  selectedCompany = null;
                                  selectedCompanyPhone = '';
                                  selectedCompanyAddress = '';
                                  isPrimary = false;
                                  grpPlanController.clear();
                                  grpEmpNameController.clear();
                                  selectedNetWorkType = null;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.all(AppConstants.HP),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     SizedBox(width: double.maxFinite,
                                     child:  Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text('Insurance Company',
                                             style: GoogleFonts.inter(
                                                 fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),

                                        InkWell(
                                             splashColor: Colors.transparent,
                                             highlightColor: Colors.transparent,
                                             onTap: () {
                                               setState(() {
                                                 isPrimary = !isPrimary;
                                               });
                                             },
                                             child: checkBox(isPrimary, 'Primary', 8.0, 20.0, 20.0))
                                       ],
                                     )),
                                      SizedBox(height: 16),
                                      Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColor.secondarySeedColor)),
                                          child: DropdownButton<String>(
                                            isDense: false,
                                            itemHeight: 50,
                                            padding: EdgeInsets.symmetric(horizontal: 12),
                                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                                            borderRadius: BorderRadius.circular(4),
                                            hint: Text('Select Insurance Company'),
                                            alignment: Alignment.centerLeft,
                                            isExpanded: true,
                                            underline: SizedBox(),
                                            value: selectedCompany,
                                            onChanged: (String? newValue) {
                                              selected = patientInsuranceCompanies.firstWhere((element) => element.practiceInsuranceCompanyName == newValue.toString());
                                              setState(() {
                                                selectedCompany = newValue.toString();
                                                selectedCompanyPhone = selected.practiceInsuranceCompanyPhone;
                                                selectedCompanyId = selected.practiceInsuranceCompanyId;
                                                selectedCompanyAddress =
                                                    '${selected.practiceInsuranceCompanyAddress1},${selected.practiceInsuranceCompanyCity},${selected.practiceInsuranceCompanyState},${selected.practiceInsuranceCompanyZipcode}';
                                                selectedCompanyAddress1 = selected.practiceInsuranceCompanyAddress1;
                                                selectedCompanyAddress2 = selected.practiceInsuranceCompanyAddress2;
                                                selectedCompanyCity = selected.practiceInsuranceCompanyCity;
                                                selectedCompanyState = selected.practiceInsuranceCompanyState;
                                                selectedCompanyZipCode = selected.practiceInsuranceCompanyZipcode;
                                              });
                                            },
                                            items: patientInsuranceCompanies.map((dynamic patientInsuranceCompanies) {
                                              return DropdownMenuItem<String>(
                                                value: patientInsuranceCompanies.practiceInsuranceCompanyName,
                                                child: Text(
                                                  patientInsuranceCompanies.practiceInsuranceCompanyName,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.bold),
                                                ),
                                              );
                                            }).toList(),
                                          )),
                                      SizedBox(height: 16),
                                      insuranceCompany('assets/images/property.svg', 'Insurance Company', selectedCompany ?? ''),
                                      Divider(height: 32),
                                      insuranceCompany('assets/images/mobileinsurance.svg', 'Phone', selectedCompanyPhone??''),
                                      Divider(height: 32),
                                      insuranceCompany('assets/images/address.svg', 'Address', selectedCompanyAddress??''),
                                    ],
                                  ),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.all(AppConstants.HP),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Policyholder Information',
                                          style: GoogleFonts.inter(
                                              fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      SizedBox(height: 16),
                                      ConstantTextFormField('Policyholder Member #', policyHolderMemberController, TextInputType.text),
                                      ConstantTextFormField('Policyholder Social Security Number', socialSecurityMemberController, TextInputType.number),
                                      SizedBox(height: 16),
                                      Text('Who is the Policyholder?',
                                          style: GoogleFonts.inter(
                                              fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      SizedBox(height: 16),
                                      SelectedOptions(
                                        title1: 'Same as ${widget.patientName}',
                                        selected1: isPatient,
                                        icon1: false,
                                        onPressed1: () {
                                          setState(() {
                                            isPatient = true;
                                            BlocProvider.of<GetPatientInsuranceCompanyCubit>(context).getGetPatientInsuranceCompany(patientId);
                                          if(patientInsurance.isNotEmpty){
                                            selectedCompany =
                                            '${patientInsurance.first.practiceInsuranceCompanyName} - ${patientInsurance.first.practiceInsuranceCompanyAddress1},${patientInsurance.first.practiceInsuranceCompanyCity},${patientInsurance.first.practiceInsuranceCompanyState},${patientInsurance.first.practiceInsuranceCompanyZipcode}';
                                            selectedCompanyPhone = patientInsurance.first.practiceInsuranceCompanyPhone;
                                            selectedCompanyAddress =
                                            '${patientInsurance.first.practiceInsuranceCompanyAddress1},${patientInsurance.first.practiceInsuranceCompanyCity},${patientInsurance.first.practiceInsuranceCompanyState},${patientInsurance.first.practiceInsuranceCompanyZipcode}';
                                            selectedGender = patientInsurance.first.subscriberGender;
                                          }
                                          });
                                        },
                                        title2: 'Other',
                                        selected2: !isPatient,
                                        icon2: false,
                                        onPressed2: () {
                                          setState(() {
                                            isPatient = false;
                                            selectedPrefix = null;
                                            firstNameController.clear();
                                            middleNameController.clear();
                                            lastNameController.clear();
                                            suffixController.clear();
                                            selectedGender = null;
                                            dobController.clear();
                                            selectedRelationship = null;
                                            phoneController.clear();
                                            phoneExtController.clear();
                                            selectedPhoneType = null;
                                            secondaryPhoneController.clear();
                                            secondaryPhoneExtController.clear();
                                            secondaryPhoneType = null;
                                          });
                                        },
                                      ),
                                      !isPatient
                                          ? Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 16),
                                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                  Text('Prefix',
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
                                                        hint: Text('Prefix'),
                                                        alignment: Alignment.centerLeft,
                                                        isExpanded: true,
                                                        underline: SizedBox(),
                                                        value: selectedPrefix,
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            selectedPrefix = newValue.toString();
                                                            prefixController.text = selectedPrefix.toString();
                                                          });
                                                        },
                                                        items: prefixes.map((String prefix) {
                                                          return DropdownMenuItem<String>(
                                                            value: prefix,
                                                            child: Text(prefix),
                                                          );
                                                        }).toList(),
                                                      ))
                                                ]),
                                                SizedBox(height: 16),
                                                ConstantTextFormField(
                                                  'First Name',
                                                  firstNameController,
                                                  TextInputType.text,
                                                  alertText: isAlert,
                                                ),
                                                ConstantTextFormField('Middle Name', middleNameController, TextInputType.text),
                                                ConstantTextFormField(
                                                  'Last Name',
                                                  lastNameController,
                                                  TextInputType.text,
                                                  alertText: isAlert,
                                                ),
                                                ConstantTextFormField('Suffix', suffixController, TextInputType.text),
                                                subCategories("Gender", gender, (context, index) {
                                                  return InkWell(
                                                    splashColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () {
                                                      setState(() {
                                                        selectedGender = gender[index];
                                                      });
                                                    },
                                                    child: radioButton(
                                                      selectedGender == gender[index],
                                                      gender[index],
                                                    ),
                                                  );
                                                }),
                                                ConstantTextFormField(
                                                  'Date of Birth',
                                                  dobController,
                                                  TextInputType.datetime,
                                                  readOnly: true,
                                                  alertText: isAlert,
                                                ),
                                                subCategories("Relationship to Patient", relation, (context, index) {
                                                  return InkWell(
                                                    splashColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () {
                                                      setState(() {
                                                        selectedRelationship = relation[index];
                                                      });
                                                    },
                                                    child: radioButton(
                                                      selectedRelationship == relation[index],
                                                      relation[index],
                                                    ),
                                                  );
                                                }),
                                                ConstantTextFormField(
                                                  'Primary Phone',
                                                  phoneController,
                                                  TextInputType.phone,
                                                  extController: phoneExtController,
                                                  alertText: isAlert,
                                                ),
                                                SizedBox(height: 16),
                                                subCategories("Primary Phone Type", primaryPhone, (context, index) {
                                                  return InkWell(
                                                    splashColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () {
                                                      setState(() {
                                                        selectedPhoneType = primaryPhone[index];
                                                      });
                                                    },
                                                    child: radioButton(
                                                      selectedPhoneType == primaryPhone[index],
                                                      primaryPhone[index],
                                                    ),
                                                  );
                                                }),
                                                ConstantTextFormField(
                                                  'Secondary Phone',
                                                  secondaryPhoneController,
                                                  TextInputType.phone,
                                                  extController: secondaryPhoneExtController,
                                                ),
                                                subCategories("Secondary Phone Type", primaryPhone, (context, index) {
                                                  return InkWell(
                                                    splashColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () {
                                                      setState(() {
                                                        secondaryPhoneType = primaryPhone[index];
                                                      });
                                                    },
                                                    child: radioButton(
                                                      secondaryPhoneType == primaryPhone[index],
                                                      primaryPhone[index],
                                                    ),
                                                  );
                                                }),
                                              ],
                                            )
                                          : SizedBox(),
                                      SizedBox(height: 16),
                                      Text('Policyholder Address?',
                                          style: GoogleFonts.inter(
                                              fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      SizedBox(height: 16),
                                      SelectedOptions(
                                          title1: 'Same as ${widget.patientName}',
                                          selected1: isPatientAdd,
                                          icon1: false,
                                          onPressed1: () {
                                            setState(() {
                                              isPatientAdd = true;
                                              BlocProvider.of<GetPatientInsuranceCompanyCubit>(context).getGetPatientInsuranceCompany(patientId);
                                             if(patientInsurance.isNotEmpty)
                                             {
                                               selectedCompany =
                                               '${patientInsurance.first.practiceInsuranceCompanyName} - ${patientInsurance.first.practiceInsuranceCompanyAddress1},${patientInsurance.first.practiceInsuranceCompanyCity},${patientInsurance.first.practiceInsuranceCompanyState},${patientInsurance.first.practiceInsuranceCompanyZipcode}';
                                               selectedCompanyPhone = patientInsurance.first.practiceInsuranceCompanyPhone;
                                               selectedCompanyAddress =
                                               '${patientInsurance.first.practiceInsuranceCompanyAddress1},${patientInsurance.first.practiceInsuranceCompanyCity},${patientInsurance.first.practiceInsuranceCompanyState},${patientInsurance.first.practiceInsuranceCompanyZipcode}';
                                               selectedGender = patientInsurance.first.subscriberGender;
                                             }
                                            });
                                          },
                                          title2: 'Other',
                                          selected2: !isPatientAdd,
                                          icon2: false,
                                          onPressed2: () {
                                            setState(() {
                                              isPatientAdd = false;

                                              address1Controller.clear();
                                              address2Controller.clear();
                                              cityController.clear();
                                              stateController.clear();
                                              zipcodeController.clear();
                                            });
                                          }),
                                      !isPatientAdd
                                          ? Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 16),
                                                ConstantTextFormField(
                                                  'Address Line 1',
                                                  address1Controller,
                                                  TextInputType.text,
                                                  alertText: isAlert,
                                                ),
                                                ConstantTextFormField('Address Line 2', address2Controller, TextInputType.text),
                                                ConstantTextFormField(
                                                  'City',
                                                  cityController,
                                                  TextInputType.text,
                                                  alertText: isAlert,
                                                ),
                                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                  Text('State',
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
                                                        hint: Text('Select State'),
                                                        alignment: Alignment.centerLeft,
                                                        isExpanded: true,
                                                        underline: SizedBox(),
                                                        value: selectedState,
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            selectedState = newValue.toString();
                                                          });
                                                        },
                                                        items: states.map((states) {
                                                          return DropdownMenuItem<String>(
                                                            value: states.stateName,
                                                            child: Text(states.stateName),
                                                          );
                                                        }).toList(),
                                                      )),
                                                  isAlert
                                                      ? Padding(
                                                          padding: EdgeInsets.only(top: 4),
                                                          child: Text(
                                                            'State is required.',
                                                            style: GoogleFonts.inter(fontSize: AppConstants.SMALL, color: Colors.redAccent),
                                                          ),
                                                        )
                                                      : SizedBox()
                                                ]),
                                                ConstantTextFormField(
                                                  'Zip Code',
                                                  zipcodeController,
                                                  TextInputType.number,
                                                  alertText: isAlert,
                                                ),
                                              ],
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                )),
                            SizedBox(height: 16),
                            Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                    padding: EdgeInsets.all(AppConstants.HP),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text('Group Information',
                                          style: GoogleFonts.inter(
                                              fontSize: AppConstants.LARGE, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                      SizedBox(height: 16),
                                      ConstantTextFormField('Group Plan #', grpPlanController, TextInputType.text),
                                      ConstantTextFormField('Group / Employer Name ', grpEmpNameController, TextInputType.text),
                                      SizedBox(height: 16),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Text('Network Type',
                                            style: GoogleFonts.inter(
                                                fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                                        SizedBox(height: 8),
                                        Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColor.secondarySeedColor)),
                                            child: DropdownButton<String>(
                                              isDense: false,
                                              itemHeight: 50,
                                              padding: EdgeInsets.symmetric(horizontal: 12),
                                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                                              borderRadius: BorderRadius.circular(4),
                                              hint: Text('Select Network Type'),
                                              alignment: Alignment.centerLeft,
                                              isExpanded: true,
                                              underline: SizedBox(),
                                              value: selectedNetWorkType,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedNetWorkType = newValue.toString();
                                                });
                                              },
                                              items: networkType.map((String networkType) {
                                                return DropdownMenuItem<String>(
                                                  value: networkType,
                                                  child: Text(networkType),
                                                );
                                              }).toList(),
                                            ))
                                      ])
                                    ]))),
                            SizedBox(height: 16),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
                                ),
                                onPressed: () {
                                  if (!isPatient || !isPatientAdd) {
                                    if (firstNameController.text.isNotEmpty &&
                                        lastNameController.text.isNotEmpty &&
                                        dobController.text.isNotEmpty &&
                                        phoneController.text.isNotEmpty &&
                                        address1Controller.text.isNotEmpty &&
                                        cityController.text.isNotEmpty &&
                                        selectedState != null &&
                                        zipcodeController.text.isNotEmpty) {
                                      BlocProvider.of<SavePatientInsuranceCubit>(context).savePatientInsurance(
                                          patientInsurance.isNotEmpty?patientInsurance.first.patientInsuranceId:0,
                                          selectedCompanyId,
                                          prefixController.text,
                                          firstNameController.text,
                                          middleNameController.text,
                                          lastNameController.text,
                                          suffixController.text,
                                          phoneController.text,
                                          phoneExtController.text,
                                          selectedPhoneType ?? '',
                                          secondaryPhoneController.text,
                                          secondaryPhoneExtController.text,
                                          secondaryPhoneType ?? '',
                                          dobController.text.isEmpty ? null : AppConstants.parsedDate(dobController.text),
                                          selectedGender ?? '',
                                          selectedRelationship,
                                          null,
                                          address1Controller.text,
                                          address2Controller.text,
                                          cityController.text,
                                          selectedState,
                                          zipcodeController.text,
                                          grpPlanController.text,
                                          policyHolderMemberController.text,
                                          selectedNetWorkType,
                                          grpEmpNameController.text,
                                          isPrimary,
                                          true,
                                          isPatient,
                                          isPatientAdd,
                                          "",
                                          selectedCompany,
                                          selectedCompanyPhone,
                                          null,
                                          selectedCompanyAddress1,
                                          selectedCompanyAddress2,
                                          selectedCompanyCity,
                                          selectedCompanyState,
                                          selectedCompanyZipCode);
                                    } else {
                                      setState(() {
                                        isAlert = true;
                                      });
                                    }
                                  }else{
                                    BlocProvider.of<SavePatientInsuranceCubit>(context).savePatientInsurance(
                                        patientInsurance.isNotEmpty?patientInsurance.first.patientInsuranceId:0,
                                        selectedCompanyId,
                                        prefixController.text,
                                        firstNameController.text,
                                        middleNameController.text,
                                        lastNameController.text,
                                        suffixController.text,
                                        phoneController.text,
                                        phoneExtController.text,
                                        selectedPhoneType ?? '',
                                        secondaryPhoneController.text,
                                        secondaryPhoneExtController.text,
                                        secondaryPhoneType ?? '',
                                        dobController.text.isEmpty ? null : AppConstants.parsedDate(dobController.text),
                                        selectedGender ?? '',
                                        selectedRelationship??'Self',
                                        null,
                                        address1Controller.text,
                                        address2Controller.text,
                                        cityController.text,
                                        selectedState??'',
                                        zipcodeController.text,
                                        grpPlanController.text,
                                        policyHolderMemberController.text,
                                        selectedNetWorkType,
                                        grpEmpNameController.text,
                                        isPrimary,
                                        true,
                                        isPatient,
                                        isPatientAdd,
                                        "",
                                        selectedCompany,
                                        selectedCompanyPhone,
                                        null,
                                        selectedCompanyAddress1,
                                        selectedCompanyAddress2,
                                        selectedCompanyCity,
                                        selectedCompanyState,
                                        selectedCompanyZipCode);
                                  }


                                },
                                child: Text('Save Patient Insurance'),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ));
  }




}
