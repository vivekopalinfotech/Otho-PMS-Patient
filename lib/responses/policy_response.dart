class PolicyResponse {
  int practicePolicyId;
  int practiceId;
  int policyTypeId;
  String? practicePolicyName;
  String practicePolicyEnglishContent;
  String practicePolicySpanishContent;
  bool isActive;
  bool showInContract;
  bool showInDocuments;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdByUserId;
  String modifiedByUserId;
  String policyTypeName;
  String policyTypeDescription;
  String practiceGuid;
  String practiceName;

  PolicyResponse({
    required this.practicePolicyId,
    required this.practiceId,
    required this.policyTypeId,
    this.practicePolicyName,
    required this.practicePolicyEnglishContent,
    required this.practicePolicySpanishContent,
    required this.isActive,
    required this.showInContract,
    required this.showInDocuments,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    required this.policyTypeName,
    required this.policyTypeDescription,
    required this.practiceGuid,
    required this.practiceName,
  });

  factory PolicyResponse.fromJson(Map<String, dynamic> json) {
    return PolicyResponse(
      practicePolicyId: json['practicePolicyId'],
      practiceId: json['practiceId'],
      policyTypeId: json['policyTypeId'],
      practicePolicyName: json['practicePolicyName'],
      practicePolicyEnglishContent: json['practicePolicyEnglishContent'],
      practicePolicySpanishContent: json['practicePolicySpanishContent'],
      isActive: json['isActive'],
      showInContract: json['showInContract'],
      showInDocuments: json['showInDocuments'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      policyTypeName: json['policyTypeName'],
      policyTypeDescription: json['policyTypeDescription'],
      practiceGuid: json['practiceGuid'],
      practiceName: json['practiceName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'practicePolicyId': practicePolicyId,
      'practiceId': practiceId,
      'policyTypeId': policyTypeId,
      'practicePolicyName': practicePolicyName,
      'practicePolicyEnglishContent': practicePolicyEnglishContent,
      'practicePolicySpanishContent': practicePolicySpanishContent,
      'isActive': isActive,
      'showInContract': showInContract,
      'showInDocuments': showInDocuments,
      'createdDate': createdDate.toIso8601String(),
      'modifiedDate': modifiedDate.toIso8601String(),
      'createdByUserId': createdByUserId,
      'modifiedByUserId': modifiedByUserId,
      'policyTypeName': policyTypeName,
      'policyTypeDescription': policyTypeDescription,
      'practiceGuid': practiceGuid,
      'practiceName': practiceName,
    };
  }
}
