class GetReferralSubCategoryResponse {
  final List<ReferralSubCategory> referralSubCategory;

  GetReferralSubCategoryResponse({
    required this.referralSubCategory,
  });

  factory GetReferralSubCategoryResponse.fromJson(List<dynamic> json) {
    return GetReferralSubCategoryResponse(
      referralSubCategory: json.map((e) => ReferralSubCategory.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class ReferralSubCategory {
  final int referralCategoryId;
  final String referralCategoryName;
  final String referralCategoryDescription;
  final String referralCategoryTooltip;
  final bool hasSubCategory;
  final bool isActive;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdByUserId;
  final String modifiedByUserId;
  dynamic referralSubCategoryId;
  dynamic referralSubCategoryName;
  dynamic referralSubCategoryDescription;

  ReferralSubCategory({
    required this.referralCategoryId,
    required this.referralCategoryName,
    required this.referralCategoryDescription,
    required this.referralCategoryTooltip,
    required this.hasSubCategory,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
    this.referralSubCategoryId,
    this.referralSubCategoryName,
    this.referralSubCategoryDescription,
  });

  factory ReferralSubCategory.fromJson(Map<String, dynamic> json) {
    return ReferralSubCategory(
      referralCategoryId: json['referralCategoryId'],
      referralCategoryName: json['referralCategoryName'],
      referralCategoryDescription: json['referralCategoryDescription'],
      referralCategoryTooltip: json['referralCategoryTooltip'],
      hasSubCategory: json['hasSubCategory'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
      referralSubCategoryId: json['referralSubCategoryId'],
      referralSubCategoryName: json['referralSubCategoryName'],
      referralSubCategoryDescription: json['referralSubCategoryDescription'],
    );
  }
}
