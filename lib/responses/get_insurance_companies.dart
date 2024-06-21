class PracticeInsuranceCompanyResponse {
  final List<PracticeInsuranceCompany> practiceInsuranceCompany;

  PracticeInsuranceCompanyResponse({
    required this.practiceInsuranceCompany,
  });

  factory PracticeInsuranceCompanyResponse.fromJson(List<dynamic> json) {
    return PracticeInsuranceCompanyResponse(
      practiceInsuranceCompany: json.map((e) => PracticeInsuranceCompany.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class PracticeInsuranceCompany {
  int practiceInsuranceCompanyId;
  int practiceId;
  String practiceInsuranceCompanyNameOnly;
  String practiceInsuranceCompanyName;
  dynamic practiceInsuranceCompanyCode;
  dynamic practiceInsuranceCompanyDescription;
  String practiceInsuranceCompanyPhone;
  dynamic practiceInsuranceCompanyPhoneExt;
  String practiceInsuranceCompanyAddress1;
  dynamic practiceInsuranceCompanyAddress2;
  dynamic practiceInsuranceCompanySuite;
  String practiceInsuranceCompanyCity;
  String practiceInsuranceCompanyState;
  String practiceInsuranceCompanyZipcode;
  dynamic practiceInsuranceCompanyPayorId;
  dynamic practiceInsuranceCompanyPlanType;
  bool practiceInsuranceCompanyIsMedicaid;
  bool isActive;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;

  PracticeInsuranceCompany({
    required this.practiceInsuranceCompanyId,
    required this.practiceId,
    required this.practiceInsuranceCompanyNameOnly,
    required this.practiceInsuranceCompanyName,
    this.practiceInsuranceCompanyCode,
    this.practiceInsuranceCompanyDescription,
    required this.practiceInsuranceCompanyPhone,
    this.practiceInsuranceCompanyPhoneExt,
    required this.practiceInsuranceCompanyAddress1,
    this.practiceInsuranceCompanyAddress2,
    this.practiceInsuranceCompanySuite,
    required this.practiceInsuranceCompanyCity,
    required this.practiceInsuranceCompanyState,
    required this.practiceInsuranceCompanyZipcode,
    this.practiceInsuranceCompanyPayorId,
    this.practiceInsuranceCompanyPlanType,
    required this.practiceInsuranceCompanyIsMedicaid,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
  });

  factory PracticeInsuranceCompany.fromJson(Map<String, dynamic> json) {
    return PracticeInsuranceCompany(
      practiceInsuranceCompanyId: json['practiceInsuranceCompanyId'],
      practiceId: json['practiceId'],
      practiceInsuranceCompanyNameOnly: json['practiceInsuranceCompanyNameOnly'],
      practiceInsuranceCompanyName: json['practiceInsuranceCompanyName'],
      practiceInsuranceCompanyCode: json['practiceInsuranceCompanyCode'],
      practiceInsuranceCompanyDescription: json['practiceInsuranceCompanyDescription'],
      practiceInsuranceCompanyPhone: json['practiceInsuranceCompanyPhone'],
      practiceInsuranceCompanyPhoneExt: json['practiceInsuranceCompanyPhoneExt'],
      practiceInsuranceCompanyAddress1: json['practiceInsuranceCompanyAddress1'],
      practiceInsuranceCompanyAddress2: json['practiceInsuranceCompanyAddress2'],
      practiceInsuranceCompanySuite: json['practiceInsuranceCompanySuite'],
      practiceInsuranceCompanyCity: json['practiceInsuranceCompanyCity'],
      practiceInsuranceCompanyState: json['practiceInsuranceCompanyState'],
      practiceInsuranceCompanyZipcode: json['practiceInsuranceCompanyZipcode'],
      practiceInsuranceCompanyPayorId: json['practiceInsuranceCompanyPayorId'],
      practiceInsuranceCompanyPlanType: json['practiceInsuranceCompanyPlanType'],
      practiceInsuranceCompanyIsMedicaid: json['practiceInsuranceCompanyIsMedicaid'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
    );
  }
}
