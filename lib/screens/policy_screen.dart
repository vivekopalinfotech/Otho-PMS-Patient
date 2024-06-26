import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/app_constants/app_constants.dart';
import 'package:ortho_pms_patient/bloc/policy/get_policy_cubit.dart';
import 'package:ortho_pms_patient/bloc/policy/get_policy_state.dart';
import 'package:ortho_pms_patient/bloc/policy/get_practice_policies_cubit.dart';
import 'package:ortho_pms_patient/bloc/policy/get_practice_policies_state.dart';
import 'package:signature/signature.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1.5,
    exportPenColor: Colors.black,
    onDrawStart: () => log('onDrawStart called!'),
    onDrawEnd: () => log('onDrawEnd called!'),
  );
  final SignatureController _controller2 = SignatureController(
    penStrokeWidth: 1.5,
    exportPenColor: Colors.black,
    onDrawStart: () => log('onDrawStart called!'),
    onDrawEnd: () => log('onDrawEnd called!'),
  );

  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetPolicyCubit>(context).getPolicy(2);
    BlocProvider.of<GetPracticePoliciesCubit>(context).getPracticePolicies();
    _controller
      ..addListener(() => log('Value changed'))
      ..onDrawEnd = () => setState(
            () {},
          );
    _controller2
      ..addListener(() => log('Value changed'))
      ..onDrawEnd = () => setState(
            () {},
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  Future<void> exportImage(BuildContext context) async {
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          key: Key('snackbarPNG'),
          content: Text('No content'),
        ),
      );
      return;
    }

    final Uint8List? data = await _controller.toPngBytes(height: 1000, width: 1000);

    if (data == null) {
      return;
    }

    if (!mounted) return;

    await push(
      context,
      Scaffold(
        appBar: AppBar(
          title: const Text('PNG Image'),
        ),
        body: Center(
          child: Container(
            color: Colors.grey[300],
            child: Image.memory(data),
          ),
        ),
      ),
    );
  }

  Future<void> exportImage2(BuildContext context) async {
    if (_controller2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          key: Key('snackbarPNG'),
          content: Text('No content'),
        ),
      );
      return;
    }
    final Uint8List? data2 = await _controller2.toPngBytes(height: 1000, width: 1000);
    if (data2 == null) {
      return;
    }
    await push(
      context,
      Scaffold(
        appBar: AppBar(
          title: const Text('PNG Image'),
        ),
        body: Center(
          child: Container(
            color: Colors.grey[300],
            child: Image.memory(data2),
          ),
        ),
      ),
    );
  }

  Future<void> exportSVG(BuildContext context) async {
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          key: Key('snackbarSVG'),
          content: Text('No content'),
        ),
      );
      return;
    }

    final SvgPicture data = _controller.toSVG()!;

    if (!mounted) return;

    await push(
      context,
      Scaffold(
        appBar: AppBar(
          title: const Text('SVG Image'),
        ),
        body: Center(
          child: Container(
            color: Colors.grey[300],
            child: data,
          ),
        ),
      ),
    );
  }

  Future<void> exportSVG2(BuildContext context) async {
    if (_controller2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          key: Key('snackbarSVG'),
          content: Text('No content'),
        ),
      );
      return;
    }
    final SvgPicture data2 = _controller2.toSVG()!;
    await push(
      context,
      Scaffold(
        appBar: AppBar(
          title: const Text('SVG Image'),
        ),
        body: Center(
          child: Container(
            color: Colors.grey[300],
            child: data2,
          ),
        ),
      ),
    );
  }

  String? selectedPolicyTypes;
  String? practicePolicyEnglishContent;
  String? practicePolicySpanishContent;
  List policyTypes = [];
  bool english = true;
  bool spanish = false;
  bool isLoading = true;
  var unescape = HtmlUnescape();
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    var brightness = Theme.of(context).brightness;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Policy'),
          automaticallyImplyLeading: false,
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<GetPolicyCubit, GetPolicyState>(listener: (context, state) {
              if (state is GetPolicySuccess) {
                setState(() {
                  isLoading = false;
                  selectedPolicyTypes = state.policyResponse.policyTypeName;
                  practicePolicyEnglishContent = state.policyResponse.practicePolicyEnglishContent;
                  practicePolicySpanishContent = state.policyResponse.practicePolicySpanishContent;
                });
              }
            }),
            BlocListener<GetPracticePoliciesCubit, GetPracticePoliciesState>(listener: (context, state) {
              if (state is GetPracticePoliciesSuccess) {
                setState(() {
                  policyTypes.addAll(state.getPracticePoliciesResponse.practicePolicy);
                });
              }
            }),
          ],
          child:isLoading?Center(
            child: CircularProgressIndicator(),
          ): SingleChildScrollView(
              padding: EdgeInsets.all(AppConstants.HP),
              child: Column(
                children: [
                  Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.HP),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('Policy Types',
                              style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold, color: brightness == Brightness.dark ? AppColor.whiteColor : AppColor.blackColor)),
                          SizedBox(height: 8),
                          Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: AppColor.secondarySeedColor)),
                              child: DropdownButton<String>(
                                isDense: false,
                                itemHeight: 50,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                icon: Icon(Icons.keyboard_arrow_down_rounded),
                                borderRadius: BorderRadius.circular(4),
                                hint: Text('Select Policy Type'),
                                alignment: Alignment.centerLeft,
                                isExpanded: true,
                                underline: SizedBox(),
                                value: selectedPolicyTypes,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedPolicyTypes = newValue.toString();
                                  });
                                },
                                items: policyTypes.map((policyTypes) {
                                  return DropdownMenuItem<String>(
                                    value: policyTypes.policyTypeName,
                                    child: Text(policyTypes.policyTypeName),
                                  );
                                }).toList(),
                              )),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                                    backgroundColor: MaterialStatePropertyAll(english ? AppColor.primaryColor : Colors.transparent),
                                    elevation: MaterialStatePropertyAll(0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      english = true;
                                      spanish = false;
                                    });
                                  },
                                  child: Text(
                                    'English',
                                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: english ? AppColor.whiteColor : AppColor.primaryColor),
                                  )),
                              SizedBox(width: 8),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                                    backgroundColor: MaterialStatePropertyAll(spanish ? AppColor.primaryColor : Colors.transparent),
                                    elevation: MaterialStatePropertyAll(0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      english = false;
                                      spanish = true;
                                    });
                                  },
                                  child: Text(
                                    'Spanish',
                                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: spanish ? AppColor.whiteColor : AppColor.primaryColor),
                                  )),
                            ],
                          ),
                          SizedBox(height: 16),
                          Html(data: english ? practicePolicyEnglishContent.toString() : practicePolicySpanishContent.toString()),
                          //Text(unescape.convert(removeAllHtmlTags(english ? practicePolicyEnglishContent.toString() : practicePolicySpanishContent.toString())))
                        ]),
                      )),
                  SizedBox(height: 16),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16),
                                Text(
                                  'Signature',
                                  style: GoogleFonts.inter(fontSize: AppConstants.TITLE, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Signer',
                                          style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ' *',
                                          style: GoogleFonts.inter(fontSize: AppConstants.SMALL, color: Colors.redAccent),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Sign inside the box by using a touchscreen or mouse',
                                      style: GoogleFonts.inter(fontSize: AppConstants.XXSMALL),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Container(
                                    height: 150,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: colorScheme.secondaryContainer)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Signature(
                                          key: const Key('signature'),
                                          controller: _controller,
                                          backgroundColor: brightness == Brightness.dark ? colorScheme.onSurface : AppColor.whiteColor,
                                          height: 150,
                                        ))),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(6),
                                                side: BorderSide(
                                                  color: AppColor.primaryColor,
                                                ),
                                              )),
                                              elevation: MaterialStatePropertyAll(0),
                                              backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                                          onPressed: () {
                                            setState(() => _controller.clear());
                                          },
                                          child: Text(
                                            'Clear',
                                            style: GoogleFonts.inter(color: AppColor.primaryColor),
                                          )),
                                      SizedBox(width: 16),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6),
                                            )),
                                            backgroundColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
                                            elevation: MaterialStatePropertyAll(0),
                                          ),
                                          onPressed: () {
                                            setState(() => _controller.disabled = !_controller.disabled);
                                          },
                                          child: Text(
                                            'Sign',
                                            style: GoogleFonts.inter(color: AppColor.primaryColor),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 30),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppConstants.HP),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Witness Signature',
                                  style: GoogleFonts.inter(fontSize: AppConstants.NORMAL, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: colorScheme.secondaryContainer)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Signature(
                                        key: const Key('signature'),
                                        controller: _controller2,
                                        backgroundColor: brightness == Brightness.dark ? colorScheme.onSurface : AppColor.whiteColor,
                                        height: 150,
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(6),
                                                side: BorderSide(
                                                  color: AppColor.primaryColor,
                                                ),
                                              )),
                                              elevation: MaterialStatePropertyAll(0),
                                              backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                                          onPressed: () {
                                            setState(() => _controller2.clear());
                                          },
                                          child: Text(
                                            'Clear',
                                            style: GoogleFonts.inter(color: AppColor.primaryColor),
                                          )),
                                      SizedBox(width: 16),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6),
                                            )),
                                            backgroundColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
                                            elevation: MaterialStatePropertyAll(0),
                                          ),
                                          onPressed: () {
                                            setState(() => _controller2.disabled = !_controller2.disabled);
                                          },
                                          child: Text(
                                            'Sign',
                                            style: GoogleFonts.inter(color: AppColor.primaryColor),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 16),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }

  Future push(context, widget) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return widget;
        },
      ),
    );
  }
}
