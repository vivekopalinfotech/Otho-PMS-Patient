class ChangePasswordResponse {
  String?userId;
  String?prefix;
  String?firstName;
  String?middleName;
  String?lastName;
  String?suffix;
  String?displayName;
  String?preferredName;
  String?email;
  String?homePhone;
  String?mobilePhone;
  String?phoneNumber;
  String?userName;
  String?address1;
  String?address2;
  String?city;
  String?state;
  String?stateAbbreviation;
  String?zipcode;
  String?country;
  bool isUserActive;
  String?profileImage;
  String?signatureImage;
  String?printedSignature;
  String?secondaryEmail;
  String?securityPin;
  String?userRole;
  String?roleGuid;
  bool isDefaultRole;
  int practiceId;
  String?practiceGuid;
  String?providerInitials;
  String?providerLicenseNumber;
  String?providerNotes;
  String?providerNpi;
  String?providerPrintedSignature;
  String?providerSignature;
  String?specializationId;
  String?providerPrimaryLocationId;
  String?specializationName;
  String?practiceLocationName;

  ChangePasswordResponse({
    required this.userId,
    required this.prefix,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.suffix,
    required this.displayName,
    required this.preferredName,
    required this.email,
    required this.homePhone,
    required this.mobilePhone,
    required this.phoneNumber,
    required this.userName,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.stateAbbreviation,
    required this.zipcode,
    required this.country,
    required this.isUserActive,
    required this.profileImage,
    required this.signatureImage,
    required this.printedSignature,
    required this.secondaryEmail,
    required this.securityPin,
    required this.userRole,
    required this.roleGuid,
    required this.isDefaultRole,
    required this.practiceId,
    required this.practiceGuid,
    required this.providerInitials,
    required this.providerLicenseNumber,
    required this.providerNotes,
    required this.providerNpi,
    required this.providerPrintedSignature,
    required this.providerSignature,
    required this.specializationId,
    required this.providerPrimaryLocationId,
    required this.specializationName,
    required this.practiceLocationName,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) => ChangePasswordResponse(
    userId: json['userId'].toString(),
    prefix: json['prefix'].toString(),
    firstName: json['firstName'].toString(),
    middleName: json['middleName'].toString(),
    lastName: json['lastName'].toString(),
    suffix: json['suffix'].toString(),
    displayName: json['displayName'].toString(),
    preferredName: json['preferredName'].toString(),
    email: json['email'].toString(),
    homePhone: json['homePhone'].toString(),
    mobilePhone: json['mobilePhone'].toString(),
    phoneNumber: json['phoneNumber'].toString(),
    userName: json['userName'].toString(),
    address1: json['address1'].toString(),
    address2: json['address2'].toString(),
    city: json['city'].toString(),
    state: json['state'].toString(),
    stateAbbreviation: json['stateAbbreviation'].toString(),
    zipcode: json['zipcode'].toString(),
    country: json['country'].toString(),
    isUserActive: json['isUserActive'],
    profileImage: json['profileImage'].toString(),
    signatureImage: json['signatureImage'].toString(),
    printedSignature: json['printedSignature'].toString(),
    secondaryEmail: json['secondaryEmail'].toString(),
    securityPin: json['securityPin'].toString(),
    userRole: json['userRole'].toString(),
    roleGuid: json['roleGuid'].toString(),
    isDefaultRole: json['isDefaultRole'],
    practiceId: json['practiceId'],
    practiceGuid: json['practiceGuid'].toString(),
    providerInitials: json['providerInitials'].toString(),
    providerLicenseNumber: json['providerLicenseNumber'].toString(),
    providerNotes: json['providerNotes'].toString(),
    providerNpi: json['providerNpi'].toString(),
    providerPrintedSignature: json['providerPrintedSignature'].toString(),
    providerSignature: json['providerSignature'].toString(),
    specializationId: json['specializationId'].toString(),
    providerPrimaryLocationId: json['providerPrimaryLocationId'].toString(),
    specializationName: json['specializationName'].toString(),
    practiceLocationName: json['practiceLocationName'].toString(),
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'prefix': prefix,
    'firstName': firstName,
    'middleName': middleName,
    'lastName': lastName,
    'suffix': suffix,
    'displayName': displayName,
    'preferredName': preferredName,
    'email': email,
    'homePhone': homePhone,
    'mobilePhone': mobilePhone,
    'phoneNumber': phoneNumber,
    'userName': userName,
    'address1': address1,
    'address2': address2,
    'city': city,
    'state': state,
    'stateAbbreviation': stateAbbreviation,
    'zipcode': zipcode,
    'country': country,
    'isUserActive': isUserActive,
    'profileImage': profileImage,
    'signatureImage': signatureImage,
    'printedSignature': printedSignature,
    'secondaryEmail': secondaryEmail,
    'securityPin': securityPin,
    'userRole': userRole,
    'roleGuid': roleGuid,
    'isDefaultRole': isDefaultRole,
    'practiceId': practiceId,
    'practiceGuid': practiceGuid,
    'providerInitials': providerInitials,
    'providerLicenseNumber': providerLicenseNumber,
    'providerNotes': providerNotes,
    'providerNpi': providerNpi,
    'providerPrintedSignature': providerPrintedSignature,
    'providerSignature': providerSignature,
    'specializationId': specializationId,
    'providerPrimaryLocationId': providerPrimaryLocationId,
    'specializationName': specializationName,
    'practiceLocationName': practiceLocationName,
  };
}
