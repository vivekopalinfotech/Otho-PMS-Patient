class GetPracticePoliciesResponse {
  final List<PracticePolicy> practicePolicy;

  GetPracticePoliciesResponse({
    required this.practicePolicy,
  });

  factory GetPracticePoliciesResponse.fromJson(List<dynamic> json) {
    return GetPracticePoliciesResponse(
      practicePolicy: json.map((e) => PracticePolicy.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class PracticePolicy {
  int practiceId;
  int practicePolicyId;
  int policyTypeId;
  String practiceGuid;
  String practiceName;
  String policyTypeName;
  String policyTypeDescription;
  bool showInContract;
  bool showInDocuments;
  bool isActive;

  PracticePolicy({
    required this.practiceId,
    required this.practicePolicyId,
    required this.policyTypeId,
    required this.practiceGuid,
    required this.practiceName,
    required this.policyTypeName,
    required this.policyTypeDescription,
    required this.showInContract,
    required this.showInDocuments,
    required this.isActive,
  });

  factory PracticePolicy.fromJson(Map<String, dynamic> json) {
    return PracticePolicy(
      practiceId: json['practiceId'],
      practicePolicyId: json['practicePolicyId'],
      policyTypeId: json['policyTypeId'],
      practiceGuid: json['practiceGuid'],
      practiceName: json['practiceName'],
      policyTypeName: json['policyTypeName'],
      policyTypeDescription: json['policyTypeDescription'],
      showInContract: json['showInContract'],
      showInDocuments: json['showInDocuments'],
      isActive: json['isActive'],
    );
  }
}
