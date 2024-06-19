
class GetReferralCategoryResponse {
  final List<ReferralCategory> referralCategory;

  GetReferralCategoryResponse({
    required this.referralCategory,
  });

  factory GetReferralCategoryResponse.fromJson(List<dynamic> json) {
    return GetReferralCategoryResponse(
      referralCategory: json.map((e) => ReferralCategory.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class ReferralCategory {
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

  ReferralCategory({
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
  });

  factory ReferralCategory.fromJson(Map<String, dynamic> json) {
    return ReferralCategory(
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
    );
  }
}
